Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 822388AC258
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Apr 2024 02:20:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 44E5FC71298;
	Mon, 22 Apr 2024 00:20:49 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A38A1C71289
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Apr 2024 00:20:46 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id AC97288311;
 Mon, 22 Apr 2024 02:20:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1713745246;
 bh=hLqi1reObWKPU10UZK88JvmIk14Vm7wyGJm1oop9fIU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pEgWTTc7qj+cezl8dvjwBf5X9XiCjBJNC6NNmvE1/TVL9v5UjhsTzziZILk+WHtaX
 UAtbCCWY6MZKg5k8GKnq8lM2/vz6lL+azPLc+7m34TWx0l0Hvwvbw853l8VVDZX7Zt
 sJeAiJ0wysdy4/gigN+Aza569FsO9Z1O+5o7CnDkCBZLT1779zR1c0ZSj781KeFEda
 bx7ezxcN1VS7BLkwdPwjebfMJzVxz9/dqqjRV0US+VvqHIXgOXl9Lkm7dF+xuIHCcl
 H1+KcwqvYruaMZqQ0Lrb4cIXCxfWC9iU97X2kxmBc2C752znZJhAA0gcH+VXESZdVR
 UOyjvF8mxtLCQ==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Mon, 22 Apr 2024 02:19:29 +0200
Message-ID: <20240422002006.243687-15-marex@denx.de>
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
Subject: [Linux-stm32] [PATCH 15/20] ARM: dts: stm32: Add alternate pinmux
	for MP13 SPI3 pins
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

QWRkIGFub3RoZXIgbXV4IG9wdGlvbiBmb3IgU1BJMyBwaW5zLCB0aGlzIGlzIHVzZWQgb24KREgg
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
cy9zdC9zdG0zMm1wMTMtcGluY3RybC5kdHNpIHwgMjMgKysrKysrKysrKysrKysrKysrKysrCiAx
IGZpbGUgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jv
b3QvZHRzL3N0L3N0bTMybXAxMy1waW5jdHJsLmR0c2kgYi9hcmNoL2FybS9ib290L2R0cy9zdC9z
dG0zMm1wMTMtcGluY3RybC5kdHNpCmluZGV4IDE3YWNkMjg1MGQzODEuLjdhYmQyMjdlNjlmNGIg
MTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxMy1waW5jdHJsLmR0c2kK
KysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJtcDEzLXBpbmN0cmwuZHRzaQpAQCAtNTM0
LDYgKzUzNCwyOSBAQCBwaW5zIHsKIAkJfTsKIAl9OwogCisJc3BpM19waW5zX2E6IHNwaTMtMCB7
CisJCXBpbnMxIHsKKwkJCXBpbm11eCA9IDxTVE0zMl9QSU5NVVgoJ0gnLCAxMywgQUY2KT4sIC8q
IFNQSTNfU0NLICovCisJCQkJIDxTVE0zMl9QSU5NVVgoJ0YnLCAxLCBBRjUpPjsgLyogU1BJM19N
T1NJICovCisJCQliaWFzLWRpc2FibGU7CisJCQlkcml2ZS1wdXNoLXB1bGw7CisJCQlzbGV3LXJh
dGUgPSA8MT47CisJCX07CisKKwkJcGluczIgeworCQkJcGlubXV4ID0gPFNUTTMyX1BJTk1VWCgn
RCcsIDQsIEFGNSk+OyAvKiBTUEkzX01JU08gKi8KKwkJCWJpYXMtZGlzYWJsZTsKKwkJfTsKKwl9
OworCisJc3BpM19zbGVlcF9waW5zX2E6IHNwaTMtc2xlZXAtMCB7CisJCXBpbnMgeworCQkJcGlu
bXV4ID0gPFNUTTMyX1BJTk1VWCgnSCcsIDEzLCBBTkFMT0cpPiwgLyogU1BJM19TQ0sgKi8KKwkJ
CQkgPFNUTTMyX1BJTk1VWCgnRCcsIDQsIEFOQUxPRyk+LCAvKiBTUEkzX01JU08gKi8KKwkJCQkg
PFNUTTMyX1BJTk1VWCgnRicsIDEsIEFOQUxPRyk+OyAvKiBTUEkzX01PU0kgKi8KKwkJfTsKKwl9
OworCiAJc3BpNV9waW5zX2E6IHNwaTUtMCB7CiAJCXBpbnMxIHsKIAkJCXBpbm11eCA9IDxTVE0z
Ml9QSU5NVVgoJ0gnLCA3LCBBRjYpPiwgLyogU1BJNV9TQ0sgKi8KLS0gCjIuNDMuMAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFp
bGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6
Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3Rt
MzIK
