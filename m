Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 633D57A69ED
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Sep 2023 19:50:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 12E1CC6C826;
	Tue, 19 Sep 2023 17:50:03 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B6120C6C823
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Sep 2023 17:50:01 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qierA-0006XK-VZ; Tue, 19 Sep 2023 19:49:53 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qierA-007VWr-Ac; Tue, 19 Sep 2023 19:49:52 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qierA-0034Xv-1J; Tue, 19 Sep 2023 19:49:52 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jonathan Cameron <jic23@kernel.org>
Date: Tue, 19 Sep 2023 19:49:04 +0200
Message-Id: <20230919174931.1417681-23-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230919174931.1417681-1-u.kleine-koenig@pengutronix.de>
References: <20230919174931.1417681-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2014;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=sIxbeL13+lF8KrifdITtoEeWPqQapatgwP5mvMYrHt8=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlCd8I4WK1OylHCGdXA8mRLCr9mGCYoL8I64o50
 QHwuhakfKSJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZQnfCAAKCRCPgPtYfRL+
 TieJB/9fx4MoIk9mbYWIS0YYhEoc9e3XBGofMguF5EG+fjbPHXosZ6NBt2HpGWoL6eazvwIfDxu
 jwkpD7dQ4LnUgxzqOupGv5zRK9+pC6PO79OAanOG8WbhLzGHnFNX8jGDUoT3ANIeIMQt3P1a9zO
 ti3etgekAlWIzxXat3aO0pFkkViXye2hW17/fikfdX3EkJgt5Fq70IxJL+3kUqsqnYdHR1mU1Qd
 K9CKSxwofm1d8mZ5Ot3d1ZZs6W/ZNvwGxEeAXGkJn/r8I5My5SgSk2dUw3gm9ReH8vGnwO5vVKs
 PhZA6WopoH7blsW/5QcdYATk/D2b9qWu9wh2vN1IY+/+PcI4
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: kernel@pengutronix.de, Rob Herring <robh@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-iio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Heiko Stuebner <heiko@sntech.de>
Subject: [Linux-stm32] [PATCH 22/49] iio: adc: stm32-dfsdm-adc: Convert to
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
cy9paW8vYWRjL3N0bTMyLWRmc2RtLWFkYy5jIHwgNiArKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9paW8v
YWRjL3N0bTMyLWRmc2RtLWFkYy5jIGIvZHJpdmVycy9paW8vYWRjL3N0bTMyLWRmc2RtLWFkYy5j
CmluZGV4IGI1Y2M0M2QxMmI2Zi4uY2EwOGFlMzEwOGIyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2lp
by9hZGMvc3RtMzItZGZzZG0tYWRjLmMKKysrIGIvZHJpdmVycy9paW8vYWRjL3N0bTMyLWRmc2Rt
LWFkYy5jCkBAIC0xNjIwLDcgKzE2MjAsNyBAQCBzdGF0aWMgaW50IHN0bTMyX2Rmc2RtX2FkY19w
cm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCXJldHVybiByZXQ7CiB9CiAKLXN0
YXRpYyBpbnQgc3RtMzJfZGZzZG1fYWRjX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpw
ZGV2KQorc3RhdGljIHZvaWQgc3RtMzJfZGZzZG1fYWRjX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1f
ZGV2aWNlICpwZGV2KQogewogCXN0cnVjdCBpaW9fZGV2ICppbmRpb19kZXYgPSBwbGF0Zm9ybV9n
ZXRfZHJ2ZGF0YShwZGV2KTsKIAlzdHJ1Y3Qgc3RtMzJfZGZzZG1fYWRjICphZGMgPSBpaW9fcHJp
dihpbmRpb19kZXYpOwpAQCAtMTYyOSw4ICsxNjI5LDYgQEAgc3RhdGljIGludCBzdG0zMl9kZnNk
bV9hZGNfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJCW9mX3BsYXRmb3Jt
X2RlcG9wdWxhdGUoJnBkZXYtPmRldik7CiAJaWlvX2RldmljZV91bnJlZ2lzdGVyKGluZGlvX2Rl
dik7CiAJc3RtMzJfZGZzZG1fZG1hX3JlbGVhc2UoaW5kaW9fZGV2KTsKLQotCXJldHVybiAwOwog
fQogCiBzdGF0aWMgaW50IHN0bTMyX2Rmc2RtX2FkY19zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRl
dikKQEAgLTE2NzcsNyArMTY3NSw3IEBAIHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIHN0
bTMyX2Rmc2RtX2FkY19kcml2ZXIgPSB7CiAJCS5wbSA9IHBtX3NsZWVwX3B0cigmc3RtMzJfZGZz
ZG1fYWRjX3BtX29wcyksCiAJfSwKIAkucHJvYmUgPSBzdG0zMl9kZnNkbV9hZGNfcHJvYmUsCi0J
LnJlbW92ZSA9IHN0bTMyX2Rmc2RtX2FkY19yZW1vdmUsCisJLnJlbW92ZV9uZXcgPSBzdG0zMl9k
ZnNkbV9hZGNfcmVtb3ZlLAogfTsKIG1vZHVsZV9wbGF0Zm9ybV9kcml2ZXIoc3RtMzJfZGZzZG1f
YWRjX2RyaXZlcik7CiAKLS0gCjIuNDAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
