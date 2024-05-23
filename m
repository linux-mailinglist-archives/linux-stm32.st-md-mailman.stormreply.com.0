Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F3D8CD065
	for <lists+linux-stm32@lfdr.de>; Thu, 23 May 2024 12:33:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 216BFC6C838;
	Thu, 23 May 2024 10:33:45 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B505DC6C820
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 May 2024 10:33:37 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1sA5lK-0007kH-Ly; Thu, 23 May 2024 12:33:30 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1sA5lI-002eDf-Q5; Thu, 23 May 2024 12:33:28 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <ukl@pengutronix.de>) id 1sA5lI-00AfcR-2K;
 Thu, 23 May 2024 12:33:28 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Alain Volmat <alain.volmat@foss.st.com>, Mark Brown <broonie@kernel.org>,
 Ben Wolsieffer <ben.wolsieffer@hefring.com>
Date: Thu, 23 May 2024 12:33:25 +0200
Message-ID: <20240523103326.792907-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3022;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=6tuNnoLkJ2tXDCxIpUaYwWLi21/Zzu/baG1ufTacAHE=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBmTxt2iwSlG4f6TMyHvH9Enp+HExKclnaGmgUv5
 sT2/d4d1iaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZk8bdgAKCRCPgPtYfRL+
 TrlmB/4gV8s2Y7NT/84tO/LJQeNFA/eP0C2EtjPHZS1/32AOwgO6TFQcrzJcpZh45yk0wPYPMHb
 aFTODdWZv8lTX3BfpTP7YfvWwPffd/xX2QoXNZeNFmn19qksWILTn53/v+W1LztEshxRElS42t1
 C0R0HoVbnbPEOb9q7MS4GrqiyCvuh3hGsHrItLh9QCy3gISo3HAi33TyIHWUbIG6sl1nhB7z3Nq
 bw4UOdOKXSU7blghuSU7ZVwLBAbVJxUoKudwG3UPt3CDErvpUawdnQRmbHIPMY//vHCXhADehof
 Y5cdLRs/dcOLq1HXB4ZE/ljlT87kerC3elpMKT4LGN4i0JAr
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-spi@vger.kernel.org,
 kernel@pengutronix.de,
 =?UTF-8?q?Leonard=20G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] spi: stm32: Revert change that enabled
	controller before asserting CS
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

T24gc3RtMzJtcDE1NyBlbmFibGluZyB0aGUgY29udHJvbGxlciBiZWZvcmUgYXNzZXJ0aW5nIENT
IG1ha2VzIHRoZQpoYXJkd2FyZSB0cmlnZ2VyIHNwdXJpb3VzIGludGVycnVwdHMgaW4gYSB0aWdo
dCBsb29wIGFuZCB0aGUgdHJhbnNmZXJzCmZhaWwuIFJldmVydCB0aGUgY29tbWl0IHRoYXQgc3dh
cHBlZCB0aGUgb3JkZXIgb2YgZW5hYmxlIGFuZCBDUy4gVGhpcwpyZWludHJvZHVjZXMgdGhlIHBy
b2JsZW0gdGhhdCBzd2FwcGluZyB3YXMgc3VwcG9zZWQgdG8gZml4LCB3aGljaApob3dldmVyIGlz
IGxlc3MgZ3JhdmUuCgpSZXBvcnRlZC1ieTogTGVvbmFyZCBHw7ZocnMgPGwuZ29laHJzQHBlbmd1
dHJvbml4LmRlPgpMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMzkwMzNlZDctM2U1
Ny00MzM5LTgwYjQtZmM4OTE5ZTI2YWE3QHBlbmd1dHJvbml4LmRlLwpGaXhlczogNTJiNjJlN2E1
ZDRmICgic3BpOiBzdG0zMjogZW5hYmxlIGNvbnRyb2xsZXIgYmVmb3JlIGFzc2VydGluZyBDUyIp
ClNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0
cm9uaXguZGU+Ci0tLQogZHJpdmVycy9zcGkvc3BpLXN0bTMyLmMgfCAxNCArKysrKysrKysrKyst
LQogMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9zcGkvc3BpLXN0bTMyLmMgYi9kcml2ZXJzL3NwaS9zcGktc3RtMzIu
YwppbmRleCA0YTY4YWJjZGNjMzUuLmU0ZTdkZGI3NTI0YSAxMDA2NDQKLS0tIGEvZHJpdmVycy9z
cGkvc3BpLXN0bTMyLmMKKysrIGIvZHJpdmVycy9zcGkvc3BpLXN0bTMyLmMKQEAgLTEwMTYsOCAr
MTAxNiwxMCBAQCBzdGF0aWMgaXJxcmV0dXJuX3Qgc3RtMzJmeF9zcGlfaXJxX2V2ZW50KGludCBp
cnEsIHZvaWQgKmRldl9pZCkKIHN0YXRpYyBpcnFyZXR1cm5fdCBzdG0zMmZ4X3NwaV9pcnFfdGhy
ZWFkKGludCBpcnEsIHZvaWQgKmRldl9pZCkKIHsKIAlzdHJ1Y3Qgc3BpX2NvbnRyb2xsZXIgKmN0
cmwgPSBkZXZfaWQ7CisJc3RydWN0IHN0bTMyX3NwaSAqc3BpID0gc3BpX2NvbnRyb2xsZXJfZ2V0
X2RldmRhdGEoY3RybCk7CiAKIAlzcGlfZmluYWxpemVfY3VycmVudF90cmFuc2ZlcihjdHJsKTsK
KwlzdG0zMmZ4X3NwaV9kaXNhYmxlKHNwaSk7CiAKIAlyZXR1cm4gSVJRX0hBTkRMRUQ7CiB9CkBA
IC0xMTg1LDggKzExODcsNiBAQCBzdGF0aWMgaW50IHN0bTMyX3NwaV9wcmVwYXJlX21zZyhzdHJ1
Y3Qgc3BpX2NvbnRyb2xsZXIgKmN0cmwsCiAJCQkgfmNscmIpIHwgc2V0YiwKIAkJCXNwaS0+YmFz
ZSArIHNwaS0+Y2ZnLT5yZWdzLT5jcG9sLnJlZyk7CiAKLQlzdG0zMl9zcGlfZW5hYmxlKHNwaSk7
Ci0KIAlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZzcGktPmxvY2ssIGZsYWdzKTsKIAogCXJldHVy
biAwOwpAQCAtMTIwNCw2ICsxMjA0LDcgQEAgc3RhdGljIHZvaWQgc3RtMzJmeF9zcGlfZG1hX3R4
X2NiKHZvaWQgKmRhdGEpCiAKIAlpZiAoc3BpLT5jdXJfY29tbSA9PSBTUElfU0lNUExFWF9UWCB8
fCBzcGktPmN1cl9jb21tID09IFNQSV8zV0lSRV9UWCkgewogCQlzcGlfZmluYWxpemVfY3VycmVu
dF90cmFuc2ZlcihzcGktPmN0cmwpOworCQlzdG0zMmZ4X3NwaV9kaXNhYmxlKHNwaSk7CiAJfQog
fQogCkBAIC0xMjE4LDYgKzEyMTksNyBAQCBzdGF0aWMgdm9pZCBzdG0zMl9zcGlfZG1hX3J4X2Ni
KHZvaWQgKmRhdGEpCiAJc3RydWN0IHN0bTMyX3NwaSAqc3BpID0gZGF0YTsKIAogCXNwaV9maW5h
bGl6ZV9jdXJyZW50X3RyYW5zZmVyKHNwaS0+Y3RybCk7CisJc3BpLT5jZmctPmRpc2FibGUoc3Bp
KTsKIH0KIAogLyoqCkBAIC0xMzA1LDYgKzEzMDcsOCBAQCBzdGF0aWMgaW50IHN0bTMyZnhfc3Bp
X3RyYW5zZmVyX29uZV9pcnEoc3RydWN0IHN0bTMyX3NwaSAqc3BpKQogCiAJc3RtMzJfc3BpX3Nl
dF9iaXRzKHNwaSwgU1RNMzJGWF9TUElfQ1IyLCBjcjIpOwogCisJc3RtMzJfc3BpX2VuYWJsZShz
cGkpOworCiAJLyogc3RhcnRpbmcgZGF0YSB0cmFuc2ZlciB3aGVuIGJ1ZmZlciBpcyBsb2FkZWQg
Ki8KIAlpZiAoc3BpLT50eF9idWYpCiAJCXNwaS0+Y2ZnLT53cml0ZV90eChzcGkpOwpAQCAtMTM0
MSw2ICsxMzQ1LDggQEAgc3RhdGljIGludCBzdG0zMmg3X3NwaV90cmFuc2Zlcl9vbmVfaXJxKHN0
cnVjdCBzdG0zMl9zcGkgKnNwaSkKIAogCXNwaW5fbG9ja19pcnFzYXZlKCZzcGktPmxvY2ssIGZs
YWdzKTsKIAorCXN0bTMyX3NwaV9lbmFibGUoc3BpKTsKKwogCS8qIEJlIHN1cmUgdG8gaGF2ZSBk
YXRhIGluIGZpZm8gYmVmb3JlIHN0YXJ0aW5nIGRhdGEgdHJhbnNmZXIgKi8KIAlpZiAoc3BpLT50
eF9idWYpCiAJCXN0bTMyaDdfc3BpX3dyaXRlX3R4ZmlmbyhzcGkpOwpAQCAtMTM3Miw2ICsxMzc4
LDggQEAgc3RhdGljIHZvaWQgc3RtMzJmeF9zcGlfdHJhbnNmZXJfb25lX2RtYV9zdGFydChzdHJ1
Y3Qgc3RtMzJfc3BpICpzcGkpCiAJCSAqLwogCQlzdG0zMl9zcGlfc2V0X2JpdHMoc3BpLCBTVE0z
MkZYX1NQSV9DUjIsIFNUTTMyRlhfU1BJX0NSMl9FUlJJRSk7CiAJfQorCisJc3RtMzJfc3BpX2Vu
YWJsZShzcGkpOwogfQogCiAvKioKQEAgLTE0MDUsNiArMTQxMyw4IEBAIHN0YXRpYyB2b2lkIHN0
bTMyaDdfc3BpX3RyYW5zZmVyX29uZV9kbWFfc3RhcnQoc3RydWN0IHN0bTMyX3NwaSAqc3BpKQog
CiAJc3RtMzJfc3BpX3NldF9iaXRzKHNwaSwgU1RNMzJIN19TUElfSUVSLCBpZXIpOwogCisJc3Rt
MzJfc3BpX2VuYWJsZShzcGkpOworCiAJaWYgKFNUTTMyX1NQSV9IT1NUX01PREUoc3BpKSkKIAkJ
c3RtMzJfc3BpX3NldF9iaXRzKHNwaSwgU1RNMzJIN19TUElfQ1IxLCBTVE0zMkg3X1NQSV9DUjFf
Q1NUQVJUKTsKIH0KCmJhc2UtY29tbWl0OiBhMzgyOTdlM2ZiMDEyZGRmYTdjZTAzMjFhN2U1YThk
YWViMTg3MmI2Ci0tIAoyLjM5LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
