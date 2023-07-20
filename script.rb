require 'yaml'

$taxcodes = YAML.load_file('taxcodes.yml')
$emergencyCodes = YAML.load_file('taxcodes.yml')

def getUsersTaxCode()
  usersCode = gets
  return usersCode
end

def checkCode(taxCode)
  $taxcodes.each { |item|
    if taxCode.match(item["code"])
      puts "As your tax code contains #{item["code"]}, #{item["description"]}"
    end 
  }
end

def checkEmergencyCode(taxCode)
  $emergencyCodes.each { |item|
    if taxCode.match(item["code"])
      puts "As your tax code also contains #{item["code"]}, #{item["description"]}"
    end 
  }
end

def getPersonalAllowance(taxCode)
  personalAllowance = taxCode[/\d{3,}/,0]
  personalAllowance = personalAllowance.to_i * 10
  # personalAllowance.insert(2, ",")
  puts("Based on the information you have provided, your personal allowance is £#{personalAllowance}")
end

def main()
  usersTaxCode = getUsersTaxCode
  checkCode(usersTaxCode)
  getPersonalAllowance(usersTaxCode)
end

main