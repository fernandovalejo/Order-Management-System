#!/bin/bash
bundle install
yarn install
rails db:migrate
rails db:seed