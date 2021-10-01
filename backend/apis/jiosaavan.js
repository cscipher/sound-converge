const jiosavan = require("jiosavan");
const searchJioSaavan = async (query) => {
  try {
    const result = await jiosavan.searchSongs(query);
    return result[0].url;
  } catch (err) {
    console.log(err.message);
    return "";
  }
};
module.exports = searchJioSaavan;
