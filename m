Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9427527B6
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Jul 2023 17:51:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F2F03C6B459;
	Thu, 13 Jul 2023 15:51:53 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 62510C6B44F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Jul 2023 15:51:52 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJybd-0004ik-9i; Thu, 13 Jul 2023 17:51:49 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJybb-00E9K8-Ux; Thu, 13 Jul 2023 17:51:47 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJybb-004abe-2w; Thu, 13 Jul 2023 17:51:47 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Thierry Reding <thierry.reding@gmail.com>
Date: Thu, 13 Jul 2023 17:51:41 +0200
Message-Id: <20230713155142.2454010-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230713155142.2454010-1-u.kleine-koenig@pengutronix.de>
References: <20230713155142.2454010-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=960;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=roYStbkk1k9kd6bMiRdxym5fMMZxiZG1Gx7zZMzyyms=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBksB2M89QNNqHnbV4EJeLcuzOQoURLQsl6THfDG
 XMMl7qJUeWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZLAdjAAKCRCPgPtYfRL+
 TspWB/wPt8DYaolcgPPyUUlRb8s6zVDpmXGNGelyQv/6R5N+iQWowqI8lZ3w4tJY1xh0tpKCvmW
 6wbVZfJoqHy/8QsE0+WA0hwiYM5JqCzlORhgJC0aVkCPyzsEEr4A4qkyGHVhg1HN3Jd6jjMfUww
 s6X1AcU9jfbs0lj3L73Rl2atzVSwZ2A/xXUDucdq+LT6PgNU6DVW5beiASLFqyRjCK7ZH9oiy3+
 bRLXjgdCplak2iRaYCSYD5ttGMLdJhhVMMAr0Y6S/zdu/KNdBcEfGYx7NoyVFqUt39X8aggZ+DP
 a6Q1+A5xilV52E7GUYRLPoe6MJ6l5dUasTa5eNKCErzzc3ao
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-pwm@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 kernel@pengutronix.de, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/2] pwm: stm32: Don't modify HW state in
	.remove() callback
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

QSBjb25zdW1lciBpcyBleHBlY3RlZCB0byBkaXNhYmxlIGEgUFdNIGJlZm9yZSBjYWxsaW5nIHB3
bV9wdXQoKS4gQW5kIGlmCnRoZXkgZGlkbid0IHRoZXJlIGlzIGhvcGVmdWxseSBhIGdvb2QgcmVh
c29uIChvciB0aGUgY29uc3VtZXIgbmVlZHMKZml4aW5nKS4gQWxzbyBpZiBkaXNhYmxpbmcgYW4g
ZW5hYmxlZCBQV00gd2FzIHRoZSByaWdodCB0aGluZyB0byBkbywKdGhpcyBzaG91bGQgYmV0dGVy
IGJlIGRvbmUgaW4gdGhlIGZyYW1ld29yayBpbnN0ZWFkIG9mIGluIGVhY2ggbG93IGxldmVsCmRy
aXZlci4KClNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdA
cGVuZ3V0cm9uaXguZGU+Ci0tLQogZHJpdmVycy9wd20vcHdtLXN0bTMyLmMgfCA0IC0tLS0KIDEg
ZmlsZSBjaGFuZ2VkLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvcHdtL3B3
bS1zdG0zMi5jIGIvZHJpdmVycy9wd20vcHdtLXN0bTMyLmMKaW5kZXggNjJlMzk3YWViOWFhLi42
ODc5NjdkMzI2NWYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcHdtL3B3bS1zdG0zMi5jCisrKyBiL2Ry
aXZlcnMvcHdtL3B3bS1zdG0zMi5jCkBAIC02NDksMTAgKzY0OSw2IEBAIHN0YXRpYyBpbnQgc3Rt
MzJfcHdtX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiBzdGF0aWMgdm9pZCBz
dG0zMl9wd21fcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiB7CiAJc3RydWN0
IHN0bTMyX3B3bSAqcHJpdiA9IHBsYXRmb3JtX2dldF9kcnZkYXRhKHBkZXYpOwotCXVuc2lnbmVk
IGludCBpOwotCi0JZm9yIChpID0gMDsgaSA8IHByaXYtPmNoaXAubnB3bTsgaSsrKQotCQlwd21f
ZGlzYWJsZSgmcHJpdi0+Y2hpcC5wd21zW2ldKTsKIAogCXB3bWNoaXBfcmVtb3ZlKCZwcml2LT5j
aGlwKTsKIH0KLS0gCjIuMzkuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
L21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
