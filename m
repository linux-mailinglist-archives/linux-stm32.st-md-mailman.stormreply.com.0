Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C3D8519BF
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Feb 2024 17:41:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1341EC71289;
	Mon, 12 Feb 2024 16:41:53 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 845B6C71284
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Feb 2024 16:41:51 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7446E4000D;
 Mon, 12 Feb 2024 16:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1707756111;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8czDIr08uKTxlGOGsDYPdcJ6cGFJ07B7pYkEvPF76hU=;
 b=TGcWw4FgT4Xnck1YkeBAl9Cni3Dvp+36QFc1wv6p8uJW5WqSNo37BglB8fTV+KIwOMK3tN
 UB75AvHrrgaL3RXUKUqT+VtZtP1x79454w8w8rJ8tW1Nu6WkvLjd/UcLuucXqYRy7BVgBn
 RUaWFoXb4KdzCrykcWWQW5WhmgK1QTmU+HOQ7CEabH/xOi+Uz4a9QhRTwrsNlw0ScLU0VI
 J6/2ZMK/D6mUxtieXPKyWWcGYZk5MS40imsPC+NlL2QyJOKkbw3Wd+vkBrpFylkdVynqXh
 Ka3psvAQIu4YC1d8JZG2UJF7dkubwqABRuqwDYvQXr7nke32l1ejtCYMQoBMxg==
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Mon, 12 Feb 2024 17:42:14 +0100
MIME-Version: 1.0
Message-Id: <20240212-rxc_bugfix-v3-7-e9f2eb6b3b05@bootlin.com>
References: <20240212-rxc_bugfix-v3-0-e9f2eb6b3b05@bootlin.com>
In-Reply-To: <20240212-rxc_bugfix-v3-0-e9f2eb6b3b05@bootlin.com>
To: Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <clement.leger@bootlin.com>
X-Mailer: b4 0.12.4
X-GND-Sasl: romain.gantois@bootlin.com
Cc: Romain Gantois <romain.gantois@bootlin.com>, netdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v3 7/7] net: pcs: rzn1-miic: Init RX
 clock early if MAC requires it
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

VGhlIEdNQUMxIGNvbnRyb2xsZXIgaW4gdGhlIFJaTjEgSVAgcmVxdWlyZXMgdGhlIFJYIE1JSSBj
bG9jayBzaWduYWwgdG8gYmUKc3RhcnRlZCBiZWZvcmUgaXQgaW5pdGlhbGl6ZXMgaXRzIG93biBo
YXJkd2FyZSwgdGh1cyBiZWZvcmUgaXQgY2FsbHMKcGh5bGlua19zdGFydC4KCkNoZWNrIHRoZSBy
eGNfYWx3YXlzX29uIHBjcyBmbGFnIGFuZCBlbmFibGUgdGhlIGNsb2NrIHNpZ25hbCBkdXJpbmcg
dGhlCmxpbmsgdmFsaWRhdGlvbiBwaGFzZS4KClJlcG9ydGVkLWJ5OiBDbMOpbWVudCBMw6lnZXIg
PGNsZW1lbnQubGVnZXJAYm9vdGxpbi5jb20+Ckxpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2xpbnV4LWFybS1rZXJuZWwvMjAyMzAxMTYxMDM5MjYuMjc2ODY5LTQtY2xlbWVudC5sZWdlckBi
b290bGluLmNvbS8KU2lnbmVkLW9mZi1ieTogUm9tYWluIEdhbnRvaXMgPHJvbWFpbi5nYW50b2lz
QGJvb3RsaW4uY29tPgotLS0KIGRyaXZlcnMvbmV0L3Bjcy9wY3MtcnpuMS1taWljLmMgfCAyNyAr
KysrKysrKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAyNyBpbnNlcnRpb25z
KCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvcGNzL3Bjcy1yem4xLW1paWMuYyBiL2RyaXZl
cnMvbmV0L3Bjcy9wY3MtcnpuMS1taWljLmMKaW5kZXggZDkzZjg0ZmJiMWZkLi5iMGQ5NzM2YzY3
OGUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbmV0L3Bjcy9wY3MtcnpuMS1taWljLmMKKysrIGIvZHJp
dmVycy9uZXQvcGNzL3Bjcy1yem4xLW1paWMuYwpAQCAtMjc5LDEwICsyNzksMzcgQEAgc3RhdGlj
IGludCBtaWljX3ZhbGlkYXRlKHN0cnVjdCBwaHlsaW5rX3BjcyAqcGNzLCB1bnNpZ25lZCBsb25n
ICpzdXBwb3J0ZWQsCiAJcmV0dXJuIC1FSU5WQUw7CiB9CiAKK3N0YXRpYyBpbnQgbWlpY19wcmVf
aW5pdChzdHJ1Y3QgcGh5bGlua19wY3MgKnBjcykKK3sKKwlzdHJ1Y3QgbWlpY19wb3J0ICptaWlj
X3BvcnQgPSBwaHlsaW5rX3Bjc190b19taWljX3BvcnQocGNzKTsKKwlzdHJ1Y3QgbWlpYyAqbWlp
YyA9IG1paWNfcG9ydC0+bWlpYzsKKwl1MzIgdmFsOworCisJLyogU3RhcnQgUlggY2xvY2sgaWYg
cmVxdWlyZWQgKi8KKwlpZiAocGNzLT5yeGNfYWx3YXlzX29uKSB7CisJCS8qIEluIE1JSSB0aHJv
dWdoIG1vZGUsIHRoZSBjbG9jayBzaWduYWxzIHdpbGwgYmUgZHJpdmVuIGJ5IHRoZQorCQkgKiBl
eHRlcm5hbCBQSFksIHdoaWNoIG1pZ2h0IG5vdCBiZSBpbml0aWFsaXplZCB5ZXQuIFNldCBSTUlJ
CisJCSAqIGFzIGRlZmF1bHQgbW9kZSB0byBlbnN1cmUgdGhhdCBhIHJlZmVyZW5jZSBjbG9jayBz
aWduYWwgaXMKKwkJICogZ2VuZXJhdGVkLgorCQkgKi8KKwkJbWlpY19wb3J0LT5pbnRlcmZhY2Ug
PSBQSFlfSU5URVJGQUNFX01PREVfUk1JSTsKKworCQl2YWwgPSBGSUVMRF9QUkVQKE1JSUNfQ09O
VkNUUkxfQ09OVl9NT0RFLCBDT05WX01PREVfUk1JSSk7CisJCW1paWNfcmVnX3JtdyhtaWljLCBN
SUlDX0NPTlZDVFJMKG1paWNfcG9ydC0+cG9ydCksCisJCQkgICAgIE1JSUNfQ09OVkNUUkxfQ09O
Vl9NT0RFLAorCQkJICAgICB2YWwpOworCisJCW1paWNfY29udmVydGVyX2VuYWJsZShtaWljLCBt
aWljX3BvcnQtPnBvcnQsIDEpOworCX0KKworCXJldHVybiAwOworfQorCiBzdGF0aWMgY29uc3Qg
c3RydWN0IHBoeWxpbmtfcGNzX29wcyBtaWljX3BoeWxpbmtfb3BzID0gewogCS5wY3NfdmFsaWRh
dGUgPSBtaWljX3ZhbGlkYXRlLAogCS5wY3NfY29uZmlnID0gbWlpY19jb25maWcsCiAJLnBjc19s
aW5rX3VwID0gbWlpY19saW5rX3VwLAorCS5wY3NfcHJlX2luaXQgPSBtaWljX3ByZV9pbml0LAog
fTsKIAogc3RydWN0IHBoeWxpbmtfcGNzICptaWljX2NyZWF0ZShzdHJ1Y3QgZGV2aWNlICpkZXYs
IHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnApCgotLSAKMi40My4wCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGlu
dXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
