
# Create a new FTP client object by calling Net::FTP.new and passing in the hostname and port number of the FTP server. You may also need to provide a username and password if the FTP server requires authentication.
# ftp = Net::FTP.new('ftp.ghestia.cat', 21)


# puts "Logging to ghestia FTP"

# ftp = Net::FTP.new('ftp.ghestia.cat')
# ftp.login(ENV['GH_L'], ENV['GH_P'])

# puts "Logged in"


# To view the directory on the FTP server that contains the XML files you want to download, you can use the dir method of the Net::FTP class. This method lists the files and directories in the current directory on the FTP server.


# *
# ftp.dir do |file|
#   puts file
# end
# *

# Use the chdir method to navigate to the directory on the FTP server that contains the XML files you want to download.

# puts "Importing files"

# ftp.nlst.each do |filename|
#   path = "public/xml/#{filename}"
#   if File.exist?(path)
#     puts 'File already exists'
#   else
#     ftp.getbinaryfile(filename, "public/xml/#{filename}")
#     puts "File #{filename} imported"
#   end
# end

# puts "Done importing files"


# To download a specific file from an FTP server in Ruby on Rails, you can use the getbinaryfile method of the Net::FTP class. This method allows you to download a file from the FTP server and save it to a local file.
# ftp.chdir("/")
# ftp.getbinaryfile("INMUEBLES_MODIFICADOS.xml", "public/xml/INMUEBLES_MODIFICADOS.xml")


puts "Parsing xml file with Nokogiri"

doc = Nokogiri::XML(File.open("public/xml/INMUEBLES_MODIFICADOS.xml"))

puts "Done parsing"

# # Parse the XML and create objects as needed

# # item is the name of the element in the xml document <item></item>
realestates = doc.search('inmueble')

# # Iterate over the elements and extract the data you want to use to create objects. You can use the element.content method to get the content of an element, and the element['attribute'] syntax to get the value of an attribute.

# puts "Destroying all properties"
puts "Destroying all features"
Feature.destroy_all
# Image.destroy_all
# Realestate.destroy_all

# puts "Creating real estate properties in Rails..."
@realestatesRails = Realestate.all

realestates.each do |realestate|

#   idfile = realestate.search('IdFicha').first.content if realestate.search('IdFicha').first

#   idagency = realestate.search('IdAgencia').first.content if realestate.search('IdAgencia').first

#   rstype = realestate.search('TipoGenerico').first.content if realestate.search('TipoGenerico').first

#   reference = realestate.search('Referencia').first.content if realestate.search('Referencia').first

#   country = realestate.search('Pais').first.content if realestate.search('Pais').first

#   speclocation = realestate.search('SituacionConcreta').first.content if realestate.search('SituacionConcreta').first

#   typestreet = realestate.search('TipoVia').first.content if realestate.search('TipoVia').first

#   namestreet = realestate.search('NombreVia').first.content if realestate.search('NombreVia').first

#   numberstreet = realestate.search('NumeroVia').first.content if realestate.search('NumeroVia').first

#   usurface = realestate.search('SuperficieUtil').first.content if realestate.search('SuperficieUtil').first

#   csurface = realestate.search('SuperficieConstruida').first.content if realestate.search('SuperficieConstruida').first

#   salesprice = realestate.search('PrecioVenta').first.content if realestate.search('PrecioVenta').first

#   rentprice = realestate.search('PrecioAlquiler').first.content if realestate.search('PrecioAlquiler').first

#   region = realestate.search('Comunidad').first.content if realestate.search('Comunidad').first

#   province = realestate.search('Provincia').first.content if realestate.search('Provincia').first

#   town = realestate.search('Localidad').first.content if realestate.search('Localidad').first

#   postcode = realestate.search('CodigoPostal').first.content if realestate.search('CodigoPostal').first

#   address = typestreet + " " + namestreet + " " + numberstreet + ", " + postcode + " " + town

#   latitude = realestate.search('Latitud').first.content if realestate.search('Latitud').first

#   longitude = realestate.search('Longitud').first.content if realestate.search('Longitud').first

#   area = realestate.search('Zona').first.content if realestate.search('Zona').first

#   title = realestate.search('SloganCAT').first.content if realestate.search('SloganCAT').first

#   ad = realestate.search('AnuncioCAT').first.content if realestate.search('AnuncioCAT').first

#   images = realestate.search('foto url').map(&:text)

features = realestate.search("Caracteristica")

#   # {x:, y:} is syntax sugar for {x: x, y: y}.

#   realestate_web = Realestate.create(idfile:, idagency:, rstype:, reference:, country:, speclocation:, typestreet:, namestreet:, numberstreet:, usurface:, csurface:, salesprice:, rentprice:, region:, province:, town:, postcode:, area:, title:, ad:, address:, latitude:, longitude:)

#   images.each do |url|
#     Image.create(url:, realestate_id: realestate_web.id)
#   end


puts "Creating features"
@realestatesRails.each do |rs|
  if realestate.search('IdFicha').first.content == rs.idfile
    features.each do |feature|
      name = feature.at("Descripcion").text
      value = feature.at("Valor").text
      Feature.create(name:, value:, realestate_id: rs.id)
    end
  end
end

puts "Added feature to #{realestate.search('IdFicha').first.content}"
end

# puts "Done creating realestate properties!"
# If you have a large number of objects to create, you may want to consider using the activerecord-import gem to optimize the process. This gem allows you to create multiple objects in a single database query, which can be much faster than creating each object individually.


# items = []
# items.each do |item|
#   name = item.search('name').first.content
#   price = item['price']
#   items << Item.new(name: name, price: price)
# end
# Item.import items


# puts "creating towns"
# @all_towns = Realestate.all.pluck(:town).uniq
# @all_towns.each do |town|
#   Town.create(
#     name: town
#   )
# end

# puts "adding realestates to towns"
# @all_realestates = Realestate.all
# @all_realestates.each do |rs|
#   rs.town_id = Town.find_by(name: rs.town).id
#   rs.save!
# end
# puts "Done!"
=======
