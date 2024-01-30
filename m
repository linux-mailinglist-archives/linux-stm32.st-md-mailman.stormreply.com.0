Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B793841F6F
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Jan 2024 10:28:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 11960C6DD96;
	Tue, 30 Jan 2024 09:28:22 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 12710C6DD9C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jan 2024 09:28:19 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 098146000C;
 Tue, 30 Jan 2024 09:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1706606898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JCIN9PC5AsOKdJhE1Swz0j+trKxzzOsLjLL1WNO/OqY=;
 b=HU5gZCH6CXQVHnfIq3Vvhyl5nAG6Igh4uDVusx1iMqEvkXZbQtsVqDwoMgNGd32mKEbBHE
 moYX3f18TPUtVSb3ueEgVe1NoBNHZSTQcudeJ6QSfkGlFn0cXdRrBsFsqBk8MYxm2ZGrD6
 1yMrE5eJfGx7lmI4PCzeFIgBSM2ki3KebrKfsTqX6NiUdo2TjStLLsxRYW9hJ9j1v6CHAP
 OMVTM1baaTQGBXcIFaE8tThrlvXHxW6yWS4rXKpGrExZwZn2je+Kqg/8igvQMDsFVMwt5Y
 yI5FM7E48EatQtLmLazotQ72v08O2F0Ppjbpox8XJboWCrw0c0BuPkBpw5pAaw==
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Tue, 30 Jan 2024 10:28:40 +0100
MIME-Version: 1.0
Message-Id: <20240130-rxc_bugfix-v2-5-5e6c3168e5f0@bootlin.com>
References: <20240130-rxc_bugfix-v2-0-5e6c3168e5f0@bootlin.com>
In-Reply-To: <20240130-rxc_bugfix-v2-0-5e6c3168e5f0@bootlin.com>
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
 linux-renesas-soc@vger.kernel.org, Clark Wang <xiaoning.wang@nxp.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 5/7] net: stmmac: Signal to
 PHY/PCS drivers to keep RX clock on
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

VGhlcmUgaXMgYSByZW9jdXJyaW5nIGlzc3VlIHdpdGggc3RtbWFjIGNvbnRyb2xsZXJzIHdoZXJl
IHRoZSBNQUMgZmFpbHMgdG8KaW5pdGlhbGl6ZSBpdHMgaGFyZHdhcmUgaWYgYW4gUlggY2xvY2sg
c2lnbmFsIGlzbid0IHByb3ZpZGVkIG9uIHRoZSBNQUMvUEhZCmxpbmsuCgpUaGlzIGNhdXNlcyBp
c3N1ZXMgd2hlbiBQSFkgb3IgUENTIGRldmljZXMgZWl0aGVyIGdvIGludG8gc3VzcGVuZCB3aGls
ZQpjdXR0aW5nIHRoZSBSWCBjbG9jayBvciBkbyBub3QgYnJpbmcgdGhlIGNsb2NrIHNpZ25hbCB1
cCBlYXJseSBlbm91Z2ggZm9yCnRoZSBNQUMgdG8gaW5pdGlhbGl6ZSBzdWNjZXNzZnVsbHkuCgpT
ZXQgdGhlIG1hY19yZXF1aXJlc19yeGMgZmxhZyBpbiB0aGUgc3RtbWFjIHBoeWxpbmsgY29uZmln
IHNvIHRoYXQgUEhZL1BDUwpkcml2ZXJzIGtub3cgdG8ga2VlcCB0aGUgUlggY2xvY2sgdXAgYXQg
YWxsIHRpbWVzLgoKUmVwb3J0ZWQtYnk6IENsYXJrIFdhbmcgPHhpYW9uaW5nLndhbmdAbnhwLmNv
bT4KTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjMwMjAyMDgxNTU5LjM1NTM2
MzctMS14aWFvbmluZy53YW5nQG54cC5jb20vClJlcG9ydGVkLWJ5OiBDbMOpbWVudCBMw6lnZXIg
PGNsZW1lbnQubGVnZXJAYm9vdGxpbi5jb20+Ckxpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2xpbnV4LWFybS1rZXJuZWwvMjAyMzAxMTYxMDM5MjYuMjc2ODY5LTQtY2xlbWVudC5sZWdlckBi
b290bGluLmNvbS8KU3VnZ2VzdGVkLWJ5OiBSdXNzZWxsIEtpbmcgPGxpbnV4QGFybWxpbnV4Lm9y
Zy51az4KU2lnbmVkLW9mZi1ieTogUm9tYWluIEdhbnRvaXMgPHJvbWFpbi5nYW50b2lzQGJvb3Rs
aW4uY29tPgotLS0KIGRyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19t
YWluLmMgfCA3ICsrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWNfbWFpbi5j
IGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX21haW4uYwppbmRl
eCA3MmUwMmVmMGVlNmIuLjczNDVlM2ZhMDdjNCAxMDA2NDQKLS0tIGEvZHJpdmVycy9uZXQvZXRo
ZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX21haW4uYworKysgYi9kcml2ZXJzL25ldC9ldGhl
cm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWNfbWFpbi5jCkBAIC0xMjE4LDYgKzEyMTgsOSBAQCBz
dGF0aWMgaW50IHN0bW1hY19waHlfc2V0dXAoc3RydWN0IHN0bW1hY19wcml2ICpwcml2KQogCXBy
aXYtPnBoeWxpbmtfY29uZmlnLnR5cGUgPSBQSFlMSU5LX05FVERFVjsKIAlwcml2LT5waHlsaW5r
X2NvbmZpZy5tYWNfbWFuYWdlZF9wbSA9IHRydWU7CiAKKwkvKiBTdG1tYWMgYWx3YXlzIHJlcXVp
cmVzIGFuIFJYIGNsb2NrIGZvciBoYXJkd2FyZSBpbml0aWFsaXphdGlvbiAqLworCXByaXYtPnBo
eWxpbmtfY29uZmlnLm1hY19yZXF1aXJlc19yeGMgPSB0cnVlOworCiAJbWRpb19idXNfZGF0YSA9
IHByaXYtPnBsYXQtPm1kaW9fYnVzX2RhdGE7CiAJaWYgKG1kaW9fYnVzX2RhdGEpCiAJCXByaXYt
PnBoeWxpbmtfY29uZmlnLm92cl9hbl9pbmJhbmQgPQpAQCAtMzQwMiw2ICszNDA1LDEwIEBAIHN0
YXRpYyBpbnQgc3RtbWFjX2h3X3NldHVwKHN0cnVjdCBuZXRfZGV2aWNlICpkZXYsIGJvb2wgcHRw
X3JlZ2lzdGVyKQogCXUzMiBjaGFuOwogCWludCByZXQ7CiAKKwkvKiBNYWtlIHN1cmUgUlggY2xv
Y2sgaXMgZW5hYmxlZCAqLworCWlmIChwcml2LT5ody0+cGh5bGlua19wY3MpCisJCXBoeWxpbmtf
cGNzX3ByZV9pbml0KHByaXYtPnBoeWxpbmssIHByaXYtPmh3LT5waHlsaW5rX3Bjcyk7CisKIAkv
KiBETUEgaW5pdGlhbGl6YXRpb24gYW5kIFNXIHJlc2V0ICovCiAJcmV0ID0gc3RtbWFjX2luaXRf
ZG1hX2VuZ2luZShwcml2KTsKIAlpZiAocmV0IDwgMCkgewoKLS0gCjIuNDMuMAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGlu
ZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9z
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
