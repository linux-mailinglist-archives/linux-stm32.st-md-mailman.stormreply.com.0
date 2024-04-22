Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF458AC253
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Apr 2024 02:20:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 31BA4C71290;
	Mon, 22 Apr 2024 00:20:47 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 16840C71290
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Apr 2024 00:20:45 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 0C62D8831F;
 Mon, 22 Apr 2024 02:20:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1713745244;
 bh=TtNqYjmOO2CpLdxim0VUZRbSrAsqgdSRa26x6/5aCF0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Y19gzc/xD3QPr38CgX2rwkX9EDas/2cNFlAh+E9L4zf99MqDXxBgEACVFsKYBHw5L
 7wGnT9eTxqtve5tfhBR9wGMj0ty5WR4CqgHSCU2kc9aGyKVF5/V1Ka+v8MHsmViHlw
 /pTdrXjdBdcdlOwoOh6GkB+CqrJWFHqB81NEWC2THvdDsvvQ7JYZq/wdmS2OvqtLJo
 pgeUZM9JblR03qXzMI9TpOPglAnUhEoPuIXfjN0xAgNLrxJBVDgTMCXxSa6/Bwznc2
 d+LZSXl1Fn8CtfScFGP1vGNWDStXcJUW0HYJ+31R6okcbfUGGqUGkySd4TW914K9Uo
 yqOEWtb8A8cRA==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Mon, 22 Apr 2024 02:19:27 +0200
Message-ID: <20240422002006.243687-13-marex@denx.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240422002006.243687-1-marex@denx.de>
References: <20240422002006.243687-1-marex@denx.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 devicetree@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>, kernel@dh-electronics.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Sean Nyekjaer <sean@geanix.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 =?UTF-8?q?Leonard=20G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
 Steffen Trumtrar <s.trumtrar@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 13/20] ARM: dts: stm32: Add alternate pinmux
	for MP13 SDMMC2 D4..D7 pins
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

QWRkIGFub3RoZXIgbXV4IG9wdGlvbiBmb3IgU0RNTUMyIEQ0Li5ENyBwaW5zLCB0aGlzIGlzIHVz
ZWQgb24KREggZWxlY3Ryb25pY3MgU1RNMzJNUDEzeHggREhDT1IgREhTQkMgYm9hcmQuCgpTaWdu
ZWQtb2ZmLWJ5OiBNYXJlayBWYXN1dCA8bWFyZXhAZGVueC5kZT4KLS0tCkNjOiAiTGVvbmFyZCBH
w7ZocnMiIDxsLmdvZWhyc0BwZW5ndXRyb25peC5kZT4KQ2M6IEFobWFkIEZhdG91bSA8YS5mYXRv
dW1AcGVuZ3V0cm9uaXguZGU+CkNjOiBBbGV4YW5kcmUgVG9yZ3VlIDxhbGV4YW5kcmUudG9yZ3Vl
QGZvc3Muc3QuY29tPgpDYzogQW5kcmUgUHJ6eXdhcmEgPGFuZHJlLnByenl3YXJhQGFybS5jb20+
CkNjOiBDb25vciBEb29sZXkgPGNvbm9yK2R0QGtlcm5lbC5vcmc+CkNjOiBEYXJpbyBCaW5hY2No
aSA8ZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20+CkNjOiBLcnp5c3p0b2YgS296
bG93c2tpIDxrcnprK2R0QGtlcm5lbC5vcmc+CkNjOiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxs
ZWlqQGxpbmFyby5vcmc+CkNjOiBNYXhpbWUgQ29xdWVsaW4gPG1jb3F1ZWxpbi5zdG0zMkBnbWFp
bC5jb20+CkNjOiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgpDYzogU2VhbiBOeWVramFl
ciA8c2VhbkBnZWFuaXguY29tPgpDYzogU3RlZmZlbiBUcnVtdHJhciA8cy50cnVtdHJhckBwZW5n
dXRyb25peC5kZT4KQ2M6IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnCkNjOiBrZXJuZWxAZGgt
ZWxlY3Ryb25pY3MuY29tCkNjOiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcK
Q2M6IGxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KLS0tCiBhcmNoL2Fy
bS9ib290L2R0cy9zdC9zdG0zMm1wMTMtcGluY3RybC5kdHNpIHwgMjEgKysrKysrKysrKysrKysr
KysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2Fy
Y2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxMy1waW5jdHJsLmR0c2kgYi9hcmNoL2FybS9ib290
L2R0cy9zdC9zdG0zMm1wMTMtcGluY3RybC5kdHNpCmluZGV4IGYyYjQxMTA0YTU4OWYuLmM2OTY3
ZTgyYjVkMmUgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxMy1waW5j
dHJsLmR0c2kKKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJtcDEzLXBpbmN0cmwuZHRz
aQpAQCAtNDkwLDYgKzQ5MCwyNyBAQCBwaW5zIHsKIAkJfTsKIAl9OwogCisJc2RtbWMyX2Q0N19w
aW5zX2E6IHNkbW1jMi1kNDctMCB7CisJCXBpbnMgeworCQkJcGlubXV4ID0gPFNUTTMyX1BJTk1V
WCgnRicsIDAsIEFGMTApPiwgLyogU0RNTUMyX0Q0ICovCisJCQkJIDxTVE0zMl9QSU5NVVgoJ0In
LCA5LCBBRjEwKT4sIC8qIFNETU1DMl9ENSAqLworCQkJCSA8U1RNMzJfUElOTVVYKCdDJywgNiwg
QUYxMCk+LCAvKiBTRE1NQzJfRDYgKi8KKwkJCQkgPFNUTTMyX1BJTk1VWCgnQycsIDcsIEFGMTAp
PjsgLyogU0RNTUMyX0Q3ICovCisJCQlzbGV3LXJhdGUgPSA8MT47CisJCQlkcml2ZS1wdXNoLXB1
bGw7CisJCQliaWFzLXB1bGwtdXA7CisJCX07CisJfTsKKworCXNkbW1jMl9kNDdfc2xlZXBfcGlu
c19hOiBzZG1tYzItZDQ3LXNsZWVwLTAgeworCQlwaW5zIHsKKwkJCXBpbm11eCA9IDxTVE0zMl9Q
SU5NVVgoJ0YnLCAwLCBBTkFMT0cpPiwgLyogU0RNTUMyX0Q0ICovCisJCQkJIDxTVE0zMl9QSU5N
VVgoJ0InLCA5LCBBTkFMT0cpPiwgLyogU0RNTUMyX0Q1ICovCisJCQkJIDxTVE0zMl9QSU5NVVgo
J0MnLCA2LCBBTkFMT0cpPiwgLyogU0RNTUMyX0Q2ICovCisJCQkJIDxTVE0zMl9QSU5NVVgoJ0Mn
LCA3LCBBTkFMT0cpPjsgLyogU0RNTUMyX0Q3ICovCisJCX07CisJfTsKKwogCXNwaTVfcGluc19h
OiBzcGk1LTAgewogCQlwaW5zMSB7CiAJCQlwaW5tdXggPSA8U1RNMzJfUElOTVVYKCdIJywgNywg
QUY2KT4sIC8qIFNQSTVfU0NLICovCi0tIAoyLjQzLjAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1z
dG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
