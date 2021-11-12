class Movie{
   String title;
   String year;
   String realesed;
   String runtime;
   String genre;
   String director;
   String img_src;

  Movie(this.title, this.year, this.realesed, this.runtime, this.genre, this.director,this.img_src);
  
  Map toMap(){
    return  {
      'Title': title,
      'Year':year ,
      'Released':realesed ,
      'Runtime':runtime ,
      'Genre': genre,
      'Director': director,
      'Poster' : img_src
          };
  }

  Movie.fromMap(map){
    title = map['Title'];
    year = map['Year'];
    realesed = map['Released'];
    runtime = map['Runtime'];
    genre = map['Genre'];
    director = map['Director'];
    img_src = map['Poster'];
  }
}