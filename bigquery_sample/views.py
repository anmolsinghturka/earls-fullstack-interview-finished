from django.http import HttpResponse
from google.cloud import bigquery
import os


def index(request):
    return HttpResponse('hello world!')


def hacker_news(request):
    credentials = "C:/Users/UserPC/Documents/fullstack-interview-main/application_default_credentials.json"
    os.environ['GOOGLE_APPLICATION_CREDENTIALS'] = credentials
    os.environ["GCLOUD_PROJECT"] = "earls-368621"

    client = bigquery.Client()
    query = "SELECT title,author,time_ts FROM bigquery-public-data.hacker_news.stories ORDER BY time_ts DESC LIMIT 5"
    query_job = client.query(query)
    respdata = "<pre>"
    record_count = 1
    for row in query_job:
        respdata += 'Record No: ' + str(record_count)
        respdata += '\nTitle: ' + row['title'] + '\nAuthor Name: ' + row['author'] + '\nDate of Publication: ' + str(
            row['time_ts']) + '\n\n'
        record_count += 1
    respdata += "</pre>"
    return HttpResponse(respdata)


def github(request):
    credentials = "C:/Users/UserPC/Documents/fullstack-interview-main/application_default_credentials.json"
    os.environ['GOOGLE_APPLICATION_CREDENTIALS'] = credentials
    os.environ["GCLOUD_PROJECT"] = "earls-368621"

    client = bigquery.Client()
    query = "SELECT author.name AS aname, count(commit) AS commit_count FROM bigquery-public-data.github_repos.sample_commits WHERE EXTRACT(YEAR FROM committer.date) = 2016 GROUP BY (author.name) ORDER BY count(commit) DESC;"
    query_job = client.query(query)
    respdata = "<pre>"
    record_count = 1
    for row in query_job:
        respdata += 'Record No: ' + str(record_count)
        respdata += '\nAuthor Name: ' + row['aname'] + '\nCommit Counts: ' + str(row['commit_count']) + '\n\n'
        record_count += 1
    respdata += "</pre>"
    return HttpResponse(respdata)
