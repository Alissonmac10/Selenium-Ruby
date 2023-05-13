
require 'rspec'
require 'selenium-webdriver'
require 'rspec/expectations'

class BaseObject
  def initialize(driver)
    @driver = driver
    @url = 'https://www.saucedemo.com/'
    @campousuario = @driver.find_element(:id, "user-name")
    @camposenha = @driver.find_element(:id, "password")
    @botaologin = @driver.find_element(:id, "login-button")
    @url_menu = "https://www.saucedemo.com/inventory.html"
  end
  def fazer_login(usuario, senha)
    @campousuario.send_keys(usuario)
    @camposenha.send_keys(senha)
    @botaologin.click
  end

  def sair
    @driver.quit
  end
end


