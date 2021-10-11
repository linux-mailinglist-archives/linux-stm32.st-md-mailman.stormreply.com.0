Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3875D428DD4
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Oct 2021 15:28:14 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DE6C7C5C82E;
	Mon, 11 Oct 2021 13:28:13 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4E73BC32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Oct 2021 13:28:12 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mZvLe-0006z2-IO; Mon, 11 Oct 2021 15:28:10 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mZvLd-0003pm-Vi; Mon, 11 Oct 2021 15:28:09 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mZvLW-0000T7-LN; Mon, 11 Oct 2021 15:28:02 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Lee Jones <lee.jones@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Mon, 11 Oct 2021 15:27:49 +0200
Message-Id: <20211011132754.2479853-9-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211011132754.2479853-1-u.kleine-koenig@pengutronix.de>
References: <20211011132754.2479853-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Patch-Hashes: v=1; h=sha256; i=SOnI2C3pbw0/O28+bQURH4mfZHs+NU3wIaeoHQEhKVQ=;
 m=WtM/zIhnsdBjs14lkJxT6oj9lbrAmktyLAk6bUH98nQ=;
 p=12TNER7mUCvsHC1mdfBXwGyRLzDN5LFZT6ziTZdlCA0=;
 g=86f514a8b5b16374e79dbf0810b2cbb16248162e
X-Patch-Sig: m=pgp; i=u.kleine-koenig@pengutronix.de;
 s=0x0D2511F322BFAB1C1580266BE2DCDD9132669BD6;
 b=iQEyBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmFkO3YACgkQwfwUeK3K7AnLJgf0CXJ
 kO3lt9dwzmdwAhoUUdGY6ItzC5+w1ZUdYOQ2UXn/Scg0G/igZPuE017453oaD/7jMPzji8xjBzD3h
 asxVuFEi5MzewAGHnSzgPLnu4PLKmX718KpGDtUshkqEH2cXNH0PpPJVrCf2mZsh7qRGW4FNbb50M
 fu58sSGoWPOrvGNjgWU1oFhynzOHXpqYNOMUSYOgM/uQCGNOCj82vjDhu6R3RadP5ye/EhtPzK28f
 UfTq89346qOjHUNY3IY1vqDNhNLaMVjI0JVuB99NYrRt+6QsIS1n3um6IkAENUoNFpFFExMcrwqzZ
 +Ac8Ka1M50+aEll3WnfovxhTCdu7e
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 Wolfram Sang <wsa@kernel.org>, Mark Brown <broonie@kernel.org>,
 linux-i2c@vger.kernel.org, kernel@pengutronix.de,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 08/13] mfd: stmpe: Make stmpe_remove() return
	void
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

VXAgdG8gbm93IHN0bXBlX3JlbW92ZSgpIHJldHVybnMgemVybyB1bmNvbmRpdGlvbmFsbHkuIE1h
a2UgaXQgcmV0dXJuCnZvaWQgaW5zdGVhZCB3aGljaCBtYWtlcyBpdCBlYXNpZXIgdG8gc2VlIGlu
IHRoZSBjYWxsZXJzIHRoYXQgdGhlcmUgaXMKbm8gZXJyb3IgdG8gaGFuZGxlLgoKQWxzbyB0aGUg
cmV0dXJuIHZhbHVlIG9mIGkyYyBhbmQgc3BpIHJlbW92ZSBjYWxsYmFja3MgaXMgaWdub3JlZCBh
bnl3YXkuCgpTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmln
QHBlbmd1dHJvbml4LmRlPgotLS0KIGRyaXZlcnMvbWZkL3N0bXBlLWkyYy5jIHwgNCArKystCiBk
cml2ZXJzL21mZC9zdG1wZS1zcGkuYyB8IDQgKysrLQogZHJpdmVycy9tZmQvc3RtcGUuYyAgICAg
fCA0ICstLS0KIGRyaXZlcnMvbWZkL3N0bXBlLmggICAgIHwgMiArLQogNCBmaWxlcyBjaGFuZ2Vk
LCA4IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9t
ZmQvc3RtcGUtaTJjLmMgYi9kcml2ZXJzL21mZC9zdG1wZS1pMmMuYwppbmRleCBjZDJmNDUyNTdk
YzEuLmQzZWVkZjNkNjA3ZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9tZmQvc3RtcGUtaTJjLmMKKysr
IGIvZHJpdmVycy9tZmQvc3RtcGUtaTJjLmMKQEAgLTk1LDcgKzk1LDkgQEAgc3RhdGljIGludCBz
dG1wZV9pMmNfcmVtb3ZlKHN0cnVjdCBpMmNfY2xpZW50ICppMmMpCiB7CiAJc3RydWN0IHN0bXBl
ICpzdG1wZSA9IGRldl9nZXRfZHJ2ZGF0YSgmaTJjLT5kZXYpOwogCi0JcmV0dXJuIHN0bXBlX3Jl
bW92ZShzdG1wZSk7CisJc3RtcGVfcmVtb3ZlKHN0bXBlKTsKKworCXJldHVybiAwOwogfQogCiBz
dGF0aWMgY29uc3Qgc3RydWN0IGkyY19kZXZpY2VfaWQgc3RtcGVfaTJjX2lkW10gPSB7CmRpZmYg
LS1naXQgYS9kcml2ZXJzL21mZC9zdG1wZS1zcGkuYyBiL2RyaXZlcnMvbWZkL3N0bXBlLXNwaS5j
CmluZGV4IDczNTE3MzRmNzU5My4uNmM1OTE1MDE2YmU1IDEwMDY0NAotLS0gYS9kcml2ZXJzL21m
ZC9zdG1wZS1zcGkuYworKysgYi9kcml2ZXJzL21mZC9zdG1wZS1zcGkuYwpAQCAtMTA2LDcgKzEw
Niw5IEBAIHN0YXRpYyBpbnQgc3RtcGVfc3BpX3JlbW92ZShzdHJ1Y3Qgc3BpX2RldmljZSAqc3Bp
KQogewogCXN0cnVjdCBzdG1wZSAqc3RtcGUgPSBzcGlfZ2V0X2RydmRhdGEoc3BpKTsKIAotCXJl
dHVybiBzdG1wZV9yZW1vdmUoc3RtcGUpOworCXN0bXBlX3JlbW92ZShzdG1wZSk7CisKKwlyZXR1
cm4gMDsKIH0KIAogc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgc3RtcGVfc3BpX29m
X21hdGNoW10gPSB7CmRpZmYgLS1naXQgYS9kcml2ZXJzL21mZC9zdG1wZS5jIGIvZHJpdmVycy9t
ZmQvc3RtcGUuYwppbmRleCA1OGQwOWM2MTVlNjcuLmU5MjhkZjk1ZTMxNiAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9tZmQvc3RtcGUuYworKysgYi9kcml2ZXJzL21mZC9zdG1wZS5jCkBAIC0xNDk2LDcg
KzE0OTYsNyBAQCBpbnQgc3RtcGVfcHJvYmUoc3RydWN0IHN0bXBlX2NsaWVudF9pbmZvICpjaSwg
ZW51bSBzdG1wZV9wYXJ0bnVtIHBhcnRudW0pCiAJcmV0dXJuIHJldDsKIH0KIAotaW50IHN0bXBl
X3JlbW92ZShzdHJ1Y3Qgc3RtcGUgKnN0bXBlKQordm9pZCBzdG1wZV9yZW1vdmUoc3RydWN0IHN0
bXBlICpzdG1wZSkKIHsKIAlpZiAoIUlTX0VSUihzdG1wZS0+dmlvKSkKIAkJcmVndWxhdG9yX2Rp
c2FibGUoc3RtcGUtPnZpbyk7CkBAIC0xNTA2LDggKzE1MDYsNiBAQCBpbnQgc3RtcGVfcmVtb3Zl
KHN0cnVjdCBzdG1wZSAqc3RtcGUpCiAJX19zdG1wZV9kaXNhYmxlKHN0bXBlLCBTVE1QRV9CTE9D
S19BREMpOwogCiAJbWZkX3JlbW92ZV9kZXZpY2VzKHN0bXBlLT5kZXYpOwotCi0JcmV0dXJuIDA7
CiB9CiAKICNpZmRlZiBDT05GSUdfUE0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWZkL3N0bXBlLmgg
Yi9kcml2ZXJzL21mZC9zdG1wZS5oCmluZGV4IDgzNDkxZTk5YmEzYy4uMWI0ZjkxZDAzYmJmIDEw
MDY0NAotLS0gYS9kcml2ZXJzL21mZC9zdG1wZS5oCisrKyBiL2RyaXZlcnMvbWZkL3N0bXBlLmgK
QEAgLTk4LDcgKzk4LDcgQEAgc3RydWN0IHN0bXBlX2NsaWVudF9pbmZvIHsKIH07CiAKIGludCBz
dG1wZV9wcm9iZShzdHJ1Y3Qgc3RtcGVfY2xpZW50X2luZm8gKmNpLCBlbnVtIHN0bXBlX3BhcnRu
dW0gcGFydG51bSk7Ci1pbnQgc3RtcGVfcmVtb3ZlKHN0cnVjdCBzdG1wZSAqc3RtcGUpOwordm9p
ZCBzdG1wZV9yZW1vdmUoc3RydWN0IHN0bXBlICpzdG1wZSk7CiAKICNkZWZpbmUgU1RNUEVfSUNS
X0xTQl9ISUdICSgxIDw8IDIpCiAjZGVmaW5lIFNUTVBFX0lDUl9MU0JfRURHRQkoMSA8PCAxKQot
LSAKMi4zMC4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9s
aXN0aW5mby9saW51eC1zdG0zMgo=
