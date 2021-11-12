final  String apikey= "QbtCd4FWhbmMsoCWc8DA1iSfoTJ1GahOMVOWOVUv	";

final String client_id="SjfZEcvoQO82QOAEs3KG";

String query="";

final mainurl="https://freesound.org/apiv2/search/text/?query=piano&token=$apikey";

final String reg_username="omkar18sawant";



//FILTER : ==>  1 > https://freesound.org/apiv2/search/text/filter=tag:"$tagtosearch"&token=$api_key; 
        // ==>  2 > https://freesound.org/apiv2/search/text/filter=original_filename:"$songname"&token=$api_key; 
//for more filter and queries and sort =>https://freesound.org/docs/api/resources_apiv2.html#text-search;
//QuerySearch ==> https://freesound.org/apiv2/search/text/?query=$query&token=$api_key;
//
// ^ by filter or query get the music id
//and to play the store the got sound_id 
//play the audio by creating url
//... => /apiv2/sounds/<sound_id>

//empty query will return all  freesound songs
