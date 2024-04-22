Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD608AC24F
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Apr 2024 02:20:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1F416C71295;
	Mon, 22 Apr 2024 00:20:45 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6307EC71295
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Apr 2024 00:20:43 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 5FA7C88322;
 Mon, 22 Apr 2024 02:20:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1713745243;
 bh=n4GYbALNd/2MorrcpgvUqzzsCtxboqeR6gvjMLjRAjE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=H4VCGp8PhY2sqCSYrTf4sJ71C/RZXrmoIRzhsJfrSC37dBj2vOg8DjEPRA2Lp8zjU
 BQtqtAPWr0yujhTi+/fbEfJ0BEiEJaQlSiELMG7SxJt1CUEDa1Pj6f2HsSS4XStHrb
 HxuatD3JDjwBS5NZp/tY62DY+h5iIX3/R6cnQSC/Z9+G4CS07sPRFOK4HkEZGZOd5l
 VZI3kKQtL9E638tbG+6PUk1iGEvH+QJd54YOFWjsvl8BL+0twvgtKSxw1mWsh6MYhZ
 q7QZqADPLG/njRC/z07ddgtGtN65+7uNEUBuO10kCD5wa084V6PfqzUC7BpvXUsqXJ
 cRm7AHTTpYp0g==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Mon, 22 Apr 2024 02:19:25 +0200
Message-ID: <20240422002006.243687-11-marex@denx.de>
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
Subject: [Linux-stm32] [PATCH 11/20] ARM: dts: stm32: Add alternate pinmux
	for MP13 QSPI pins
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

QWRkIGFub3RoZXIgbXV4IG9wdGlvbiBmb3IgUVNQSSBwaW5zLCB0aGlzIGlzIHVzZWQgb24KREgg
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
cy9zdC9zdG0zMm1wMTMtcGluY3RybC5kdHNpIHwgNTEgKysrKysrKysrKysrKysrKysrKysrCiAx
IGZpbGUgY2hhbmdlZCwgNTEgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jv
b3QvZHRzL3N0L3N0bTMybXAxMy1waW5jdHJsLmR0c2kgYi9hcmNoL2FybS9ib290L2R0cy9zdC9z
dG0zMm1wMTMtcGluY3RybC5kdHNpCmluZGV4IGNmMDcwZmJkN2Y3MDguLjc3YTIyMjkwM2RlODQg
MTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxMy1waW5jdHJsLmR0c2kK
KysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJtcDEzLXBpbmN0cmwuZHRzaQpAQCAtMzA1
LDYgKzMwNSw1NyBAQCBwaW5zIHsKIAkJfTsKIAl9OwogCisJcXNwaV9jbGtfcGluc19hOiBxc3Bp
LWNsay0wIHsKKwkJcGlucyB7CisJCQlwaW5tdXggPSA8U1RNMzJfUElOTVVYKCdGJywgMTAsIEFG
OSk+OyAvKiBRU1BJX0NMSyAqLworCQkJYmlhcy1kaXNhYmxlOworCQkJZHJpdmUtcHVzaC1wdWxs
OworCQkJc2xldy1yYXRlID0gPDM+OworCQl9OworCX07CisKKwlxc3BpX2Nsa19zbGVlcF9waW5z
X2E6IHFzcGktY2xrLXNsZWVwLTAgeworCQlwaW5zIHsKKwkJCXBpbm11eCA9IDxTVE0zMl9QSU5N
VVgoJ0YnLCAxMCwgQU5BTE9HKT47IC8qIFFTUElfQ0xLICovCisJCX07CisJfTsKKworCXFzcGlf
YmsxX3BpbnNfYTogcXNwaS1iazEtMCB7CisJCXBpbnMgeworCQkJcGlubXV4ID0gPFNUTTMyX1BJ
Tk1VWCgnRicsIDgsIEFGMTApPiwgLyogUVNQSV9CSzFfSU8wICovCisJCQkJIDxTVE0zMl9QSU5N
VVgoJ0YnLCA5LCBBRjEwKT4sIC8qIFFTUElfQksxX0lPMSAqLworCQkJCSA8U1RNMzJfUElOTVVY
KCdEJywgMTEsIEFGOSk+LCAvKiBRU1BJX0JLMV9JTzIgKi8KKwkJCQkgPFNUTTMyX1BJTk1VWCgn
SCcsIDcsIEFGMTMpPjsgLyogUVNQSV9CSzFfSU8zICovCisJCQliaWFzLWRpc2FibGU7CisJCQlk
cml2ZS1wdXNoLXB1bGw7CisJCQlzbGV3LXJhdGUgPSA8MT47CisJCX07CisJfTsKKworCXFzcGlf
YmsxX3NsZWVwX3BpbnNfYTogcXNwaS1iazEtc2xlZXAtMCB7CisJCXBpbnMgeworCQkJcGlubXV4
ID0gPFNUTTMyX1BJTk1VWCgnRicsIDgsIEFOQUxPRyk+LCAvKiBRU1BJX0JLMV9JTzAgKi8KKwkJ
CQkgPFNUTTMyX1BJTk1VWCgnRicsIDksIEFOQUxPRyk+LCAvKiBRU1BJX0JLMV9JTzEgKi8KKwkJ
CQkgPFNUTTMyX1BJTk1VWCgnRCcsIDExLCBBTkFMT0cpPiwgLyogUVNQSV9CSzFfSU8yICovCisJ
CQkJIDxTVE0zMl9QSU5NVVgoJ0gnLCA3LCBBTkFMT0cpPjsgLyogUVNQSV9CSzFfSU8zICovCisJ
CX07CisJfTsKKworCXFzcGlfY3MxX3BpbnNfYTogcXNwaS1jczEtMCB7CisJCXBpbnMgeworCQkJ
cGlubXV4ID0gPFNUTTMyX1BJTk1VWCgnQicsIDIsIEFGOSk+OyAvKiBRU1BJX0JLMV9OQ1MgKi8K
KwkJCWJpYXMtcHVsbC11cDsKKwkJCWRyaXZlLXB1c2gtcHVsbDsKKwkJCXNsZXctcmF0ZSA9IDwx
PjsKKwkJfTsKKwl9OworCisJcXNwaV9jczFfc2xlZXBfcGluc19hOiBxc3BpLWNzMS1zbGVlcC0w
IHsKKwkJcGlucyB7CisJCQlwaW5tdXggPSA8U1RNMzJfUElOTVVYKCdCJywgMiwgQU5BTE9HKT47
IC8qIFFTUElfQksxX05DUyAqLworCQl9OworCX07CisKIAlzZG1tYzFfYjRfcGluc19hOiBzZG1t
YzEtYjQtMCB7CiAJCXBpbnMgewogCQkJcGlubXV4ID0gPFNUTTMyX1BJTk1VWCgnQycsIDgsIEFG
MTIpPiwgLyogU0RNTUMxX0QwICovCi0tIAoyLjQzLjAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1z
dG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
