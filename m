Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A624447FB74
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Dec 2021 10:46:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 693A1C5F1F1;
	Mon, 27 Dec 2021 09:46:00 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1C246C5F1F0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Dec 2021 09:45:59 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1n1mZY-0006an-62; Mon, 27 Dec 2021 10:45:40 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1n1mZV-006u9a-Vg; Mon, 27 Dec 2021 10:45:37 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1n1mZU-0005XP-9E; Mon, 27 Dec 2021 10:45:36 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Date: Mon, 27 Dec 2021 10:45:23 +0100
Message-Id: <20211227094526.698714-21-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211227094526.698714-1-u.kleine-koenig@pengutronix.de>
References: <20211227094526.698714-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Patch-Hashes: v=1; h=sha256; i=v4zGYhOHsyg9iYZhNI1UDYcjthPJ6td3ckU3nWtgO68=;
 m=2JnEkPCaowZOKuyzD9yTFMIdrv+hKJ42Y0wCXUyIor0=;
 p=dDV9QrmT4JqkzSSSjNjq6wOVUXb8Sd9mQHeOzq19VTY=;
 g=6e4c634470f6219b318c73337ce4f94afb61474d
X-Patch-Sig: m=pgp; i=u.kleine-koenig@pengutronix.de;
 s=0x0D2511F322BFAB1C1580266BE2DCDD9132669BD6;
 b=iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmHJir8ACgkQwfwUeK3K7Am01wgAny0
 RSCdChCLcVQsdj67F6kIt9faenJUtWOG0prabyvryfhBLoBDrDw6kOZM1u24Q3sxb/XZPnmxnPjGh
 8PTA25ECgi4dcRI4u1I++qrFugSuRF9Irio2ojmDBm/42gtfHTsSIR34YzFbkIw+An6jbFX/oaHwO
 0w/+KMD56ND4QEroU74X7t5RAXM6ZGdoh+UoQRnF5uGYQMCd8djxZSVm+/uEkdLJbCkOR8BAHHHMg
 aBtK37YfIgjzGx3eIHlf/uWbSUeiixIqgQqBSTJiOv5macevzQ2RVGQP91Vexnc7LRAzWXrk+FqZF
 FgUqt8jRs1axIcbBS7GdHUf+bcFdL7g==
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
Subject: [Linux-stm32] [PATCH v2 20/23] counter: stm32-timer-cnt: Convert to
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
ZXI6IEFkZCBTVE0zMiBUaW1lciBxdWFkcmF0dXJlIGVuY29kZXIiKQpTaWduZWQtb2ZmLWJ5OiBV
d2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgotLS0KIGRy
aXZlcnMvY291bnRlci9zdG0zMi10aW1lci1jbnQuYyB8IDMwICsrKysrKysrKysrKysrKysrKy0t
LS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvY291bnRlci9zdG0zMi10aW1lci1jbnQuYyBiL2Ry
aXZlcnMvY291bnRlci9zdG0zMi10aW1lci1jbnQuYwppbmRleCA0YjA1YjE5OGE4ZDguLjU3Nzlh
ZTdjNzNjZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9jb3VudGVyL3N0bTMyLXRpbWVyLWNudC5jCisr
KyBiL2RyaXZlcnMvY291bnRlci9zdG0zMi10aW1lci1jbnQuYwpAQCAtMjksNyArMjksNiBAQCBz
dHJ1Y3Qgc3RtMzJfdGltZXJfcmVncyB7CiB9OwogCiBzdHJ1Y3Qgc3RtMzJfdGltZXJfY250IHsK
LQlzdHJ1Y3QgY291bnRlcl9kZXZpY2UgY291bnRlcjsKIAlzdHJ1Y3QgcmVnbWFwICpyZWdtYXA7
CiAJc3RydWN0IGNsayAqY2xrOwogCXUzMiBtYXhfYXJyOwpAQCAtMzE3LDMxICszMTYsMzggQEAg
c3RhdGljIGludCBzdG0zMl90aW1lcl9jbnRfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldikKIAlzdHJ1Y3Qgc3RtMzJfdGltZXJzICpkZGF0YSA9IGRldl9nZXRfZHJ2ZGF0YShwZGV2
LT5kZXYucGFyZW50KTsKIAlzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmcGRldi0+ZGV2OwogCXN0cnVj
dCBzdG0zMl90aW1lcl9jbnQgKnByaXY7CisJc3RydWN0IGNvdW50ZXJfZGV2aWNlICpjb3VudGVy
OworCWludCByZXQ7CiAKIAlpZiAoSVNfRVJSX09SX05VTEwoZGRhdGEpKQogCQlyZXR1cm4gLUVJ
TlZBTDsKIAotCXByaXYgPSBkZXZtX2t6YWxsb2MoZGV2LCBzaXplb2YoKnByaXYpLCBHRlBfS0VS
TkVMKTsKLQlpZiAoIXByaXYpCisJY291bnRlciA9IGRldm1fY291bnRlcl9hbGxvYyhkZXYsIHNp
emVvZigqcHJpdikpOworCWlmICghY291bnRlcikKIAkJcmV0dXJuIC1FTk9NRU07CiAKKwlwcml2
ID0gY291bnRlcl9wcml2KGNvdW50ZXIpOworCiAJcHJpdi0+cmVnbWFwID0gZGRhdGEtPnJlZ21h
cDsKIAlwcml2LT5jbGsgPSBkZGF0YS0+Y2xrOwogCXByaXYtPm1heF9hcnIgPSBkZGF0YS0+bWF4
X2FycjsKIAotCXByaXYtPmNvdW50ZXIubmFtZSA9IGRldl9uYW1lKGRldik7Ci0JcHJpdi0+Y291
bnRlci5wYXJlbnQgPSBkZXY7Ci0JcHJpdi0+Y291bnRlci5vcHMgPSAmc3RtMzJfdGltZXJfY250
X29wczsKLQlwcml2LT5jb3VudGVyLmNvdW50cyA9ICZzdG0zMl9jb3VudHM7Ci0JcHJpdi0+Y291
bnRlci5udW1fY291bnRzID0gMTsKLQlwcml2LT5jb3VudGVyLnNpZ25hbHMgPSBzdG0zMl9zaWdu
YWxzOwotCXByaXYtPmNvdW50ZXIubnVtX3NpZ25hbHMgPSBBUlJBWV9TSVpFKHN0bTMyX3NpZ25h
bHMpOwotCXByaXYtPmNvdW50ZXIucHJpdiA9IHByaXY7CisJY291bnRlci0+bmFtZSA9IGRldl9u
YW1lKGRldik7CisJY291bnRlci0+cGFyZW50ID0gZGV2OworCWNvdW50ZXItPm9wcyA9ICZzdG0z
Ml90aW1lcl9jbnRfb3BzOworCWNvdW50ZXItPmNvdW50cyA9ICZzdG0zMl9jb3VudHM7CisJY291
bnRlci0+bnVtX2NvdW50cyA9IDE7CisJY291bnRlci0+c2lnbmFscyA9IHN0bTMyX3NpZ25hbHM7
CisJY291bnRlci0+bnVtX3NpZ25hbHMgPSBBUlJBWV9TSVpFKHN0bTMyX3NpZ25hbHMpOwogCiAJ
cGxhdGZvcm1fc2V0X2RydmRhdGEocGRldiwgcHJpdik7CiAKIAkvKiBSZWdpc3RlciBDb3VudGVy
IGRldmljZSAqLwotCXJldHVybiBkZXZtX2NvdW50ZXJfcmVnaXN0ZXIoZGV2LCAmcHJpdi0+Y291
bnRlcik7CisJcmV0ID0gZGV2bV9jb3VudGVyX2FkZChkZXYsIGNvdW50ZXIpOworCWlmIChyZXQg
PCAwKQorCQlkZXZfZXJyX3Byb2JlKGRldiwgcmV0LCAiRmFpbGVkIHRvIGFkZCBjb3VudGVyXG4i
KTsKKworCXJldHVybiByZXQ7CiB9CiAKIHN0YXRpYyBpbnQgX19tYXliZV91bnVzZWQgc3RtMzJf
dGltZXJfY250X3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQotLSAKMi4zMy4wCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWls
aW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczov
L3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0z
Mgo=
