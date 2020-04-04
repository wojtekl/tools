# usprawnienia

## AUTHORS
[wojtekel](http://mojemiejsce-wojtekel.rhcloud.com)

## USAGE
- WireMock:
```
docker build `
  --tag wiremock `
  https://github.com/wojtekl/tools/raw/master/wiremock/dockerfile ; `
docker run `
  --detach `
  --restart=unless-stopped `
  --publish 8080:8080 `
  --name wiremock `
  --volume=C:/wiremock/configuration:/opt/wiremock/configuration `
  wiremock
```
- [nbp](https://htmlpreview.github.io/?https://github.com/wojtekl/usprawnienia/blob/master/nbp.html)
- [suplementat](https://htmlpreview.github.io/?https://github.com/wojtekl/usprawnienia/blob/master/suplementat.html)

## DONATE
It's all free, but you know life's a b*tch and we need money to survive. So if you liked my work and want to donate me please send me an e-mail for details.

