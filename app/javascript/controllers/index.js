// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import CategoryController from "./category_controller.js"
application.register("category", CategoryController)

import HelloController from "./hello_controller.js"
application.register("hello", HelloController)

import LoaderController from "./loader_controller.js"
application.register("loader", LoaderController)

import MapController from "./map_controller.js"
application.register("map", MapController)

import NotificationSubscriptionController from "./notification_subscription_controller.js"
application.register("notification-subscription", NotificationSubscriptionController)

import ScrollOnConnectController from "./scroll_on_connect_controller.js"
application.register("scroll-on-connect", ScrollOnConnectController)
