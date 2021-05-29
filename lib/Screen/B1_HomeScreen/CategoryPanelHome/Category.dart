

class Category {
  List<Included> _included;

  Category({List<Included> included}) {
    this._included = included;
  }

  List<Included> get included => _included;
  set included(List<Included> included) => _included = included;

  Category.fromJson(Map<String, dynamic> json) {
    if (json['included'] != null) {
      _included = new List<Included>();
      json['included'].forEach((v) {
        _included.add(new Included.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._included != null) {
      data['included'] = this._included.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Included {
  String _id;
  String _type;
  Attributes _attributes;
  Links _links;

  Included({String id,  String type,  Attributes attributes,  Links links}) {
    this._id = id;
    this._type = type;
    this._attributes = attributes;
    this._links = links;
  }

  String get id => _id;
  set id(String id) => _id = id;
  String get type => _type;
  set type(String type) => _type = type;
  Attributes get attributes => _attributes;
  set attributes(Attributes attributes) => _attributes = attributes;
  Links get links => _links;
  set links(Links links) => _links = links;

  Included.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _type = json['type'];
    _attributes = (json['attributes'] != null
        ? new Attributes.fromJson(json['attributes'])
        : null);
    _links = (json['links'] != null ? new Links.fromJson(json['links']) : null);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['type'] = this._type;
    if (this._attributes != null) {
      data['attributes'] = this._attributes.toJson();
    }
    if (this._links != null) {
      data['links'] = this._links.toJson();
    }
    return data;
  }
}

class Attributes {
  String _catalogUrl;
  String _catalogCode;
  String _catalogLabel;
  List<Null> _catalogConfig;
  int _catalogStatus;
  String _catalogTarget;
  bool _catalogHasChildren;
  String _mediaId;
  String _mediaDomain;
  String _mediaLabel;
  Null _mediaLanguageid;
  String _mediaMimetype;
  String _mediaType;
  String _mediaPreview;
  MediaPreviews _mediaPreviews;
  String _mediaUrl;
  int _mediaStatus;
  String _textId;
  String _textLanguageid;
  String _textType;
  String _textLabel;
  String _textDomain;
  String _textContent;
  int _textStatus;

  Attributes(
      { String catalogUrl,
         String catalogCode,
         String catalogLabel,
         List<Null> catalogConfig,
         int catalogStatus,
         String catalogTarget,
         bool catalogHasChildren,
         String mediaId,
         String mediaDomain,
         String mediaLabel,
        Null mediaLanguageid,
         String mediaMimetype,
         String mediaType,
         String mediaPreview,
         MediaPreviews mediaPreviews,
         String mediaUrl,
         int mediaStatus,
         String textId,
         String textLanguageid,
         String textType,
         String textLabel,
         String textDomain,
         String textContent,
         int textStatus}) {
    this._catalogUrl = catalogUrl;
    this._catalogCode = catalogCode;
    this._catalogLabel = catalogLabel;
    this._catalogConfig = catalogConfig;
    this._catalogStatus = catalogStatus;
    this._catalogTarget = catalogTarget;
    this._catalogHasChildren = catalogHasChildren;
    this._mediaId = mediaId;
    this._mediaDomain = mediaDomain;
    this._mediaLabel = mediaLabel;
    this._mediaLanguageid = mediaLanguageid;
    this._mediaMimetype = mediaMimetype;
    this._mediaType = mediaType;
    this._mediaPreview = mediaPreview;
    this._mediaPreviews = mediaPreviews;
    this._mediaUrl = mediaUrl;
    this._mediaStatus = mediaStatus;
    this._textId = textId;
    this._textLanguageid = textLanguageid;
    this._textType = textType;
    this._textLabel = textLabel;
    this._textDomain = textDomain;
    this._textContent = textContent;
    this._textStatus = textStatus;
  }

  String get catalogUrl => _catalogUrl;
  set catalogUrl(String catalogUrl) => _catalogUrl = catalogUrl;
  String get catalogCode => _catalogCode;
  set catalogCode(String catalogCode) => _catalogCode = catalogCode;
  String get catalogLabel => _catalogLabel;
  set catalogLabel(String catalogLabel) => _catalogLabel = catalogLabel;
  List<Null> get catalogConfig => _catalogConfig;
  set catalogConfig(List<Null> catalogConfig) => _catalogConfig = catalogConfig;
  int get catalogStatus => _catalogStatus;
  set catalogStatus(int catalogStatus) => _catalogStatus = catalogStatus;
  String get catalogTarget => _catalogTarget;
  set catalogTarget(String catalogTarget) => _catalogTarget = catalogTarget;
  bool get catalogHasChildren => _catalogHasChildren;
  set catalogHasChildren(bool catalogHasChildren) =>
      _catalogHasChildren = catalogHasChildren;
  String get mediaId => _mediaId;
  set mediaId(String mediaId) => _mediaId = mediaId;
  String get mediaDomain => _mediaDomain;
  set mediaDomain(String mediaDomain) => _mediaDomain = mediaDomain;
  String get mediaLabel => _mediaLabel;
  set mediaLabel(String mediaLabel) => _mediaLabel = mediaLabel;
  Null get mediaLanguageid => _mediaLanguageid;
  set mediaLanguageid(Null mediaLanguageid) =>
      _mediaLanguageid = mediaLanguageid;
  String get mediaMimetype => _mediaMimetype;
  set mediaMimetype(String mediaMimetype) => _mediaMimetype = mediaMimetype;
  String get mediaType => _mediaType;
  set mediaType(String mediaType) => _mediaType = mediaType;
  String get mediaPreview => _mediaPreview;
  set mediaPreview(String mediaPreview) => _mediaPreview = mediaPreview;
  MediaPreviews get mediaPreviews => _mediaPreviews;
  set mediaPreviews(MediaPreviews mediaPreviews) =>
      _mediaPreviews = mediaPreviews;
  String get mediaUrl => _mediaUrl;
  set mediaUrl(String mediaUrl) => _mediaUrl = mediaUrl;
  int get mediaStatus => _mediaStatus;
  set mediaStatus(int mediaStatus) => _mediaStatus = mediaStatus;
  String get textId => _textId;
  set textId(String textId) => _textId = textId;
  String get textLanguageid => _textLanguageid;
  set textLanguageid(String textLanguageid) => _textLanguageid = textLanguageid;
  String get textType => _textType;
  set textType(String textType) => _textType = textType;
  String get textLabel => _textLabel;
  set textLabel(String textLabel) => _textLabel = textLabel;
  String get textDomain => _textDomain;
  set textDomain(String textDomain) => _textDomain = textDomain;
  String get textContent => _textContent;
  set textContent(String textContent) => _textContent = textContent;
  int get textStatus => _textStatus;
  set textStatus(int textStatus) => _textStatus = textStatus;

  Attributes.fromJson(Map<String, dynamic> json) {
    _catalogUrl = json['catalog.url'];
    _catalogCode = json['catalog.code'];
    _catalogLabel = json['catalog.label'];

    _catalogStatus = json['catalog.status'];
    _catalogTarget = json['catalog.target'];
    _catalogHasChildren = json['catalog.hasChildren'];
    _mediaId = json['media.id'];
    _mediaDomain = json['media.domain'];
    _mediaLabel = json['media.label'];
    _mediaLanguageid = json['media.languageid'];
    _mediaMimetype = json['media.mimetype'];
    _mediaType = json['media.type'];
    _mediaPreview = json['media.preview'];
    _mediaPreviews = (json['media.previews'] != null
        ? new MediaPreviews.fromJson(json['media.previews'])
        : null);
    _mediaUrl = json['media.url'];
    _mediaStatus = json['media.status'];
    _textId = json['text.id'];
    _textLanguageid = json['text.languageid'];
    _textType = json['text.type'];
    _textLabel = json['text.label'];
    _textDomain = json['text.domain'];
    _textContent = json['text.content'];
    _textStatus = json['text.status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['catalog.url'] = this._catalogUrl;
    data['catalog.code'] = this._catalogCode;
    data['catalog.label'] = this._catalogLabel;

    data['catalog.status'] = this._catalogStatus;
    data['catalog.target'] = this._catalogTarget;
    data['catalog.hasChildren'] = this._catalogHasChildren;
    data['media.id'] = this._mediaId;
    data['media.domain'] = this._mediaDomain;
    data['media.label'] = this._mediaLabel;
    data['media.languageid'] = this._mediaLanguageid;
    data['media.mimetype'] = this._mediaMimetype;
    data['media.type'] = this._mediaType;
    data['media.preview'] = this._mediaPreview;
    if (this._mediaPreviews != null) {
      data['media.previews'] = this._mediaPreviews.toJson();
    }
    data['media.url'] = this._mediaUrl;
    data['media.status'] = this._mediaStatus;
    data['text.id'] = this._textId;
    data['text.languageid'] = this._textLanguageid;
    data['text.type'] = this._textType;
    data['text.label'] = this._textLabel;
    data['text.domain'] = this._textDomain;
    data['text.content'] = this._textContent;
    data['text.status'] = this._textStatus;
    return data;
  }
}

class MediaPreviews {
  String _s360;
  String _s720;
  String _s1200;

  MediaPreviews({String s360,  String s720,  String s1200}) {
    this._s360 = s360;
    this._s720 = s720;
    this._s1200 = s1200;
  }

  String get s360 => _s360;
  set s360(String s360) => _s360 = s360;
  String get s720 => _s720;
  set s720(String s720) => _s720 = s720;
  String get s1200 => _s1200;
  set s1200(String s1200) => _s1200 = s1200;

  MediaPreviews.fromJson(Map<String, dynamic> json) {
    _s360 = json['360'];
    _s720 = json['720'];
    _s1200 = json['1200'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['360'] = this._s360;
    data['720'] = this._s720;
    data['1200'] = this._s1200;
    return data;
  }
}

class Links {
  Self _self;

  Links({ Self self}) {
    this._self = self;
  }

  Self get self => _self;
  set self(Self self) => _self = self;

  Links.fromJson(Map<String, dynamic> json) {
    _self = (json['self'] != null ? new Self.fromJson(json['self']) : null);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._self != null) {
      data['self'] = this._self.toJson();
    }
    return data;
  }
}

class Self {
  String _href;
  List<String> _allow;

  Self({String href, List<String> allow}) {
    this._href = href;
    this._allow = allow;
  }

  String get href => _href;
  set href(String href) => _href = href;
  List<String> get allow => _allow;
  set allow(List<String> allow) => _allow = allow;

  Self.fromJson(Map<String, dynamic> json) {
    _href = json['href'];
    _allow = json['allow'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['href'] = this._href;
    data['allow'] = this._allow;
    return data;
  }
}