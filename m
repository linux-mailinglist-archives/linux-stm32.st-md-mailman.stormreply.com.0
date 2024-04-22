Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 265278AC246
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Apr 2024 02:20:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DE317C7128F;
	Mon, 22 Apr 2024 00:20:40 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 35D70C6DD6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Apr 2024 00:20:39 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 37D5688318;
 Mon, 22 Apr 2024 02:20:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1713745238;
 bh=xYvtAo2O+N5eSt50prXAdT42njIXWjFhrOcqZUALOOo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=zLh4WPSU4tfhCfQS/jqeFmqPsI+nJHtXDhErPb91yGZnMG0/YjYhk63DdTEAUlZ9O
 rQGQwqlu3jJ9Ck6NCFWLgzWjmJ4TXK7CzhZI914QB6MFFSs/glYDRzviOVSjn99xEL
 F5CYm1Uz3aM1DtLRMEcjNLc0Im8ow1PElHxyWpMU7eqcPaQ1ePrRj3LTDYQ5mKqsFC
 tq6IVuLzHOOOhct3yH6FIZO9//in0sHTJ9hJn/tItA9M5Rs9n/IZH9UNOhqyqAe/C0
 FH2g4KxnQwfPNmP7tYTfyf/ztMeNk1sV4T9FWl2PBzNXhedXqN4UdYKIfVASFVBm5R
 pLM3+62ka0Pqg==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Mon, 22 Apr 2024 02:19:20 +0200
Message-ID: <20240422002006.243687-6-marex@denx.de>
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
Subject: [Linux-stm32] [PATCH 06/20] ARM: dts: stm32: Add alternate pinmux
	for MP13 I2C5 pins
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

QWRkIGFub3RoZXIgbXV4IG9wdGlvbiBmb3IgSTJDNSBwaW5zLCB0aGlzIGlzIHVzZWQgb24KREgg
ZWxlY3Ryb25pY3MgU1RNMzJNUDEzeHggREhDT1IgREhTQkMgYm9hcmQuCgpTaWduZWQtb2ZmLWJ5
OiBNYXJlayBWYXN1dCA8bWFyZXhAZGVueC5kZT4KLS0tCkNjOiAiTGVvbmFyZCBHw7ZocnMiIDxs
LmdvZWhyc0BwZW5ndXRyb25peC5kZT4KQ2M6IEFobWFkIEZhdG91bSA8YS5mYXRvdW1AcGVuZ3V0
cm9uaXguZGU+CkNjOiBBbGV4YW5kcmUgVG9yZ3VlIDxhbGV4YW5kcmUudG9yZ3VlQGZvc3Muc3Qu
Y29tPgpDYzogQW5kcmUgUHJ6eXdhcmEgPGFuZHJlLnByenl3YXJhQGFybS5jb20+CkNjOiBDb25v
ciBEb29sZXkgPGNvbm9yK2R0QGtlcm5lbC5vcmc+CkNjOiBEYXJpbyBCaW5hY2NoaSA8ZGFyaW8u
YmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20+CkNjOiBLcnp5c3p0b2YgS296bG93c2tpIDxr
cnprK2R0QGtlcm5lbC5vcmc+CkNjOiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFy
by5vcmc+CkNjOiBNYXhpbWUgQ29xdWVsaW4gPG1jb3F1ZWxpbi5zdG0zMkBnbWFpbC5jb20+CkNj
OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgpDYzogU2VhbiBOeWVramFlciA8c2VhbkBn
ZWFuaXguY29tPgpDYzogU3RlZmZlbiBUcnVtdHJhciA8cy50cnVtdHJhckBwZW5ndXRyb25peC5k
ZT4KQ2M6IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnCkNjOiBrZXJuZWxAZGgtZWxlY3Ryb25p
Y3MuY29tCkNjOiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKQ2M6IGxpbnV4
LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KLS0tCiBhcmNoL2FybS9ib290L2R0
cy9zdC9zdG0zMm1wMTMtcGluY3RybC5kdHNpIHwgMTcgKysrKysrKysrKysrKysrKysKIDEgZmls
ZSBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9k
dHMvc3Qvc3RtMzJtcDEzLXBpbmN0cmwuZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMy
bXAxMy1waW5jdHJsLmR0c2kKaW5kZXggODk5ZjBmOThlMWE2NS4uY2ZiYWU3MWVmYzcyOSAxMDA2
NDQKLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJtcDEzLXBpbmN0cmwuZHRzaQorKysg
Yi9hcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTMtcGluY3RybC5kdHNpCkBAIC0xNTEsNiAr
MTUxLDIzIEBAIHBpbnMgewogCQl9OwogCX07CiAKKwlpMmM1X3BpbnNfYjogaTJjNS0xIHsKKwkJ
cGlucyB7CisJCQlwaW5tdXggPSA8U1RNMzJfUElOTVVYKCdEJywgMSwgQUY0KT4sIC8qIEkyQzVf
U0NMICovCisJCQkJIDxTVE0zMl9QSU5NVVgoJ0UnLCAxMywgQUY0KT47IC8qIEkyQzVfU0RBICov
CisJCQliaWFzLWRpc2FibGU7CisJCQlkcml2ZS1vcGVuLWRyYWluOworCQkJc2xldy1yYXRlID0g
PDA+OworCQl9OworCX07CisKKwlpMmM1X3NsZWVwX3BpbnNfYjogaTJjNS1zbGVlcC0xIHsKKwkJ
cGlucyB7CisJCQlwaW5tdXggPSA8U1RNMzJfUElOTVVYKCdEJywgMSwgQU5BTE9HKT4sIC8qIEky
QzVfU0NMICovCisJCQkJIDxTVE0zMl9QSU5NVVgoJ0UnLCAxMywgQU5BTE9HKT47IC8qIEkyQzVf
U0RBICovCisJCX07CisJfTsKKwogCW1jcDIzMDE3X3BpbnNfYTogbWNwMjMwMTctMCB7CiAJCXBp
bnMgewogCQkJcGlubXV4ID0gPFNUTTMyX1BJTk1VWCgnRycsIDEyLCBHUElPKT47Ci0tIAoyLjQz
LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXN0bTMyCg==
