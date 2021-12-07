module ElevatorMedia
    class Streamer
        def initialize
            @video = ""
        end
        def getContent
            @video = "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/AKy6Jx59fis\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>"
        end
    end
end