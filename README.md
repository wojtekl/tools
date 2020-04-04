# Tools

## AUTHORS
[wojtekl](https://play.google.com/store/apps/developer?id=Wojciech+Le%C5%9Bniak)

## USAGE
- WireMock:
```
# run
docker build `
  --quiet `
  --tag wiremock `
  https://github.com/wojtekl/tools/raw/master/wiremock/dockerfile `
; `
docker run `
  --detach `
  --restart=unless-stopped `
  --publish 8080:8080 `
  --name wiremock `
  --volume=C:/wiremock/configuration:/opt/wiremock/configuration `
  wiremock

# manual
docker exec wiremock ../man
```
- JMeter
```
# run
docker build `
  --quiet `
  --tag jmeter `
  https://github.com/wojtekl/tools/raw/master/jmeter/dockerfile `
; `
docker run `
  --interactive `
  --rm `
  --name jmeter `
  --volume=C:/apache-jmeter/test:/opt/apache-jmeter/test `
  --env ARGS="" `
  jmeter
```
- [Generator](https://htmlpreview.github.io/?https://github.com/wojtekl/tools/blob/master/generator.html)
- [nbp](https://htmlpreview.github.io/?https://github.com/wojtekl/tools/blob/master/nbp.html)

