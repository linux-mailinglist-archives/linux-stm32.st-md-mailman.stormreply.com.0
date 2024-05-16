Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A6D8C6FFA
	for <lists+linux-stm32@lfdr.de>; Thu, 16 May 2024 03:22:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F2A80C6C83A;
	Thu, 16 May 2024 01:22:41 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 71F15C6C83A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 May 2024 01:22:34 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 86F9587DB0;
 Thu, 16 May 2024 03:22:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1715822553;
 bh=raQZ10l3+cclQ4SOmqVPgMhHjTADA3OYQuPrKD7T/LI=;
 h=From:To:Cc:Subject:Date:From;
 b=sBMpfJkVagA4BWlF8Yo2JVJXO2RpSyTQvvn11ziawhRR4U7vzS08f+D771T011jTw
 GSRdF9Ja/bcV1NrgUkBvtx8nc3ZXLOwb9eMUbd4dkX2GgD/sPRoklnbMsUqxklzrJX
 VCImGBQB1ruVh+eRtgaImwvPE+YOEvB3ToUgoCUpH7aX6I+Rz7sYuawlPLl2dtkv5R
 2AUPMH6LU3RAm+MmiDQMDatlqq6iRKxRTPmqTSiq3J8xRolKK5rQS81J60SAPuQmjz
 2eZKPsRkSdnfYKgYYeP3KqfczlNS+GnUkbML2A/izAmPL3bXU0dQS8cyksSeA7XdzM
 UuiBopPWJHjvw==
From: Marek Vasut <marex@denx.de>
To: linux-crypto@vger.kernel.org
Date: Thu, 16 May 2024 03:20:45 +0200
Message-ID: <20240516012210.128307-1-marex@denx.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>, Rob Herring <robh@kernel.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Yang Yingliang <yangyingliang@huawei.com>, kernel@dh-electronics.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Olivia Mackall <olivia@selenic.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/2] hwrng: stm32 - use
	pm_runtime_resume_and_get()
X-BeenThere: linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/linux-stm32/>
List-Post: <mailto:linux-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

aW5jbHVkZS9saW51eC9wbV9ydW50aW1lLmggcG1fcnVudGltZV9nZXRfc3luYygpIGRlc2NyaXB0
aW9uIHN1Z2dlc3RzIHRvCi4uLiBjb25zaWRlciB1c2luZyBwbV9ydW50aW1lX3Jlc3VtZV9hbmRf
Z2V0KCkgaW5zdGVhZCBvZiBpdCwgZXNwZWNpYWxseQppZiBpdHMgcmV0dXJuIHZhbHVlIGlzIGNo
ZWNrZWQgYnkgdGhlIGNhbGxlciwgYXMgdGhpcyBpcyBsaWtlbHkgdG8gcmVzdWx0CmluIGNsZWFu
ZXIgY29kZS4KClRoaXMgaXMgaW5kZWVkIGJldHRlciwgc3dpdGNoIHRvIHBtX3J1bnRpbWVfcmVz
dW1lX2FuZF9nZXQoKSB3aGljaApjb3JyZWN0bHkgc3VzcGVuZHMgdGhlIGRldmljZSBhZ2FpbiBp
biBjYXNlIG9mIGZhaWx1cmUuIEFsc28gYWRkIGVycm9yCmNoZWNraW5nIGludG8gdGhlIFJORyBk
cml2ZXIgaW4gY2FzZSBwbV9ydW50aW1lX3Jlc3VtZV9hbmRfZ2V0KCkgZG9lcwpmYWlsLCB3aGlj
aCBpcyBjdXJyZW50bHkgbm90IGRvbmUsIGFuZCBpdCBkb2VzIGRldGVjdCBzcG9yYWRpYyAtRUFD
Q0VTCmVycm9yIHJldHVybiBhZnRlciByZXN1bWUsIHdoaWNoIHdvdWxkIG90aGVyd2lzZSBsZWFk
IHRvIGEgaGFuZyBkdWUgdG8KcmVnaXN0ZXIgYWNjZXNzIG9uIHVuLXJlc3VtZWQgaGFyZHdhcmUu
IE5vdyB0aGUgcmVhZCBzaW1wbHkgZXJyb3JzIG91dAphbmQgdGhlIHN5c3RlbSBkb2VzIG5vdCBo
YW5nLgoKU2lnbmVkLW9mZi1ieTogTWFyZWsgVmFzdXQgPG1hcmV4QGRlbnguZGU+Ci0tLQpDYzog
IlV3ZSBLbGVpbmUtS8O2bmlnIiA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgpDYzog
QWxleGFuZHJlIFRvcmd1ZSA8YWxleGFuZHJlLnRvcmd1ZUBmb3NzLnN0LmNvbT4KQ2M6IEdhdGll
biBDaGV2YWxsaWVyIDxnYXRpZW4uY2hldmFsbGllckBmb3NzLnN0LmNvbT4KQ2M6IEhlcmJlcnQg
WHUgPGhlcmJlcnRAZ29uZG9yLmFwYW5hLm9yZy5hdT4KQ2M6IE1hcmVrIFZhc3V0IDxtYXJleEBk
ZW54LmRlPgpDYzogTWF4aW1lIENvcXVlbGluIDxtY29xdWVsaW4uc3RtMzJAZ21haWwuY29tPgpD
YzogT2xpdmlhIE1hY2thbGwgPG9saXZpYUBzZWxlbmljLmNvbT4KQ2M6IFJvYiBIZXJyaW5nIDxy
b2JoQGtlcm5lbC5vcmc+CkNjOiBZYW5nIFlpbmdsaWFuZyA8eWFuZ3lpbmdsaWFuZ0BodWF3ZWku
Y29tPgpDYzoga2VybmVsQGRoLWVsZWN0cm9uaWNzLmNvbQpDYzogbGludXgtYXJtLWtlcm5lbEBs
aXN0cy5pbmZyYWRlYWQub3JnCkNjOiBsaW51eC1jcnlwdG9Admdlci5rZXJuZWwub3JnCkNjOiBs
aW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCi0tLQogZHJpdmVycy9jaGFy
L2h3X3JhbmRvbS9zdG0zMi1ybmcuYyB8IDQgKysrLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2hhci9od19yYW5k
b20vc3RtMzItcm5nLmMgYi9kcml2ZXJzL2NoYXIvaHdfcmFuZG9tL3N0bTMyLXJuZy5jCmluZGV4
IDBlOTAzZDZlMjJlMzAuLjZkZWM0YWRjNDk4NTMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvY2hhci9o
d19yYW5kb20vc3RtMzItcm5nLmMKKysrIGIvZHJpdmVycy9jaGFyL2h3X3JhbmRvbS9zdG0zMi1y
bmcuYwpAQCAtMTg3LDcgKzE4Nyw5IEBAIHN0YXRpYyBpbnQgc3RtMzJfcm5nX3JlYWQoc3RydWN0
IGh3cm5nICpybmcsIHZvaWQgKmRhdGEsIHNpemVfdCBtYXgsIGJvb2wgd2FpdCkKIAlpbnQgcmV0
dmFsID0gMCwgZXJyID0gMDsKIAl1MzIgc3I7CiAKLQlwbV9ydW50aW1lX2dldF9zeW5jKChzdHJ1
Y3QgZGV2aWNlICopIHByaXYtPnJuZy5wcml2KTsKKwlyZXR2YWwgPSBwbV9ydW50aW1lX3Jlc3Vt
ZV9hbmRfZ2V0KChzdHJ1Y3QgZGV2aWNlICopcHJpdi0+cm5nLnByaXYpOworCWlmIChyZXR2YWwp
CisJCXJldHVybiByZXR2YWw7CiAKIAlpZiAocmVhZGxfcmVsYXhlZChwcml2LT5iYXNlICsgUk5H
X1NSKSAmIFJOR19TUl9TRUlTKQogCQlzdG0zMl9ybmdfY29uY2VhbF9zZWVkX2Vycm9yKHJuZyk7
Ci0tIAoyLjQzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
