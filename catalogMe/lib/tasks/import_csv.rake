namespace :import_csv do 
	desc "This task imports the csv and populates database with the datasets"
	task :import_csv_vehicles => [:environment] do
		
		puts "starting to read in CSV"
		
		filename = File.join Rails.root, "ForHireVehicles.csv"
		counter = 0

		require 'csv'
		require 'date'
		
		CSV.foreach(filename, :headers => true) do |row|
=begin
			row = {}
  			unstriped_row.each { |k, v| 
  								 k = k.nil? ? k : k.strip
  								 v = v.nil? ? v : v.strip
  								 row[k] = v
  								}
=end
  			last_date_updated = row[21].strip
  			last_time_updated =	row[22].strip			

			user = User.create({
								:active => row[0].strip,
								:vehicle_license_number => row[1].strip,
								:name => row[2].strip,	
								:license_type => row[3].strip, 
								:expiration_date =>  DateTime.parse(row[4].strip), #row[4],
								:permit_license_number => row[5].strip, 
								:dmv_license_plate_number => row[6].strip,	
								:vehicle_vin_number => row[7].strip,
								:wheelchair_accessible => row[8],
								:certification_date => DateTime.parse(row[9].strip), #row[9], 
								:hack_up_date => DateTime.parse(row[10].strip), #row[10],
								:vehicle_year => row[11].strip.to_i,
								:base_number => row[12].strip,
								:base_name => row[13].strip,
								:base_type => row[14].strip,
								:veh => row[15],
								:base_telephone_number => row[16].strip,
								:website => row[17],
								:base_address => row[18].strip,
								:reason => row[19].strip,
								:order_date => row[20], # DateTime.parse(row[20]), #row[20],
								:last_date_updated => DateTime.parse(last_date_updated), #row[21]
								:last_time_updated => last_date_updated + " " + last_time_updated
									#Date.strptime(last_date_updated, '%m/%d/%Y') + " " + row[22]
								 	#DateTime.strptime('#{last_date_updated_raw} #{last_time_updated_raw}', format) 
					})
			counter += 1 if user.persisted?
		end

		puts "Success: Just imported #{counter} lines/rows of vehicle data from the file ForHireVehicles.csv"

  end
end