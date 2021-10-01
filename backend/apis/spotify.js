var SpotifyWebApi = require("spotify-web-api-node");
var qs = require('querystring');

var client_id = '1918c9e61d7f47efaf05911824df17d8';
 var client_secret = '1582bbbf54a348f0aaded1a3d9d570f1';

const axios = require("axios").default;
searchSpotify = async (songName) => {
  var spotifyAPI = new SpotifyWebApi();

  getNewAccessToken().then((access_token) => {
    spotifyAPI.setAccessToken(access_token);
  });
  //spotifyAPI.setAccessToken(access_token);


  return await spotifyAPI
    .searchTracks(songName)
    .then((track) => {
      console.log({ tracks: track.body.tracks.items[0].external_urls.spotify });
      return track.body.tracks.items[0].external_urls.spotify;
    })
    .catch((err) => {
      console.log({ spotifyErr: err.message });
    });
};
module.exports = searchSpotify;

const getNewAccessToken = async () => {
  await axios
    .post(
      "https://accounts.spotify.com/api/token",
      qs.stringify({ "grant_type": "client_credentials" }),
      {
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
          "Authorization":
            "Basic " + Buffer.from(client_id + ':' + client_secret).toString('base64'),
        },
      }
    )
    .then((res) => {
      console.log(res.data);
      return res.data.access_token;
    })
    .catch((err) => {
      console.log(err.message);
    });
};

getNewAccessToken();
