Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE4C861218
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Feb 2024 13:59:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 05A4FC6B47A;
	Fri, 23 Feb 2024 12:59:34 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 87D3CC6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Feb 2024 12:59:32 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1rdV9D-0005WK-4S; Fri, 23 Feb 2024 13:59:27 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rdV9C-002QaT-6U; Fri, 23 Feb 2024 13:59:26 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <ukl@pengutronix.de>) id 1rdV9C-00AKBw-0M;
 Fri, 23 Feb 2024 13:59:26 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Date: Fri, 23 Feb 2024 13:59:07 +0100
Message-ID: <7e85adb3c2f11fc10e5a18bb341c5af8b35c4d88.1708692946.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1708692946.git.u.kleine-koenig@pengutronix.de>
References: <cover.1708692946.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2028;
 i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id;
 bh=cGnrBxqGxCmEtDuWxONLei27GY0x+yDrPiamFnG8NHg=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBl2JahwqaMRF1CPxbj1EwCu77uTj4TmU1PEFAv0
 XDuPOLeA6mJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZdiWoQAKCRCPgPtYfRL+
 TvIEB/wO/V5+nBYCIwEezMcTGrxF/tGJ/B8e/Tpc+wD+9fdC08TczkaX3SjLpKbKXnUBz1gFtSF
 eSgmgjBxElnAHO8nk9zwJ36R+tTm3zouqkIPCJ9x5oOVZFTqHXWl2hkqZJ/eOBSLZ7O76LQdicn
 7pJXhibFTOEsnBgJhYP5225xLWw99rc0uxtq2RV7ycJ3KqlbbSoxbuc06Dxy2yg8YJkJuYvWLat
 8mB8DZ6OHnK2nY3DBQUgnPfNu6zdBlWqRGTgTSMKPzOh91wSSNgxttjlXhPA0TJwf+IAyrs5tTO
 4yAdjF6oXbhvr8pgTbOMcOXlVabbFgqgVOkVUJ0h6ebidEfK
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: kernel@pengutronix.de, Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH 4/5] media: stm32-dcmipp: Convert to platform
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
ZXJzL21lZGlhL3BsYXRmb3JtL3N0L3N0bTMyL3N0bTMyLWRjbWlwcC9kY21pcHAtY29yZS5jIHwg
NiArKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9zdC9zdG0zMi9zdG0zMi1kY21p
cHAvZGNtaXBwLWNvcmUuYyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vc3Qvc3RtMzIvc3RtMzIt
ZGNtaXBwL2RjbWlwcC1jb3JlLmMKaW5kZXggMzJjNjYxOWJlOWEyLi5iY2U4MjFlYjcxY2UgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vc3Qvc3RtMzIvc3RtMzItZGNtaXBwL2Rj
bWlwcC1jb3JlLmMKKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9zdC9zdG0zMi9zdG0zMi1k
Y21pcHAvZGNtaXBwLWNvcmUuYwpAQCAtNTE3LDcgKzUxNyw3IEBAIHN0YXRpYyBpbnQgZGNtaXBw
X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJcmV0dXJuIDA7CiB9CiAKLXN0
YXRpYyBpbnQgZGNtaXBwX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQorc3Rh
dGljIHZvaWQgZGNtaXBwX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogewog
CXN0cnVjdCBkY21pcHBfZGV2aWNlICpkY21pcHAgPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShwZGV2
KTsKIAl1bnNpZ25lZCBpbnQgaTsKQEAgLTUzNCw4ICs1MzQsNiBAQCBzdGF0aWMgaW50IGRjbWlw
cF9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAltZWRpYV9kZXZpY2VfY2xl
YW51cCgmZGNtaXBwLT5tZGV2KTsKIAogCXY0bDJfZGV2aWNlX3VucmVnaXN0ZXIoJmRjbWlwcC0+
djRsMl9kZXYpOwotCi0JcmV0dXJuIDA7CiB9CiAKIHN0YXRpYyBpbnQgZGNtaXBwX3J1bnRpbWVf
c3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYpCkBAIC01ODgsNyArNTg2LDcgQEAgc3RhdGljIGNv
bnN0IHN0cnVjdCBkZXZfcG1fb3BzIGRjbWlwcF9wbV9vcHMgPSB7CiAKIHN0YXRpYyBzdHJ1Y3Qg
cGxhdGZvcm1fZHJpdmVyIGRjbWlwcF9wZHJ2ID0gewogCS5wcm9iZQkJPSBkY21pcHBfcHJvYmUs
Ci0JLnJlbW92ZQkJPSBkY21pcHBfcmVtb3ZlLAorCS5yZW1vdmVfbmV3CT0gZGNtaXBwX3JlbW92
ZSwKIAkuZHJpdmVyCQk9IHsKIAkJLm5hbWUJPSBEQ01JUFBfUERFVl9OQU1FLAogCQkub2ZfbWF0
Y2hfdGFibGUgPSBkY21pcHBfb2ZfbWF0Y2gsCi0tIAoyLjQzLjAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApM
aW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
