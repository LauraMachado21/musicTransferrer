require 'httparty'
API_KEY =

def parseFileContents(content)
end

def searchTrack(track)
  artist = track.artist;
  title = track.title;
  album = track.album;

  trackResult = HTTParty.head("https://api.spotify.com/v1/search?q=artist:#{artist}album:#{album}name:#{title}&type=track&limit=1",{Authorization: "Bearer ${API_KEY}"});
end

def saveTrack(trackID)
  HTTParty.post()
end

def getProgressBar(current, total)
  bar_len = 60;
  filled_len = current/total*bar_len;
  remaining_len = bar_len-filled_len;
  percentage = (current/total*100) + "%";

  progress_bar = '['+ '='*filled_len + '-'*remaining_len + ']' + percentage;

  return progress_bar;
end


def

if ARGV.length != 1
  puts "One parameter only -> filename";
  exit;
end

filename = ARGV[0];
puts "Opening '#{filename}' ...";

fh = open filename;
content = fh.read;
tracks = parseFileContents(content);
unsavedTracks = [];

print getProgressBar(0, tracks.length);

i=0;
tracks.each do |track|
  i++;
  trackID = searchTrack(track);

  if !trackID
    unsavedTracks.push(track);
  else
    saveTrack(trackId);
  end
  print getProgressBar(i, tracks.length);
end

puts unsavedTracks;
