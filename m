Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F35D8AC250
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Apr 2024 02:20:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 27A6BC71297;
	Mon, 22 Apr 2024 00:20:45 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 31A77C71289
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Apr 2024 00:20:44 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 36DA788326;
 Mon, 22 Apr 2024 02:20:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1713745243;
 bh=NWdFhzJIvwLt1pbVmuhZ9xKmgIt7HxmToICIeaqWs4w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SdLjqLRpOI70s5aDUTyEaq3jO093W6emYZtTrvVaGjJxrc/nDelniu00nl2qmqfPZ
 afJLk/QoeUi/RQJsSfhl2BlOPy6imEF72YS8KhM1tC3VqX/kdK5S3afwjgQODqQe2V
 mV9+bU+s0TWDdFm5qjA/dxnam6caJkoExn5cPNIMdqQwI+pw7/hfcjFRm0I/qpXOYH
 FZ7zn6WuSkvxNBM0ovhAto0jBlHDyL+KA1dzovA9K/RVEoKPvkbNi+wJVDJ/65Lzqf
 PoTso8h2y9dZ3oUv4VTTtnKLUXtZ/QwPOm3HNO3Z0oJeFlDhT7tGilaUhhZ0/kiPCb
 Wc1lpxyQUjmqQ==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Mon, 22 Apr 2024 02:19:26 +0200
Message-ID: <20240422002006.243687-12-marex@denx.de>
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
Subject: [Linux-stm32] [PATCH 12/20] ARM: dts: stm32: Add alternate pinmux
	for MP13 SAI1 pins
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

QWRkIGFub3RoZXIgbXV4IG9wdGlvbiBmb3IgU0FJMSBwaW5zLCB0aGlzIGlzIHVzZWQgb24KREgg
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
cy9zdC9zdG0zMm1wMTMtcGluY3RybC5kdHNpIHwgMzIgKysrKysrKysrKysrKysrKysrKysrCiAx
IGZpbGUgY2hhbmdlZCwgMzIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jv
b3QvZHRzL3N0L3N0bTMybXAxMy1waW5jdHJsLmR0c2kgYi9hcmNoL2FybS9ib290L2R0cy9zdC9z
dG0zMm1wMTMtcGluY3RybC5kdHNpCmluZGV4IDc3YTIyMjkwM2RlODQuLmYyYjQxMTA0YTU4OWYg
MTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxMy1waW5jdHJsLmR0c2kK
KysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJtcDEzLXBpbmN0cmwuZHRzaQpAQCAtMzU2
LDYgKzM1NiwzOCBAQCBwaW5zIHsKIAkJfTsKIAl9OwogCisJc2FpMWFfcGluc19hOiBzYWkxYS0w
IHsKKwkJcGlucyB7CisJCQlwaW5tdXggPSA8U1RNMzJfUElOTVVYKCdBJywgNCwgQUYxMik+LCAv
KiBTQUkxX1NDS19BICovCisJCQkJIDxTVE0zMl9QSU5NVVgoJ0QnLCA2LCBBRjYpPiwgLyogU0FJ
MV9TRF9BICovCisJCQkJIDxTVE0zMl9QSU5NVVgoJ0UnLCAxMSwgQUY2KT47IC8qIFNBSTFfRlNf
QSAqLworCQkJc2xldy1yYXRlID0gPDA+OworCQkJZHJpdmUtcHVzaC1wdWxsOworCQkJYmlhcy1k
aXNhYmxlOworCQl9OworCX07CisKKwlzYWkxYV9zbGVlcF9waW5zX2E6IHNhaTFhLXNsZWVwLTAg
eworCQlwaW5zIHsKKwkJCXBpbm11eCA9IDxTVE0zMl9QSU5NVVgoJ0EnLCA0LCBBTkFMT0cpPiwg
LyogU0FJMV9TQ0tfQSAqLworCQkJCSA8U1RNMzJfUElOTVVYKCdEJywgNiwgQU5BTE9HKT4sIC8q
IFNBSTFfU0RfQSAqLworCQkJCSA8U1RNMzJfUElOTVVYKCdFJywgMTEsIEFOQUxPRyk+OyAvKiBT
QUkxX0ZTX0EgKi8KKwkJfTsKKwl9OworCisJc2FpMWJfcGluc19hOiBzYWkxYi0wIHsKKwkJcGlu
cyB7CisJCQlwaW5tdXggPSA8U1RNMzJfUElOTVVYKCdBJywgMCwgQUY2KT47IC8qIFNBSTFfU0Rf
QiAqLworCQkJYmlhcy1kaXNhYmxlOworCQl9OworCX07CisKKwlzYWkxYl9zbGVlcF9waW5zX2E6
IHNhaTFiLXNsZWVwLTAgeworCQlwaW5zIHsKKwkJCXBpbm11eCA9IDxTVE0zMl9QSU5NVVgoJ0En
LCAwLCBBTkFMT0cpPjsgLyogU0FJMV9TRF9CICovCisJCX07CisJfTsKKwogCXNkbW1jMV9iNF9w
aW5zX2E6IHNkbW1jMS1iNC0wIHsKIAkJcGlucyB7CiAJCQlwaW5tdXggPSA8U1RNMzJfUElOTVVY
KCdDJywgOCwgQUYxMik+LCAvKiBTRE1NQzFfRDAgKi8KLS0gCjIuNDMuMAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBs
aXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
