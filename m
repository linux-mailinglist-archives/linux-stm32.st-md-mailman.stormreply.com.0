Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C67F081CFE7
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Dec 2023 23:51:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6BDD0C6B477;
	Fri, 22 Dec 2023 22:51:24 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1CEBBC6B457
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Dec 2023 22:51:23 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1rGoMN-0005ie-Ah; Fri, 22 Dec 2023 23:51:15 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rGoML-000qvb-K2; Fri, 22 Dec 2023 23:51:14 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <ukl@pengutronix.de>) id 1rGoMM-000Ffm-21;
 Fri, 22 Dec 2023 23:51:14 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thomas Gleixner <tglx@linutronix.de>
Date: Fri, 22 Dec 2023 23:50:43 +0100
Message-ID: <ac551b89025bafadce05102b94596f8cd3564a32.1703284359.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <cover.1703284359.git.u.kleine-koenig@pengutronix.de>
References: <cover.1703284359.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1709;
 i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id;
 bh=7EUZkiwcSMvqh8+WiN8ti4/qLswt+nYfqNb7cjNoDwE=;
 b=owGbwMvMwMXY3/A7olbonx/jabUkhtQ2oSMTEhY9Zs929nbyD5xYoyjS+nYDj6jyi+el7leDn
 jmqlSzpZDRmYWDkYpAVU2Sxb1yTaVUlF9m59t9lmEGsTCBTGLg4BWAimw+x/3cIPnHvtvdmj4Ty
 9ga120sKuFJanNI+Mpj72VXN6xZasHSLG+exki/JRu4BTzLFQxaf/n9Ia46uV3bt0S1yjLu/8Oo
 o67l8kHmUmCLvddSq+vfMPI6WCe8WZaotS5iiWytTeHbz+eQ0xrri5ZmFpxNF5kb8Zw0Sl9ytOi
 P61k7pGdeX6Uk++b5Wtt0urV9U8fn/l3O/BcfYrzQxWGjy5ckNNrEUc9Hv3lPXZp/jEBcx2G77u
 drG+t0defaoNfJ7d69dHquZ6bTg+OQAnwR+r0258158KVO97Hdsn2K0dSIDT+wPPuaM09J6+hF2
 W11XSv7IOJe49VXOp8Y1LGVMARYJ0wtP/E0w/caizP0QAA==
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
Subject: [Linux-stm32] [PATCH 12/13] irqchip/stm32-exti: Convert to platform
	remove callback returning void
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
ZXJzL2lycWNoaXAvaXJxLXN0bTMyLWV4dGkuYyB8IDUgKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9pcnFj
aGlwL2lycS1zdG0zMi1leHRpLmMgYi9kcml2ZXJzL2lycWNoaXAvaXJxLXN0bTMyLWV4dGkuYwpp
bmRleCA5NzEyNDBlMmUzMWIuLmM2MWE5N2NhYWZjOSAxMDA2NDQKLS0tIGEvZHJpdmVycy9pcnFj
aGlwL2lycS1zdG0zMi1leHRpLmMKKysrIGIvZHJpdmVycy9pcnFjaGlwL2lycS1zdG0zMi1leHRp
LmMKQEAgLTg5OCwxMCArODk4LDkgQEAgc3RhdGljIHZvaWQgc3RtMzJfZXh0aV9yZW1vdmVfaXJx
KHZvaWQgKmRhdGEpCiAJaXJxX2RvbWFpbl9yZW1vdmUoZG9tYWluKTsKIH0KIAotc3RhdGljIGlu
dCBzdG0zMl9leHRpX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQorc3RhdGlj
IHZvaWQgc3RtMzJfZXh0aV9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIHsK
IAlzdG0zMl9leHRpX2hfc3lzY29yZV9kZWluaXQoKTsKLQlyZXR1cm4gMDsKIH0KIAogc3RhdGlj
IGludCBzdG0zMl9leHRpX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCkBAIC05
OTEsNyArOTkwLDcgQEAgTU9EVUxFX0RFVklDRV9UQUJMRShvZiwgc3RtMzJfZXh0aV9pZHMpOwog
CiBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBzdG0zMl9leHRpX2RyaXZlciA9IHsKIAku
cHJvYmUJCT0gc3RtMzJfZXh0aV9wcm9iZSwKLQkucmVtb3ZlCQk9IHN0bTMyX2V4dGlfcmVtb3Zl
LAorCS5yZW1vdmVfbmV3CT0gc3RtMzJfZXh0aV9yZW1vdmUsCiAJLmRyaXZlcgkJPSB7CiAJCS5u
YW1lCT0gInN0bTMyX2V4dGkiLAogCQkub2ZfbWF0Y2hfdGFibGUgPSBzdG0zMl9leHRpX2lkcywK
LS0gCjIuNDIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4v
bGlzdGluZm8vbGludXgtc3RtMzIK
