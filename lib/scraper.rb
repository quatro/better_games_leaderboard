class Scraper
  include HTTParty
  base_uri 'https://games.crossfit.com'

  def start
    batch = DateTime.now.to_i / 60
    divisions = (1..19)
    competitions = [1]
    years = [2017]
    scaleds = [0,1]
    fittests = ['1','2','3','4','5']
    occupations = (1..9)
    sorts = (0..5)
    fittest1s = {
        "1" => (1..17),
        "2" => [],
        #  {
        #    "AF" => "Afghanistan",
        #    "AL" => "Albania",
        #    "DZ" => "Algeria",
        #    "AS" => "American Samoa",
        #    "AD" => "Andorra",
        #    "AO" => "Angola",
        #    "AI" => "Anguilla",
        #    "AQ" => "Antarctica",
        #    "AG" => "Antigua and Barbuda",
        #    "AR" => "Argentina",
        #    "AM" => "Armenia",
        #    "AW" => "Aruba",
        #    "AU" => "Australia",
        #    "AT" => "Austria",
        #    "AZ" => "Azerbaijan",
        #    "AX" => "Åland Islands",
        #    "BS" => "Bahamas",
        #    "BH" => "Bahrain",
        #    "BD" => "Bangladesh",
        #    "BB" => "Barbados",
        #    "BY" => "Belarus",
        #    "BE" => "Belgium",
        #    "BZ" => "Belize",
        #    "BJ" => "Benin",
        #    "BM" => "Bermuda",
        #    "BT" => "Bhutan",
        #    "BO" => "Bolivia",
        #    "BQ" => "Bonaire",
        #    "BA" => "Bosnia and Herzegovina",
        #    "BW" => "Botswana",
        #    "BV" => "Bouvet Island",
        #    "BR" => "Brazil",
        #    "IO" => "British Indian Ocean Terr.",
        #    "BN" => "Brunei Darussalam",
        #    "BG" => "Bulgaria",
        #    "BF" => "Burkina Faso",
        #    "BI" => "Burundi",
        #    "KH" => "Cambodia",
        #    "CM" => "Cameroon",
        #    "CA" => "Canada",
        #    "CV" => "Cape Verde",
        #    "KY" => "Cayman Islands",
        #    "CI" => "Côte d'Ivoire",
        #    "CF" => "Central African Republic",
        #    "TD" => "Chad",
        #    "CL" => "Chile",
        #    "CN" => "China",
        #    "CX" => "Christmas Island",
        #    "CC" => "Cocos (Keeling) Islands",
        #    "CO" => "Colombia",
        #    "KM" => "Comoros",
        #    "CD" => "Congo, Democratic Republic of",
        #    "CG" => "Congo, Republic of",
        #    "CK" => "Cook Islands",
        #    "CR" => "Costa Rica",
        #    "HR" => "Croatia",
        #    "CU" => "Cuba",
        #    "CW" => "Curaçao",
        #    "CY" => "Cyprus",
        #    "CZ" => "Czech Republic",
        #    "DK" => "Denmark",
        #    "DJ" => "Djibouti",
        #    "DM" => "Dominica",
        #    "DO" => "Dominican Republic",
        #    "EC" => "Ecuador",
        #    "EG" => "Egypt",
        #    "SV" => "El Salvador",
        #    "GQ" => "Equatorial Guinea",
        #    "ER" => "Eritrea",
        #    "EE" => "Estonia",
        #    "ET" => "Ethiopia",
        #    "FK" => "Falkland Islands (Malvinas)",
        #    "FO" => "Faroe Islands",
        #    "FJ" => "Fiji",
        #    "FI" => "Finland",
        #    "FR" => "France",
        #    "GF" => "French Guiana",
        #    "PF" => "French Polynesia",
        #    "TF" => "French Southern Terr.",
        #    "GA" => "Gabon",
        #    "GM" => "Gambia",
        #    "GE" => "Georgia",
        #    "DE" => "Germany",
        #    "GH" => "Ghana",
        #    "GI" => "Gibraltar",
        #    "GR" => "Greece",
        #    "GL" => "Greenland",
        #    "GD" => "Grenada",
        #    "GP" => "Guadeloupe",
        #    "GU" => "Guam",
        #    "GT" => "Guatemala",
        #    "GG" => "Guernsey",
        #    "GN" => "Guinea",
        #    "GW" => "Guinea-Bissau",
        #    "GY" => "Guyana",
        #    "HT" => "Haiti",
        #    "HM" => "Heard Island and McDonald Islands",
        #    "VA" => "Holy See (Vatican)",
        #    "HN" => "Honduras",
        #    "HK" => "Hong Kong",
        #    "HU" => "Hungary",
        #    "IS" => "Iceland",
        #    "IN" => "India",
        #    "ID" => "Indonesia",
        #    "IR" => "Iran",
        #    "IQ" => "Iraq",
        #    "IE" => "Ireland",
        #    "IM" => "Isle of Man",
        #    "IL" => "Israel",
        #    "IT" => "Italy",
        #    "JM" => "Jamaica",
        #    "JP" => "Japan",
        #    "JE" => "Jersey",
        #    "JO" => "Jordan",
        #    "KZ" => "Kazakhstan",
        #    "KE" => "Kenya",
        #    "KI" => "Kiribati",
        #    "KP" => "Korea, Democratic People's Republic of",
        #    "KR" => "Korea, Republic of",
        #    "KW" => "Kuwait",
        #    "KG" => "Kyrgyzstan",
        #    "LA" => "Laos",
        #    "LV" => "Latvia",
        #    "LB" => "Lebanon",
        #    "LS" => "Lesotho",
        #    "LR" => "Liberia",
        #    "LY" => "Libya",
        #    "LI" => "Liechtenstein",
        #    "LT" => "Lithuania",
        #    "LU" => "Luxembourg",
        #    "MO" => "Macao",
        #    "MK" => "Macedonia",
        #    "MG" => "Madagascar",
        #    "MW" => "Malawi",
        #    "MY" => "Malaysia",
        #    "MV" => "Maldives",
        #    "ML" => "Mali",
        #    "MT" => "Malta",
        #    "MH" => "Marshall Islands",
        #    "MQ" => "Martinique",
        #    "MR" => "Mauritania",
        #    "MU" => "Mauritius",
        #    "YT" => "Mayotte",
        #    "MX" => "Mexico",
        #    "FM" => "Micronesia",
        #    "MD" => "Moldova",
        #    "MC" => "Monaco",
        #    "MN" => "Mongolia",
        #    "ME" => "Montenegro",
        #    "MS" => "Montserrat",
        #    "MA" => "Morocco",
        #    "MZ" => "Mozambique",
        #    "MM" => "Myanmar",
        #    "NA" => "Namibia",
        #    "NR" => "Nauru",
        #    "NP" => "Nepal",
        #    "NL" => "Netherlands",
        #    "NC" => "New Caledonia",
        #    "NZ" => "New Zealand",
        #    "NI" => "Nicaragua",
        #    "NE" => "Niger",
        #    "NG" => "Nigeria",
        #    "NU" => "Niue",
        #    "NF" => "Norfolk Island",
        #    "MP" => "Northern Mariana Islands",
        #    "NO" => "Norway",
        #    "OM" => "Oman",
        #    "PK" => "Pakistan",
        #    "PW" => "Palau",
        #    "PS" => "Palestinian Territory",
        #    "PA" => "Panama",
        #    "PG" => "Papua New Guinea",
        #    "PY" => "Paraguay",
        #    "PE" => "Peru",
        #    "PH" => "Philippines",
        #    "PN" => "Pitcairn",
        #    "PL" => "Poland",
        #    "PT" => "Portugal",
        #    "PR" => "Puerto Rico",
        #    "QA" => "Qatar",
        #    "RE" => "Réunion",
        #    "RO" => "Romania",
        #    "RU" => "Russian Federation",
        #    "RW" => "Rwanda",
        #    "GS" => "S Georgia/S Sandwich Is",
        #    "BL" => "Saint Barthélemy",
        #    "SH" => "Saint Helena",
        #    "KN" => "Saint Kitts and Nevis",
        #    "LC" => "Saint Lucia",
        #    "MF" => "Saint Martin",
        #    "PM" => "Saint Pierre and Miquelon",
        #    "VC" => "Saint Vincent and the Grenadines",
        #    "WS" => "Samoa",
        #    "SM" => "San Marino",
        #    "ST" => "Sao Tome and Principe",
        #    "SA" => "Saudi Arabia",
        #    "SN" => "Senegal",
        #    "RS" => "Serbia",
        #    "SC" => "Seychelles",
        #    "SL" => "Sierra Leone",
        #    "SG" => "Singapore",
        #    "SX" => "Sint Maarten",
        #    "SK" => "Slovakia",
        #    "SI" => "Slovenia",
        #    "SB" => "Solomon Islands",
        #    "SO" => "Somalia",
        #    "ZA" => "South Africa",
        #    "SS" => "South Sudan",
        #    "ES" => "Spain",
        #    "LK" => "Sri Lanka",
        #    "SD" => "Sudan",
        #    "SR" => "Suriname",
        #    "SJ" => "Svalbard and Jan Mayen",
        #    "SZ" => "Swaziland",
        #    "SE" => "Sweden",
        #    "CH" => "Switzerland",
        #    "SY" => "Syrian Arab Republic",
        #    "TW" => "Taiwan",
        #    "TJ" => "Tajikistan",
        #    "TZ" => "Tanzania",
        #    "TH" => "Thailand",
        #    "TL" => "Timor-Leste",
        #    "TG" => "Togo",
        #    "TK" => "Tokelau",
        #    "TO" => "Tonga",
        #    "TT" => "Trinidad and Tobago",
        #    "TN" => "Tunisia",
        #    "TR" => "Turkey",
        #    "TM" => "Turkmenistan",
        #    "TC" => "Turks and Caicos Islands",
        #    "TV" => "Tuvalu",
        #    "UG" => "Uganda",
        #    "UA" => "Ukraine",
        #    "AE" => "United Arab Emirates",
        #    "GB" => "United Kingdom",
        #    "US" => "United States",
        #    "UY" => "Uruguay",
        #    "UM" => "US Minor Outlying Islands",
        #    "UZ" => "Uzbekistan",
        #    "VU" => "Vanuatu",
        #    "VE" => "Venezuela",
        #    "VN" => "Vietnam",
        #    "VG" => "Virgin Islands (British)",
        #    "VI" => "Virgin Islands (US)",
        #    "WF" => "Wallis and Futuna",
        #    "EH" => "Western Sahara",
        #    "YE" => "Yemen",
        #    "ZM" => "Zambia",
        #    "ZW" => "Zimbabwe"
        #},
        "3" => [],
        "4" => [],
        "5" => []
    }


    competitions.each do |competition|
      years.each do |year|
        divisions.each do |division|
          scaleds.each do |scaled|
            fittests.each do |fittest|
              fittest1s[fittest].each do |fittest1|
                occupations.each do |occupation|
                  sorts.each do |sort|
                    scrape_for_filter(competition, year, division, scaled, fittest, fittest1, occupation, sort, batch)
                  end
                end
              end
            end
          end
        end
      end
    end
  end

  def men(page)
    page_sex(1,page)
  end

  def women(page)
    page_sex(2,page)
  end

  def total_pages_men
    total_pages_sex(1)
  end

  def total_pages_women
    total_pages_sex(2)
  end

  def scrape_for_filter(competition, year, division, scaled, fittest, fittest1, occupation, sort, batch)
    # for this combination first get pages
    totalpages = page_count_for_filter(competition, year, division, scaled, fittest, fittest1, occupation, sort)

    #puts "competition: #{competition}"
    #puts "year: #{year}"
    #puts "division: #{division}"
    #puts "scaled: #{scaled}"
    #puts "fittest: #{fittest}"
    #puts "fittest1: #{fittest1}"
    #puts "occupation: #{occupation}"
    #puts "sort: #{sort}"
    #puts "batch: #{batch}"
    #puts "totalpages: #{totalpages}"

    if totalpages
      totalpages.times do |i|
        store_for_filter(competition, year, division, scaled, fittest, fittest1, occupation, sort, i+1, batch)
      end
    end

  end


  private

  def page_count_for_filter(competition, year, division, scaled, fittest, fittest1, occupation, sort)
    results = self.class.get("/competitions/api/v1/competitions/open/2017/leaderboards", { query: {compeition:competition, year:year, division:division, scaled:scaled, sort:sort, fittest:fittest, fittest1:fittest1, occupation: occupation, page:1}})
    results['totalpages']
  end

  def store_for_filter(competition, year, division, scaled, fittest, fittest1, occupation, sort, page, batch)
    results = self.class.get("/competitions/api/v1/competitions/open/2017/leaderboards", { query: {compeition:competition, year:year, division:division, scaled:scaled, sort:sort, fittest:fittest, fittest1:fittest1, occupation: occupation, page:page}})

    currentpage = results['currentpage']
    totalpages = results['totalpages']

    inserts = results['athletes'].map{ |athlete| "(#{[competition, year, division, scaled, fittest, fittest1, occupation, sort, currentpage, totalpages, sanitize(athlete['name']), athlete['userid'], athlete['overallrank'], athlete['overallscore'], athlete['regionid'], sanitize(athlete['region']), athlete['affiliateid'], sanitize(athlete['affiliate']), athlete['age'], athlete['highlight'], sanitize(athlete['height']), sanitize(athlete['weight']), sanitize(athlete['profilepic']), batch].join(', ')})" }

    sql = "INSERT INTO scrapes (competition, year, division, scaled, fittest, fittest1, occupation, sort, currentpage, totalpages, name, userid, overallrank, overallscore, regionid, region, affiliateid, affiliate, age, highlight, weight, height, profilepic, batch) VALUES #{inserts.join(', ')}"

    ActiveRecord::Base.connection.execute(sql) if inserts.any? # Only insert if there's something to insert
  end

  def sanitize(str)
    ActiveRecord::Base::sanitize(str)
  end

end




