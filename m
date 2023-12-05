Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0112080540F
	for <lists+linux-stm32@lfdr.de>; Tue,  5 Dec 2023 13:26:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A2748C6A61D;
	Tue,  5 Dec 2023 12:26:42 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2BB65C65E56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Dec 2023 12:26:41 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1rAUVY-0005Xu-76; Tue, 05 Dec 2023 13:26:36 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rAUVX-00Djux-Eg; Tue, 05 Dec 2023 13:26:35 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rAUVX-00EhQm-5Y; Tue, 05 Dec 2023 13:26:35 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Date: Tue,  5 Dec 2023 13:26:19 +0100
Message-ID: <2e96cf99c8d97b728d891a745e8f94ee39fbfee8.1701778038.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <cover.1701778038.git.u.kleine-koenig@pengutronix.de>
References: <cover.1701778038.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2049;
 i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id;
 bh=sYW+VRQlaUR4tM4vU6xMFTkIkYFDO3ZsrQVPaJ+GEJ4=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlbxbqWGuXtsy7gv6tNYQlb2xj7XMEobJPqduLF
 BBMwrfHmbqJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZW8W6gAKCRCPgPtYfRL+
 TgbCB/98owzxEUqbrEj9sMckpRxSmLplun0ZyYiCAYe6awaXUO86peyV+H+0CXO93EdHbFb4Ha1
 xR5aVqiHFvoflGPGMgYevzws9GXypUxbh9gddEc2dz8xIkjTjFUvIKL/GtY/xbEwdI812mdn2vK
 cwO2rD6nuyqSKMytiCXe1J1ms/54sERaxtP2fOqj35P8hbQoBW6LBF9iC4Q7bu7gWN8jzQUTFFb
 g5GpT/vMiC1D1cyVqLkr+nihchbcCW2SQ1C5Pa7VtvAxHVy1/T5Q7GsxR7SxccytJxtrxjMPlhE
 tA3urkm3LotZUnKzL2NsfSDubXKXyLeesFdivas8fQU+d4sc
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
Subject: [Linux-stm32] [PATCH 4/8] regulator: stm32-vrefbuf: Convert to
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
ZXJzL3JlZ3VsYXRvci9zdG0zMi12cmVmYnVmLmMgfCA2ICsrLS0tLQogMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3Jl
Z3VsYXRvci9zdG0zMi12cmVmYnVmLmMgYi9kcml2ZXJzL3JlZ3VsYXRvci9zdG0zMi12cmVmYnVm
LmMKaW5kZXggNzE3MTQ0Y2JlMGY5Li40MDg1NTEwNWRkMzMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
cmVndWxhdG9yL3N0bTMyLXZyZWZidWYuYworKysgYi9kcml2ZXJzL3JlZ3VsYXRvci9zdG0zMi12
cmVmYnVmLmMKQEAgLTIzMyw3ICsyMzMsNyBAQCBzdGF0aWMgaW50IHN0bTMyX3ZyZWZidWZfcHJv
YmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlyZXR1cm4gcmV0OwogfQogCi1zdGF0
aWMgaW50IHN0bTMyX3ZyZWZidWZfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYp
CitzdGF0aWMgdm9pZCBzdG0zMl92cmVmYnVmX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNl
ICpwZGV2KQogewogCXN0cnVjdCByZWd1bGF0b3JfZGV2ICpyZGV2ID0gcGxhdGZvcm1fZ2V0X2Ry
dmRhdGEocGRldik7CiAJc3RydWN0IHN0bTMyX3ZyZWZidWYgKnByaXYgPSByZGV2X2dldF9kcnZk
YXRhKHJkZXYpOwpAQCAtMjQ0LDggKzI0NCw2IEBAIHN0YXRpYyBpbnQgc3RtMzJfdnJlZmJ1Zl9y
ZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlwbV9ydW50aW1lX2Rpc2FibGUo
JnBkZXYtPmRldik7CiAJcG1fcnVudGltZV9zZXRfc3VzcGVuZGVkKCZwZGV2LT5kZXYpOwogCXBt
X3J1bnRpbWVfcHV0X25vaWRsZSgmcGRldi0+ZGV2KTsKLQotCXJldHVybiAwOwogfTsKIAogc3Rh
dGljIGludCBfX21heWJlX3VudXNlZCBzdG0zMl92cmVmYnVmX3J1bnRpbWVfc3VzcGVuZChzdHJ1
Y3QgZGV2aWNlICpkZXYpCkBAIC0yODIsNyArMjgwLDcgQEAgTU9EVUxFX0RFVklDRV9UQUJMRShv
Ziwgc3RtMzJfdnJlZmJ1Zl9vZl9tYXRjaCk7CiAKIHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJp
dmVyIHN0bTMyX3ZyZWZidWZfZHJpdmVyID0gewogCS5wcm9iZSA9IHN0bTMyX3ZyZWZidWZfcHJv
YmUsCi0JLnJlbW92ZSA9IHN0bTMyX3ZyZWZidWZfcmVtb3ZlLAorCS5yZW1vdmVfbmV3ID0gc3Rt
MzJfdnJlZmJ1Zl9yZW1vdmUsCiAJLmRyaXZlciA9IHsKIAkJLm5hbWUgID0gInN0bTMyLXZyZWZi
dWYiLAogCQkucHJvYmVfdHlwZSA9IFBST0JFX1BSRUZFUl9BU1lOQ0hST05PVVMsCi0tIAoyLjQy
LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXN0bTMyCg==
