Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1B3888735
	for <lists+linux-stm32@lfdr.de>; Mon, 25 Mar 2024 02:54:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B5A17C6B444;
	Mon, 25 Mar 2024 01:54:26 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5B511C6907A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Mar 2024 01:54:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B1BC060DC6;
 Mon, 25 Mar 2024 01:54:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 70C87C433F1;
 Mon, 25 Mar 2024 01:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711331662;
 bh=x6gbNWDUC3393woiAhRGtrXvkbgxFEKnVO43IWMARsU=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=jrPZZfZ03PsaQD3fMGm9nq2UPpPmNCR2UhRG5lEG5sj1PDjplq8FZ75Zbzq4M++fX
 Q6TVSgOVQbUvhZzKhKOQNbQwhQhy2BZ8MRkhAIEF+3w0ilwV/nWxm1rjxE/qfP/Mr+
 E3yc5dSuBNp0Bm1L/KI5QDwiA8kFCuNjxzWIU7cCRVNPOgSNBZV+qUtQOY4O/YoTDT
 PFwCgNm3HEFcmI1zG6v/j47VLsywRsjUKgaIEweM6/K8U5bK1qRIu9RKHx/KjIcwnX
 cAPddvxMuoVuFBd1hKdjXjkxNm2QAvn+OmyKHTZvNymrjm/TZ8YaQVQ3vy0XdpqBcO
 88LTlEfD/nBQw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 59B24D2D0E0; Mon, 25 Mar 2024 01:54:22 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: <171133166235.9916.5159550524752322105.git-patchwork-notify@kernel.org>
Date: Mon, 25 Mar 2024 01:54:22 +0000
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
Z2l0IChmb3Ita2VybmVsY2kpCmJ5IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdA
cGVuZ3V0cm9uaXguZGU+OgoKT24gV2VkLCAxNCBGZWIgMjAyNCAxMDozMDo0NyArMDEwMCB5b3Ug
d3JvdGU6Cj4gSGVsbG8sCj4gCj4gdGhpcyBpcyB2NiBvZiB0aGUgc2VyaWVzIGludHJvZHVjaW5n
IGJldHRlciBsaWZldGltZSB0cmFja2luZyBmb3IKPiBwd21jaGlwcyB0aGF0IGFkZHJlc3NlcyAo
Zm9yIG5vdyB0aGVvcmV0aWMpIGxpZmV0aW1lIGlzc3VlcyBvZiBwd20KPiBjaGlwcy4gQWRkcmVz
c2luZyB0aGVzZSBpcyBhIG5lY2Vzc2FyeSBwcmVjb25kaXRpb24gdG8gaW50cm9kdWNlIGNoYXJk
ZXYKPiBzdXBwb3J0IGZvciBQV01zLgo+IAo+IFsuLi5dCgpIZXJlIGlzIHRoZSBzdW1tYXJ5IHdp
dGggbGlua3M6CiAgLSBbdjYsMDAxLzE2NF0gcHdtOiBQcm92aWRlIGFuIGlubGluZSBmdW5jdGlv
biB0byBnZXQgdGhlIHBhcmVudCBkZXZpY2Ugb2YgYSBnaXZlbiBjaGlwCiAgICBodHRwczovL2dp
dC5rZXJuZWwub3JnL2Nocm9tZS1wbGF0Zm9ybS9jLzRlNTkyNjdjN2EyMAogIC0gW3Y2LDAwMy8x
NjRdIHB3bTogUHJvdmlkZSBwd21jaGlwX2FsbG9jKCkgZnVuY3Rpb24gYW5kIGEgZGV2bSB2YXJp
YW50IG9mIGl0CiAgICBodHRwczovL2dpdC5rZXJuZWwub3JnL2Nocm9tZS1wbGF0Zm9ybS9jLzAy
NDkxM2RiZjk5ZgogIC0gW3Y2LDAyOS8xNjRdIHB3bTogY3Jvcy1lYzogQ2hhbmdlIHByb3RvdHlw
ZSBvZiBoZWxwZXJzIHRvIHByZXBhcmUgZnVydGhlciBjaGFuZ2VzCiAgICBodHRwczovL2dpdC5r
ZXJuZWwub3JnL2Nocm9tZS1wbGF0Zm9ybS9jLzcyNTZjMmU3OWI4ZQogIC0gW3Y2LDAzMC8xNjRd
IHB3bTogY3Jvcy1lYzogTWFrZSB1c2Ugb2YgcHdtY2hpcF9wYXJlbnQoKSBhY2Nlc3NvcgogICAg
aHR0cHM6Ly9naXQua2VybmVsLm9yZy9jaHJvbWUtcGxhdGZvcm0vYy8xOWE1NjhhOGQzYzQKICAt
IFt2NiwwMzEvMTY0XSBwd206IGNyb3MtZWM6IE1ha2UgdXNlIG9mIGRldm1fcHdtY2hpcF9hbGxv
YygpIGZ1bmN0aW9uCiAgICBodHRwczovL2dpdC5rZXJuZWwub3JnL2Nocm9tZS1wbGF0Zm9ybS9j
LzQ1MmJlOTQyMWVkYQoKWW91IGFyZSBhd2Vzb21lLCB0aGFuayB5b3UhCi0tIApEZWV0LWRvb3Qt
ZG90LCBJIGFtIGEgYm90LgpodHRwczovL2tvcmcuZG9jcy5rZXJuZWwub3JnL3BhdGNod29yay9w
d2JvdC5odG1sCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4v
bGlzdGluZm8vbGludXgtc3RtMzIK
