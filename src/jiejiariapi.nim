import asyncdispatch, httpclient, json, strutils, uri

const api = "https://api.jiejiariapi.com/v1"
var headers = newHttpHeaders({
    "Connection": "keep-alive",
    "User-Agent": "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36",
    "Host": "api.jiejiariapi.com",
    "Accept": "application/json"
})

# Получить праздники за год
proc get_holidays*(year: int): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  client.headers = headers
  try:
    let response = await client.get(api & "/holidays/" & $year)
    let body = await response.body
    result = parseJson(body)
  finally:
    client.close()

# Получить выходные за год
proc get_weekends*(year: int): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  client.headers = headers
  try:
    let response = await client.get(api & "/weekends/" & $year)
    let body = await response.body
    result = parseJson(body)
  finally:
    client.close()

# Получить рабочие дни за год
proc get_workdays*(year: int): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  client.headers = headers
  try:
    let response = await client.get(api & "/workdays/" & $year)
    let body = await response.body
    result = parseJson(body)
  finally:
    client.close()

# Проверить, является ли дата праздником
proc is_holiday*(date: string): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  client.headers = headers
  try:
    let response = await client.get(api & "/is_holiday?date=" & encodeUrl(date))
    let body = await response.body
    result = parseJson(body)
  finally:
    client.close()
