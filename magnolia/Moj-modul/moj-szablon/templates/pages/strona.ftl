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
                  <div class="media">
[#if content.image?has_content]
                      <a class="pull-right" href="${content.image}">
                          <img class="media-object img-thumbnail" src="${content.image}" alt="...">
                      </a>
[/#if]
[#if content.introText?has_content]
                      <div class="media-body">
${cmsfn.decode(content).introText}
                      </div>
[/#if]
                  </div>
              </div>
          </div>
          <ul class="nav nav-pills nav-stacked col-md-2 col-md-offset-1" role="tablist">
[#assign stronyKatalog = cmsfn.contentByPath("/")]
[#assign stronyLista = cmsfn.children(stronyKatalog, "mgnl:page")]
[#list stronyLista as strona]
[#if content != strona]
              <li><a href="/${strona}">${strona.title}</a></li>
[#else]
              <li class="active"><a href="/${strona}">${strona.title}</a></li>
[/#if]
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