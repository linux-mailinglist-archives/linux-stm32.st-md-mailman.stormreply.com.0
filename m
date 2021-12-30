Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE4A481D5C
	for <lists+linux-stm32@lfdr.de>; Thu, 30 Dec 2021 16:03:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1C20FC5F1EA;
	Thu, 30 Dec 2021 15:03:16 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 14ACBC5E2C2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Dec 2021 15:03:14 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1n2wxQ-0000cU-6N; Thu, 30 Dec 2021 16:03:08 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1n2wxN-007VL1-SG; Thu, 30 Dec 2021 16:03:05 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1n2wxM-0007i3-Lg; Thu, 30 Dec 2021 16:03:04 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Thu, 30 Dec 2021 16:02:48 +0100
Message-Id: <20211230150300.72196-12-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211230150300.72196-1-u.kleine-koenig@pengutronix.de>
References: <20211230150300.72196-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3728; h=from:subject;
 bh=HzpiF2hM7TUPP6R0Q8sjl1mleB8WWDqnHZa5zXo9C1Q=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBhzcmNMowiChMBSWxMR+GhqtTMOuc77XHdTRdcTAEG
 HfEiyxCJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYc3JjQAKCRDB/BR4rcrsCRZ+B/
 4yPolbyDT6/f2itAP6FVVWrMKwBy2ark9XYvvASOMVv/Bisr0fRnfJIOl5ecEUXay0yguUAh6CphIu
 rsYavJpz6QpPfm1ilX4jCiR+qBSZSFH7UOJOBAD0EcWpIZx2Ye6r9LAW7+TczDj7uke1LVcPLQkC2/
 T8PisQ6c5P2UiSumHKLP4WZbJfYfPM5Tj91pvv8ONUrcRyCNAtwTDuqHjTMg6hSL2juojNJSFBFJAh
 K2eXmSCsF3qoXfPmP8oYwaOFD9pVSYtjmEscgZz+snPbK+ImcFN+MOhRAc25ov/srHOQGFIZvb0jCH
 ICExfnjQoB06yCVoDKiIYLb120xW1F
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
Subject: [Linux-stm32] [PATCH v4 11/23] counter: stm32-lptimer-cnt: Convert
	to counter_priv() wrapper
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

VGhpcyBpcyBhIHN0cmFpZ2h0IGZvcndhcmQgY29udmVyc2lvbiB0byB0aGUgbmV3IGNvdW50ZXJf
cHJpdigpIHdyYXBwZXIuCgpBY2tlZC1ieTogSm9uYXRoYW4gQ2FtZXJvbiA8Sm9uYXRoYW4uQ2Ft
ZXJvbkBodWF3ZWkuY29tPgpBY2tlZC1ieTogV2lsbGlhbSBCcmVhdGhpdHQgR3JheSA8dmlsaGVs
bS5ncmF5QGdtYWlsLmNvbT4KU2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xl
aW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KLS0tCiBkcml2ZXJzL2NvdW50ZXIvc3RtMzItbHB0
aW1lci1jbnQuYyB8IDE4ICsrKysrKysrKy0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDkgaW5z
ZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2NvdW50ZXIv
c3RtMzItbHB0aW1lci1jbnQuYyBiL2RyaXZlcnMvY291bnRlci9zdG0zMi1scHRpbWVyLWNudC5j
CmluZGV4IDUxNjg4MzNiMWZkZi4uOWNmMDBlOTI5Y2MwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2Nv
dW50ZXIvc3RtMzItbHB0aW1lci1jbnQuYworKysgYi9kcml2ZXJzL2NvdW50ZXIvc3RtMzItbHB0
aW1lci1jbnQuYwpAQCAtMTQxLDcgKzE0MSw3IEBAIHN0YXRpYyBjb25zdCBlbnVtIGNvdW50ZXJf
c3luYXBzZV9hY3Rpb24gc3RtMzJfbHB0aW1fY250X3N5bmFwc2VfYWN0aW9uc1tdID0gewogc3Rh
dGljIGludCBzdG0zMl9scHRpbV9jbnRfcmVhZChzdHJ1Y3QgY291bnRlcl9kZXZpY2UgKmNvdW50
ZXIsCiAJCQkJc3RydWN0IGNvdW50ZXJfY291bnQgKmNvdW50LCB1NjQgKnZhbCkKIHsKLQlzdHJ1
Y3Qgc3RtMzJfbHB0aW1fY250ICpjb25zdCBwcml2ID0gY291bnRlci0+cHJpdjsKKwlzdHJ1Y3Qg
c3RtMzJfbHB0aW1fY250ICpjb25zdCBwcml2ID0gY291bnRlcl9wcml2KGNvdW50ZXIpOwogCXUz
MiBjbnQ7CiAJaW50IHJldDsKIApAQCAtMTU4LDcgKzE1OCw3IEBAIHN0YXRpYyBpbnQgc3RtMzJf
bHB0aW1fY250X2Z1bmN0aW9uX3JlYWQoc3RydWN0IGNvdW50ZXJfZGV2aWNlICpjb3VudGVyLAog
CQkJCQkgc3RydWN0IGNvdW50ZXJfY291bnQgKmNvdW50LAogCQkJCQkgZW51bSBjb3VudGVyX2Z1
bmN0aW9uICpmdW5jdGlvbikKIHsKLQlzdHJ1Y3Qgc3RtMzJfbHB0aW1fY250ICpjb25zdCBwcml2
ID0gY291bnRlci0+cHJpdjsKKwlzdHJ1Y3Qgc3RtMzJfbHB0aW1fY250ICpjb25zdCBwcml2ID0g
Y291bnRlcl9wcml2KGNvdW50ZXIpOwogCiAJaWYgKCFwcml2LT5xdWFkcmF0dXJlX21vZGUpIHsK
IAkJKmZ1bmN0aW9uID0gQ09VTlRFUl9GVU5DVElPTl9JTkNSRUFTRTsKQEAgLTE3Nyw3ICsxNzcs
NyBAQCBzdGF0aWMgaW50IHN0bTMyX2xwdGltX2NudF9mdW5jdGlvbl93cml0ZShzdHJ1Y3QgY291
bnRlcl9kZXZpY2UgKmNvdW50ZXIsCiAJCQkJCSAgc3RydWN0IGNvdW50ZXJfY291bnQgKmNvdW50
LAogCQkJCQkgIGVudW0gY291bnRlcl9mdW5jdGlvbiBmdW5jdGlvbikKIHsKLQlzdHJ1Y3Qgc3Rt
MzJfbHB0aW1fY250ICpjb25zdCBwcml2ID0gY291bnRlci0+cHJpdjsKKwlzdHJ1Y3Qgc3RtMzJf
bHB0aW1fY250ICpjb25zdCBwcml2ID0gY291bnRlcl9wcml2KGNvdW50ZXIpOwogCiAJaWYgKHN0
bTMyX2xwdGltX2lzX2VuYWJsZWQocHJpdikpCiAJCXJldHVybiAtRUJVU1k7CkBAIC0yMDAsNyAr
MjAwLDcgQEAgc3RhdGljIGludCBzdG0zMl9scHRpbV9jbnRfZW5hYmxlX3JlYWQoc3RydWN0IGNv
dW50ZXJfZGV2aWNlICpjb3VudGVyLAogCQkJCSAgICAgICBzdHJ1Y3QgY291bnRlcl9jb3VudCAq
Y291bnQsCiAJCQkJICAgICAgIHU4ICplbmFibGUpCiB7Ci0Jc3RydWN0IHN0bTMyX2xwdGltX2Nu
dCAqY29uc3QgcHJpdiA9IGNvdW50ZXItPnByaXY7CisJc3RydWN0IHN0bTMyX2xwdGltX2NudCAq
Y29uc3QgcHJpdiA9IGNvdW50ZXJfcHJpdihjb3VudGVyKTsKIAlpbnQgcmV0OwogCiAJcmV0ID0g
c3RtMzJfbHB0aW1faXNfZW5hYmxlZChwcml2KTsKQEAgLTIxNiw3ICsyMTYsNyBAQCBzdGF0aWMg
aW50IHN0bTMyX2xwdGltX2NudF9lbmFibGVfd3JpdGUoc3RydWN0IGNvdW50ZXJfZGV2aWNlICpj
b3VudGVyLAogCQkJCQlzdHJ1Y3QgY291bnRlcl9jb3VudCAqY291bnQsCiAJCQkJCXU4IGVuYWJs
ZSkKIHsKLQlzdHJ1Y3Qgc3RtMzJfbHB0aW1fY250ICpjb25zdCBwcml2ID0gY291bnRlci0+cHJp
djsKKwlzdHJ1Y3Qgc3RtMzJfbHB0aW1fY250ICpjb25zdCBwcml2ID0gY291bnRlcl9wcml2KGNv
dW50ZXIpOwogCWludCByZXQ7CiAKIAkvKiBDaGVjayBub2JvZHkgdXNlcyB0aGUgdGltZXIsIG9y
IGFscmVhZHkgZGlzYWJsZWQvZW5hYmxlZCAqLwpAQCAtMjQxLDcgKzI0MSw3IEBAIHN0YXRpYyBp
bnQgc3RtMzJfbHB0aW1fY250X2NlaWxpbmdfcmVhZChzdHJ1Y3QgY291bnRlcl9kZXZpY2UgKmNv
dW50ZXIsCiAJCQkJCXN0cnVjdCBjb3VudGVyX2NvdW50ICpjb3VudCwKIAkJCQkJdTY0ICpjZWls
aW5nKQogewotCXN0cnVjdCBzdG0zMl9scHRpbV9jbnQgKmNvbnN0IHByaXYgPSBjb3VudGVyLT5w
cml2OworCXN0cnVjdCBzdG0zMl9scHRpbV9jbnQgKmNvbnN0IHByaXYgPSBjb3VudGVyX3ByaXYo
Y291bnRlcik7CiAKIAkqY2VpbGluZyA9IHByaXYtPmNlaWxpbmc7CiAKQEAgLTI1Miw3ICsyNTIs
NyBAQCBzdGF0aWMgaW50IHN0bTMyX2xwdGltX2NudF9jZWlsaW5nX3dyaXRlKHN0cnVjdCBjb3Vu
dGVyX2RldmljZSAqY291bnRlciwKIAkJCQkJIHN0cnVjdCBjb3VudGVyX2NvdW50ICpjb3VudCwK
IAkJCQkJIHU2NCBjZWlsaW5nKQogewotCXN0cnVjdCBzdG0zMl9scHRpbV9jbnQgKmNvbnN0IHBy
aXYgPSBjb3VudGVyLT5wcml2OworCXN0cnVjdCBzdG0zMl9scHRpbV9jbnQgKmNvbnN0IHByaXYg
PSBjb3VudGVyX3ByaXYoY291bnRlcik7CiAKIAlpZiAoc3RtMzJfbHB0aW1faXNfZW5hYmxlZChw
cml2KSkKIAkJcmV0dXJuIC1FQlVTWTsKQEAgLTI3Nyw3ICsyNzcsNyBAQCBzdGF0aWMgaW50IHN0
bTMyX2xwdGltX2NudF9hY3Rpb25fcmVhZChzdHJ1Y3QgY291bnRlcl9kZXZpY2UgKmNvdW50ZXIs
CiAJCQkJICAgICAgIHN0cnVjdCBjb3VudGVyX3N5bmFwc2UgKnN5bmFwc2UsCiAJCQkJICAgICAg
IGVudW0gY291bnRlcl9zeW5hcHNlX2FjdGlvbiAqYWN0aW9uKQogewotCXN0cnVjdCBzdG0zMl9s
cHRpbV9jbnQgKmNvbnN0IHByaXYgPSBjb3VudGVyLT5wcml2OworCXN0cnVjdCBzdG0zMl9scHRp
bV9jbnQgKmNvbnN0IHByaXYgPSBjb3VudGVyX3ByaXYoY291bnRlcik7CiAJZW51bSBjb3VudGVy
X2Z1bmN0aW9uIGZ1bmN0aW9uOwogCWludCBlcnI7CiAKQEAgLTMyMSw3ICszMjEsNyBAQCBzdGF0
aWMgaW50IHN0bTMyX2xwdGltX2NudF9hY3Rpb25fd3JpdGUoc3RydWN0IGNvdW50ZXJfZGV2aWNl
ICpjb3VudGVyLAogCQkJCQlzdHJ1Y3QgY291bnRlcl9zeW5hcHNlICpzeW5hcHNlLAogCQkJCQll
bnVtIGNvdW50ZXJfc3luYXBzZV9hY3Rpb24gYWN0aW9uKQogewotCXN0cnVjdCBzdG0zMl9scHRp
bV9jbnQgKmNvbnN0IHByaXYgPSBjb3VudGVyLT5wcml2OworCXN0cnVjdCBzdG0zMl9scHRpbV9j
bnQgKmNvbnN0IHByaXYgPSBjb3VudGVyX3ByaXYoY291bnRlcik7CiAJZW51bSBjb3VudGVyX2Z1
bmN0aW9uIGZ1bmN0aW9uOwogCWludCBlcnI7CiAKLS0gCjIuMzQuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0
CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
