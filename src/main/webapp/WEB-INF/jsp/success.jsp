<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <sec:csrfMetaTags />
    <!--
        <meta name="_csrf" content="${_csrf.token}"/>
        <meta name="_csrf_header" content="${_csrf.headerName}"/>
    -->

    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Spring Boot CSRF Success</title>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
    <link rel="stylesheet" href="styles/styles.css">
</head>
<body>

<div class="container">
    <div class="header clearfix">

        <h3 class="text-muted">Success Login with CSRF</h3>
        <a class="btn btn-primary" href="/logout" >Logout</a>
   <a class="btn btn-primary" href="/home" >Home</a>
        
    </div>

<div >
<h2>
<%

out.println(session.getAttribute("User"));
%>
</h2>
</div>
    <div class="row marketing">
        <div class="col-lg-12">
            <h4>Info</h4>
            <dl>
                <dt>Session Id:</dt>
                <dd><c:out value="${pageContext.request.session.id}" /></dd>
            </dl>
            <dl>
                <dt>_csrf.token:</dt>
                <dd><c:out value="${_csrf.token}" /></dd>
            </dl>
            <dl>
                <dt>Session scope:</dt>
                <dd><c:out value="${sessionScope}" /></dd>
            </dl>
        </div>
    </div>


</div> <!-- /container -->

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>

<script src="//cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>

<script>

    $(function () {
        var csrfToken = $("meta[name='_csrf']").attr("content");
        var csrfHeader = $("meta[name='_csrf_header']").attr("content");

        /*
        var csrfToken = $.cookie('CSRF-TOKEN');
        var csrfHeader = $.cookie('CSRF-HEADER');
        */

        $(document).ajaxSend(function(e, xhr, options) {
            xhr.setRequestHeader(csrfHeader, csrfToken);
        });
        /*
        */

    });

</script>
</body>
</html>