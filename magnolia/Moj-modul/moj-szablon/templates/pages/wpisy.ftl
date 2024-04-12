[#assign tytul = content.title]

<!DOCTYPE html>
<html lang="pl" style="height: 100%;">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>${tytul}</title>

    <!-- Bootstrap -->
    <link href="${ctx.contextPath}/.resources/moj-szablon/webresources/css/bootstrap.min.css" rel="stylesheet">
        [@cms.page /]

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body style="padding: 20px; background-color: #1e5799; height: 100%;">
      <div class="container" style="padding: 20px; background-color: #f6f6f6; min-height: 100%; margin-bottom: 20px;">
          <div class="tab-content col-md-9" style="height: 100%;">
              <div class="tab-pane active">
[#if content.introText?has_content]
                  <p>
${cmsfn.decode(content).introText}
                  </p>
[/#if]
[#-- [#assign wpisyKatalog = cmsfn.contentByPath("/", "wpisy")] --]
[#assign wpisyKatalog = cmsfn.contentById(content.wpisKatalog, "wpisy")]
[#assign wpisyLista = cmsfn.children(wpisyKatalog, "mgnl:wpis")?reverse]
[#if wpisyLista?has_content]
[#assign numerStrony = (ctx.getParameter('strona')?number)!1]
[#assign l = 5]
[#assign poczatek = (numerStrony - 1) * l]
[#assign koniec = poczatek + l - 1]
[#assign liczbaWpisow = wpisyLista?size]
[#if koniec gte liczbaWpisow]
    [#assign koniec = liczbaWpisow - 1]
[/#if]
[#list poczatek..koniec as i]
    [#assign wpis = wpisyLista[i]]
                  <div class="media">
    [#if wpis.image?has_content]
        [#assign obraz = damfn.getAssetLink(wpis.image, "small")!]
        [#if obraz?has_content]
                      <a class="pull-right" href="${obraz}">
                          <img class="media-object img-thumbnail" src="${obraz}" style="max-width: 240px; max-height: 240px;" alt="">
                      </a>
        [/#if]
    [/#if]
                      <div class="media-body">
                          <h4 class="media-heading">
    [#if wpis.title?has_content]${wpis.title}[/#if]
                          </h4>
    [#if wpis.description?has_content]${cmsfn.decode(wpis).description}[/#if]
                      </div>
                  </div>
[/#list]
[#if liczbaWpisow gt l]
    [#assign liczbaStron = liczbaWpisow / l]
    [#if (liczbaWpisow % l) gt 0]
        [#assign liczbaStron = liczbaStron + 1]
    [/#if]
                  <ul class="pagination">
    [#list 1..liczbaStron as i]
        [#if numerStrony != i]
                      <li>
        [#else]
                      <li class="active">
        [/#if]
                          <a href="/${content}?strona=${i}">${i}</a></li>
    [/#list]
                  </ul>
[/#if]
[/#if]
              </div>
          </div>
          <ul class="nav nav-pills nav-stacked col-md-2 col-md-offset-1" role="tablist">
[#assign stronyKatalog = cmsfn.contentByPath("/")]
[#assign stronyLista = cmsfn.children(stronyKatalog, "mgnl:page")]
[#list stronyLista as strona]
[#if content != strona]
              <li>
[#else]
              <li class="active">
[/#if]
                  <a href="/${strona}">${strona.title}</a></li>
[/#list]
              <li><a href="wejdz">Wejdź</a></li>
          </ul>
      </div>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="${ctx.contextPath}/.resources/moj-szablon/webresources/js/bootstrap.min.js"></script>
  </body>
</html>