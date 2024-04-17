Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 17AD28A7F0F
	for <lists+linux-stm32@lfdr.de>; Wed, 17 Apr 2024 11:04:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D58D7C6C859;
	Wed, 17 Apr 2024 09:04:33 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D430FC69067
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Apr 2024 09:04:30 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1rx1DD-0004om-PA; Wed, 17 Apr 2024 11:04:15 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rx1DB-00ClGH-Va; Wed, 17 Apr 2024 11:04:13 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <ukl@pengutronix.de>) id 1rx1DB-002hM0-2s;
 Wed, 17 Apr 2024 11:04:13 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Wed, 17 Apr 2024 11:03:27 +0200
Message-ID: <5f92603d0dfd8a5b8014b2b10a902d91e0bb881f.1713344161.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1713344161.git.u.kleine-koenig@pengutronix.de>
References: <cover.1713344161.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2801;
 i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id;
 bh=jz6AwetzGMEFARbI09ryhM79Cpp+5tcl5jRCkdSNET4=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBmH5BgGqqxohanUIs9ldgC3LKg8mUkUOW5enTWc
 nNTWDud12aJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZh+QYAAKCRCPgPtYfRL+
 Tn61B/wLkA8sd9+OtnXiV7D2HuC8Y3rIY+yd3AqI83nlYd01ePT6tnPUuatJgNSOV1d5bvjLaJm
 Ww7/8w3VW765fy5wfteHQLWausCQyAutmj+F6PnsX/OwEPLE4g4nxolcav8z+bREIaOtvDzyxy7
 a/pNV+1rHNPJdvh/WU7yxwYahJbXPp/8CE1ULP4jU1fSzERqTXO9Ezig1qg5F1j4DDjhP4XxX57
 ZBQ6Vr0E385ebYDSFYLSHM95N1xNfBpWjXb3Rs575gZMYo/3U+2F8eiw0j4QvXFfEHIOaAOBqGy
 pNB5jT61gSQrg8z709OwewOeRD9EqDtj7zvOHIteSZzbR+9u
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Peter Hurley <peter@hurleysoftware.com>, stable@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 kernel@pengutronix.de, linux-serial@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lino Sanfilippo <l.sanfilippo@kunbus.com>,
 Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Subject: [Linux-stm32] [PATCH 1/2] serial: stm32: Return IRQ_NONE in the ISR
	if no handling happend
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

SWYgdGhlcmUgaXMgYSBzdHVjayBpcnEgdGhhdCB0aGUgaGFuZGxlciBkb2Vzbid0IGFkZHJlc3Ms
IHJldHVybmluZwpJUlFfSEFORExFRCB1bmNvbmRpdGlvbmFsbHkgbWFrZXMgaXQgaW1wb3NzaWJs
ZSBmb3IgdGhlIGlycSBjb3JlIHRvCmRldGVjdCB0aGUgcHJvYmxlbSBhbmQgZGlzYWJsZSB0aGUg
aXJxLiBTbyBvbmx5IHJldHVybiBJUlFfSEFORExFRCBpZgphbiBldmVudCB3YXMgaGFuZGxlZC4K
CkEgc3R1Y2sgaXJxIGlzIHN0aWxsIHByb2JsZW1hdGljLCBidXQgd2l0aCB0aGlzIGNoYW5nZSBh
dCBsZWFzdCBpdCBvbmx5Cm1ha2VzIHRoZSBVQVJUIG5vbmZ1bmN0aW9uYWwgaW5zdGVhZCBvZiBv
Y2N1cHlpbmcgdGhlICh1c3VhbGx5IG9ubHkpIENQVQpieSAxMDAlIGFuZCBzbyBzdGFsbCB0aGUg
d2hvbGUgbWFjaGluZS4KCkZpeGVzOiA0OGE2MDkyZmI0MWYgKCJzZXJpYWw6IHN0bTMyLXVzYXJ0
OiBBZGQgU1RNMzIgVVNBUlQgRHJpdmVyIikKQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKU2ln
bmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25p
eC5kZT4KLS0tCiBkcml2ZXJzL3R0eS9zZXJpYWwvc3RtMzItdXNhcnQuYyB8IDEyICsrKysrKysr
KystLQogMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy90dHkvc2VyaWFsL3N0bTMyLXVzYXJ0LmMgYi9kcml2ZXJzL3R0
eS9zZXJpYWwvc3RtMzItdXNhcnQuYwppbmRleCA4YzY2YWJjZmU2Y2EuLjJiZWExZDdjOTg1OCAx
MDA2NDQKLS0tIGEvZHJpdmVycy90dHkvc2VyaWFsL3N0bTMyLXVzYXJ0LmMKKysrIGIvZHJpdmVy
cy90dHkvc2VyaWFsL3N0bTMyLXVzYXJ0LmMKQEAgLTg0OSw2ICs4NDksNyBAQCBzdGF0aWMgaXJx
cmV0dXJuX3Qgc3RtMzJfdXNhcnRfaW50ZXJydXB0KGludCBpcnEsIHZvaWQgKnB0cikKIAljb25z
dCBzdHJ1Y3Qgc3RtMzJfdXNhcnRfb2Zmc2V0cyAqb2ZzID0gJnN0bTMyX3BvcnQtPmluZm8tPm9m
czsKIAl1MzIgc3I7CiAJdW5zaWduZWQgaW50IHNpemU7CisJaXJxcmV0dXJuX3QgcmV0ID0gSVJR
X05PTkU7CiAKIAlzciA9IHJlYWRsX3JlbGF4ZWQocG9ydC0+bWVtYmFzZSArIG9mcy0+aXNyKTsK
IApAQCAtODU3LDExICs4NTgsMTQgQEAgc3RhdGljIGlycXJldHVybl90IHN0bTMyX3VzYXJ0X2lu
dGVycnVwdChpbnQgaXJxLCB2b2lkICpwdHIpCiAJICAgIChzciAmIFVTQVJUX1NSX1RDKSkgewog
CQlzdG0zMl91c2FydF90Y19pbnRlcnJ1cHRfZGlzYWJsZShwb3J0KTsKIAkJc3RtMzJfdXNhcnRf
cnM0ODVfcnRzX2Rpc2FibGUocG9ydCk7CisJCXJldCA9IElSUV9IQU5ETEVEOwogCX0KIAotCWlm
ICgoc3IgJiBVU0FSVF9TUl9SVE9GKSAmJiBvZnMtPmljciAhPSBVTkRFRl9SRUcpCisJaWYgKChz
ciAmIFVTQVJUX1NSX1JUT0YpICYmIG9mcy0+aWNyICE9IFVOREVGX1JFRykgewogCQl3cml0ZWxf
cmVsYXhlZChVU0FSVF9JQ1JfUlRPQ0YsCiAJCQkgICAgICAgcG9ydC0+bWVtYmFzZSArIG9mcy0+
aWNyKTsKKwkJcmV0ID0gSVJRX0hBTkRMRUQ7CisJfQogCiAJaWYgKChzciAmIFVTQVJUX1NSX1dV
RikgJiYgb2ZzLT5pY3IgIT0gVU5ERUZfUkVHKSB7CiAJCS8qIENsZWFyIHdha2UgdXAgZmxhZyBh
bmQgZGlzYWJsZSB3YWtlIHVwIGludGVycnVwdCAqLwpAQCAtODcwLDYgKzg3NCw3IEBAIHN0YXRp
YyBpcnFyZXR1cm5fdCBzdG0zMl91c2FydF9pbnRlcnJ1cHQoaW50IGlycSwgdm9pZCAqcHRyKQog
CQlzdG0zMl91c2FydF9jbHJfYml0cyhwb3J0LCBvZnMtPmNyMywgVVNBUlRfQ1IzX1dVRklFKTsK
IAkJaWYgKGlycWRfaXNfd2FrZXVwX3NldChpcnFfZ2V0X2lycV9kYXRhKHBvcnQtPmlycSkpKQog
CQkJcG1fd2FrZXVwX2V2ZW50KHRwb3J0LT50dHktPmRldiwgMCk7CisJCXJldCA9IElSUV9IQU5E
TEVEOwogCX0KIAogCS8qCkBAIC04ODQsNiArODg5LDcgQEAgc3RhdGljIGlycXJldHVybl90IHN0
bTMyX3VzYXJ0X2ludGVycnVwdChpbnQgaXJxLCB2b2lkICpwdHIpCiAJCQl1YXJ0X3VubG9ja19h
bmRfY2hlY2tfc3lzcnEocG9ydCk7CiAJCQlpZiAoc2l6ZSkKIAkJCQl0dHlfZmxpcF9idWZmZXJf
cHVzaCh0cG9ydCk7CisJCQlyZXQgPSBJUlFfSEFORExFRDsKIAkJfQogCX0KIApAQCAtODkxLDYg
Kzg5Nyw3IEBAIHN0YXRpYyBpcnFyZXR1cm5fdCBzdG0zMl91c2FydF9pbnRlcnJ1cHQoaW50IGly
cSwgdm9pZCAqcHRyKQogCQl1YXJ0X3BvcnRfbG9jayhwb3J0KTsKIAkJc3RtMzJfdXNhcnRfdHJh
bnNtaXRfY2hhcnMocG9ydCk7CiAJCXVhcnRfcG9ydF91bmxvY2socG9ydCk7CisJCXJldCA9IElS
UV9IQU5ETEVEOwogCX0KIAogCS8qIFJlY2VpdmVyIHRpbWVvdXQgaXJxIGZvciBETUEgUlggKi8K
QEAgLTkwMCw5ICs5MDcsMTAgQEAgc3RhdGljIGlycXJldHVybl90IHN0bTMyX3VzYXJ0X2ludGVy
cnVwdChpbnQgaXJxLCB2b2lkICpwdHIpCiAJCXVhcnRfdW5sb2NrX2FuZF9jaGVja19zeXNycShw
b3J0KTsKIAkJaWYgKHNpemUpCiAJCQl0dHlfZmxpcF9idWZmZXJfcHVzaCh0cG9ydCk7CisJCXJl
dCA9IElSUV9IQU5ETEVEOwogCX0KIAotCXJldHVybiBJUlFfSEFORExFRDsKKwlyZXR1cm4gcmV0
OwogfQogCiBzdGF0aWMgdm9pZCBzdG0zMl91c2FydF9zZXRfbWN0cmwoc3RydWN0IHVhcnRfcG9y
dCAqcG9ydCwgdW5zaWduZWQgaW50IG1jdHJsKQotLSAKMi40My4wCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QK
TGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
