Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD2B48149B
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Dec 2021 16:45:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DA032C5F1F1;
	Wed, 29 Dec 2021 15:45:06 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1172EC5E2C2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Dec 2021 15:45:06 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1n2b8N-0006qT-51; Wed, 29 Dec 2021 16:44:59 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1n2b8F-007KHE-Bs; Wed, 29 Dec 2021 16:44:50 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1n2b8E-000144-AW; Wed, 29 Dec 2021 16:44:50 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Date: Wed, 29 Dec 2021 16:44:30 +0100
Message-Id: <20211229154441.38045-13-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211229154441.38045-1-u.kleine-koenig@pengutronix.de>
References: <20211229154441.38045-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3961; h=from:subject;
 bh=wdtKkluXMmzSj2wb5mCtiu7A85AS1CCPgxJ//4kVhbg=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBhzII43kwwwRodcPX7bEvfoLeNLmWXzuuZZVvYByRe
 IiHkw0WJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYcyCOAAKCRDB/BR4rcrsCbfvB/
 9GYkY5IfFHlZ8gE7GGmUcvU0cAHhCxX2T9XS59eBp3yO1/c4PMubdMIqYHrCOKyEm2SqIoyMqCc/9e
 cAOQRc1tyoP0hY57o4/pqdVHDMXPQg9MM8XaYUbupf6MVg8AhXd1VJUn6l5gRz4ijT0hFFg6n/9/qX
 NRTvE+XDCroKRJFBg88oCzfX3agNnvVKTEE6pYQl/Lvo82Um8gvlLCCr1jHjoIGv41r3qy7JUv9BEO
 tBt4qenVtPXcHRQZPo4VuFElSvjy75J8jEvENRYVbDWt7OUH5a9UvBUlDlTIvzs62Zhll6aeZDRbUQ
 gjxxrxCtGWa/hM6OtAD/VARE+4qBxv
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-iio@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, kernel@pengutronix.de,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 12/23] counter: stm32-timer-cnt: Convert to
	counter_priv() wrapper
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
aW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KLS0tCiBkcml2ZXJzL2NvdW50ZXIvc3RtMzItdGlt
ZXItY250LmMgfCAxOCArKysrKysrKystLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2Vy
dGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9jb3VudGVyL3N0
bTMyLXRpbWVyLWNudC5jIGIvZHJpdmVycy9jb3VudGVyL3N0bTMyLXRpbWVyLWNudC5jCmluZGV4
IDA1NDZlOTMyZGIwYy4uNGIwNWIxOThhOGQ4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2NvdW50ZXIv
c3RtMzItdGltZXItY250LmMKKysrIGIvZHJpdmVycy9jb3VudGVyL3N0bTMyLXRpbWVyLWNudC5j
CkBAIC00Nyw3ICs0Nyw3IEBAIHN0YXRpYyBjb25zdCBlbnVtIGNvdW50ZXJfZnVuY3Rpb24gc3Rt
MzJfY291bnRfZnVuY3Rpb25zW10gPSB7CiBzdGF0aWMgaW50IHN0bTMyX2NvdW50X3JlYWQoc3Ry
dWN0IGNvdW50ZXJfZGV2aWNlICpjb3VudGVyLAogCQkJICAgIHN0cnVjdCBjb3VudGVyX2NvdW50
ICpjb3VudCwgdTY0ICp2YWwpCiB7Ci0Jc3RydWN0IHN0bTMyX3RpbWVyX2NudCAqY29uc3QgcHJp
diA9IGNvdW50ZXItPnByaXY7CisJc3RydWN0IHN0bTMyX3RpbWVyX2NudCAqY29uc3QgcHJpdiA9
IGNvdW50ZXJfcHJpdihjb3VudGVyKTsKIAl1MzIgY250OwogCiAJcmVnbWFwX3JlYWQocHJpdi0+
cmVnbWFwLCBUSU1fQ05ULCAmY250KTsKQEAgLTU5LDcgKzU5LDcgQEAgc3RhdGljIGludCBzdG0z
Ml9jb3VudF9yZWFkKHN0cnVjdCBjb3VudGVyX2RldmljZSAqY291bnRlciwKIHN0YXRpYyBpbnQg
c3RtMzJfY291bnRfd3JpdGUoc3RydWN0IGNvdW50ZXJfZGV2aWNlICpjb3VudGVyLAogCQkJICAg
ICBzdHJ1Y3QgY291bnRlcl9jb3VudCAqY291bnQsIGNvbnN0IHU2NCB2YWwpCiB7Ci0Jc3RydWN0
IHN0bTMyX3RpbWVyX2NudCAqY29uc3QgcHJpdiA9IGNvdW50ZXItPnByaXY7CisJc3RydWN0IHN0
bTMyX3RpbWVyX2NudCAqY29uc3QgcHJpdiA9IGNvdW50ZXJfcHJpdihjb3VudGVyKTsKIAl1MzIg
Y2VpbGluZzsKIAogCXJlZ21hcF9yZWFkKHByaXYtPnJlZ21hcCwgVElNX0FSUiwgJmNlaWxpbmcp
OwpAQCAtNzMsNyArNzMsNyBAQCBzdGF0aWMgaW50IHN0bTMyX2NvdW50X2Z1bmN0aW9uX3JlYWQo
c3RydWN0IGNvdW50ZXJfZGV2aWNlICpjb3VudGVyLAogCQkJCSAgICAgc3RydWN0IGNvdW50ZXJf
Y291bnQgKmNvdW50LAogCQkJCSAgICAgZW51bSBjb3VudGVyX2Z1bmN0aW9uICpmdW5jdGlvbikK
IHsKLQlzdHJ1Y3Qgc3RtMzJfdGltZXJfY250ICpjb25zdCBwcml2ID0gY291bnRlci0+cHJpdjsK
KwlzdHJ1Y3Qgc3RtMzJfdGltZXJfY250ICpjb25zdCBwcml2ID0gY291bnRlcl9wcml2KGNvdW50
ZXIpOwogCXUzMiBzbWNyOwogCiAJcmVnbWFwX3JlYWQocHJpdi0+cmVnbWFwLCBUSU1fU01DUiwg
JnNtY3IpOwpAQCAtMTAwLDcgKzEwMCw3IEBAIHN0YXRpYyBpbnQgc3RtMzJfY291bnRfZnVuY3Rp
b25fd3JpdGUoc3RydWN0IGNvdW50ZXJfZGV2aWNlICpjb3VudGVyLAogCQkJCSAgICAgIHN0cnVj
dCBjb3VudGVyX2NvdW50ICpjb3VudCwKIAkJCQkgICAgICBlbnVtIGNvdW50ZXJfZnVuY3Rpb24g
ZnVuY3Rpb24pCiB7Ci0Jc3RydWN0IHN0bTMyX3RpbWVyX2NudCAqY29uc3QgcHJpdiA9IGNvdW50
ZXItPnByaXY7CisJc3RydWN0IHN0bTMyX3RpbWVyX2NudCAqY29uc3QgcHJpdiA9IGNvdW50ZXJf
cHJpdihjb3VudGVyKTsKIAl1MzIgY3IxLCBzbXM7CiAKIAlzd2l0Y2ggKGZ1bmN0aW9uKSB7CkBA
IC0xNDAsNyArMTQwLDcgQEAgc3RhdGljIGludCBzdG0zMl9jb3VudF9kaXJlY3Rpb25fcmVhZChz
dHJ1Y3QgY291bnRlcl9kZXZpY2UgKmNvdW50ZXIsCiAJCQkJICAgICAgc3RydWN0IGNvdW50ZXJf
Y291bnQgKmNvdW50LAogCQkJCSAgICAgIGVudW0gY291bnRlcl9jb3VudF9kaXJlY3Rpb24gKmRp
cmVjdGlvbikKIHsKLQlzdHJ1Y3Qgc3RtMzJfdGltZXJfY250ICpjb25zdCBwcml2ID0gY291bnRl
ci0+cHJpdjsKKwlzdHJ1Y3Qgc3RtMzJfdGltZXJfY250ICpjb25zdCBwcml2ID0gY291bnRlcl9w
cml2KGNvdW50ZXIpOwogCXUzMiBjcjE7CiAKIAlyZWdtYXBfcmVhZChwcml2LT5yZWdtYXAsIFRJ
TV9DUjEsICZjcjEpOwpAQCAtMTUzLDcgKzE1Myw3IEBAIHN0YXRpYyBpbnQgc3RtMzJfY291bnRf
ZGlyZWN0aW9uX3JlYWQoc3RydWN0IGNvdW50ZXJfZGV2aWNlICpjb3VudGVyLAogc3RhdGljIGlu
dCBzdG0zMl9jb3VudF9jZWlsaW5nX3JlYWQoc3RydWN0IGNvdW50ZXJfZGV2aWNlICpjb3VudGVy
LAogCQkJCSAgICBzdHJ1Y3QgY291bnRlcl9jb3VudCAqY291bnQsIHU2NCAqY2VpbGluZykKIHsK
LQlzdHJ1Y3Qgc3RtMzJfdGltZXJfY250ICpjb25zdCBwcml2ID0gY291bnRlci0+cHJpdjsKKwlz
dHJ1Y3Qgc3RtMzJfdGltZXJfY250ICpjb25zdCBwcml2ID0gY291bnRlcl9wcml2KGNvdW50ZXIp
OwogCXUzMiBhcnI7CiAKIAlyZWdtYXBfcmVhZChwcml2LT5yZWdtYXAsIFRJTV9BUlIsICZhcnIp
OwpAQCAtMTY2LDcgKzE2Niw3IEBAIHN0YXRpYyBpbnQgc3RtMzJfY291bnRfY2VpbGluZ19yZWFk
KHN0cnVjdCBjb3VudGVyX2RldmljZSAqY291bnRlciwKIHN0YXRpYyBpbnQgc3RtMzJfY291bnRf
Y2VpbGluZ193cml0ZShzdHJ1Y3QgY291bnRlcl9kZXZpY2UgKmNvdW50ZXIsCiAJCQkJICAgICBz
dHJ1Y3QgY291bnRlcl9jb3VudCAqY291bnQsIHU2NCBjZWlsaW5nKQogewotCXN0cnVjdCBzdG0z
Ml90aW1lcl9jbnQgKmNvbnN0IHByaXYgPSBjb3VudGVyLT5wcml2OworCXN0cnVjdCBzdG0zMl90
aW1lcl9jbnQgKmNvbnN0IHByaXYgPSBjb3VudGVyX3ByaXYoY291bnRlcik7CiAKIAlpZiAoY2Vp
bGluZyA+IHByaXYtPm1heF9hcnIpCiAJCXJldHVybiAtRVJBTkdFOwpAQCAtMTgxLDcgKzE4MSw3
IEBAIHN0YXRpYyBpbnQgc3RtMzJfY291bnRfY2VpbGluZ193cml0ZShzdHJ1Y3QgY291bnRlcl9k
ZXZpY2UgKmNvdW50ZXIsCiBzdGF0aWMgaW50IHN0bTMyX2NvdW50X2VuYWJsZV9yZWFkKHN0cnVj
dCBjb3VudGVyX2RldmljZSAqY291bnRlciwKIAkJCQkgICBzdHJ1Y3QgY291bnRlcl9jb3VudCAq
Y291bnQsIHU4ICplbmFibGUpCiB7Ci0Jc3RydWN0IHN0bTMyX3RpbWVyX2NudCAqY29uc3QgcHJp
diA9IGNvdW50ZXItPnByaXY7CisJc3RydWN0IHN0bTMyX3RpbWVyX2NudCAqY29uc3QgcHJpdiA9
IGNvdW50ZXJfcHJpdihjb3VudGVyKTsKIAl1MzIgY3IxOwogCiAJcmVnbWFwX3JlYWQocHJpdi0+
cmVnbWFwLCBUSU1fQ1IxLCAmY3IxKTsKQEAgLTE5NCw3ICsxOTQsNyBAQCBzdGF0aWMgaW50IHN0
bTMyX2NvdW50X2VuYWJsZV9yZWFkKHN0cnVjdCBjb3VudGVyX2RldmljZSAqY291bnRlciwKIHN0
YXRpYyBpbnQgc3RtMzJfY291bnRfZW5hYmxlX3dyaXRlKHN0cnVjdCBjb3VudGVyX2RldmljZSAq
Y291bnRlciwKIAkJCQkgICAgc3RydWN0IGNvdW50ZXJfY291bnQgKmNvdW50LCB1OCBlbmFibGUp
CiB7Ci0Jc3RydWN0IHN0bTMyX3RpbWVyX2NudCAqY29uc3QgcHJpdiA9IGNvdW50ZXItPnByaXY7
CisJc3RydWN0IHN0bTMyX3RpbWVyX2NudCAqY29uc3QgcHJpdiA9IGNvdW50ZXJfcHJpdihjb3Vu
dGVyKTsKIAl1MzIgY3IxOwogCiAJaWYgKGVuYWJsZSkgewotLSAKMi4zNC4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5n
IGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
