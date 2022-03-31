from decimal import Decimal

from flask import Blueprint, jsonify, request
from my_app import db
from my_app.catalog.models import Product

catalog = Blueprint("catalog", __name__)


@catalog.route("/")
@catalog.route("/home")
def home():
    return "Welcome to the Catalog Home."


@catalog.route("/product/<id>")
def product(id):
    product = Product.objects.get_or_404(id=id)
    return "Product - %s, $%s" % (product.name, product.price)


@catalog.route("/products")
def products():
    products = Product.query.all()
    res = {}
    for product in products:
        res[product.id] = {
            "name": product.name,
            "price": str(product.price),
        }
    return jsonify(res)


@catalog.route(
    "/product-create",
    methods=[
        "POST",
    ],
)
def create_product():
    name = request.form.get("name")
    price = request.form.get("price")
    product = Product(name=name, price=Decimal(price))
    db.session.add(product)
    db.session.commit()

    return "Product created."
