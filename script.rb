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
  emergencyOutcomes = []
  $emergencyCodes.each { |item|
    if taxCode.match(item["code"])
      emergencyOutcomes.append("As your tax code also contains #{item["code"]}, #{item["description"]}")
    end 
  }
  return emergencyOutcomes
end

def getPersonalAllowance(taxCode)
  personalAllowance = taxCode[/\d{3,}/,0]
  personalAllowance = personalAllowance.to_i * 10
  return personalAllowance
end