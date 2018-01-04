class HubspotController < ApplicationController
  
  def involvements
    json = {
        "results" => [
          {
            "objectId"=> 574,
            "title"=> "Another Involvement",
            "relationship_type" => "Prospect",
            "involvement_code" => "00002134",
            "involvement_type" => "Exchanger Optimizer"
          }
        ],
    }

    render json: json
  end
end