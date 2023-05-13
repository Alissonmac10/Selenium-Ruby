require 'rspec/expectations'
require 'rspec'
require 'selenium-webdriver'
require 'minitest/autorun'
require './spec/TestesLogin/LoginPage'
class LoginTest < Minitest::Test
  def setup
    @driver = Selenium::WebDriver.for :chrome
    @url = 'https://www.saucedemo.com/'
    @urlMenu = "https://www.saucedemo.com/inventory.html"
  end
  #Fecha o navegador
  def teardown
    @driver.quit
  end
  def test_login_sucesso
    #instancia
    @driver.get(@url)
    login_page = LoginPage.new(@driver)
    #Preenche formulario
    login_page.preencher_campos("standard_user", "secret_sauce")
    #Clica no botao de login
    login_page.fazer_login
    #Espera 3 segundos
    sleep(3)
    #Verifica se foi redirecionado para o menu
    current_url = @driver.current_url
    assert_equal(@urlMenu, current_url)
  end
end
