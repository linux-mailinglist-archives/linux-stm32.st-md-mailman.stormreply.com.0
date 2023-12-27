Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BE21081F211
	for <lists+linux-stm32@lfdr.de>; Wed, 27 Dec 2023 22:03:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 56DFDC6B47E;
	Wed, 27 Dec 2023 21:03:03 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D253FC6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Dec 2023 21:03:01 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1rIb3L-0000sW-8N; Wed, 27 Dec 2023 22:02:59 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rIb3J-001wFF-OL; Wed, 27 Dec 2023 22:02:58 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <ukl@pengutronix.de>) id 1rIb3K-001ZVo-2S;
 Wed, 27 Dec 2023 22:02:58 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jassi Brar <jassisinghbrar@gmail.com>
Date: Wed, 27 Dec 2023 22:02:37 +0100
Message-ID: <3189b81c29e185e76e87a150051e5e73047b76ea.1703710628.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1703710628.git.u.kleine-koenig@pengutronix.de>
References: <cover.1703710628.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1799;
 i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id;
 bh=3bDUjGjP7wzxKyoJxgukH0hU9Cj6FBrYyYL2xQFaSUY=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBljJDvHB8PRK2f+cN/dTeaPhGdhFq1chpZPlaNJ
 Nus1qGLwfuJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZYyQ7wAKCRCPgPtYfRL+
 TnzaCACaIsH1woq68S42H2f/RVHXYiWQHTDmhEhk9nRfPyPMnH/LTY8QR4960J3vS3E4YlzpXD4
 e8Fb9Pdn1otwdBaCiCKQ+jFxD5fN3gs8DxO1augzsYhBFFAbiOSlc9dTXbVwVSuISPIxv2eoz5S
 NBKQsfEydrR5UQymLJYcXo8qJSBg9XGyLpacTXFoTAx1ip1ShhIXCruPrt6bD3uWj3E7NQW8Fre
 oqDT36vI+j2waULDBWz24J47yHOTscUVw6D5s07bXWglA8P7CAsV/OSDSI94I0AVfnQLBr0rkzi
 /l1jNsQFzbe93BCZEb8sEpXrBKcYUp6KjT19THwhl5UaysP0
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 09/12] mailbox: stm32-ipcc: Convert to
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
CgpUbyBpbXByb3ZlIGhlcmUgdGhlcmUgaXMgYSBxdWVzdCB0byBtYWtlIHRoZSByZW1vdmUgY2Fs
bGJhY2sgcmV0dXJuCnZvaWQuIEluIHRoZSBmaXJzdCBzdGVwIG9mIHRoaXMgcXVlc3QgYWxsIGRy
aXZlcnMgYXJlIGNvbnZlcnRlZCB0bwoucmVtb3ZlX25ldygpLCB3aGljaCBhbHJlYWR5IHJldHVy
bnMgdm9pZC4gRXZlbnR1YWxseSBhZnRlciBhbGwgZHJpdmVycwphcmUgY29udmVydGVkLCAucmVt
b3ZlX25ldygpIHdpbGwgYmUgcmVuYW1lZCB0byAucmVtb3ZlKCkuCgpUcml2aWFsbHkgY29udmVy
dCB0aGlzIGRyaXZlciBmcm9tIGFsd2F5cyByZXR1cm5pbmcgemVybyBpbiB0aGUgcmVtb3ZlCmNh
bGxiYWNrIHRvIHRoZSB2b2lkIHJldHVybmluZyB2YXJpYW50LgoKU2lnbmVkLW9mZi1ieTogVXdl
IEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KLS0tCiBkcml2
ZXJzL21haWxib3gvc3RtMzItaXBjYy5jIHwgNiArKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tYWlsYm94
L3N0bTMyLWlwY2MuYyBiL2RyaXZlcnMvbWFpbGJveC9zdG0zMi1pcGNjLmMKaW5kZXggNGFkMzY1
M2YzODY2Li4xNDQyZjI3NTc4MmIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbWFpbGJveC9zdG0zMi1p
cGNjLmMKKysrIGIvZHJpdmVycy9tYWlsYm94L3N0bTMyLWlwY2MuYwpAQCAtMzMxLDcgKzMzMSw3
IEBAIHN0YXRpYyBpbnQgc3RtMzJfaXBjY19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpw
ZGV2KQogCXJldHVybiByZXQ7CiB9CiAKLXN0YXRpYyBpbnQgc3RtMzJfaXBjY19yZW1vdmUoc3Ry
dWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKK3N0YXRpYyB2b2lkIHN0bTMyX2lwY2NfcmVtb3Zl
KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiB7CiAJc3RydWN0IGRldmljZSAqZGV2ID0g
JnBkZXYtPmRldjsKIApAQCAtMzM5LDggKzMzOSw2IEBAIHN0YXRpYyBpbnQgc3RtMzJfaXBjY19y
ZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAkJZGV2X3BtX2NsZWFyX3dha2Vf
aXJxKCZwZGV2LT5kZXYpOwogCiAJZGV2aWNlX3NldF93YWtldXBfY2FwYWJsZShkZXYsIGZhbHNl
KTsKLQotCXJldHVybiAwOwogfQogCiAjaWZkZWYgQ09ORklHX1BNX1NMRUVQCkBAIC0zODEsNyAr
Mzc5LDcgQEAgc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgc3RtMzJfaXBjY19kcml2ZXIg
PSB7CiAJCS5vZl9tYXRjaF90YWJsZSA9IHN0bTMyX2lwY2Nfb2ZfbWF0Y2gsCiAJfSwKIAkucHJv
YmUJCT0gc3RtMzJfaXBjY19wcm9iZSwKLQkucmVtb3ZlCQk9IHN0bTMyX2lwY2NfcmVtb3ZlLAor
CS5yZW1vdmVfbmV3CT0gc3RtMzJfaXBjY19yZW1vdmUsCiB9OwogCiBtb2R1bGVfcGxhdGZvcm1f
ZHJpdmVyKHN0bTMyX2lwY2NfZHJpdmVyKTsKLS0gCjIuNDMuMAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0Ckxp
bnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
