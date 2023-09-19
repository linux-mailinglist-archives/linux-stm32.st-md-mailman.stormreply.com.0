Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD5F7A69F4
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Sep 2023 19:50:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 21CA6C6C825;
	Tue, 19 Sep 2023 17:50:05 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D62C7C6C827
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Sep 2023 17:50:03 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qierA-0006Wb-Va; Tue, 19 Sep 2023 19:49:53 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qierA-007VWo-45; Tue, 19 Sep 2023 19:49:52 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qier9-0034Xr-Qz; Tue, 19 Sep 2023 19:49:51 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jonathan Cameron <jic23@kernel.org>
Date: Tue, 19 Sep 2023 19:49:03 +0200
Message-Id: <20230919174931.1417681-22-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230919174931.1417681-1-u.kleine-koenig@pengutronix.de>
References: <20230919174931.1417681-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1911;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=2IJdHWO8PCUHXhN+Bf4BVhDD3vEc4XIIPPlau+wZ0uo=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlCd8Hn8QSiO65e7135FOiFXMptlEfZQTvMivAr
 YuJEVQ4s0GJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZQnfBwAKCRCPgPtYfRL+
 TqiDB/9446oEn288cKhe9v5Dbz86mSVC0C+6AyNrQLcz+DfPw2bGistuFJWBU6wJXFNJWUbz9TQ
 q0BsZS39uexqH/N7Sw5riQj2GSQOQ1Imy3AEh6yCSRN5BgSuEQ0C/LzSev1i0UacY/bADx36dPj
 qmpRGU6pOKLARKDi7acmJ7Sx6TnxOa8CfzP3xj2ceoCW6aJhfHNJ20Lg4wwlsszT4YYL7sqzkFh
 ZAILfjmL664WgKyhV36VdmM7ks1reg6zi63CkMswRTlGZsHXG2Z0bR1ncKm/eP22CvB4ppZjzxh
 XVLpjjKy7yY0ZW6JZNYlTv4H44MD2Uk0RE2lInVK6Y+GKIZ/
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: kernel@pengutronix.de, Lars-Peter Clausen <lars@metafoo.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-iio@vger.kernel.org,
 Tom Rix <trix@redhat.com>, Andy Shevchenko <andy.shevchenko@gmail.com>,
 Sean Nyekjaer <sean@geanix.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 21/49] iio: adc: stm32-adc: Convert to
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
cy9paW8vYWRjL3N0bTMyLWFkYy5jIHwgNiArKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9paW8vYWRjL3N0
bTMyLWFkYy5jIGIvZHJpdmVycy9paW8vYWRjL3N0bTMyLWFkYy5jCmluZGV4IGY3NjEzZWZiODcw
ZC4uMjVhOTEyODA1NDM5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2lpby9hZGMvc3RtMzItYWRjLmMK
KysrIGIvZHJpdmVycy9paW8vYWRjL3N0bTMyLWFkYy5jCkBAIC0yNTEzLDcgKzI1MTMsNyBAQCBz
dGF0aWMgaW50IHN0bTMyX2FkY19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQog
CXJldHVybiByZXQ7CiB9CiAKLXN0YXRpYyBpbnQgc3RtMzJfYWRjX3JlbW92ZShzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpwZGV2KQorc3RhdGljIHZvaWQgc3RtMzJfYWRjX3JlbW92ZShzdHJ1Y3Qg
cGxhdGZvcm1fZGV2aWNlICpwZGV2KQogewogCXN0cnVjdCBpaW9fZGV2ICppbmRpb19kZXYgPSBw
bGF0Zm9ybV9nZXRfZHJ2ZGF0YShwZGV2KTsKIAlzdHJ1Y3Qgc3RtMzJfYWRjICphZGMgPSBpaW9f
cHJpdihpbmRpb19kZXYpOwpAQCAtMjUzMiw4ICsyNTMyLDYgQEAgc3RhdGljIGludCBzdG0zMl9h
ZGNfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJCQkJICBhZGMtPnJ4X2J1
ZiwgYWRjLT5yeF9kbWFfYnVmKTsKIAkJZG1hX3JlbGVhc2VfY2hhbm5lbChhZGMtPmRtYV9jaGFu
KTsKIAl9Ci0KLQlyZXR1cm4gMDsKIH0KIAogc3RhdGljIGludCBzdG0zMl9hZGNfc3VzcGVuZChz
dHJ1Y3QgZGV2aWNlICpkZXYpCkBAIC0yNjU5LDcgKzI2NTcsNyBAQCBNT0RVTEVfREVWSUNFX1RB
QkxFKG9mLCBzdG0zMl9hZGNfb2ZfbWF0Y2gpOwogCiBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2Ry
aXZlciBzdG0zMl9hZGNfZHJpdmVyID0gewogCS5wcm9iZSA9IHN0bTMyX2FkY19wcm9iZSwKLQku
cmVtb3ZlID0gc3RtMzJfYWRjX3JlbW92ZSwKKwkucmVtb3ZlX25ldyA9IHN0bTMyX2FkY19yZW1v
dmUsCiAJLmRyaXZlciA9IHsKIAkJLm5hbWUgPSAic3RtMzItYWRjIiwKIAkJLm9mX21hdGNoX3Rh
YmxlID0gc3RtMzJfYWRjX29mX21hdGNoLAotLSAKMi40MC4xCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGlu
dXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
