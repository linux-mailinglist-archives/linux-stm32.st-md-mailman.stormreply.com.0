Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E0C481D5D
	for <lists+linux-stm32@lfdr.de>; Thu, 30 Dec 2021 16:03:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 33CBDC5F1F0;
	Thu, 30 Dec 2021 15:03:16 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D0189C5C829
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Dec 2021 15:03:14 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1n2wxQ-0000dq-LY; Thu, 30 Dec 2021 16:03:08 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1n2wxP-007VLR-UG; Thu, 30 Dec 2021 16:03:07 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1n2wxO-0007jt-Vv; Thu, 30 Dec 2021 16:03:06 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Thu, 30 Dec 2021 16:02:57 +0100
Message-Id: <20211230150300.72196-21-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211230150300.72196-1-u.kleine-koenig@pengutronix.de>
References: <20211230150300.72196-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2408; h=from:subject;
 bh=yamPh52MWvtBuq1kwhHgzE8DC1LccrX53waJcMLV5Ao=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBhzcmv2YDALYtMQDBjFVY7z1y0vh4yin3H9exKf8He
 MpsunwCJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYc3JrwAKCRDB/BR4rcrsCfJBB/
 0e5hM0NoFJaHD14gPHYYux/XWg3iPAG7ZhGj0EGyLztSsKeAra+nb+1ccCW7UQTJt/1WLWu9vB7M2R
 w1i/dx+LUnoZ1PKvV+b5tQFZ4ulnQf5yJS68VomEi7s7LBja4bTGigx4FfoQei5UK/6p/RDeapy8L7
 CI1aPUMVyqD5idJBxCkGJxtq95mt5jV8fKKTye6N5aNCDIiCmZ3XqxPGUP5tQPNir/KmKUKY0G8G44
 I+nthHRnQEv5yRTC3hmn6nbms/A2SiCDiaJIXKtCEHF9jwPjYh0tMjnPd6SpDx8DKBMMn7oe6TDexs
 5YJO/FdT7z6jzC/nSyGX3qztZuMyOY
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: kernel@pengutronix.de, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 William Breathitt Gray <vilhelm.gray@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 20/23] counter: stm32-timer-cnt: Convert to
	new counter registration
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

VGhpcyBmaXhlcyBkZXZpY2UgbGlmZXRpbWUgaXNzdWVzIHdoZXJlIGl0IHdhcyBwb3NzaWJsZSB0
byBmcmVlIGEgbGl2ZQpzdHJ1Y3QgZGV2aWNlLgoKRml4ZXM6IGFkMjk5MzdlMjA2ZiAoImNvdW50
ZXI6IEFkZCBTVE0zMiBUaW1lciBxdWFkcmF0dXJlIGVuY29kZXIiKQpSZXZpZXdlZC1ieTogSm9u
YXRoYW4gQ2FtZXJvbiA8Sm9uYXRoYW4uQ2FtZXJvbkBodWF3ZWkuY29tPgpBY2tlZC1ieTogV2ls
bGlhbSBCcmVhdGhpdHQgR3JheSA8dmlsaGVsbS5ncmF5QGdtYWlsLmNvbT4KU2lnbmVkLW9mZi1i
eTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KLS0t
CiBkcml2ZXJzL2NvdW50ZXIvc3RtMzItdGltZXItY250LmMgfCAzMCArKysrKysrKysrKysrKysr
KystLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCAxMiBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2NvdW50ZXIvc3RtMzItdGltZXItY250LmMg
Yi9kcml2ZXJzL2NvdW50ZXIvc3RtMzItdGltZXItY250LmMKaW5kZXggNGIwNWIxOThhOGQ4Li41
Nzc5YWU3YzczY2YgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvY291bnRlci9zdG0zMi10aW1lci1jbnQu
YworKysgYi9kcml2ZXJzL2NvdW50ZXIvc3RtMzItdGltZXItY250LmMKQEAgLTI5LDcgKzI5LDYg
QEAgc3RydWN0IHN0bTMyX3RpbWVyX3JlZ3MgewogfTsKIAogc3RydWN0IHN0bTMyX3RpbWVyX2Nu
dCB7Ci0Jc3RydWN0IGNvdW50ZXJfZGV2aWNlIGNvdW50ZXI7CiAJc3RydWN0IHJlZ21hcCAqcmVn
bWFwOwogCXN0cnVjdCBjbGsgKmNsazsKIAl1MzIgbWF4X2FycjsKQEAgLTMxNywzMSArMzE2LDM4
IEBAIHN0YXRpYyBpbnQgc3RtMzJfdGltZXJfY250X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZp
Y2UgKnBkZXYpCiAJc3RydWN0IHN0bTMyX3RpbWVycyAqZGRhdGEgPSBkZXZfZ2V0X2RydmRhdGEo
cGRldi0+ZGV2LnBhcmVudCk7CiAJc3RydWN0IGRldmljZSAqZGV2ID0gJnBkZXYtPmRldjsKIAlz
dHJ1Y3Qgc3RtMzJfdGltZXJfY250ICpwcml2OworCXN0cnVjdCBjb3VudGVyX2RldmljZSAqY291
bnRlcjsKKwlpbnQgcmV0OwogCiAJaWYgKElTX0VSUl9PUl9OVUxMKGRkYXRhKSkKIAkJcmV0dXJu
IC1FSU5WQUw7CiAKLQlwcml2ID0gZGV2bV9remFsbG9jKGRldiwgc2l6ZW9mKCpwcml2KSwgR0ZQ
X0tFUk5FTCk7Ci0JaWYgKCFwcml2KQorCWNvdW50ZXIgPSBkZXZtX2NvdW50ZXJfYWxsb2MoZGV2
LCBzaXplb2YoKnByaXYpKTsKKwlpZiAoIWNvdW50ZXIpCiAJCXJldHVybiAtRU5PTUVNOwogCisJ
cHJpdiA9IGNvdW50ZXJfcHJpdihjb3VudGVyKTsKKwogCXByaXYtPnJlZ21hcCA9IGRkYXRhLT5y
ZWdtYXA7CiAJcHJpdi0+Y2xrID0gZGRhdGEtPmNsazsKIAlwcml2LT5tYXhfYXJyID0gZGRhdGEt
Pm1heF9hcnI7CiAKLQlwcml2LT5jb3VudGVyLm5hbWUgPSBkZXZfbmFtZShkZXYpOwotCXByaXYt
PmNvdW50ZXIucGFyZW50ID0gZGV2OwotCXByaXYtPmNvdW50ZXIub3BzID0gJnN0bTMyX3RpbWVy
X2NudF9vcHM7Ci0JcHJpdi0+Y291bnRlci5jb3VudHMgPSAmc3RtMzJfY291bnRzOwotCXByaXYt
PmNvdW50ZXIubnVtX2NvdW50cyA9IDE7Ci0JcHJpdi0+Y291bnRlci5zaWduYWxzID0gc3RtMzJf
c2lnbmFsczsKLQlwcml2LT5jb3VudGVyLm51bV9zaWduYWxzID0gQVJSQVlfU0laRShzdG0zMl9z
aWduYWxzKTsKLQlwcml2LT5jb3VudGVyLnByaXYgPSBwcml2OworCWNvdW50ZXItPm5hbWUgPSBk
ZXZfbmFtZShkZXYpOworCWNvdW50ZXItPnBhcmVudCA9IGRldjsKKwljb3VudGVyLT5vcHMgPSAm
c3RtMzJfdGltZXJfY250X29wczsKKwljb3VudGVyLT5jb3VudHMgPSAmc3RtMzJfY291bnRzOwor
CWNvdW50ZXItPm51bV9jb3VudHMgPSAxOworCWNvdW50ZXItPnNpZ25hbHMgPSBzdG0zMl9zaWdu
YWxzOworCWNvdW50ZXItPm51bV9zaWduYWxzID0gQVJSQVlfU0laRShzdG0zMl9zaWduYWxzKTsK
IAogCXBsYXRmb3JtX3NldF9kcnZkYXRhKHBkZXYsIHByaXYpOwogCiAJLyogUmVnaXN0ZXIgQ291
bnRlciBkZXZpY2UgKi8KLQlyZXR1cm4gZGV2bV9jb3VudGVyX3JlZ2lzdGVyKGRldiwgJnByaXYt
PmNvdW50ZXIpOworCXJldCA9IGRldm1fY291bnRlcl9hZGQoZGV2LCBjb3VudGVyKTsKKwlpZiAo
cmV0IDwgMCkKKwkJZGV2X2Vycl9wcm9iZShkZXYsIHJldCwgIkZhaWxlZCB0byBhZGQgY291bnRl
clxuIik7CisKKwlyZXR1cm4gcmV0OwogfQogCiBzdGF0aWMgaW50IF9fbWF5YmVfdW51c2VkIHN0
bTMyX3RpbWVyX2NudF9zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRldikKLS0gCjIuMzQuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIg
bWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0
cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgt
c3RtMzIK
