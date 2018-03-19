# Metamind demo story


## About
This repository contains demo story and configuration files for [Metamind-api](https://github.com/Metatavu/metamind-api)

## Usage

#### Requirements
To use these story and config files you will need:
- Install Apache OpenNLP 
- Clone and install [Metamind-api](https://github.com/Metatavu/metamind-api) 

#### Concatenate intents
OpenNLP accepts only 1 training data file as parameter when training with `DoccatTrainer` class. You can concate all intent files from folder `./intents` by using `./concate-intents` script.

__Make sure that you have empty line at end of every intent file__

#### Training using OpenNLP
You can train with `DoccatTrainer` with following commands:

`NPL_BIN=path/to/your/OpenNLP`

`${NPL_BIN}/opennlp DoccatTrainer -model ./intents/bin/fi-metatavu-bot.bin -lang fi -data ./intents/MetatavuBotIntents.txt -encoding UTF-8 -featureGenerators opennlp.tools.doccat.NGramFeatureGenerator,opennlp.tools.doccat.BagOfWordsFeatureGenerator -params ./params/MetatavuBotIntentsParams.txt
`

_Note: You can add/remove featureGenerators as you like. You can also change model urls, just make sure you use correct urls while configuring Metamind_