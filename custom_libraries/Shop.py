from robot.api.deco import library, keyword

@library
class Shop:

    # def __init__(self):

    @keyword
    def hello_world(self):
        print("Hello World my friends!!")

    @keyword
    def add_items_to_cart_and_checkout(self):
        pass
