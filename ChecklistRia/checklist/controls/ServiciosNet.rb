# encoding: utf-8
# copyright: 2018, The Authors

title 'Validación de Servicios Net'

#Validación de servicio DHCP en VM NET
if os.release == '10.04'
   describe service('dhcp3-server') do
     it {should be_installed}
     it {should be_enabled}
     it {should be_running}
   end
end

if os.release == '16.04'
  describe service('isc-dhcp-server') do
     it {should be_installed}
     it {should be_enabled}
     it {should be_running}
   end
end

if os.release == '18.04'
  describe service('isc-dhcp-server') do
     it {should be_installed}
     it {should be_enabled}
     it {should be_running}
   end
end


#Validación de servicio snmpd en VMs
describe service('snmpd') do
  it {should be_installed}
  it {should be_enabled}
  it {should be_running}
end

#Validación de servicio bind en VM NET
describe service('bind9') do
  it {should be_installed}
  it {should be_enabled}
  it {should be_running}
end

#Validación de servicio bind en VM NET
describe service('ntp') do
  it {should be_installed}
  it {should be_enabled}
  it {should be_running}
end

