const axios = require("axios").default;

const searchGaana = async (query) => {
  try {
    const res = await axios.post(
      "http://api.gaana.com/",
      {},
      {
        params: {
          type: "search",
          subtype: "search_song",
          key: query,
          token: "b2e6d7fbc136547a940516e9b77e5990",
          format: "JSON",
          order: "alltime",
        },
      }
    );
    return `https://www.gaana.com/song/${res.data.tracks[0].seokey}`;
  } catch (error) {
    console.log(error.message);
  }
}; // not giving any output as a URL
module.exports = searchGaana;
