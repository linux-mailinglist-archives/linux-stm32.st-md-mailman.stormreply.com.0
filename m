Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5532E7A69EC
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Sep 2023 19:50:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 04ED0C6C824;
	Tue, 19 Sep 2023 17:50:03 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B4059C6C822
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Sep 2023 17:50:01 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qierB-0006ZI-3o; Tue, 19 Sep 2023 19:49:53 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qierA-007VWv-Iz; Tue, 19 Sep 2023 19:49:52 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qierA-0034Xz-8V; Tue, 19 Sep 2023 19:49:52 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jonathan Cameron <jic23@kernel.org>
Date: Tue, 19 Sep 2023 19:49:05 +0200
Message-Id: <20230919174931.1417681-24-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230919174931.1417681-1-u.kleine-koenig@pengutronix.de>
References: <20230919174931.1417681-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2001;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=Odd+RR/837MbYsuNsjeIILdO7UZ1l2djK0pXJyvvXZY=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlCd8JhnGrgHxpbOtocYCzcmAv0UfW0RNx5SRtn
 ms407trrqmJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZQnfCQAKCRCPgPtYfRL+
 Tnb/B/0T7M+EoxRTfYd4HzCi4fKQ9VAJh/8vm7CHs8ueNMkZDeaQ5AlHb82E0Z1TY81AwiyYxjK
 PrISBLIgClRTlT/7ePynekBXnDrnOeac2jV45A/Rv35clsVuJfFmpoWB6cC9/7Q03jIwcupExWE
 Eihzqi0UplRv9Z0EXi5mvNCOQkJtVQ+3YxflvngX67PJ4Yr5LyZq7aRUDci/X0oCSJpzlzYgsGL
 W/QJeeDHcbbOPPBVwK+YJJ0RXjEclxf2Hi+Xw22W4bd0agJ3K1GLhpniYvXMfzySQo5zeNuD6Yj
 aAYmIPmSQKArdaMDxmQl0lZPqebMn3mX4UA/qSd+FtJ8YBnG
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: kernel@pengutronix.de, Rob Herring <robh@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Heiko Stuebner <heiko@sntech.de>,
 linux-iio@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 23/49] iio: adc: stm32-dfsdm-core: Convert to
	platform remove callback returning void
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

VGhlIC5yZW1vdmUoKSBjYWxsYmFjayBmb3IgYSBwbGF0Zm9ybSBkcml2ZXIgcmV0dXJucyBhbiBp
bnQgd2hpY2ggbWFrZXMKbWFueSBkcml2ZXIgYXV0aG9ycyB3cm9uZ2x5IGFzc3VtZSBpdCdzIHBv
c3NpYmxlIHRvIGRvIGVycm9yIGhhbmRsaW5nIGJ5CnJldHVybmluZyBhbiBlcnJvciBjb2RlLiBI
b3dldmVyIHRoZSB2YWx1ZSByZXR1cm5lZCBpcyBpZ25vcmVkIChhcGFydApmcm9tIGVtaXR0aW5n
IGEgd2FybmluZykgYW5kIHRoaXMgdHlwaWNhbGx5IHJlc3VsdHMgaW4gcmVzb3VyY2UgbGVha3Mu
ClRvIGltcHJvdmUgaGVyZSB0aGVyZSBpcyBhIHF1ZXN0IHRvIG1ha2UgdGhlIHJlbW92ZSBjYWxs
YmFjayByZXR1cm4Kdm9pZC4gSW4gdGhlIGZpcnN0IHN0ZXAgb2YgdGhpcyBxdWVzdCBhbGwgZHJp
dmVycyBhcmUgY29udmVydGVkIHRvCi5yZW1vdmVfbmV3KCkgd2hpY2ggYWxyZWFkeSByZXR1cm5z
IHZvaWQuIEV2ZW50dWFsbHkgYWZ0ZXIgYWxsIGRyaXZlcnMKYXJlIGNvbnZlcnRlZCwgLnJlbW92
ZV9uZXcoKSB3aWxsIGJlIHJlbmFtZWQgdG8gLnJlbW92ZSgpLgoKVHJpdmlhbGx5IGNvbnZlcnQg
dGhpcyBkcml2ZXIgZnJvbSBhbHdheXMgcmV0dXJuaW5nIHplcm8gaW4gdGhlIHJlbW92ZQpjYWxs
YmFjayB0byB0aGUgdm9pZCByZXR1cm5pbmcgdmFyaWFudC4KClNpZ25lZC1vZmYtYnk6IFV3ZSBL
bGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+Ci0tLQogZHJpdmVy
cy9paW8vYWRjL3N0bTMyLWRmc2RtLWNvcmUuYyB8IDYgKystLS0tCiAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvaWlv
L2FkYy9zdG0zMi1kZnNkbS1jb3JlLmMgYi9kcml2ZXJzL2lpby9hZGMvc3RtMzItZGZzZG0tY29y
ZS5jCmluZGV4IDBmNmViYjMwNjFhMC4uYTA1ZDk3OGI4Y2I4IDEwMDY0NAotLS0gYS9kcml2ZXJz
L2lpby9hZGMvc3RtMzItZGZzZG0tY29yZS5jCisrKyBiL2RyaXZlcnMvaWlvL2FkYy9zdG0zMi1k
ZnNkbS1jb3JlLmMKQEAgLTQzNiw3ICs0MzYsNyBAQCBzdGF0aWMgaW50IHN0bTMyX2Rmc2RtX3By
b2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJcmV0dXJuIHJldDsKIH0KIAotc3Rh
dGljIGludCBzdG0zMl9kZnNkbV9jb3JlX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpw
ZGV2KQorc3RhdGljIHZvaWQgc3RtMzJfZGZzZG1fY29yZV9yZW1vdmUoc3RydWN0IHBsYXRmb3Jt
X2RldmljZSAqcGRldikKIHsKIAlzdHJ1Y3Qgc3RtMzJfZGZzZG0gKmRmc2RtID0gcGxhdGZvcm1f
Z2V0X2RydmRhdGEocGRldik7CiAKQEAgLTQ0Niw4ICs0NDYsNiBAQCBzdGF0aWMgaW50IHN0bTMy
X2Rmc2RtX2NvcmVfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJcG1fcnVu
dGltZV9zZXRfc3VzcGVuZGVkKCZwZGV2LT5kZXYpOwogCXBtX3J1bnRpbWVfcHV0X25vaWRsZSgm
cGRldi0+ZGV2KTsKIAlzdG0zMl9kZnNkbV9jbGtfZGlzYWJsZV91bnByZXBhcmUoZGZzZG0pOwot
Ci0JcmV0dXJuIDA7CiB9CiAKIHN0YXRpYyBpbnQgc3RtMzJfZGZzZG1fY29yZV9zdXNwZW5kKHN0
cnVjdCBkZXZpY2UgKmRldikKQEAgLTUwOCw3ICs1MDYsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0
IGRldl9wbV9vcHMgc3RtMzJfZGZzZG1fY29yZV9wbV9vcHMgPSB7CiAKIHN0YXRpYyBzdHJ1Y3Qg
cGxhdGZvcm1fZHJpdmVyIHN0bTMyX2Rmc2RtX2RyaXZlciA9IHsKIAkucHJvYmUgPSBzdG0zMl9k
ZnNkbV9wcm9iZSwKLQkucmVtb3ZlID0gc3RtMzJfZGZzZG1fY29yZV9yZW1vdmUsCisJLnJlbW92
ZV9uZXcgPSBzdG0zMl9kZnNkbV9jb3JlX3JlbW92ZSwKIAkuZHJpdmVyID0gewogCQkubmFtZSA9
ICJzdG0zMi1kZnNkbSIsCiAJCS5vZl9tYXRjaF90YWJsZSA9IHN0bTMyX2Rmc2RtX29mX21hdGNo
LAotLSAKMi40MC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1h
bi9saXN0aW5mby9saW51eC1zdG0zMgo=
