Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 942E1815FB7
	for <lists+linux-stm32@lfdr.de>; Sun, 17 Dec 2023 15:30:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 32D2DC6DD6E;
	Sun, 17 Dec 2023 14:30:12 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F1E4DC6B45E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 17 Dec 2023 14:30:10 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1rEs9f-0006XQ-MC; Sun, 17 Dec 2023 15:30:07 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rEs9e-00GUhg-AA; Sun, 17 Dec 2023 15:30:06 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rEs9e-004hzc-0q; Sun, 17 Dec 2023 15:30:06 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 17 Dec 2023 15:29:37 +0100
Message-ID: <fa74d4ae3cbf337dcae66db8479125fec8078153.1702822744.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <cover.1702822744.git.u.kleine-koenig@pengutronix.de>
References: <cover.1702822744.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1981;
 i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id;
 bh=vnXMNpPc4CNH6yHCGy/VEkrbe/7SkdFU6zjQKAFNmw4=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlfwXRzgYeIa1M6T02trXcwbebDDAXRteH/aASJ
 EIeTmDpO4CJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZX8F0QAKCRCPgPtYfRL+
 Tlm4B/9oZRXDNti3I91lE3SnU/Anh5vxwqoEOcMKmojlJ6DMKjre9S0FWbf7LQ6tIOgJChGdJfI
 5DJb4OZKt42SL/tFDSzqh/EIvKdDcV6WF4wuBJzQFCqTE7aRfQOmeuQZPVa1gyZwV44OR23niIj
 4I10JoIIcuAKjKIWXa8Z4H/lV/048Q8W1IMiMvPG9bGFpkim7ypa/edmlbt5Nt49YU7qZB2+1/b
 GOxAwmrXq8yWvc3cKNRiNHA3xmgZtva1Q5qt8yg7E+rUC1yhzKYW5MJBy4UAipDxk5R9ZZv5k5s
 HJuw65+ON7MO74lTZicb9ZGvxEyXS8f+od6/Urr+eAKk7vEd
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: kernel@pengutronix.de, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 11/15] memory: stm32-fmc2-ebi: Convert to
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
ZXJzL21lbW9yeS9zdG0zMi1mbWMyLWViaS5jIHwgNiArKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZW1v
cnkvc3RtMzItZm1jMi1lYmkuYyBiL2RyaXZlcnMvbWVtb3J5L3N0bTMyLWZtYzItZWJpLmMKaW5k
ZXggOTAxNWU4Mjc3ZGM4Li40N2QwZWE1ZjE2MTYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbWVtb3J5
L3N0bTMyLWZtYzItZWJpLmMKKysrIGIvZHJpdmVycy9tZW1vcnkvc3RtMzItZm1jMi1lYmkuYwpA
QCAtMTE0Niw3ICsxMTQ2LDcgQEAgc3RhdGljIGludCBzdG0zMl9mbWMyX2ViaV9wcm9iZShzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCXJldHVybiByZXQ7CiB9CiAKLXN0YXRpYyBpbnQg
c3RtMzJfZm1jMl9lYmlfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCitzdGF0
aWMgdm9pZCBzdG0zMl9mbWMyX2ViaV9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRl
dikKIHsKIAlzdHJ1Y3Qgc3RtMzJfZm1jMl9lYmkgKmViaSA9IHBsYXRmb3JtX2dldF9kcnZkYXRh
KHBkZXYpOwogCkBAIC0xMTU0LDggKzExNTQsNiBAQCBzdGF0aWMgaW50IHN0bTMyX2ZtYzJfZWJp
X3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCXN0bTMyX2ZtYzJfZWJpX2Rp
c2FibGVfYmFua3MoZWJpKTsKIAlzdG0zMl9mbWMyX2ViaV9kaXNhYmxlKGViaSk7CiAJY2xrX2Rp
c2FibGVfdW5wcmVwYXJlKGViaS0+Y2xrKTsKLQotCXJldHVybiAwOwogfQogCiBzdGF0aWMgaW50
IF9fbWF5YmVfdW51c2VkIHN0bTMyX2ZtYzJfZWJpX3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2
KQpAQCAtMTE5Nyw3ICsxMTk1LDcgQEAgTU9EVUxFX0RFVklDRV9UQUJMRShvZiwgc3RtMzJfZm1j
Ml9lYmlfbWF0Y2gpOwogCiBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBzdG0zMl9mbWMy
X2ViaV9kcml2ZXIgPSB7CiAJLnByb2JlCT0gc3RtMzJfZm1jMl9lYmlfcHJvYmUsCi0JLnJlbW92
ZQk9IHN0bTMyX2ZtYzJfZWJpX3JlbW92ZSwKKwkucmVtb3ZlX25ldyA9IHN0bTMyX2ZtYzJfZWJp
X3JlbW92ZSwKIAkuZHJpdmVyCT0gewogCQkubmFtZSA9ICJzdG0zMl9mbWMyX2ViaSIsCiAJCS5v
Zl9tYXRjaF90YWJsZSA9IHN0bTMyX2ZtYzJfZWJpX21hdGNoLAotLSAKMi40Mi4wCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWls
aW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczov
L3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0z
Mgo=
