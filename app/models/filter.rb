class Filter
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :competition, :year, :division, :scaled, :sort, :fittest, :fittest1, :occupation, :page, :athlete, :regional, :games

  def initialize(h={})
    h.each {|k,v| public_send("#{k}=",v) if respond_to?("#{k}=")}
  end

  def persisted?
    false
  end



  def self.competition_options
    {'Open' => 1}
  end

  def self.regional_options
    {
        'California' => 2,
        'Atlantic' => 1,
        'Central' => 3,
        'East' => 4,
        'Meridian' => 5,
        'Pacific' => 6,
        'South' => 7,
        'West' => 8
    }
  end

  def self.open_division_options
    {
        'Individual Men' => 1,
        'Individual Women' => 2,
        'Team' => 11,
        'Teenage Girls (14-15)' => 15,
        'Teenage Boys (14-15)' => 14,
        'Teenage Girls (16-17)' => 17,
        'Teenage Boys (16-17)' => 16,
        'Masters Women (35-39)' => 19,
        'Masters Men (35-39)' => 18,
        'Masters Women (40-44)' => 13,
        'Masters Men (40-44)' => 12,
        'Masters Women (45-49)' => 4,
        'Masters Men (45-49)' => 3,
        'Masters Women (50-54)' => 6,
        'Masters Men (50-54)' => 5,
        'Masters Women (55-59)' => 8,
        'Masters Men (55-59)' => 7,
        'Masters Women (60+)' => 10,
        'Masters Men (60+)' => 9
    }
  end

  def self.regional_division_options
    {
        'Individual Men' => 1,
        'Individual Women' => 2,
        'Team' => 11
    }
  end

  def self.scaled_options
    {
        'Rx' => 0,
        #'Scaled' => 1
    }
  end

  def self.year_options
    {
        '2017' => 2017
    }
  end

  def self.fittest_options
    {
        'Region' => '1',
        #'Country' => '2',
        #'US States' => '3',
        #'Canadian Provinces' => '4',
        #'Australian States' => '5'
    }
  end

  def self.fittest1_options
    {
        '1' =>
        {
            'Worldwide' => 0,
            'Africa Middle East' => 25,
            'Asia' => 20,
            'Australia' => 21,
            'Canada East' => 18,
            'Canada West' => 5,
            'Central America' => 26,
            'Central East' => 6,
            'Europe Central' => 23,
            'Europe North' => 22,
            'Europe South' => 24,
            'Mid Atlantic' => 9,
            'North Central' => 10,
            'North East' => 11,
            'South America' => 27,
            'South Central' => 14,
            'South East' => 15,
            'South West' => 17,
            'West Coast' => 19
        },

        #{
        #  'Worldwide' => 0,
        #  'Africa' => 1,
        #  'Asia' => 2,
        #  'Australia' => 3,
        #  'Canada East' => 4,
        #  'Canada West' => 5,
        #  'Central East' => 6,
        #  'Europe' => 7,
        #  'Latin America' => 8,
        #  'Mid Atlantic' => 9,
        #  'North Central' => 10,
        #  'North East' => 11,
        #  'Northern California' => 12,
        #  'North West' => 13,
        #  'South Central' => 14,
        #  'South East' => 15,
        #  'Southern California' => 16,
        #  'South West' => 17
        #},
        '2' =>
              {
                "Afghanistan" =>                               "AF",
                "Albania" =>                                   "AL",
                "Algeria" =>                                   "DZ",
                "American Samoa" =>                            "AS",
                "Andorra" =>                                   "AD",
                "Angola" =>                                    "AO",
                "Anguilla" =>                                  "AI",
                "Antarctica" =>                                "AQ",
                "Antigua and Barbuda" =>                       "AG",
                "Argentina" =>                                 "AR",
                "Armenia" =>                                   "AM",
                "Aruba" =>                                     "AW",
                "Australia" =>                                 "AU",
                "Austria" =>                                   "AT",
                "Azerbaijan" =>                                "AZ",
                "Åland Islands" =>                             "AX",
                "Bahamas" =>                                   "BS",
                "Bahrain" =>                                   "BH",
                "Bangladesh" =>                                "BD",
                "Barbados" =>                                  "BB",
                "Belarus" =>                                   "BY",
                "Belgium" =>                                   "BE",
                "Belize" =>                                    "BZ",
                "Benin" =>                                     "BJ",
                "Bermuda" =>                                   "BM",
                "Bhutan" =>                                    "BT",
                "Bolivia" =>                                   "BO",
                "Bonaire" =>                                   "BQ",
                "Bosnia and Herzegovina" =>                    "BA",
                "Botswana" =>                                  "BW",
                "Bouvet Island" =>                             "BV",
                "Brazil" =>                                    "BR",
                "British Indian Ocean Terr." =>                "IO",
                "Brunei Darussalam" =>                         "BN",
                "Bulgaria" =>                                  "BG",
                "Burkina Faso" =>                              "BF",
                "Burundi" =>                                   "BI",
                "Cambodia" =>                                  "KH",
                "Cameroon" =>                                  "CM",
                "Canada" =>                                    "CA",
                "Cape Verde" =>                                "CV",
                "Cayman Islands" =>                            "KY",
                "Côte d'Ivoire" =>                             "CI",
                "Central African Republic" =>                  "CF",
                "Chad" =>                                      "TD",
                "Chile" =>                                     "CL",
                "China" =>                                     "CN",
                "Christmas Island" =>                          "CX",
                "Cocos (Keeling) Islands" =>                   "CC",
                "Colombia" =>                                  "CO",
                "Comoros" =>                                   "KM",
                "Congo, Democratic Republic of" =>             "CD",
                "Congo, Republic of" =>                        "CG",
                "Cook Islands" =>                              "CK",
                "Costa Rica" =>                                "CR",
                "Croatia" =>                                   "HR",
                "Cuba" =>                                      "CU",
                "Curaçao" =>                                   "CW",
                "Cyprus" =>                                    "CY",
                "Czech Republic" =>                            "CZ",
                "Denmark" =>                                   "DK",
                "Djibouti" =>                                  "DJ",
                "Dominica" =>                                  "DM",
                "Dominican Republic" =>                        "DO",
                "Ecuador" =>                                   "EC",
                "Egypt" =>                                     "EG",
                "El Salvador" =>                               "SV",
                "Equatorial Guinea" =>                         "GQ",
                "Eritrea" =>                                   "ER",
                "Estonia" =>                                   "EE",
                "Ethiopia" =>                                  "ET",
                "Falkland Islands (Malvinas)" =>               "FK",
                "Faroe Islands" =>                             "FO",
                "Fiji" =>                                      "FJ",
                "Finland" =>                                   "FI",
                "France" =>                                    "FR",
                "French Guiana" =>                             "GF",
                "French Polynesia" =>                          "PF",
                "French Southern Terr." =>                     "TF",
                "Gabon" =>                                     "GA",
                "Gambia" =>                                    "GM",
                "Georgia" =>                                   "GE",
                "Germany" =>                                   "DE",
                "Ghana" =>                                     "GH",
                "Gibraltar" =>                                 "GI",
                "Greece" =>                                    "GR",
                "Greenland" =>                                 "GL",
                "Grenada" =>                                   "GD",
                "Guadeloupe" =>                                "GP",
                "Guam" =>                                      "GU",
                "Guatemala" =>                                 "GT",
                "Guernsey" =>                                  "GG",
                "Guinea" =>                                    "GN",
                "Guinea-Bissau" =>                             "GW",
                "Guyana" =>                                    "GY",
                "Haiti" =>                                     "HT",
                "Heard Island and McDonald Islands" =>         "HM",
                "Holy See (Vatican)" =>                        "VA",
                "Honduras" =>                                  "HN",
                "Hong Kong" =>                                 "HK",
                "Hungary" =>                                   "HU",
                "Iceland" =>                                   "IS",
                "India" =>                                     "IN",
                "Indonesia" =>                                 "ID",
                "Iran" =>                                      "IR",
                "Iraq" =>                                      "IQ",
                "Ireland" =>                                   "IE",
                "Isle of Man" =>                               "IM",
                "Israel" =>                                    "IL",
                "Italy" =>                                     "IT",
                "Jamaica" =>                                   "JM",
                "Japan" =>                                     "JP",
                "Jersey" =>                                    "JE",
                "Jordan" =>                                    "JO",
                "Kazakhstan" =>                                "KZ",
                "Kenya" =>                                     "KE",
                "Kiribati" =>                                  "KI",
                "Korea, Democratic People's Republic of" =>    "KP",
                "Korea, Republic of" =>                        "KR",
                "Kuwait" =>                                    "KW",
                "Kyrgyzstan" =>                                "KG",
                "Laos" =>                                      "LA",
                "Latvia" =>                                    "LV",
                "Lebanon" =>                                   "LB",
                "Lesotho" =>                                   "LS",
                "Liberia" =>                                   "LR",
                "Libya" =>                                     "LY",
                "Liechtenstein" =>                             "LI",
                "Lithuania" =>                                 "LT",
                "Luxembourg" =>                                "LU",
                "Macao" =>                                     "MO",
                "Macedonia" =>                                 "MK",
                "Madagascar" =>                                "MG",
                "Malawi" =>                                    "MW",
                "Malaysia" =>                                  "MY",
                "Maldives" =>                                  "MV",
                "Mali" =>                                      "ML",
                "Malta" =>                                     "MT",
                "Marshall Islands" =>                          "MH",
                "Martinique" =>                                "MQ",
                "Mauritania" =>                                "MR",
                "Mauritius" =>                                 "MU",
                "Mayotte" =>                                   "YT",
                "Mexico" =>                                    "MX",
                "Micronesia" =>                                "FM",
                "Moldova" =>                                   "MD",
                "Monaco" =>                                    "MC",
                "Mongolia" =>                                  "MN",
                "Montenegro" =>                                "ME",
                "Montserrat" =>                                "MS",
                "Morocco" =>                                   "MA",
                "Mozambique" =>                                "MZ",
                "Myanmar" =>                                   "MM",
                "Namibia" =>                                   "NA",
                "Nauru" =>                                     "NR",
                "Nepal" =>                                     "NP",
                "Netherlands" =>                               "NL",
                "New Caledonia" =>                             "NC",
                "New Zealand" =>                               "NZ",
                "Nicaragua" =>                                 "NI",
                "Niger" =>                                     "NE",
                "Nigeria" =>                                   "NG",
                "Niue" =>                                      "NU",
                "Norfolk Island" =>                            "NF",
                "Northern Mariana Islands" =>                  "MP",
                "Norway" =>                                    "NO",
                "Oman" =>                                      "OM",
                "Pakistan" =>                                  "PK",
                "Palau" =>                                     "PW",
                "Palestinian Territory" =>                     "PS",
                "Panama" =>                                    "PA",
                "Papua New Guinea" =>                          "PG",
                "Paraguay" =>                                  "PY",
                "Peru" =>                                      "PE",
                "Philippines" =>                               "PH",
                "Pitcairn" =>                                  "PN",
                "Poland" =>                                    "PL",
                "Portugal" =>                                  "PT",
                "Puerto Rico" =>                               "PR",
                "Qatar" =>                                     "QA",
                "Réunion" =>                                   "RE",
                "Romania" =>                                   "RO",
                "Russian Federation" =>                        "RU",
                "Rwanda" =>                                    "RW",
                "S Georgia/S Sandwich Is" =>                   "GS",
                "Saint Barthélemy" =>                          "BL",
                "Saint Helena" =>                              "SH",
                "Saint Kitts and Nevis" =>                     "KN",
                "Saint Lucia" =>                               "LC",
                "Saint Martin" =>                              "MF",
                "Saint Pierre and Miquelon" =>                 "PM",
                "Saint Vincent and the Grenadines" =>          "VC",
                "Samoa" =>                                     "WS",
                "San Marino" =>                                "SM",
                "Sao Tome and Principe" =>                     "ST",
                "Saudi Arabia" =>                              "SA",
                "Senegal" =>                                   "SN",
                "Serbia" =>                                    "RS",
                "Seychelles" =>                                "SC",
                "Sierra Leone" =>                              "SL",
                "Singapore" =>                                 "SG",
                "Sint Maarten" =>                              "SX",
                "Slovakia" =>                                  "SK",
                "Slovenia" =>                                  "SI",
                "Solomon Islands" =>                           "SB",
                "Somalia" =>                                   "SO",
                "South Africa" =>                              "ZA",
                "South Sudan" =>                               "SS",
                "Spain" =>                                     "ES",
                "Sri Lanka" =>                                 "LK",
                "Sudan" =>                                     "SD",
                "Suriname" =>                                  "SR",
                "Svalbard and Jan Mayen" =>                    "SJ",
                "Swaziland" =>                                 "SZ",
                "Sweden" =>                                    "SE",
                "Switzerland" =>                               "CH",
                "Syrian Arab Republic" =>                      "SY",
                "Taiwan" =>                                    "TW",
                "Tajikistan" =>                                "TJ",
                "Tanzania" =>                                  "TZ",
                "Thailand" =>                                  "TH",
                "Timor-Leste" =>                               "TL",
                "Togo" =>                                      "TG",
                "Tokelau" =>                                   "TK",
                "Tonga" =>                                     "TO",
                "Trinidad and Tobago" =>                       "TT",
                "Tunisia" =>                                   "TN",
                "Turkey" =>                                    "TR",
                "Turkmenistan" =>                              "TM",
                "Turks and Caicos Islands" =>                  "TC",
                "Tuvalu" =>                                    "TV",
                "Uganda" =>                                    "UG",
                "Ukraine" =>                                   "UA",
                "United Arab Emirates" =>                      "AE",
                "United Kingdom" =>                            "GB",
                "United States" =>                             "US",
                "Uruguay" =>                                   "UY",
                "US Minor Outlying Islands" =>                 "UM",
                "Uzbekistan" =>                                "UZ",
                "Vanuatu" =>                                   "VU",
                "Venezuela" =>                                 "VE",
                "Vietnam" =>                                   "VN",
                "Virgin Islands (British)" =>                  "VG",
                "Virgin Islands (US)" =>                       "VI",
                "Wallis and Futuna" =>                         "WF",
                "Western Sahara" =>                            "EH",
                "Yemen" =>                                     "YE",
                "Zambia" =>                                    "ZM",
                "Zimbabwe" =>                                  "ZW"
              },
        '3' => {},
        '4' => {},
        '5' => {}
    }
  end

  def self.occupation_options
    {
        'All' => 0,
        #'Military Servicemember' => 1,
        #'Law Enforcement Officer' => 2,
        #'Firefighter' => 3,
        #'EMT/Paramedic' => 4,
        #'Registered Nurse' => 5,
        #'Medical Doctor' => 6,
        #'School Teacher' => 7,
        #'Student' => 8,
        #'Garage CrossFitter' => 9
    }
  end

  def self.sort_options
    #{
    #    'Overall' => 0,
    #    '17.1' => 1,
    #    '17.2' => 2,
    #    '17.3' => 3,
    #    '17.4' => 4,
    #    '17.5' => 5
    #}
    {
        'Overall' => 0,
        '18.1' => 1,
        '18.2' => 2,
        '18.2a' => 3,
        '18.3' => 4,
        '18.4' => 5,
        '18.5' => 6
    }
  end

  def self.regional_sort_options
    {
        'Overall' => 0,
        '1' => 1,
        '2' => 2,
        '3' => 3,
        '4' => 4,
        '5' => 5,
        '6' => 6,
    }
  end
end
