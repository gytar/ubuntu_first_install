#!/usr/bin/env zx

export const okLog = (logMessage) => {
    console.log(chalk.green("[OK] " + logMessage))
}

export const infoLog = (logMessage) => {
    console.log(chalk.yellow("[INFO] " + logMessage + "..."))
}