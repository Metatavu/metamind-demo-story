#!/bin/bash
if [ -e ./intents/MetatavuBotIntents.txt ]
then
	rm ./intents/MetatavuBotIntents.txt && cat ./intents/*.txt > ./intents/MetatavuBotIntents.txt
else
	cat ./intents/*.txt > ./intents/MetatavuBotIntents.txt
fi

echo "All intents concatenated"