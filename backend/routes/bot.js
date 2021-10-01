var express = require("express");
var router = express.Router();
var searchSpotify = require("../apis/spotify");
var searchGaana = require("../apis/gaana");
var searchYoutube = require("../apis/yt-music");
var searchJioSaavan = require("../apis/jiosaavan");
router.post("/", async (req, res) => {
  const song_name = req.body.queryResult.parameters.song_name;
  const spotifyURL = await searchSpotify(song_name);
  const gaanaURL = await searchGaana(song_name);
  const jioSaavanURL = await searchJioSaavan(song_name);
  const ytMusicURL = await searchYoutube(song_name);

  console.log({ spotifyURL, gaanaURL, jioSaavanURL, ytMusicURL });
  let apiData = {
    fulfillmentText: "I have found your song on these platforms...",
    fulfillmentMessages: [
      {
        text: {
          text: ["I have found your song on these platforms..."],
        },
      },
      {
        payload: {
          data: "I have found your song on these platforms...",
          spotifyUrl: spotifyURL,
          gaanaUrl: gaanaURL,
          jioSaavanUrl: jioSaavanURL,
          ytMusicUrl: ytMusicURL,
        },
      },
    ],
  };
  res.send(apiData);
});
module.exports = router;
