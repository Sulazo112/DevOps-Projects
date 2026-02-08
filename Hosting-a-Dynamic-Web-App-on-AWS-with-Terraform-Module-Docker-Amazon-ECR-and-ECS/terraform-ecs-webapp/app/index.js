const express = require("express");
const app = express();

// Root route
app.get("/", (req, res) => {
  res.send("🚀 Web App Running on AWS ECS via Terraform!");
});

// Server configuration
const port = process.env.PORT || 3000;

app.listen(port, () => {
  console.log(`App listening on port ${port}`);
});

