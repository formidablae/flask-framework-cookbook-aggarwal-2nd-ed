from decimal import Decimal

from flask import Blueprint, jsonify, request
from my_app import db
from my_app.catalog_with_categories.models import Category, Product

catalog_with_categories = Blueprint("catalog_with_categories", __name__)


@catalog_with_categories.route("/")
@catalog_with_categories.route("/home")
def home():
    return "Welcome to the Catalog Home."


@catalog_with_categories.route("/product/<id>")
def product(id):
    product = Product.objects.get_or_404(id=id)
    return "Product - %s, $%s" % (product.name, product.price)


@catalog_with_categories.route("/products")
def products():
    products = Product.query.all()
    res = {}
    for product in products:
        res[product.id] = {"name": product.name, "price": str(product.price), "category": product.category.name}
    return jsonify(res)


@catalog_with_categories.route(
    "/product-create",
    methods=[
        "POST",
    ],
)
def create_product():
    name = request.form.get("name")
    price = request.form.get("price")
    categ_name = request.form.get("category")
    category = Category.query.filter_by(name=categ_name).first()
    if not category:
        category = Category(name=categ_name)
    product = Product(name=name, price=Decimal(price), category=category)
    db.session.add(product)
    db.session.commit()

    return "Product created."


@catalog_with_categories.route("/category-create", methods=["POST"])
def create_category():
    name = request.form.get("name")
    category = Category(name=name)
    db.session.add(category)
    db.session.commit()

    return "Category created."


@catalog_with_categories.route("/categories")
def categories():
    categories = Category.query.all()
    res = {}
    for category in categories:
        res[category.id] = {
            "name": category.name,
        }

        for product in category.products:
            res[category.id]["products"] = {
                "id": product.id,
                "name": product.name,
                "price": str(product.price),
            }

    return jsonify(res)
