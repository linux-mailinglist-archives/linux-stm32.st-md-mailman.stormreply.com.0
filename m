Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A36D8AC245
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Apr 2024 02:20:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D55F2C7128D;
	Mon, 22 Apr 2024 00:20:39 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7F516C6DD6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Apr 2024 00:20:38 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 5D17388317;
 Mon, 22 Apr 2024 02:20:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1713745238;
 bh=cLz65tu7oIryFVFdGImU/XbVCYatXj5NdS5IucgGbHE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=srV/Op3RU+9V62Q4JOOb+R3aClsfyvI7V003O1kTqWu1C2ccO2/gkOPKRs2nXw9lC
 swP5ePaMCZBkvUWM1z4TpBZ+iJQlJl9uUPm+bBzBCelwHeWn1ixFSPWa3oVrsPRRMs
 QngnZIeniMKpDUfavqUIdy7FcizkLsypo6f/dt8IWNrZQjd86LDqCgcUTIHQkidAhf
 9/+kVYR3mIHLKbaDb8fw6Lqc1EEzDgBOByTzU9uaPXCRZDN1AnBG1lZ416VCF3EqiV
 TTBmJ/1nQRHRL4nHwnABNSmqM0F8BUo+CudPQYKHgcyRDfLbmDSjazBYfLgKl9KAu2
 hYfKYt+2lhnKQ==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Mon, 22 Apr 2024 02:19:19 +0200
Message-ID: <20240422002006.243687-5-marex@denx.de>
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
Subject: [Linux-stm32] [PATCH 05/20] ARM: dts: stm32: Add alternate pinmux
	for MP13 ETH2 pins
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

QWRkIGFub3RoZXIgbXV4IG9wdGlvbiBmb3IgRVRIMiBwaW5zLCB0aGlzIGlzIHVzZWQgb24KREgg
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
cy9zdC9zdG0zMm1wMTMtcGluY3RybC5kdHNpIHwgNDUgKysrKysrKysrKysrKysrKysrKysrCiAx
IGZpbGUgY2hhbmdlZCwgNDUgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jv
b3QvZHRzL3N0L3N0bTMybXAxMy1waW5jdHJsLmR0c2kgYi9hcmNoL2FybS9ib290L2R0cy9zdC9z
dG0zMm1wMTMtcGluY3RybC5kdHNpCmluZGV4IGM3MDlkNjRlZGNjMmQuLjg5OWYwZjk4ZTFhNjUg
MTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxMy1waW5jdHJsLmR0c2kK
KysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJtcDEzLXBpbmN0cmwuZHRzaQpAQCAtNzIs
NiArNzIsNTEgQEAgcGluczEgewogCQl9OwogCX07CiAKKwlldGgyX3JnbWlpX3BpbnNfYTogZXRo
Mi1yZ21paS0wIHsKKwkJcGluczEgeworCQkJcGlubXV4ID0gPFNUTTMyX1BJTk1VWCgnRicsIDcs
IEFGMTEpPiwgLyogRVRIX1JHTUlJX1RYRDAgKi8KKwkJCQkgPFNUTTMyX1BJTk1VWCgnRycsIDEx
LCBBRjEwKT4sIC8qIEVUSF9SR01JSV9UWEQxICovCisJCQkJIDxTVE0zMl9QSU5NVVgoJ0cnLCAx
LCBBRjEwKT4sIC8qIEVUSF9SR01JSV9UWEQyICovCisJCQkJIDxTVE0zMl9QSU5NVVgoJ0UnLCA2
LCBBRjExKT4sIC8qIEVUSF9SR01JSV9UWEQzICovCisJCQkJIDxTVE0zMl9QSU5NVVgoJ0YnLCA2
LCBBRjExKT4sIC8qIEVUSF9SR01JSV9UWF9DVEwgKi8KKwkJCQkgPFNUTTMyX1BJTk1VWCgnRycs
IDMsIEFGMTApPiwgLyogRVRIX1JHTUlJX0dUWF9DTEsgKi8KKwkJCQkgPFNUTTMyX1BJTk1VWCgn
QicsIDYsIEFGMTEpPiwgLyogRVRIX01ESU8gKi8KKwkJCQkgPFNUTTMyX1BJTk1VWCgnRycsIDUs
IEFGMTApPjsgLyogRVRIX01EQyAqLworCQkJYmlhcy1kaXNhYmxlOworCQkJZHJpdmUtcHVzaC1w
dWxsOworCQkJc2xldy1yYXRlID0gPDI+OworCQl9OworCisJCXBpbnMyIHsKKwkJCXBpbm11eCA9
IDxTVE0zMl9QSU5NVVgoJ0YnLCA0LCBBRjExKT4sIC8qIEVUSF9SR01JSV9SWEQwICovCisJCQkJ
IDxTVE0zMl9QSU5NVVgoJ0UnLCAyLCBBRjEwKT4sIC8qIEVUSF9SR01JSV9SWEQxICovCisJCQkJ
IDxTVE0zMl9QSU5NVVgoJ0gnLCA2LCBBRjEyKT4sIC8qIEVUSF9SR01JSV9SWEQyICovCisJCQkJ
IDxTVE0zMl9QSU5NVVgoJ0EnLCA4LCBBRjExKT4sIC8qIEVUSF9SR01JSV9SWEQzICovCisJCQkJ
IDxTVE0zMl9QSU5NVVgoJ0EnLCAxMiwgQUYxMSk+LCAvKiBFVEhfUkdNSUlfUlhfQ1RMICovCisJ
CQkJIDxTVE0zMl9QSU5NVVgoJ0gnLCAxMSwgQUYxMSk+OyAvKiBFVEhfUkdNSUlfUlhfQ0xLICov
CisJCQliaWFzLWRpc2FibGU7CisJCX07CisJfTsKKworCWV0aDJfcmdtaWlfc2xlZXBfcGluc19h
OiBldGgyLXJnbWlpLXNsZWVwLTAgeworCQlwaW5zMSB7CisJCQlwaW5tdXggPSA8U1RNMzJfUElO
TVVYKCdGJywgNywgQU5BTE9HKT4sIC8qIEVUSF9SR01JSV9UWEQwICovCisJCQkJIDxTVE0zMl9Q
SU5NVVgoJ0cnLCAxMSwgQU5BTE9HKT4sIC8qIEVUSF9SR01JSV9UWEQxICovCisJCQkJIDxTVE0z
Ml9QSU5NVVgoJ0cnLCAxMSwgQU5BTE9HKT4sIC8qIEVUSF9SR01JSV9UWEQyICovCisJCQkJIDxT
VE0zMl9QSU5NVVgoJ0cnLCAxMSwgQU5BTE9HKT4sIC8qIEVUSF9SR01JSV9UWEQzICovCisJCQkJ
IDxTVE0zMl9QSU5NVVgoJ0cnLCA4LCBBTkFMT0cpPiwgLyogRVRIX1JHTUlJX1RYX0NUTCAqLwor
CQkJCSA8U1RNMzJfUElOTVVYKCdGJywgNiwgQU5BTE9HKT4sIC8qIEVUSF9SR01JSV9HVFhfQ0xL
ICovCisJCQkJIDxTVE0zMl9QSU5NVVgoJ0InLCAyLCBBTkFMT0cpPiwgLyogRVRIX01ESU8gKi8K
KwkJCQkgPFNUTTMyX1BJTk1VWCgnRycsIDUsIEFOQUxPRyk+LCAvKiBFVEhfTURDICovCisJCQkJ
IDxTVE0zMl9QSU5NVVgoJ0YnLCA0LCBBTkFMT0cpPiwgLyogRVRIX1JHTUlJX1JYRDAgKi8KKwkJ
CQkgPFNUTTMyX1BJTk1VWCgnRScsIDIsIEFOQUxPRyk+LCAvKiBFVEhfUkdNSUlfUlhEMSAqLwor
CQkJCSA8U1RNMzJfUElOTVVYKCdFJywgMiwgQU5BTE9HKT4sIC8qIEVUSF9SR01JSV9SWEQyICov
CisJCQkJIDxTVE0zMl9QSU5NVVgoJ0UnLCAyLCBBTkFMT0cpPiwgLyogRVRIX1JHTUlJX1JYRDMg
Ki8KKwkJCQkgPFNUTTMyX1BJTk1VWCgnQScsIDEyLCBBTkFMT0cpPiwgLyogRVRIX1JHTUlJX1JY
X0NUTCAqLworCQkJCSA8U1RNMzJfUElOTVVYKCdIJywgMTEsIEFOQUxPRyk+OyAvKiBFVEhfUkdN
SUlfUlhfQ0xLICovCisJCX07CisJfTsKKwogCWkyYzFfcGluc19hOiBpMmMxLTAgewogCQlwaW5z
IHsKIAkJCXBpbm11eCA9IDxTVE0zMl9QSU5NVVgoJ0QnLCAxMiwgQUY1KT4sIC8qIEkyQzFfU0NM
ICovCi0tIAoyLjQzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
