const yts = require("yt-search");

const searchYoutube = async (query) => {
  const res = await yts(query);
  const url = res.videos[0].url;
  return url;
};
module.exports = searchYoutube;
