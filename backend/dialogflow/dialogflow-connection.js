const dialogflow = require("dialogflow");
const uuid = require("uuid");

const getDialogFlowResponse = async (text) => {
  const sessionId = uuid.v4();
  const sessionClient = new dialogflow.SessionsClient({
    keyFilename: "./assistantzedd-qjxl-46544c3e33ef.json",
  });
  const sessionPath = sessionClient.sessionPath(
    process.env.NODE_PROJECT_ID,
    sessionId
  );
  const request = {
    session: sessionPath,
    queryInput: {
      text: {
        text: text,
        languageCode: "en-US",
      },
    },
  };
  try {
    const responses = await sessionClient.detectIntent(request);
    console.log({ env: process.env });
    return responses[0];
  } catch (err) {
    console.log({ dialogflowError: err.message });
    return { error: err.message };
  }
};

module.exports = getDialogFlowResponse;
