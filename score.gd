extends RichTextLabel

var default_text = "OCs RESCUED: "

func _process(_delta):
	var text = str(default_text, str(GameManager.score))
	self.text = (text)
	
