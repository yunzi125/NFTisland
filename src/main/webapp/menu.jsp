<%@ page contentType="text/html; charset=UTF-8" %>
<nav class="navbar navbar-expand navbar-dark bg-dark">
  <a class="navbar-brand" href="#">NFT ISLAND</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbars" aria-controls="navbars" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarsExample02">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="./welcome.jsp">Home <span class="sr-only"></span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="./works.jsp">NFT WORKS</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="./addWork.jsp">ADD WORK</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="./editWork.jsp">EDIT WORK</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="./editWork.jsp?edit=delete">DELETE WORK</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="./liked.jsp">LIKED LIST</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="./login.jsp">LOGIN</a>
      </li>
    </ul>
    <form class="form-inline my-2 my-md-0">
      <input class="form-control" type="text" placeholder="Search">
    </form>
  </div>
</nav>