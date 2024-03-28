<%@page import="java.util.Date"%>

    <footer class="py-3 my-4">
    <p class="text-center text-dark">&copy;  <a href="https://www.bigezo.com">  <%
                                     Date d=new Date();
                                     int yea=d.getYear();
                                     int year=yea+1900;
                                       int year2=year+1;
                                //     out.println(year);
                                     %> <%
                                                                    out.println(year);
                                     %>  Bigezo Technologies</a> </p>
  <p class="text-center text-body-secondary">
    +256 773913902 , bigezobot@gmail.com , info@bigezo.com
  </p>

  <p class="text-sm text-center" style="font-size: 70%">
    Fear God, and give glory to Him <span class="text-danger"> Rev 14:6-7</span>
  </p>
</footer>



   <script src="js/bootstrap.bundle.min.js"></script>