class HubspotController < ApplicationController
  
  def involvements
    json = {
        "results" => [
          {
            "objectId"=> 574,
            "title"=> "Another Involvement",
            "link"=> "http=>//example.com/2",
            "created"=> "2016-08-04",
            "priority"=> "HIGH",
            "project"=> "API",
            "relationship_type" => "Prospect",
            "involvement_code" => "00002134",
            "involvement_type" => "Exchanger Optimizer",
            "reported_by"=> "ksmith@hubspot.com",
            "description"=> "Customer is not able to find documentation about our bulk Contacts APIs.",
            "reporter_type"=> "Support Rep",
            "status"=> "Resolved",
            "ticket_type"=> "Bug",
            "updated"=> "2016-09-23",
            "properties"=> [
              {
                "label"=> "Involvement Code",
                "dataType"=> "STRING",
                "value"=> "00000001"
              },
              {
                "label"=> "Relationship Type",
                "dataType"=> "STRING",
                "value"=> "HTRI"
              },
            ],
            "actions"=> []
          }],

        "settingsAction"=> {
            "type"=> "IFRAME",
            "width"=> 890,
            "height"=> 748,
            "uri"=> "https=>//example.com/settings-iframe-contents",
            "label"=> "Settings"
        },
        "primaryAction"=> {
            "type"=> "IFRAME",
            "width"=> 890,
            "height"=> 748,
            "uri"=> "https=>//example.com/create-iframe-contents",
            "label"=> "Create Ticket"
        }
    }

    render json: json
  end
end