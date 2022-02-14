Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0149C4B542B
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Feb 2022 16:07:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A7AF9C5F1F9;
	Mon, 14 Feb 2022 15:07:24 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8A862C5F1D7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Feb 2022 15:07:23 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1nJcwk-0007C6-06; Mon, 14 Feb 2022 16:07:22 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nJcwf-00GZDl-K1; Mon, 14 Feb 2022 16:07:16 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nJcwe-0038vY-42; Mon, 14 Feb 2022 16:07:16 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Lee Jones <lee.jones@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Mon, 14 Feb 2022 16:07:10 +0100
Message-Id: <20220214150710.312269-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1895; h=from:subject;
 bh=7otsfwH6fSTSNUg7D7PDPsJdAxvDx1C+OtM3X6y9WW4=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBiCnAahVc9oU88f9z5+LdgQOM1K1huVzxH5a+FLmWY
 K9ojzgSJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYgpwGgAKCRDB/BR4rcrsCYhVB/
 9x07HzFdma9g0XNiJMNDxDayGfAdWxyIOGpO+YuzleN4hktHzAof+9Ev8LRGtv+sL0AUF8LjDgpfjc
 acuWNwW8TxaKvXq8jSkVwJBU8qGCGT9MeXJOzH37Od5J4ONBCrWObqSBRb5R4d9sJwwvmausAJuYJZ
 YnwV1Jq3GV33j+RRStbRBhXBIihNTgBEhWf2zabifTj8tnqmf/lfQCL2XABByq0dtcLIvkA7BdzNCN
 PwX2tXHjdtTjWRsnMwzr42WR++dtsQOw8KhHLBu3B9IJZidKwXGKTWsMo9ojObuKe1wHP1qwoR963I
 LUMZOkThhFh4FecJ13wIJXT+Un3oKK
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, kernel@pengutronix.de,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH v2] mfd: stmfx: Improve error message
	triggered by regulator fault in .remove()
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

UmV0dXJuaW5nIGEgbm9uLXplcm8gdmFsdWUgaW4gYW4gaTJjIHJlbW92ZSBjYWxsYmFjayByZXN1
bHRzIGluIHRoZSBpMmMKY29yZSBlbWl0dGluZyBhIHZlcnkgZ2VuZXJpYyBlcnJvciBtZXNzYWdl
ICgicmVtb3ZlIGZhaWxlZCAoLUVTT01FVEhJTkcpLAp3aWxsIGJlIGlnbm9yZWQiKSBhbmQgYXMg
dGhlIG1lc3NhZ2UgaW5kaWNhdGVzIG5vdCBmdXJ0aGVyIGVycm9yIGhhbmRsaW5nCmlzIGRvbmUu
CgpJbnN0ZWFkIGVtaXQgYSBtb3JlIHNwZWNpZmljIGVycm9yIG1lc3NhZ2UgYW5kIHRoZW4gcmV0
dXJuIHplcm8gaW4KLnJlbW92ZSgpLgoKVGhlIGxvbmctdGVybSBnb2FsIGlzIHRvIG1ha2UgdGhl
IGkyYyByZW1vdmUgcHJvdG90eXBlIHJldHVybiB2b2lkLCBtYWtpbmcKYWxsIGltcGxlbWVudGF0
aW9ucyByZXR1cm4gMCBpcyBwcmVwYXJhdG9yeSB3b3JrIGZvciB0aGlzIGNoYW5nZS4KClNpZ25l
ZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXgu
ZGU+Ci0tLQpDaGFuZ2VzIHNpbmNlIChpbXBsaWNpdCkgdjE6CgogLSBwdXQgZGVjbGFyYXRpb24g
b2YgcmV0IGFuZCBhc3NpZ25tZW50IGluIHR3byBsaW5lcy4KICAgKHJlcXVlc3RlZCBieSBMZWUg
Sm9uZXMpCgogZHJpdmVycy9tZmQvc3RtZnguYyB8IDE3ICsrKysrKysrKysrKy0tLS0tCiAxIGZp
bGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL21mZC9zdG1meC5jIGIvZHJpdmVycy9tZmQvc3RtZnguYwppbmRleCBlMDk1YTM5
MzAxNDIuLjEyMmY5NjA5NDQxMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9tZmQvc3RtZnguYworKysg
Yi9kcml2ZXJzL21mZC9zdG1meC5jCkBAIC0zOTIsMTcgKzM5MiwyMiBAQCBzdGF0aWMgaW50IHN0
bWZ4X2NoaXBfaW5pdChzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50KQogCXJldHVybiByZXQ7CiB9
CiAKLXN0YXRpYyBpbnQgc3RtZnhfY2hpcF9leGl0KHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQp
CitzdGF0aWMgdm9pZCBzdG1meF9jaGlwX2V4aXQoc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCkK
IHsKIAlzdHJ1Y3Qgc3RtZnggKnN0bWZ4ID0gaTJjX2dldF9jbGllbnRkYXRhKGNsaWVudCk7CiAK
IAlyZWdtYXBfd3JpdGUoc3RtZngtPm1hcCwgU1RNRlhfUkVHX0lSUV9TUkNfRU4sIDApOwogCXJl
Z21hcF93cml0ZShzdG1meC0+bWFwLCBTVE1GWF9SRUdfU1lTX0NUUkwsIDApOwogCi0JaWYgKHN0
bWZ4LT52ZGQpCi0JCXJldHVybiByZWd1bGF0b3JfZGlzYWJsZShzdG1meC0+dmRkKTsKKwlpZiAo
c3RtZngtPnZkZCkgeworCQlpbnQgcmV0OwogCisJCXJldCA9IHJlZ3VsYXRvcl9kaXNhYmxlKHN0
bWZ4LT52ZGQpOworCQlpZiAocmV0KQorCQkJZGV2X2VycigmY2xpZW50LT5kZXYsCisJCQkJIkZh
aWxlZCB0byBkaXNhYmxlIHZkZCByZWd1bGF0b3I6ICVwZVxuIiwKKwkJCQlFUlJfUFRSKHJldCkp
OworCX0KLQlyZXR1cm4gMDsKIH0KIAogc3RhdGljIGludCBzdG1meF9wcm9iZShzdHJ1Y3QgaTJj
X2NsaWVudCAqY2xpZW50LApAQCAtNDY2LDcgKzQ3MSw5IEBAIHN0YXRpYyBpbnQgc3RtZnhfcmVt
b3ZlKHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQpCiB7CiAJc3RtZnhfaXJxX2V4aXQoY2xpZW50
KTsKIAotCXJldHVybiBzdG1meF9jaGlwX2V4aXQoY2xpZW50KTsKKwlzdG1meF9jaGlwX2V4aXQo
Y2xpZW50KTsKKworCXJldHVybiAwOwogfQogCiAjaWZkZWYgQ09ORklHX1BNX1NMRUVQCgpiYXNl
LWNvbW1pdDogZGNiODVmODVmYTZmMTQyYWFlMWZlODZmMzk5ZDQ1MDNkNDlmMmI2MAotLSAKMi4z
NC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5m
by9saW51eC1zdG0zMgo=
