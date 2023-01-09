# Intro
This is a simple example of a C# Durable Function, it is designed to be run in a docker container.

## Requirements
A `local.settings.json` file must be created, it should have the format below.
```
{
  "IsEncrypted": false,
  "Values": {
    "AzureWebJobsStorage": "DefaultEndpointsProtocol=https;AccountName={name};AccountKey={key};EndpointSuffix=core.windows.net",
    "FUNCTIONS_WORKER_RUNTIME": "dotnet"
  }
}
```

## Docker commands
To build the image.

`docker build -t csharpdurablefunc`

To run the image.

`docker run --rm -p 7071:7071 csharpdurablefunc`

## Running the function
To initiate a run of the function use the following cURL command (or import it into your favourite HTTP request tool).

`curl --request GET --url http://localhost:7071/runtime/webhooks/durableTask/instances`

## Durable function management.
Detailed [here](https://learn.microsoft.com/en-us/azure/azure-functions/durable/durable-functions-http-api)
