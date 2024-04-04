#include "httputils.h"
#include <QNetworkAccessManager>
#include <QNetworkReply>

HttpUtils::HttpUtils(QObject *parent): QObject(parent), manager(new QNetworkAccessManager(this))
{
    QObject::connect(manager, &QNetworkAccessManager::finished, this, &HttpUtils::replyFinished);
}
////HttpUtils::HttpUtils(QObject *parent): QObject(parent)

//{
//    QNetworkAccessManager * manager = new QNetworkAccessManager(this);

//    QObject::connect(manager, SIGNAL(finished(QNetworkReply*)),this, SLOT(replyFinished(QNetworkReply*)));

//}
// * 在这段代码中，你创建了一个QNetworkAccessManager的局部变量manager，
// * 而不是初始化类成员变量manager。这意味着在构造函数结束时局部变量manager会被销毁，
// * 类成员变量manager仍然是未初始化的nullptr。之后，当你尝试在conNet函数中使用manager成员变量发起网络请求时，
// * 因为它没有被正确初始化，所以尝试访问一个空指针会导致崩溃。*/

void HttpUtils::conNet(QString url)
{
    QNetworkRequest request;
    request.setUrl(QUrl(BASE_URL+url));
    manager->get(request);
}


void HttpUtils::replyFinished(QNetworkReply *reply)
{
    emit replySignal(reply->readAll());
}
