# Kitura SOS Workshop

<p align="center">
<img src="https://www.ibm.com/cloud-computing/bluemix/sites/default/files/assets/page/catalog-swift.svg" width="120" alt="Kitura Bird">
</p>

<p align="center">
<a href= "http://swift-at-ibm-slack.mybluemix.net/">
    <img src="http://swift-at-ibm-slack.mybluemix.net/badge.svg"  alt="Slack">
</a>
</p>

## Background Info

If you've ever been in an area where there's a natural disaster that's occurred and has affected a large number of people, you may have seen a Facebook notification pop up asking you to report whether or not you are "safe". This has been helpful to families concerned about their loved ones when they can't reach them. Today, we are going to implement this feature with Kitura and WebSockets.

## [Getting Started](./01-GettingStarted.md)

The first chapter of this guide will walk you through the necessary requirements that are needed to complete this workshop, including initial setup for the server, macOS dashboard and iOS client.

## [Server Setup](./02-ServerSetUp.md)

This chapter will be the setup for the server side of the application.  We will be setting up our WebSocket class so that the clients can successfully connect to it in later chapters.

## [Dashboard Setup](./03-DashboardSetUp.md)

This chapter will be the setup for the dashboard of the application.  The dashboard will allow iOS users to connect to it and be visible on the map presented in the dashboard.

## [iOS Client Setup](./04-iOSSetUp.md)

This chapter will be the setup for the iOS client of the application.

## [Status Reports and Disasters](./05-StatusReportsAndDisasters.md)

This chapter will be setting up the status reports and disaster handling of the application, after completing this section, the dashboard will be able to call in disasters and the clients will be able to respond to it reporting their current status.

## [Adding OpenAPI and REST API Support](./06-OpenAndRESTAPI.md)

This chapter will enable you to add OpenAPI and REST API functionality to the server.  We will be adding in different functionalities that allow us to send specific requests to the server and get responses based off of them.

## [Using Docker and Kubernetes with your application](./07-DockerAndKubernetes.md)

This chapter will allow you to deploy your server on Docker in a Kubernetes cluster.

## [Monitoring your application with Grafana and Prometheus](./08-PrometheusAndGrafana.md)

This final chapter will allow you to monitor your server using Prometheus and Grafana.
