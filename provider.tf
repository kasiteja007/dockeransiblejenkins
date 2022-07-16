terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.15.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "docker" {
 registry_auth {
    address  = "https://id.docker.com/login/?next=%2Fid%2Foauth%2Fauthorize%2F%3Fclient_id%3D43f17c5f-9ba4-4f13-853d-9d0074e349a7%26nonce%3DeyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiI0M2YxN2M1Zi05YmE0LTRmMTMtODUzZC05ZDAwNzRlMzQ5YTciLCJleHAiOiIyMDIyLTA3LTE2VDEzOjA1OjM3Ljc4MjYyMjU0MVoiLCJpYXQiOiIyMDIyLTA3LTE2VDEzOjAwOjM3Ljc4MjYyMzYyOVoiLCJyZnAiOiI5U09nc2ozUzRqM2FJRXl4NjQyNDBnPT0iLCJ0YXJnZXRfbGlua191cmkiOiJodHRwczovL2h1Yi5kb2NrZXIuY29tIn0.19hnp2DKozd3_1nih3Ez64Js-4XRWeySqc5rPWk1qLI%26redirect_uri%3Dhttps%253A%252F%252Fhub.docker.com%252Fsso%252Fcallback%26response_type%3Dcode%26scope%3Dopenid%26state%3DeyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiI0M2YxN2M1Zi05YmE0LTRmMTMtODUzZC05ZDAwNzRlMzQ5YTciLCJleHAiOiIyMDIyLTA3LTE2VDEzOjA1OjM3Ljc4MjYyMjU0MVoiLCJpYXQiOiIyMDIyLTA3LTE2VDEzOjAwOjM3Ljc4MjYyMzYyOVoiLCJyZnAiOiI5U09nc2ozUzRqM2FJRXl4NjQyNDBnPT0iLCJ0YXJnZXRfbGlua191cmkiOiJodHRwczovL2h1Yi5kb2NrZXIuY29tIn0.19hnp2DKozd3_1nih3Ez64Js-4XRWeySqc5rPWk1qLI"
    username = "$DOCKERHUB_CREDENTIALS_USR"
    password = "$DOCKERHUB_CREDENTIALS_PSW"
  }
}

provider "aws" {
  region = var.region
}
