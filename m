Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B178AC244
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Apr 2024 02:20:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C7FC2C7128B;
	Mon, 22 Apr 2024 00:20:39 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 963F1C6DD6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Apr 2024 00:20:37 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 8B89788315;
 Mon, 22 Apr 2024 02:20:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1713745237;
 bh=qeRy0w03GTRuo56r++jk03MGcyr7f3pdXI4GeYHlGbI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ak3olcg9RCLvtP32cFNv7Wz8mxRW7I6fDGvt4/VBBpIhZFXwe/pvqRBpdlSwsRDyk
 TQSSmvNpnbI5hCj50VOwWcOGkekGP662dNTLO8lkvl6ULpPsOTS9+ZC+5LCpCjaRt1
 dtrzRZ6kGWYfSLCGJ2me5/JZHCDJsJdLiXi41unGcossl6+DxWkH2GFPGRC1nHm1Eb
 3TwN3yW1e4MNkK5C+tNv78NyV7SgzCEl7GENPCmPmX32Zpz6luPYiR5evmGhBoaJai
 V3Uj6NbfeGFP5ZaBoJzcJbW971+vyK8kC9MCTXKtO9V8hQNvBcUQuW/6dmvhNrPvhS
 TQ4Rir93Pt2Kw==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Mon, 22 Apr 2024 02:19:18 +0200
Message-ID: <20240422002006.243687-4-marex@denx.de>
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
Subject: [Linux-stm32] [PATCH 04/20] ARM: dts: stm32: Add alternate pinmux
	for MP13 ETH1 pins
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

QWRkIGFub3RoZXIgbXV4IG9wdGlvbiBmb3IgRVRIMSBwaW5zLCB0aGlzIGlzIHVzZWQgb24KREgg
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
cy9zdC9zdG0zMm1wMTMtcGluY3RybC5kdHNpIHwgNDYgKysrKysrKysrKysrKysrKysrKysrCiAx
IGZpbGUgY2hhbmdlZCwgNDYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jv
b3QvZHRzL3N0L3N0bTMybXAxMy1waW5jdHJsLmR0c2kgYi9hcmNoL2FybS9ib290L2R0cy9zdC9z
dG0zMm1wMTMtcGluY3RybC5kdHNpCmluZGV4IDM5NmZiNmVlZTg0MTIuLmM3MDlkNjRlZGNjMmQg
MTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxMy1waW5jdHJsLmR0c2kK
KysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJtcDEzLXBpbmN0cmwuZHRzaQpAQCAtMjYs
NiArMjYsNTIgQEAgcGlucyB7CiAJCX07CiAJfTsKIAorCWV0aDFfcmdtaWlfcGluc19hOiBldGgx
LXJnbWlpLTAgeworCQlwaW5zMSB7CisJCQlwaW5tdXggPSA8U1RNMzJfUElOTVVYKCdHJywgMTMs
IEFGMTEpPiwgLyogRVRIX1JHTUlJX1RYRDAgKi8KKwkJCQkgPFNUTTMyX1BJTk1VWCgnRycsIDE0
LCBBRjExKT4sIC8qIEVUSF9SR01JSV9UWEQxICovCisJCQkJIDxTVE0zMl9QSU5NVVgoJ0MnLCAy
LCBBRjExKT4sIC8qIEVUSF9SR01JSV9UWEQyICovCisJCQkJIDxTVE0zMl9QSU5NVVgoJ0UnLCA1
LCBBRjEwKT4sIC8qIEVUSF9SR01JSV9UWEQzICovCisJCQkJIDxTVE0zMl9QSU5NVVgoJ0InLCAx
MSwgQUYxMSk+LCAvKiBFVEhfUkdNSUlfVFhfQ1RMICovCisJCQkJIDxTVE0zMl9QSU5NVVgoJ0Mn
LCAxLCBBRjExKT4sIC8qIEVUSF9SR01JSV9HVFhfQ0xLICovCisJCQkJIDxTVE0zMl9QSU5NVVgo
J0EnLCAyLCBBRjExKT4sIC8qIEVUSF9NRElPICovCisJCQkJIDxTVE0zMl9QSU5NVVgoJ0cnLCAy
LCBBRjExKT47IC8qIEVUSF9NREMgKi8KKwkJCWJpYXMtZGlzYWJsZTsKKwkJCWRyaXZlLXB1c2gt
cHVsbDsKKwkJCXNsZXctcmF0ZSA9IDwyPjsKKwkJfTsKKworCQlwaW5zMiB7CisJCQlwaW5tdXgg
PSA8U1RNMzJfUElOTVVYKCdDJywgNCwgQUYxMSk+LCAvKiBFVEhfUkdNSUlfUlhEMCAqLworCQkJ
CSA8U1RNMzJfUElOTVVYKCdDJywgNSwgQUYxMSk+LCAvKiBFVEhfUkdNSUlfUlhEMSAqLworCQkJ
CSA8U1RNMzJfUElOTVVYKCdCJywgMCwgQUYxMSk+LCAvKiBFVEhfUkdNSUlfUlhEMiAqLworCQkJ
CSA8U1RNMzJfUElOTVVYKCdCJywgMSwgQUYxMSk+LCAvKiBFVEhfUkdNSUlfUlhEMyAqLworCQkJ
CSA8U1RNMzJfUElOTVVYKCdBJywgNywgQUYxMSk+LCAvKiBFVEhfUkdNSUlfUlhfQ1RMICovCisJ
CQkJIDxTVE0zMl9QSU5NVVgoJ0QnLCA3LCBBRjEwKT47IC8qIEVUSF9SR01JSV9SWF9DTEsgKi8K
KwkJCWJpYXMtZGlzYWJsZTsKKwkJfTsKKworCX07CisKKwlldGgxX3JnbWlpX3NsZWVwX3BpbnNf
YTogZXRoMS1yZ21paS1zbGVlcC0wIHsKKwkJcGluczEgeworCQkJcGlubXV4ID0gPFNUTTMyX1BJ
Tk1VWCgnRycsIDEzLCBBTkFMT0cpPiwgLyogRVRIX1JHTUlJX1RYRDAgKi8KKwkJCQkgPFNUTTMy
X1BJTk1VWCgnRycsIDE0LCBBTkFMT0cpPiwgLyogRVRIX1JHTUlJX1RYRDEgKi8KKwkJCQkgPFNU
TTMyX1BJTk1VWCgnQycsIDIsIEFOQUxPRyk+LCAvKiBFVEhfUkdNSUlfVFhEMiAqLworCQkJCSA8
U1RNMzJfUElOTVVYKCdFJywgNSwgQU5BTE9HKT4sIC8qIEVUSF9SR01JSV9UWEQzICovCisJCQkJ
IDxTVE0zMl9QSU5NVVgoJ0InLCAxMSwgQU5BTE9HKT4sIC8qIEVUSF9SR01JSV9UWF9DVEwgKi8K
KwkJCQkgPFNUTTMyX1BJTk1VWCgnQycsIDEsIEFOQUxPRyk+LCAvKiBFVEhfUkdNSUlfR1RYX0NM
SyAqLworCQkJCSA8U1RNMzJfUElOTVVYKCdBJywgMiwgQU5BTE9HKT4sIC8qIEVUSF9NRElPICov
CisJCQkJIDxTVE0zMl9QSU5NVVgoJ0cnLCAyLCBBTkFMT0cpPiwgLyogRVRIX01EQyAqLworCQkJ
CSA8U1RNMzJfUElOTVVYKCdDJywgNCwgQU5BTE9HKT4sIC8qIEVUSF9SR01JSV9SWEQwICovCisJ
CQkJIDxTVE0zMl9QSU5NVVgoJ0MnLCA1LCBBTkFMT0cpPiwgLyogRVRIX1JHTUlJX1JYRDEgKi8K
KwkJCQkgPFNUTTMyX1BJTk1VWCgnQicsIDAsIEFOQUxPRyk+LCAvKiBFVEhfUkdNSUlfUlhEMSAq
LworCQkJCSA8U1RNMzJfUElOTVVYKCdCJywgMSwgQU5BTE9HKT4sIC8qIEVUSF9SR01JSV9SWEQx
ICovCisJCQkJIDxTVE0zMl9QSU5NVVgoJ0EnLCA3LCBBTkFMT0cpPiwgLyogRVRIX1JHTUlJX1JY
X0NUTCAqLworCQkJCSA8U1RNMzJfUElOTVVYKCdEJywgNywgQU5BTE9HKT47IC8qIEVUSF9SR01J
SV9SWF9DTEsgKi8KKwkJfTsKKwl9OworCiAJaTJjMV9waW5zX2E6IGkyYzEtMCB7CiAJCXBpbnMg
ewogCQkJcGlubXV4ID0gPFNUTTMyX1BJTk1VWCgnRCcsIDEyLCBBRjUpPiwgLyogSTJDMV9TQ0wg
Ki8KLS0gCjIuNDMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxt
YW4vbGlzdGluZm8vbGludXgtc3RtMzIK
