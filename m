Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 27FB28887E7
	for <lists+linux-stm32@lfdr.de>; Mon, 25 Mar 2024 03:13:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CA4F0C6B444;
	Mon, 25 Mar 2024 02:13:12 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6F477C6907A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Mar 2024 02:13:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 9561FCE0F95;
 Mon, 25 Mar 2024 02:13:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 76189C43394;
 Mon, 25 Mar 2024 02:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711332787;
 bh=aJvg1KH6joFG6oJkgTHoc61lNEcN6UYDL94Kek/0h5A=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=bUL61oDb/M+5KYmdH9GZAQdZT3PYKaJ010SbGP/0QAETJ2gY+Rxd19+hfItokn4fc
 qXm+5UshaVvnLaKO+h8US6GsQq7XoxEkTJDEVJIEaNCFv8M2uUBhoQrMAu3fisTCQo
 B4fRFMNeMscSki123E/z54cBRXf+v5p5HhYpLJ3jJtc1OvR7VQslOwZ36RRz8NHOez
 HFUH5lzzeG0rrZGBHCyr2OTeNZB2H2sILwj6OEqE53Bfd2qCAI/Z34pAg9I1JWd2Cn
 dq/bNtJWoCPVpzv9DjBiOxvAIfXazxrFfLBNOkzXYWWq5P+zSQavVa4Lgiia++T7N2
 7rjlBqvf/ljRg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 5AFA0D2D0E0; Mon, 25 Mar 2024 02:13:07 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: <171133278736.9916.5526869645378949035.git-patchwork-notify@kernel.org>
Date: Mon, 25 Mar 2024 02:13:07 +0000
References: <cover.1707900770.git.u.kleine-koenig@pengutronix.de>
In-Reply-To: <cover.1707900770.git.u.kleine-koenig@pengutronix.de>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=3Cu=2Ekleine-koenig=40pengutronix=2Ede=3E?=@ci.codeaurora.org
Cc: heiko@sntech.de, linus.walleij@linaro.org, dri-devel@lists.freedesktop.org,
 conor.dooley@microchip.com, pavel@ucw.cz, nobuhiro1.iwamatsu@toshiba.co.jp,
 linux-stm32@st-md-mailman.stormreply.com, jbrunet@baylibre.com,
 linux-samsung-soc@vger.kernel.org, rfoss@kernel.org, samuel@sholland.org,
 sean.anderson@seco.com, khilman@baylibre.com, hammerh0314@gmail.com,
 linux-imx@nxp.com, linux-sunxi@lists.linux.dev, s.hauer@pengutronix.de,
 andy@kernel.org, elder@kernel.org, sbranden@broadcom.com,
 daire.mcnamara@microchip.com, gregkh@linuxfoundation.org,
 kernel@pengutronix.de, linux-hardening@vger.kernel.org,
 alexandre.belloni@bootlin.com, mwalle@kernel.org, alim.akhtar@samsung.com,
 linux-doc@vger.kernel.org, thierry.reding@gmail.com, james.clark@arm.com,
 groeck@chromium.org, chrome-platform@lists.linux.dev,
 quic_bjorande@quicinc.com, zhang.lyra@gmail.com, brgl@bgdev.pl, lee@kernel.org,
 jonathanh@nvidia.com, linux-rockchip@lists.infradead.org,
 martin.blumenstingl@googlemail.com, mripard@kernel.org,
 linux-gpio@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, michal.simek@amd.com,
 linux-arm-kernel@lists.infradead.org, neil.armstrong@linaro.org,
 greybus-dev@lists.linaro.org, marcan@marcan.st, dianders@chromium.org,
 mcoquelin.stm32@gmail.com, gustavoars@kernel.org, Jonathan.Cameron@huawei.com,
 platform-driver-x86@vger.kernel.org, linux-tegra@vger.kernel.org,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com, festevam@gmail.com,
 alyssa@rosenzweig.io, robh@kernel.org, shc_work@mail.ru, corbet@lwn.net,
 mika.westerberg@linux.intel.com, linux-staging@lists.linux.dev,
 jernej.skrabec@gmail.com, wens@csie.org, bcm-kernel-feedback-list@broadcom.com,
 ilpo.jarvinen@linux.intel.com, p.zabel@pengutronix.de,
 linux-pwm@vger.kernel.org, keescook@chromium.org, jonas@kwiboo.se,
 rjui@broadcom.com, j.neuschaefer@gmx.net, vz@mleia.com, broonie@kernel.org,
 baolin.wang@linux.alibaba.com, orsonzhai@gmail.com, bleung@chromium.org,
 claudiu.beznea@tuxon.dev, asahi@lists.linux.dev, shawnguo@kernel.org,
 quic_amelende@quicinc.com, linux-mips@vger.kernel.org, paul@crapouillou.net,
 linux-riscv@lists.infradead.org, airlied@gmail.com, linux-leds@vger.kernel.org,
 florian.fainelli@broadcom.com, daniel@ffwll.ch, sven@svenpeter.dev,
 maarten.lankhorst@linux.intel.com, johan@kernel.org, hdegoede@redhat.com,
 linux-mediatek@lists.infradead.org, paul.walmsley@sifive.com,
 matthias.bgg@gmail.com, andriy.shevchenko@linux.intel.com,
 angelogioacchino.delregno@collabora.com, nicolas.ferre@microchip.com,
 krzysztof.kozlowski@linaro.org, palmer@dabbelt.com, tzimmermann@suse.de
Subject: Re: [Linux-stm32] [PATCH v6 000/164] pwm: Improve lifetime tracking
	for pwm_chips
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

SGVsbG86CgpUaGlzIHNlcmllcyB3YXMgYXBwbGllZCB0byBjaHJvbWUtcGxhdGZvcm0vbGludXgu
Z2l0IChmb3ItbmV4dCkKYnkgVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5n
dXRyb25peC5kZT46CgpPbiBXZWQsIDE0IEZlYiAyMDI0IDEwOjMwOjQ3ICswMTAwIHlvdSB3cm90
ZToKPiBIZWxsbywKPiAKPiB0aGlzIGlzIHY2IG9mIHRoZSBzZXJpZXMgaW50cm9kdWNpbmcgYmV0
dGVyIGxpZmV0aW1lIHRyYWNraW5nIGZvcgo+IHB3bWNoaXBzIHRoYXQgYWRkcmVzc2VzIChmb3Ig
bm93IHRoZW9yZXRpYykgbGlmZXRpbWUgaXNzdWVzIG9mIHB3bQo+IGNoaXBzLiBBZGRyZXNzaW5n
IHRoZXNlIGlzIGEgbmVjZXNzYXJ5IHByZWNvbmRpdGlvbiB0byBpbnRyb2R1Y2UgY2hhcmRldgo+
IHN1cHBvcnQgZm9yIFBXTXMuCj4gCj4gWy4uLl0KCkhlcmUgaXMgdGhlIHN1bW1hcnkgd2l0aCBs
aW5rczoKICAtIFt2NiwwMDEvMTY0XSBwd206IFByb3ZpZGUgYW4gaW5saW5lIGZ1bmN0aW9uIHRv
IGdldCB0aGUgcGFyZW50IGRldmljZSBvZiBhIGdpdmVuIGNoaXAKICAgIGh0dHBzOi8vZ2l0Lmtl
cm5lbC5vcmcvY2hyb21lLXBsYXRmb3JtL2MvNGU1OTI2N2M3YTIwCiAgLSBbdjYsMDAzLzE2NF0g
cHdtOiBQcm92aWRlIHB3bWNoaXBfYWxsb2MoKSBmdW5jdGlvbiBhbmQgYSBkZXZtIHZhcmlhbnQg
b2YgaXQKICAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvY2hyb21lLXBsYXRmb3JtL2MvMDI0OTEz
ZGJmOTlmCiAgLSBbdjYsMDI5LzE2NF0gcHdtOiBjcm9zLWVjOiBDaGFuZ2UgcHJvdG90eXBlIG9m
IGhlbHBlcnMgdG8gcHJlcGFyZSBmdXJ0aGVyIGNoYW5nZXMKICAgIGh0dHBzOi8vZ2l0Lmtlcm5l
bC5vcmcvY2hyb21lLXBsYXRmb3JtL2MvNzI1NmMyZTc5YjhlCiAgLSBbdjYsMDMwLzE2NF0gcHdt
OiBjcm9zLWVjOiBNYWtlIHVzZSBvZiBwd21jaGlwX3BhcmVudCgpIGFjY2Vzc29yCiAgICBodHRw
czovL2dpdC5rZXJuZWwub3JnL2Nocm9tZS1wbGF0Zm9ybS9jLzE5YTU2OGE4ZDNjNAogIC0gW3Y2
LDAzMS8xNjRdIHB3bTogY3Jvcy1lYzogTWFrZSB1c2Ugb2YgZGV2bV9wd21jaGlwX2FsbG9jKCkg
ZnVuY3Rpb24KICAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvY2hyb21lLXBsYXRmb3JtL2MvNDUy
YmU5NDIxZWRhCgpZb3UgYXJlIGF3ZXNvbWUsIHRoYW5rIHlvdSEKLS0gCkRlZXQtZG9vdC1kb3Qs
IEkgYW0gYSBib3QuCmh0dHBzOi8va29yZy5kb2NzLmtlcm5lbC5vcmcvcGF0Y2h3b3JrL3B3Ym90
Lmh0bWwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0
aW5mby9saW51eC1zdG0zMgo=
