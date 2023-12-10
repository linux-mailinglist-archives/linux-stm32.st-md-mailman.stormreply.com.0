Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C4380BD8D
	for <lists+linux-stm32@lfdr.de>; Sun, 10 Dec 2023 23:12:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A1DD6C6B46B;
	Sun, 10 Dec 2023 22:12:56 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4C5A0C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 10 Dec 2023 22:12:55 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1rCS2a-0006P0-BC; Sun, 10 Dec 2023 23:12:48 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rCS2U-00ExYI-U3; Sun, 10 Dec 2023 23:12:42 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rCS2U-000RWY-Ks; Sun, 10 Dec 2023 23:12:42 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Olivia Mackall <olivia@selenic.com>,
 Herbert Xu <herbert@gondor.apana.org.au>
Date: Sun, 10 Dec 2023 23:12:25 +0100
Message-ID: <855e8e89de0c0e2a82e181b883275754f8c16a38.1702245873.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <cover.1702245873.git.u.kleine-koenig@pengutronix.de>
References: <cover.1702245873.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1686;
 i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id;
 bh=tJ2yKb21/v8dgfuhgALzaxDexLMP8sgVYPpXDzQrTKs=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBldjfKeIvGJORSVKGHwwwyFKf7y9MUJlfleH1Jl
 DiYf7f3Vr+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZXY3ygAKCRCPgPtYfRL+
 TtbwCACuhFqANg8WSx60uhQJSpr0JdPEteh6pcmqE2mfzI4AetRrLIKWj1F8o/MM6mj3cU8M+4S
 hcitsrZA76q3cL4RTQFzPX8JkrSwm4OjxGDEQFOrAa/l69INUglpYKYPEFBrrLks8D/HDJ2Ift7
 rKB3lNgzJ7lTJe+SpojQGsoe5gLsxivIIcc4XsVJ0iuoDVp57EN5iyVZoA+mGSTvkQwi44SaX8Q
 VUbOiHSuksPBkyd8R06N588Wo369O08Ff6WCrv/QbArB+eI+pjwBKaW7YNTIA9cVbfxX+/qKx+z
 99S4hJ0pj3y0TEfK3h400SL6iP3K9C10AE+L30YTDOrqLhro
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Rob Herring <robh@kernel.org>, kernel@pengutronix.de,
 linux-crypto@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 10/12] hwrng: stm32 - Convert to platform
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
ZXJzL2NoYXIvaHdfcmFuZG9tL3N0bTMyLXJuZy5jIHwgNiArKy0tLS0KIDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9j
aGFyL2h3X3JhbmRvbS9zdG0zMi1ybmcuYyBiL2RyaXZlcnMvY2hhci9od19yYW5kb20vc3RtMzIt
cm5nLmMKaW5kZXggNDFlMWRiZWE1ZDJlLi45OGM5MmI5MTRjZmQgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvY2hhci9od19yYW5kb20vc3RtMzItcm5nLmMKKysrIGIvZHJpdmVycy9jaGFyL2h3X3JhbmRv
bS9zdG0zMi1ybmcuYwpAQCAtMzYyLDExICszNjIsOSBAQCBzdGF0aWMgaW50IHN0bTMyX3JuZ19p
bml0KHN0cnVjdCBod3JuZyAqcm5nKQogCXJldHVybiAwOwogfQogCi1zdGF0aWMgaW50IHN0bTMy
X3JuZ19yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqb2ZkZXYpCitzdGF0aWMgdm9pZCBz
dG0zMl9ybmdfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKm9mZGV2KQogewogCXBtX3J1
bnRpbWVfZGlzYWJsZSgmb2ZkZXYtPmRldik7Ci0KLQlyZXR1cm4gMDsKIH0KIAogc3RhdGljIGlu
dCBfX21heWJlX3VudXNlZCBzdG0zMl9ybmdfcnVudGltZV9zdXNwZW5kKHN0cnVjdCBkZXZpY2Ug
KmRldikKQEAgLTU1Nyw3ICs1NTUsNyBAQCBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBz
dG0zMl9ybmdfZHJpdmVyID0gewogCQkub2ZfbWF0Y2hfdGFibGUgPSBzdG0zMl9ybmdfbWF0Y2gs
CiAJfSwKIAkucHJvYmUgPSBzdG0zMl9ybmdfcHJvYmUsCi0JLnJlbW92ZSA9IHN0bTMyX3JuZ19y
ZW1vdmUsCisJLnJlbW92ZV9uZXcgPSBzdG0zMl9ybmdfcmVtb3ZlLAogfTsKIAogbW9kdWxlX3Bs
YXRmb3JtX2RyaXZlcihzdG0zMl9ybmdfZHJpdmVyKTsKLS0gCjIuNDIuMAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBs
aXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
