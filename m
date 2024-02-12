Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9798519BD
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Feb 2024 17:41:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F3A84C71285;
	Mon, 12 Feb 2024 16:41:51 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 84B9EC71285
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Feb 2024 16:41:49 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 68ABF4000C;
 Mon, 12 Feb 2024 16:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1707756109;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yRIMbE0unjYrvpCkfTYc04XJCl1PK7tAYUxBqamkw58=;
 b=SRVKwD5TC6/Q/eaZF0TKEEqglU/W26MWXFS0LesVfLHa/r8b4Bqs2Pr/fVFXoa4rUp0gqA
 cJC/8k6hbAEkuAG9Nw+UxdOqzXzvv54Hfw506EknpjJSlydEasazH1gM3biMrHyUUlXaNF
 qtrwepyhLN30iZoM+OJMUTmPhX49xDk3JqSJlAvmX5T+OSj+U8Wh82ezTLmFOHBOEmWW5k
 ZPwnTns+FH6Wsn4C7QLbkl4aAIEBVElezT59+mUT9iDNQae4DQM7gWexF+Yu/JcBI88Efz
 kCVgkXkRTkJ6bdO5imQ3DBJaNVLNN1gR85zREm0vlKuNsf9uebNloGTwkZAp5A==
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Mon, 12 Feb 2024 17:42:12 +0100
MIME-Version: 1.0
Message-Id: <20240212-rxc_bugfix-v3-5-e9f2eb6b3b05@bootlin.com>
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
 linux-renesas-soc@vger.kernel.org, Clark Wang <xiaoning.wang@nxp.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v3 5/7] net: stmmac: Signal to
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
eCBlYzRmNjM3N2I1ZWUuLmNhZjcxYTUwMmZmMiAxMDA2NDQKLS0tIGEvZHJpdmVycy9uZXQvZXRo
ZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX21haW4uYworKysgYi9kcml2ZXJzL25ldC9ldGhl
cm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWNfbWFpbi5jCkBAIC0xMjE4LDYgKzEyMTgsOSBAQCBz
dGF0aWMgaW50IHN0bW1hY19waHlfc2V0dXAoc3RydWN0IHN0bW1hY19wcml2ICpwcml2KQogCXBy
aXYtPnBoeWxpbmtfY29uZmlnLnR5cGUgPSBQSFlMSU5LX05FVERFVjsKIAlwcml2LT5waHlsaW5r
X2NvbmZpZy5tYWNfbWFuYWdlZF9wbSA9IHRydWU7CiAKKwkvKiBTdG1tYWMgYWx3YXlzIHJlcXVp
cmVzIGFuIFJYIGNsb2NrIGZvciBoYXJkd2FyZSBpbml0aWFsaXphdGlvbiAqLworCXByaXYtPnBo
eWxpbmtfY29uZmlnLm1hY19yZXF1aXJlc19yeGMgPSB0cnVlOworCiAJbWRpb19idXNfZGF0YSA9
IHByaXYtPnBsYXQtPm1kaW9fYnVzX2RhdGE7CiAJaWYgKG1kaW9fYnVzX2RhdGEpCiAJCXByaXYt
PnBoeWxpbmtfY29uZmlnLm92cl9hbl9pbmJhbmQgPQpAQCAtMzQwNyw2ICszNDEwLDEwIEBAIHN0
YXRpYyBpbnQgc3RtbWFjX2h3X3NldHVwKHN0cnVjdCBuZXRfZGV2aWNlICpkZXYsIGJvb2wgcHRw
X3JlZ2lzdGVyKQogCXUzMiBjaGFuOwogCWludCByZXQ7CiAKKwkvKiBNYWtlIHN1cmUgUlggY2xv
Y2sgaXMgZW5hYmxlZCAqLworCWlmIChwcml2LT5ody0+cGh5bGlua19wY3MpCisJCXBoeWxpbmtf
cGNzX3ByZV9pbml0KHByaXYtPnBoeWxpbmssIHByaXYtPmh3LT5waHlsaW5rX3Bjcyk7CisKIAkv
KiBETUEgaW5pdGlhbGl6YXRpb24gYW5kIFNXIHJlc2V0ICovCiAJcmV0ID0gc3RtbWFjX2luaXRf
ZG1hX2VuZ2luZShwcml2KTsKIAlpZiAocmV0IDwgMCkgewoKLS0gCjIuNDMuMAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGlu
ZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9z
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
