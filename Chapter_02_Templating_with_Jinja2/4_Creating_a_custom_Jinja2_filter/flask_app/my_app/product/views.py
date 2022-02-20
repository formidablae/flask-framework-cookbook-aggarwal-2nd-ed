from flask import Blueprint, render_template
from my_app.product.models import PRODUCTS
from werkzeug.exceptions import abort

product_blueprint = Blueprint('product', __name__)

@product_blueprint.route('/')
@product_blueprint.route('/home')
def home():
    return render_template('home.html', products=PRODUCTS)

@product_blueprint.route('/product/<key>')
def product(key):
    product = PRODUCTS.get(key)
    if not product:
        abort(404)
    return render_template('product.html', product=product)

@product_blueprint.context_processor
def product_name_processor():
    def full_name(product):
        return '{0} / {1}'.format(product['category'], product['name'])
    return {'full_name': full_name}
