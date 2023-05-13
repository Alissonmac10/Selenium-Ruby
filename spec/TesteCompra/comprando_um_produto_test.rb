require 'rspec/expectations'
require 'rspec'
require 'selenium-webdriver'
require 'minitest/autorun'
require './spec/TesteCompra/compraPage'
require './spec/BaseObject'
class ComprandoUmProdutoTest < Minitest::Test
  def setup
    @driver = Selenium::WebDriver.for :chrome
    @url = 'https://www.saucedemo.com/'
  end

  def teardown
    @driver.quit
  end

  def test_compra_sucesso
    #instancia
    @driver.get(@url)
    base_page = BaseObject.new(@driver)

    sleep(3)
    base_page.fazer_login("standard_user","secret_sauce")
    @produto = @driver.find_element(:xpath, '//*[@class="inventory_item_name" and text()="Sauce Labs Bike Light"]').click
    sleep(3)
    
  end
end
