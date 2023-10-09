Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BF57BD6A5
	for <lists+linux-stm32@lfdr.de>; Mon,  9 Oct 2023 11:22:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 320D5C6C83E;
	Mon,  9 Oct 2023 09:22:39 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5B6B9C6B44B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Oct 2023 09:22:38 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qpmTF-0006uH-DO; Mon, 09 Oct 2023 11:22:37 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qpmTF-000NX9-0B; Mon, 09 Oct 2023 11:22:37 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qpmTE-00C4pb-NE; Mon, 09 Oct 2023 11:22:36 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Linus Walleij <linus.walleij@linaro.org>
Date: Mon,  9 Oct 2023 10:38:49 +0200
Message-Id: <20231009083856.222030-14-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231009083856.222030-1-u.kleine-koenig@pengutronix.de>
References: <20231009083856.222030-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1870;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=PgpMnVQndSD56U26Qe9f+HDWSOr4u9++3LxM4ikfokI=;
 b=owGbwMvMwMXY3/A7olbonx/jabUkhlTlPXxTYpbahPY0vU5SKpNnd1LLWngypTvykl6VQwL3b
 92rOS87GY1ZGBi5GGTFFFnsG9dkWlXJRXau/XcZZhArE8gUBi5OAZgI71T2/0mqOXml5U71y83+
 5QtO/ybMIN1Q/Kpu5roQhzqhieruz96ncFc1unAsXL7/9ZeuytoWT9YvaomGezbrXRT6GFx2SzK
 obD/Pu6MeE1gLZtddeOywgHm6cXzLnb7939X3c9SFmK8u+2y4dNI8rq9326eoLDs553hjocupl2
 wOjZueGDy4rr01LSjIoFf1uYzRLcFplSeYInlNag5XeAULK37gnn7gtu+D8oBEo/sq3YdXXP5f8
 CG9M6bqq17Km+wl3j36FV5nDjT/LuuyMnfaxP7qtt8jkRdy59P23uadXGjZ0GAv/KCq+j77Amfz
 tv5OgYNz1+fss0pU19aLbv3yod8ibzbHf16OQDVTkb0A
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 13/20] pinctrl: stmfx: Convert to platform
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
ZXJzL3BpbmN0cmwvcGluY3RybC1zdG1meC5jIHwgNiArKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9waW5j
dHJsL3BpbmN0cmwtc3RtZnguYyBiL2RyaXZlcnMvcGluY3RybC9waW5jdHJsLXN0bWZ4LmMKaW5k
ZXggZDdhYjgyNDMyYTUyLi42MzEzYmUzNzBlYjcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcGluY3Ry
bC9waW5jdHJsLXN0bWZ4LmMKKysrIGIvZHJpdmVycy9waW5jdHJsL3BpbmN0cmwtc3RtZnguYwpA
QCAtNzM0LDcgKzczNCw3IEBAIHN0YXRpYyBpbnQgc3RtZnhfcGluY3RybF9wcm9iZShzdHJ1Y3Qg
cGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCXJldHVybiAwOwogfQogCi1zdGF0aWMgaW50IHN0bWZ4
X3BpbmN0cmxfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCitzdGF0aWMgdm9p
ZCBzdG1meF9waW5jdHJsX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogewog
CXN0cnVjdCBzdG1meCAqc3RtZnggPSBkZXZfZ2V0X2RydmRhdGEocGRldi0+ZGV2LnBhcmVudCk7
CiAJaW50IHJldDsKQEAgLTc0Niw4ICs3NDYsNiBAQCBzdGF0aWMgaW50IHN0bWZ4X3BpbmN0cmxf
cmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJaWYgKHJldCkKIAkJZGV2X2Vy
cigmcGRldi0+ZGV2LCAiRmFpbGVkIHRvIGRpc2FibGUgcGlucyAoJXBlKVxuIiwKIAkJCUVSUl9Q
VFIocmV0KSk7Ci0KLQlyZXR1cm4gMDsKIH0KIAogI2lmZGVmIENPTkZJR19QTV9TTEVFUApAQCAt
ODU2LDcgKzg1NCw3IEBAIHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIHN0bWZ4X3BpbmN0
cmxfZHJpdmVyID0gewogCQkucG0gPSAmc3RtZnhfcGluY3RybF9kZXZfcG1fb3BzLAogCX0sCiAJ
LnByb2JlID0gc3RtZnhfcGluY3RybF9wcm9iZSwKLQkucmVtb3ZlID0gc3RtZnhfcGluY3RybF9y
ZW1vdmUsCisJLnJlbW92ZV9uZXcgPSBzdG1meF9waW5jdHJsX3JlbW92ZSwKIH07CiBtb2R1bGVf
cGxhdGZvcm1fZHJpdmVyKHN0bWZ4X3BpbmN0cmxfZHJpdmVyKTsKIAotLSAKMi40MC4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBt
YWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRw
czovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1z
dG0zMgo=
