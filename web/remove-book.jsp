<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="it">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Cancellazione di un libro su Online BookStore">
    <meta name="author" content="Fabio Somaglia">
    <title>Rimuovi libro - Online BookStore</title>
    <!-- Bootstrap CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom fonts for this template -->
    <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <!-- CSS for DataTables -->
    <link href="vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
    <link href="vendor/datatables/select/css/select.dataTables.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="css/sb-admin.css" rel="stylesheet">
    <!-- My custom styles for this template -->
    <link href="css/my-css.css" rel="stylesheet">
</head>

<body class="fixed-nav sticky-footer bg-dark" id="page-top">
<jsp:include page="page-structure/nav.jsp" flush="true"/>
<jsp:include page="Controller">
    <jsp:param name="action" value="remove-book"/>
</jsp:include>
<div class="content-wrapper">
    <div class="container-fluid">
        <!-- Breadcrumbs -->
        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                <a href="dashboard.jsp">Dashboard</a>
            </li>
            <li class="breadcrumb-item active">Rimuovi libro</li>
        </ol>
        <div class="row">
            <div class="col-12">
                <h1>Rimuovi un libro</h1>
                <hr>
            </div>
            <br>
            <div class="col-12">
                <!-- Error in deleting the book -->
                <c:if test="${requestScope.errorRemoveBook != null}">
                    <div class="alert alert-danger alert-dismissible fade show col-8 offset-2" role="alert">
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        <strong>Oh no!</strong> Abbiamo riscontrato dei problemi a cancellare il libro. Riprovare più tardi. Grazie.
                    </div>
                </c:if>
                <h6 class="mb-3">Per rimuovere un libro, selezionalo e in basso compariranno i dati riepilogativi del libro selezionato. Verificare che le informazioni siano corrette e fare click su "Rimuovi".</h6>
                <!-- DataTables for all books -->
                <div class="card mb-3">
                    <div class="card-header">
                        <i class="fa fa-fw fa-table"></i>Catalogo completo dei libri</div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table allbooks table-bordered table-hover" id="allBooks" width="100%" cellspacing="0">
                                <thead>
                                <tr>
                                    <th>ID Libro</th>
                                    <th>Titolo</th>
                                    <th>Autore/i</th>
                                    <th>Editore</th>
                                </tr>
                                </thead>
                                <tfoot>
                                <tr>
                                    <th>ID Libro</th>
                                    <th>Titolo</th>
                                    <th>Autore/i</th>
                                    <th>Editore</th>
                                </tr>
                                </tfoot>
                                <c:forEach items="${requestScope.allBooks}" var="book">
                                    <tr><td><c:out value="${book.bookId}" /></td><td><c:out value="${book.title}" /></td><td><c:out value="${book.author}" /></td><td><c:out value="${book.publisher}" /></td></tr>
                                </c:forEach>
                            </table>
                        </div>
                    </div>
                    <div class="card-footer small text-muted">
                        <c:set var = "now" value = "<%=new java.util.Date()%>" />
                        Ultimo aggiornamento: <fmt:formatDate type = "both" value = "${now}" />
                    </div>
                </div>
                <div id="containerFormRemove" class="mb-3">
                    <h4>Libro selezionato:</h4>
                    <form action="Controller" method="post" id="formRemove" class="form-inline">
                        <div class="form-group">
                            <label class="mr-2 col-form-label font-weight-bold" for="inputIdBook">ID Libro:</label>
                            <div class="mr-5 form-control-static" id="idbook"></div>
                            <input type="hidden" id="inputIdBook" name="inputIdBook" value=""/>
                        </div>
                        <div class="form-group">
                            <label class="mr-2 col-form-label font-weight-bold">Titolo:</label>
                            <div class="mr-5 form-control-static" id="title"></div>
                        </div>
                        <div class="form-group">
                            <label class="mr-2 col-form-label font-weight-bold">Autore/i:</label>
                            <div class="mr-5 form-control-static" id="author"></div>
                        </div>
                        <div class="form-group">
                            <label class="mr-2 col-form-label font-weight-bold">Editore:</label>
                            <div class="mr-5 form-control-static" id="publisher"></div>
                        </div>
                        <button type="submit" class="btn btn-primary" name="action" value="remove-confirmed">Rimuovi</button>
                    </form>
                </div>
            </div>
        </div>
        <jsp:include page="page-structure/footer.jsp" flush="true"/>
        <!-- Scroll to Top Button-->
        <a class="scroll-to-top rounded" href="#page-top">
            <i class="fa fa-angle-up"></i>
        </a>
    </div>
</div>
<!-- Bootstrap core JavaScript -->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Core plugin JavaScript -->
<script src="vendor/jquery-easing/jquery.easing.min.js"></script>
<!-- DataTables core JavaScript -->
<script src="vendor/datatables/jquery.dataTables.js"></script>
<script src="vendor/datatables/dataTables.bootstrap4.js"></script>
<script src="vendor/datatables/select/js/dataTables.select.min.js"></script>
<!-- Custom scripts for all pages -->
<script src="js/sb-admin.min.js"></script>
<!-- Custom scripts for DataTables -->
<script src="js/datatables.js"></script>
</body>

</html>
