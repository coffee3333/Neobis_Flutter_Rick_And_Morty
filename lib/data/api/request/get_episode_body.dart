class GetEpisodeBody {
  final List<int> episodes;

  GetEpisodeBody({required this.episodes});

  String toApi() {
    return episodes.map((episode) => episode.toString()).join(',');
  }
}
