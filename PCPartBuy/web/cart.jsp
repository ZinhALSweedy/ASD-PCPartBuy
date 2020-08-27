<%@page import="model.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:useBean id="cart" class="model.Cart" scope="session"/>
<jsp:setProperty name="cart" property="*"/>

<header>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
</header>
<body>
    <style>
            .logo {width: 150px;}
            .divFloat{display: flex;
                      justify-content: flex-end;
                      flex-direction: row;
                      padding: 50px 0px;
            }
            .checkoutHeader{display: inline-block; margin-left: auto;}
            .checkoutBody{display: inline-block; float: right;}
        </style>
        
<div class="container mt-4">
    
    <div class="divFloat">
        <div class="checkoutBody">
                    <a href="index.html" class='goback'> < Go Back </a>
                </div>
                <div class="checkoutHeader">
                    <a href="index.html" class="logolink"><img class="logo" src="images/pcpartbuy.png" alt="logo"></a>
                </div>
            </div>
    
    <div class="row">
        <div class="col-12">
            <div class="table-responsive">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th scope="col"> </th>
                            <th scope="col">Product</th>
                            <th scope="col">Available</th>
                            <th scope="col" class="text-center">Quantity</th>
                            <th scope="col" class="text-right">Price</th>
                            <th scope="col"> </th>
                            <th scope="col"> </th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (CartItem cartItem : cart.getItems()) { %>
                        <form method="post" action="cart">
                            <input type="hidden" name="cartItemID" value="<%= cartItem.getItemID() %>">
                            <tr>
                                <td></td>
                                <td><%= cartItem.getProductID() %></td>
                                <td>In stock</td>
                                <td><input class="form-control" type="text" name="quantity" value="<%= cartItem.getQuantity() %>" /></td>
                                <td class="text-right">$ <%= cartItem.getPrice() %> </td>
                                <td class="text-right"><button class="btn btn-sm btn-info" type="submit" name="action" value="update"><i class="fa fa-save"></i> </button> </td>
                                <td class="text-right"><button class="btn btn-sm btn-danger" type="submit" name="action" value="remove"><i class="fa fa-trash"></i> </button> </td>
                            </tr>
                        </form>
                        <% } %>
                        
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td><strong>Total</strong></td>
                            <td class="text-right"><strong>$ <%= cart.getCartTotal() %> </strong></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="col-12">
            <div class="row">
                <div class="col-sm-12  col-md-6">
                    <form action="cart" method="post">
                        <button class="btn btn-lg btn-block btn-secondary text-uppercase" type="submit" name="action" value="continue">Continue Shopping</button>
                    </form>
                </div>
                <div class="col-sm-12 col-md-6 text-right">
                    <form action="checkout" method="post">
                        <button class="btn btn-lg btn-block btn-success text-uppercase" type="submit" name="action" value="checkout">Checkout</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>    
</body>

