Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 92DB97A6A00
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Sep 2023 19:50:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 57F2BC6C823;
	Tue, 19 Sep 2023 17:50:14 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 65D88C6C822
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Sep 2023 17:50:12 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qierD-0006WN-V4; Tue, 19 Sep 2023 19:49:55 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qier9-007VWj-Ri; Tue, 19 Sep 2023 19:49:51 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qier9-0034Xn-I9; Tue, 19 Sep 2023 19:49:51 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jonathan Cameron <jic23@kernel.org>
Date: Tue, 19 Sep 2023 19:49:02 +0200
Message-Id: <20230919174931.1417681-21-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230919174931.1417681-1-u.kleine-koenig@pengutronix.de>
References: <20230919174931.1417681-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1996;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=WSJX25WSQLs7OvVKbqk6leOgh/V6E1BBL0l8Qm7+sJg=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlCd8GgNcFOnrFMcZcUSjQ4cgFpvB8rIlGVCMJ6
 HvjdkWt3mKJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZQnfBgAKCRCPgPtYfRL+
 TkPrB/wPefIGJwRrtcx9BIwo/98kaRZZsLmqVRPnnTmLsKha6RWmJsbfvJbPShgl8yzxbdJBz6h
 k9CqXjqwf63gzLPIeBjE1ZAwKQCgtjdQYZF2lKJbEGpc5BMPoUtJp1xmwJn/OdKzPSwps9bBZ3J
 6zI7LlnSVucW5XSqMd8pejTj3NaRvsm2DNK5LC/GtPPtESiv/5ic7+QE5niLTMpTexw2p/r31i/
 DGFh1hXjnF2XJb1S6mT2f15SmOlUb2fF15M+cFTUnlye4a6DucHWblAWf628EWnMYbkO4FM+2o4
 Zev564enqS5DQsZjQkpjHsrfGAEIdwL4KUd1oC4eCpFXy+WD
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: kernel@pengutronix.de, Rob Herring <robh@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Yangtao Li <frank.li@vivo.com>,
 linux-iio@vger.kernel.org, Zhang Shurong <zhang_shurong@foxmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Heiko Stuebner <heiko@sntech.de>
Subject: [Linux-stm32] [PATCH 20/49] iio: adc: stm32-adc-core: Convert to
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
cy9paW8vYWRjL3N0bTMyLWFkYy1jb3JlLmMgfCA2ICsrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2lpby9h
ZGMvc3RtMzItYWRjLWNvcmUuYyBiL2RyaXZlcnMvaWlvL2FkYy9zdG0zMi1hZGMtY29yZS5jCmlu
ZGV4IGJiZDViZGQ3MzJmMC4uYzE5NTA2YjBhYWM4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2lpby9h
ZGMvc3RtMzItYWRjLWNvcmUuYworKysgYi9kcml2ZXJzL2lpby9hZGMvc3RtMzItYWRjLWNvcmUu
YwpAQCAtODE5LDcgKzgxOSw3IEBAIHN0YXRpYyBpbnQgc3RtMzJfYWRjX3Byb2JlKHN0cnVjdCBw
bGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJcmV0dXJuIHJldDsKIH0KIAotc3RhdGljIGludCBzdG0z
Ml9hZGNfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCitzdGF0aWMgdm9pZCBz
dG0zMl9hZGNfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiB7CiAJc3RydWN0
IHN0bTMyX2FkY19jb21tb24gKmNvbW1vbiA9IHBsYXRmb3JtX2dldF9kcnZkYXRhKHBkZXYpOwog
CXN0cnVjdCBzdG0zMl9hZGNfcHJpdiAqcHJpdiA9IHRvX3N0bTMyX2FkY19wcml2KGNvbW1vbik7
CkBAIC04MzEsOCArODMxLDYgQEAgc3RhdGljIGludCBzdG0zMl9hZGNfcmVtb3ZlKHN0cnVjdCBw
bGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJcG1fcnVudGltZV9kaXNhYmxlKCZwZGV2LT5kZXYpOwog
CXBtX3J1bnRpbWVfc2V0X3N1c3BlbmRlZCgmcGRldi0+ZGV2KTsKIAlwbV9ydW50aW1lX3B1dF9u
b2lkbGUoJnBkZXYtPmRldik7Ci0KLQlyZXR1cm4gMDsKIH0KIAogc3RhdGljIGludCBzdG0zMl9h
ZGNfY29yZV9ydW50aW1lX3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQpAQCAtOTEzLDcgKzkx
MSw3IEBAIE1PRFVMRV9ERVZJQ0VfVEFCTEUob2YsIHN0bTMyX2FkY19vZl9tYXRjaCk7CiAKIHN0
YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIHN0bTMyX2FkY19kcml2ZXIgPSB7CiAJLnByb2Jl
ID0gc3RtMzJfYWRjX3Byb2JlLAotCS5yZW1vdmUgPSBzdG0zMl9hZGNfcmVtb3ZlLAorCS5yZW1v
dmVfbmV3ID0gc3RtMzJfYWRjX3JlbW92ZSwKIAkuZHJpdmVyID0gewogCQkubmFtZSA9ICJzdG0z
Mi1hZGMtY29yZSIsCiAJCS5vZl9tYXRjaF90YWJsZSA9IHN0bTMyX2FkY19vZl9tYXRjaCwKLS0g
CjIuNDAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlz
dGluZm8vbGludXgtc3RtMzIK
