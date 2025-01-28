# ApiGatewayErrorCodes-Datadog
## Simple Datadog Api Gateway Error Monitoring

## Setup 
- Clone repo
- Install Datadog Integration into your AWS account
- Verify `apiGateway:GET` persmission
- Setup terminal with AWS credentials


## Demo


### Launch app

This application is a simple CloudFormation Template which deploys
a single Lambda function along with an ApiGateway.

```
./launch-app.sh
```

### Track via Api Gateway ID

When ready fetch Api Gateway ID:

```
API_GATEWAY_ID=$(aws cloudformation describe-stacks --region us-east-1 --stack-name DatadogSimpleApiGateway | 
jq -r '.Stacks[0].Outputs[] | select(.OutputKey=="apiGatewayId") | .OutputValue')
echo $API_GATEWAY_ID
```
### View logs

Tail logs in one terminal

```
aws logs tail "${API_GATEWAY_ID}-access-logs" --follow
```

### Test app

Stress app in another terminal

```
./stress-app.sh ${API_GATEWAY_ID" <POST|GET>    # Defaults to POST
```
### Check Datadog

Launch Datadog Api Gateway Dashboard
<<PIC>>

### Clean up

To clean up, run

```
./destroy-app
```

## Reference

- launch-app.sh   // Launches the sample application                   
- stack.yaml      // Defines the sample application
- destroy-app.sh  // Removes the sample application
- stress-app.sh   // Tests out the application with HTTP requests

https://gist.github.com/magnetikonline/c314952045eee8e8375b82bc7ec68e88

https://github.com/hatoo/oha
