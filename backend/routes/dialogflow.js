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
          res.send(data).status(200);
        })
        .catch((error) => {
          console.log({ yewala: error.message });
          res.send({ status: 500, message: "Internal Server Error" });
        });
    }
  });

module.exports = router;
