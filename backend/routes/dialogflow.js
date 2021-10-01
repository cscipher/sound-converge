var express = require("express");
const getDialogFlowResponse = require("../dialogflow/dialogflow-connection");
var router = express.Router();

router
  .get("/", (req, res) => {
    res.send("Not Found").status(404);
  })
  .post("/message", async (req, res) => {
    if (req.body.message === null) {
      res.send("Bad Request").status(400);
    } else {
      await getDialogFlowResponse(req.body.message)
        .then((data) => {
          console.log({ data });
          if (data.queryResult.intent.displayName === "spotify_call") {
            console.log(JSON.stringify(data.queryResult));
            const fields = data.queryResult.fulfillmentMessages[1].payload.fields;
            var apiData = {
              message: data.queryResult.fulfillmentText,
              spotifyUrl: fields.spotifyUrl.stringValue,
              jioSaavanUrl: fields.jioSaavanUrl.stringValue,
              ytMusicUrl: fields.ytMusicUrl.stringValue,
              gaanaUrl: fields.gaanaUrl.stringValue,
            };
            res.send(apiData).status(200);
          } else {
            res.send({ message: data.queryResult.fulfillmentText }).status(200);
          }
        })
        .catch((error) => {
          console.log({ err: error.message });
          res.send("Internal Server Error").status(500);
        });
    }
  });

module.exports = router;
