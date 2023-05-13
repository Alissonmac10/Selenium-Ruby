require 'rspec/expectations'
require 'rspec'
require 'selenium-webdriver'
require 'minitest/autorun'
require './spec/TestesLogin/LoginPage'

class LoginFalhoTest < Minitest::Test
  def setup
    @driver = Selenium::WebDriver.for :chrome
    @url = 'https://www.saucedemo.com/'
  end

  def teardown
    @driver.quit
  end
  def test_login_falho
    #instancia
    @driver.get(@url)
    login_page = LoginPage.new(@driver)
    #Preenche formulario
    login_page.preencher_campos("standard_user", "senha-incorreta")
    #Clica no botao de login
    login_page.fazer_login
    #Espera 3 segundos
    sleep(3)
    #Verificando se mensagem de erro apareceu
    assert login_page.mensagemErro
  end
end
