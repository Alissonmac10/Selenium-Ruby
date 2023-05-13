
require 'rspec'
require 'selenium-webdriver'
require 'rspec/expectations'

class LoginPage
  def initialize(driver)
    @driver = driver
    @url = 'https://www.saucedemo.com/'
    @campousuario = @driver.find_element(:id, "user-name")
    @camposenha = @driver.find_element(:id, "password")
    @botaologin = @driver.find_element(:id, "login-button")
    @url_menu = "https://www.saucedemo.com/inventory.html"
  end
  def preencher_campos(usuario, senha)
    @campousuario.send_keys(usuario)
    @camposenha.send_keys(senha)
  end
  def fazer_login
    @botaologin.click
  end
  def mensagemErro
    @driver.find_element(:xpath, '//h3[@data-test="error" and text()="Epic sadface: Username and password do not match any user in this service"]')
  end
  def sair
    @driver.quit
  end
end
