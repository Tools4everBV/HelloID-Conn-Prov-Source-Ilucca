
# HelloID-Conn-Prov-Source-Ilucca


| :information_source: Information |
|:---------------------------|
| This repository contains the connector and configuration code only. The implementer is responsible to acquire the connection details such as username, password, certificate, etc. You might even need to sign a contract or agreement with the supplier before implementing this connector. Please contact the client's application manager to coordinate the connector requirements. |

<p align="center">
  <img src="assets/lucca.png">
</p>

## Table of contents

- [Introduction](#Introduction)
- [Getting started](#Getting-started)
  + [Connection settings](#Connection-settings)
  + [Prerequisites](#Prerequisites)
  + [Remarks](#Remarks)
- [Getting help](#Getting-help)
- [HelloID Docs](#HelloID-docs)

## Introduction

HelloID-Conn-Prov-Source-Ilucca is a _source_ connector. Ilucca provides a set of REST API's that allow you to programmatically interact with its data. The HelloID connector uses the API endpoints listed in the table below.

| Endpoint     			| Description				|
| ----------------- 	| ----------------------	|
| api/v3/users 			| To get the users			|
| api/v3/departments 	| To get the departments	|

## Getting started

### Connection settings

The following settings are required to connect to the API.

| Setting      	| Description                       | Mandatory   |
| ------------ 	| -----------                       | ----------- |
| CustomerUrl	| The Url to connect to the API 	| Yes         |
| Secret  		| The Secret to connect to the API 	| Yes         |

Fill in the required fields on the 'Configuration' tab.
<p align="left">
  <img src="https://github.com/Tools4everBV/HelloID-Conn-Prov-Source-Ilucca/raw/main/assets/Config.png" width="800">
</p>


### Prerequisites

### Remarks


## Getting help

> _For more information on how to configure a HelloID PowerShell connector, please refer to our [documentation](https://docs.helloid.com/hc/en-us/articles/360012557600-Configure-a-custom-PowerShell-source-system) pages_

> _If you need help, feel free to ask questions on our [forum](https://forum.helloid.com)_

## HelloID docs

The official HelloID documentation can be found at: https://docs.helloid.com/
