/// @desc Text typing

if (page < 0) exit;

dialogPage = dialog[page];

if (textPause > 0)
{
	textPause--;
}
//Typing effect
else if (currentChar < string_length(dialogPage))
{
	var _typeSpd = typeSpd;
	
	currentChar += _typeSpd + keyboard_check(ord("X")) * 100;

	//-------Pause at punctuations-------//
	
	var _punc = string_char_at(dialogPage, currentChar);
	
	for (var pu = 0; pu < 4; pu++)
	{
		//Check through puncations array
		if (_punc == punctuations[pu] and _typeSpd == typeSpd)
		{
			currentChar++
			_punc = string_char_at(dialogPage, currentChar);
		
			if (_punc == " ")
			{
				textPause = puncTime;
			}
		}
	}
	
		

		//----------Keystrings----------//
	
		var _keystring = string_char_at(dialogPage, currentChar);
	
		if (_keystring == "/")
		{
			currentChar++
			_keystring = string_char_at(dialogPage, currentChar);
		
			switch (_keystring)
			{
				/*case "L":
				_keystring += "\n";
				break;*/
			
				case "P":
				
				//If not skipped
				if (_typeSpd == typeSpd)
				{
					autoPage = true;
					currentChar++;
				}	
				break;
			}
		}	
		
			//Input time typing is paused
			else if (_keystring == "^" and _typeSpd == typeSpd)
			{
				currentChar++
				_keystring = string_char_at(dialogPage, currentChar);
		
				if (_keystring != "0")
				{
					var time = real(_keystring);
					textPause = time * 10;
					currentChar++;
				}
			}
				//talk sprites
			else if (_keystring == "$" && _typeSpd == typeSpd)
			{
			//	show_debug_message($"char: {currentChar}");
				if(currentChar <1) {
				currentChar += 2;
				} else {
					currentChar++;
				}
				var _dig1 = string_char_at(dialogPage, currentChar);
				var _dig2 = string_char_at(dialogPage, currentChar+1);
				var _portrait = _dig1 + _dig2;
				portraitString = $"spr_portrait{_portrait}"
				show_debug_message(portraitString);
				currentChar++
			}
		
//-------Set points where the dialogue wraps-------//
    var _words = string_split(dialogPage, " ");
    var _wrappedText = "";
    var _currentLine = "";

    for (var w = 0; w < array_length(_words); w++)
    {
        var _line = _currentLine;

        if (_line != "")
		{
            _line += " ";
		}	

        _line += _words[w];
		
				//sets the length of what's considered "too long"
		if(portraitString == "0") {
			lineBreak = boxW-15;
		} else {
			lineBreak = boxW-15-4.266*48
		}

		//if currentline is to long cut to the next line
        if (string_width(_line) > lineBreak)
        {
			//Start next line
            _wrappedText += _currentLine + "\n";
            _currentLine = _words[w];
        }
        else
        {
            _currentLine = _line;
        }
    }

    _wrappedText += _currentLine
	
	//Copy current character
	drawnText = string_copy(_wrappedText, 1, currentChar);
	
	//---------Clear dialogue of substrings---------//
	
	//Clear /(letter)
	for (var key = 0; key < array_length(keystringList); key++)
	{
		drawnText = string_replace_all(drawnText, "/" + keystringList[key], "");
	}
	
	//Clear ^(value)
	for (var i = 1; i < 10; i++)
	{
		drawnText = string_replace_all(drawnText,"^" + string(i), "");
	}
		//clear $(value)
	for (var i = 30; i >= 0 ; i--)
	{
		if(i<10) {
			var j = $"0{i}"; 
		} else {
			var j = string(i);
		}
		drawnText = string_replace_all(drawnText,"$" + j, "");
	}
}


else if (keyboard_check_pressed(ord("Z")) or autoPage == true)
	 {
		 //Advanse dialogue
		 portraitString = "0";
		 page++;
		 autoPage = false;
		
		 //End dialogue if done
		 if (page >= array_length(dialog))
		 {
			global.interact = 0;
		    instance_destroy();
		 }
		 else
		 {
			 currentChar = 0;
		 }
	 }

