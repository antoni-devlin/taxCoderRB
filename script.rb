require 'yaml'

$taxcodes = YAML.load_file('taxcodes.yml')
$emergencyCodes = YAML.load_file('emergencycodes.yml')

def getUsersTaxCode(usersCode)
  #TODO: Add validation taxcode validation here
  return usersCode
end

def checkCode(taxCode)
  outcomes = []
  $taxcodes.each { |item|
    if taxCode.match(item["code"])
      outcomes.append("As your tax code contains #{item["code"]}, #{item["description"]}")
    end 
  }
  return outcomes
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
  return personalAllowance
end