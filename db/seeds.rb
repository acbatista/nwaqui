@user = Admin::AdminUser.new({
  name: "homologação",
  email: "homologacao@homologacao.com",
  telephone: "619999999",
  username: "homolog",
  password: "123456789",
  password_confirmation: "123456789",
  status: true
})

@user.save

@user = Admin::CustomerUser.new({
  name: "homologação",
  email: "homologacao@homologacao.com",
  telephone: "619999999",
  username: "homolog",
  password: "123456789",
  password_confirmation: "123456789",
  status: true
})

@user.save