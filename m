Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FBBB7E2ACD
	for <lists+linux-stm32@lfdr.de>; Mon,  6 Nov 2023 18:17:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F413FC6B460;
	Mon,  6 Nov 2023 17:17:56 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B29DCC6A61A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Nov 2023 17:17:55 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1r03EV-0005au-7B; Mon, 06 Nov 2023 18:17:51 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1r03EU-0075z9-AJ; Mon, 06 Nov 2023 18:17:50 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1r03EU-00DrJf-0y; Mon, 06 Nov 2023 18:17:50 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Lee Jones <lee@kernel.org>
Date: Mon,  6 Nov 2023 18:17:24 +0100
Message-ID: <20231106171708.3892347-16-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0.586.gbc5204569f7d.dirty
In-Reply-To: <20231106171708.3892347-1-u.kleine-koenig@pengutronix.de>
References: <20231106171708.3892347-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1913;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=jVkK8Ke5hsybq+hJya3Qt2KaRP0LWkU08638E+yF+OA=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlSR+mWnS+kDacKKlH4v2Liesd5r6OzwvKBRTf0
 42Nudp3EaOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZUkfpgAKCRCPgPtYfRL+
 Th4jCAChOnRByVuDoEEgRtaZ29TE4Wyd0c8x3Im/5GBUKAIQ6n5P2tWhAKBAbGN1hSisGBWGpSj
 OH4X2zfWLdJmyI3/emIZsuKOPr/GWj0XchRPJcEXyzLwkDX1ycZcHW9x8kbo96llWzEIwj/jNTf
 9dNl0tD5lkD1QFA43/9XFjutwadfXB3uL7LbQ10QcGg32fGNxQTn/xSPehNpBlahbqNfJpyUGGN
 2eBJaY3AXqtrimgG3lZlJTxq0aa8uMG2kqlKnNUooWmrdLG1G4MCdam4HoZ5CJu5LIlHKs7ukL3
 AeIhRKQvvT5W5Jbaj06qCZSkpeiqMpFJkbxTaejZcq44NTok
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, kernel@pengutronix.de,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 15/18] mfd: stm32-timers: Convert to platform
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
ZXJzL21mZC9zdG0zMi10aW1lcnMuYyB8IDYgKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWZkL3N0bTMy
LXRpbWVycy5jIGIvZHJpdmVycy9tZmQvc3RtMzItdGltZXJzLmMKaW5kZXggYTY1NmExYzE4NmE4
Li45ZmQxM2Q4ODk1MGMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbWZkL3N0bTMyLXRpbWVycy5jCisr
KyBiL2RyaXZlcnMvbWZkL3N0bTMyLXRpbWVycy5jCkBAIC0zMDYsNyArMzA2LDcgQEAgc3RhdGlj
IGludCBzdG0zMl90aW1lcnNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAly
ZXR1cm4gcmV0OwogfQogCi1zdGF0aWMgaW50IHN0bTMyX3RpbWVyc19yZW1vdmUoc3RydWN0IHBs
YXRmb3JtX2RldmljZSAqcGRldikKK3N0YXRpYyB2b2lkIHN0bTMyX3RpbWVyc19yZW1vdmUoc3Ry
dWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIHsKIAlzdHJ1Y3Qgc3RtMzJfdGltZXJzICpkZGF0
YSA9IHBsYXRmb3JtX2dldF9kcnZkYXRhKHBkZXYpOwogCkBAIC0zMTYsOCArMzE2LDYgQEAgc3Rh
dGljIGludCBzdG0zMl90aW1lcnNfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYp
CiAJICovCiAJb2ZfcGxhdGZvcm1fZGVwb3B1bGF0ZSgmcGRldi0+ZGV2KTsKIAlzdG0zMl90aW1l
cnNfZG1hX3JlbW92ZSgmcGRldi0+ZGV2LCBkZGF0YSk7Ci0KLQlyZXR1cm4gMDsKIH0KIAogc3Rh
dGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgc3RtMzJfdGltZXJzX29mX21hdGNoW10gPSB7
CkBAIC0zMjgsNyArMzI2LDcgQEAgTU9EVUxFX0RFVklDRV9UQUJMRShvZiwgc3RtMzJfdGltZXJz
X29mX21hdGNoKTsKIAogc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgc3RtMzJfdGltZXJz
X2RyaXZlciA9IHsKIAkucHJvYmUgPSBzdG0zMl90aW1lcnNfcHJvYmUsCi0JLnJlbW92ZSA9IHN0
bTMyX3RpbWVyc19yZW1vdmUsCisJLnJlbW92ZV9uZXcgPSBzdG0zMl90aW1lcnNfcmVtb3ZlLAog
CS5kcml2ZXIJPSB7CiAJCS5uYW1lID0gInN0bTMyLXRpbWVycyIsCiAJCS5vZl9tYXRjaF90YWJs
ZSA9IHN0bTMyX3RpbWVyc19vZl9tYXRjaCwKLS0gCjIuNDIuMAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0Ckxp
bnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
