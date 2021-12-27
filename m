Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 93FDC47FB72
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Dec 2021 10:45:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4C163C5F1F6;
	Mon, 27 Dec 2021 09:45:51 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ADB68C5F1F2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Dec 2021 09:45:50 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1n1mZY-0006YX-68; Mon, 27 Dec 2021 10:45:40 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1n1mZT-006u9B-PS; Mon, 27 Dec 2021 10:45:35 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1n1mZS-0005VU-L9; Mon, 27 Dec 2021 10:45:34 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Date: Mon, 27 Dec 2021 10:45:14 +0100
Message-Id: <20211227094526.698714-12-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211227094526.698714-1-u.kleine-koenig@pengutronix.de>
References: <20211227094526.698714-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Patch-Hashes: v=1; h=sha256; i=0yX2wuHepSgzmHBcBjV+l+JzQO1R5LNoMTHdUc1ehqw=;
 m=O/hbHSowifJBTpUmrGb87d4c+26dGvtHSBxVMu37a1o=;
 p=MPuYNGn6o/9dZFmQfs3kSBFCwdmcbQB8/ZjqZVWw3zU=;
 g=a38dfe0269317a90960ceb5e30dd5407f739ecfc
X-Patch-Sig: m=pgp; i=u.kleine-koenig@pengutronix.de;
 s=0x0D2511F322BFAB1C1580266BE2DCDD9132669BD6;
 b=iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmHJipoACgkQwfwUeK3K7AltAwf8DEV
 frM7dihZGOsaLBmO8lEahoCcZAYQxAuLnybfc16Bv9itVLiwLwWdJVrpZzOrf57GeMAujdgWu7Mw+
 Bajt5ewVEh5ctYJqzJKwdPvPXP69i/kZ4hwusGhcod0OZbxtnSAXORZ2uhc5qLD3xIvjRCUsIhaAA
 3yM+4APn537hIEYtlietWfOQ0oMHrmYFjNew+z7d5Tbic62vKt7EwdX0ul+DZI4HFPU0NRMrCArnd
 oSGGsewwmN1VwooZomoH4RpR1k+O7BXTNZW9+JWi7iws8RaHF8SozeqISG8mygKgNfvrRU+MKXqkY
 Iqbqu5LJfa9Hoz2Pou+G+kyxk/VW8Yw==
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Lars-Peter Clausen <lars@metafoo.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-iio@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, kernel@pengutronix.de,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Benjamin Gaignard <benjamin.gaignard@st.com>
Subject: [Linux-stm32] [PATCH v2 11/23] counter: stm32-lptimer-cnt: Convert
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
cHJpdigpIHdyYXBwZXIuCgpTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVp
bmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgotLS0KIGRyaXZlcnMvY291bnRlci9zdG0zMi1scHRp
bWVyLWNudC5jIHwgMTggKysrKysrKysrLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNl
cnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvY291bnRlci9z
dG0zMi1scHRpbWVyLWNudC5jIGIvZHJpdmVycy9jb3VudGVyL3N0bTMyLWxwdGltZXItY250LmMK
aW5kZXggNTE2ODgzM2IxZmRmLi45Y2YwMGU5MjljYzAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvY291
bnRlci9zdG0zMi1scHRpbWVyLWNudC5jCisrKyBiL2RyaXZlcnMvY291bnRlci9zdG0zMi1scHRp
bWVyLWNudC5jCkBAIC0xNDEsNyArMTQxLDcgQEAgc3RhdGljIGNvbnN0IGVudW0gY291bnRlcl9z
eW5hcHNlX2FjdGlvbiBzdG0zMl9scHRpbV9jbnRfc3luYXBzZV9hY3Rpb25zW10gPSB7CiBzdGF0
aWMgaW50IHN0bTMyX2xwdGltX2NudF9yZWFkKHN0cnVjdCBjb3VudGVyX2RldmljZSAqY291bnRl
ciwKIAkJCQlzdHJ1Y3QgY291bnRlcl9jb3VudCAqY291bnQsIHU2NCAqdmFsKQogewotCXN0cnVj
dCBzdG0zMl9scHRpbV9jbnQgKmNvbnN0IHByaXYgPSBjb3VudGVyLT5wcml2OworCXN0cnVjdCBz
dG0zMl9scHRpbV9jbnQgKmNvbnN0IHByaXYgPSBjb3VudGVyX3ByaXYoY291bnRlcik7CiAJdTMy
IGNudDsKIAlpbnQgcmV0OwogCkBAIC0xNTgsNyArMTU4LDcgQEAgc3RhdGljIGludCBzdG0zMl9s
cHRpbV9jbnRfZnVuY3Rpb25fcmVhZChzdHJ1Y3QgY291bnRlcl9kZXZpY2UgKmNvdW50ZXIsCiAJ
CQkJCSBzdHJ1Y3QgY291bnRlcl9jb3VudCAqY291bnQsCiAJCQkJCSBlbnVtIGNvdW50ZXJfZnVu
Y3Rpb24gKmZ1bmN0aW9uKQogewotCXN0cnVjdCBzdG0zMl9scHRpbV9jbnQgKmNvbnN0IHByaXYg
PSBjb3VudGVyLT5wcml2OworCXN0cnVjdCBzdG0zMl9scHRpbV9jbnQgKmNvbnN0IHByaXYgPSBj
b3VudGVyX3ByaXYoY291bnRlcik7CiAKIAlpZiAoIXByaXYtPnF1YWRyYXR1cmVfbW9kZSkgewog
CQkqZnVuY3Rpb24gPSBDT1VOVEVSX0ZVTkNUSU9OX0lOQ1JFQVNFOwpAQCAtMTc3LDcgKzE3Nyw3
IEBAIHN0YXRpYyBpbnQgc3RtMzJfbHB0aW1fY250X2Z1bmN0aW9uX3dyaXRlKHN0cnVjdCBjb3Vu
dGVyX2RldmljZSAqY291bnRlciwKIAkJCQkJICBzdHJ1Y3QgY291bnRlcl9jb3VudCAqY291bnQs
CiAJCQkJCSAgZW51bSBjb3VudGVyX2Z1bmN0aW9uIGZ1bmN0aW9uKQogewotCXN0cnVjdCBzdG0z
Ml9scHRpbV9jbnQgKmNvbnN0IHByaXYgPSBjb3VudGVyLT5wcml2OworCXN0cnVjdCBzdG0zMl9s
cHRpbV9jbnQgKmNvbnN0IHByaXYgPSBjb3VudGVyX3ByaXYoY291bnRlcik7CiAKIAlpZiAoc3Rt
MzJfbHB0aW1faXNfZW5hYmxlZChwcml2KSkKIAkJcmV0dXJuIC1FQlVTWTsKQEAgLTIwMCw3ICsy
MDAsNyBAQCBzdGF0aWMgaW50IHN0bTMyX2xwdGltX2NudF9lbmFibGVfcmVhZChzdHJ1Y3QgY291
bnRlcl9kZXZpY2UgKmNvdW50ZXIsCiAJCQkJICAgICAgIHN0cnVjdCBjb3VudGVyX2NvdW50ICpj
b3VudCwKIAkJCQkgICAgICAgdTggKmVuYWJsZSkKIHsKLQlzdHJ1Y3Qgc3RtMzJfbHB0aW1fY250
ICpjb25zdCBwcml2ID0gY291bnRlci0+cHJpdjsKKwlzdHJ1Y3Qgc3RtMzJfbHB0aW1fY250ICpj
b25zdCBwcml2ID0gY291bnRlcl9wcml2KGNvdW50ZXIpOwogCWludCByZXQ7CiAKIAlyZXQgPSBz
dG0zMl9scHRpbV9pc19lbmFibGVkKHByaXYpOwpAQCAtMjE2LDcgKzIxNiw3IEBAIHN0YXRpYyBp
bnQgc3RtMzJfbHB0aW1fY250X2VuYWJsZV93cml0ZShzdHJ1Y3QgY291bnRlcl9kZXZpY2UgKmNv
dW50ZXIsCiAJCQkJCXN0cnVjdCBjb3VudGVyX2NvdW50ICpjb3VudCwKIAkJCQkJdTggZW5hYmxl
KQogewotCXN0cnVjdCBzdG0zMl9scHRpbV9jbnQgKmNvbnN0IHByaXYgPSBjb3VudGVyLT5wcml2
OworCXN0cnVjdCBzdG0zMl9scHRpbV9jbnQgKmNvbnN0IHByaXYgPSBjb3VudGVyX3ByaXYoY291
bnRlcik7CiAJaW50IHJldDsKIAogCS8qIENoZWNrIG5vYm9keSB1c2VzIHRoZSB0aW1lciwgb3Ig
YWxyZWFkeSBkaXNhYmxlZC9lbmFibGVkICovCkBAIC0yNDEsNyArMjQxLDcgQEAgc3RhdGljIGlu
dCBzdG0zMl9scHRpbV9jbnRfY2VpbGluZ19yZWFkKHN0cnVjdCBjb3VudGVyX2RldmljZSAqY291
bnRlciwKIAkJCQkJc3RydWN0IGNvdW50ZXJfY291bnQgKmNvdW50LAogCQkJCQl1NjQgKmNlaWxp
bmcpCiB7Ci0Jc3RydWN0IHN0bTMyX2xwdGltX2NudCAqY29uc3QgcHJpdiA9IGNvdW50ZXItPnBy
aXY7CisJc3RydWN0IHN0bTMyX2xwdGltX2NudCAqY29uc3QgcHJpdiA9IGNvdW50ZXJfcHJpdihj
b3VudGVyKTsKIAogCSpjZWlsaW5nID0gcHJpdi0+Y2VpbGluZzsKIApAQCAtMjUyLDcgKzI1Miw3
IEBAIHN0YXRpYyBpbnQgc3RtMzJfbHB0aW1fY250X2NlaWxpbmdfd3JpdGUoc3RydWN0IGNvdW50
ZXJfZGV2aWNlICpjb3VudGVyLAogCQkJCQkgc3RydWN0IGNvdW50ZXJfY291bnQgKmNvdW50LAog
CQkJCQkgdTY0IGNlaWxpbmcpCiB7Ci0Jc3RydWN0IHN0bTMyX2xwdGltX2NudCAqY29uc3QgcHJp
diA9IGNvdW50ZXItPnByaXY7CisJc3RydWN0IHN0bTMyX2xwdGltX2NudCAqY29uc3QgcHJpdiA9
IGNvdW50ZXJfcHJpdihjb3VudGVyKTsKIAogCWlmIChzdG0zMl9scHRpbV9pc19lbmFibGVkKHBy
aXYpKQogCQlyZXR1cm4gLUVCVVNZOwpAQCAtMjc3LDcgKzI3Nyw3IEBAIHN0YXRpYyBpbnQgc3Rt
MzJfbHB0aW1fY250X2FjdGlvbl9yZWFkKHN0cnVjdCBjb3VudGVyX2RldmljZSAqY291bnRlciwK
IAkJCQkgICAgICAgc3RydWN0IGNvdW50ZXJfc3luYXBzZSAqc3luYXBzZSwKIAkJCQkgICAgICAg
ZW51bSBjb3VudGVyX3N5bmFwc2VfYWN0aW9uICphY3Rpb24pCiB7Ci0Jc3RydWN0IHN0bTMyX2xw
dGltX2NudCAqY29uc3QgcHJpdiA9IGNvdW50ZXItPnByaXY7CisJc3RydWN0IHN0bTMyX2xwdGlt
X2NudCAqY29uc3QgcHJpdiA9IGNvdW50ZXJfcHJpdihjb3VudGVyKTsKIAllbnVtIGNvdW50ZXJf
ZnVuY3Rpb24gZnVuY3Rpb247CiAJaW50IGVycjsKIApAQCAtMzIxLDcgKzMyMSw3IEBAIHN0YXRp
YyBpbnQgc3RtMzJfbHB0aW1fY250X2FjdGlvbl93cml0ZShzdHJ1Y3QgY291bnRlcl9kZXZpY2Ug
KmNvdW50ZXIsCiAJCQkJCXN0cnVjdCBjb3VudGVyX3N5bmFwc2UgKnN5bmFwc2UsCiAJCQkJCWVu
dW0gY291bnRlcl9zeW5hcHNlX2FjdGlvbiBhY3Rpb24pCiB7Ci0Jc3RydWN0IHN0bTMyX2xwdGlt
X2NudCAqY29uc3QgcHJpdiA9IGNvdW50ZXItPnByaXY7CisJc3RydWN0IHN0bTMyX2xwdGltX2Nu
dCAqY29uc3QgcHJpdiA9IGNvdW50ZXJfcHJpdihjb3VudGVyKTsKIAllbnVtIGNvdW50ZXJfZnVu
Y3Rpb24gZnVuY3Rpb247CiAJaW50IGVycjsKIAotLSAKMi4zMy4wCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QK
TGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
