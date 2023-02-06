Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D6668C245
	for <lists+linux-stm32@lfdr.de>; Mon,  6 Feb 2023 16:53:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 00F22C65E4F;
	Mon,  6 Feb 2023 15:53:22 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A29CEC65049
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Feb 2023 15:53:20 +0000 (UTC)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 635361C000A;
 Mon,  6 Feb 2023 15:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1675698800;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T+B3RCvnN/A9QkWUBTmslla6TsR6i6LzRlnEYAv5F3Q=;
 b=Qtjb3GZlond/VqhH1wI9WqFkUTwIx6Xv+zssCdcz0vlldDafEWSB06zZ//x0Ak5PkC5s9y
 ZxfUTza51NQilgjwYbUeD93lWl0YkGanyt4N/HQcJQmS+KroZcFE/xfTkRSM2sxsdcGf1f
 20SxBUIoivwiZ6s9aJ+ixE2geS9izQBcTC0BtnofMVoclnJKbVIB5QEvwsdQxDRVvnTztn
 mWfYNVZzBBsywzjxDjc3HnjZoENi2lYxasHSm8kpUEw2am/dKrdmudXoC8BSbNJ5qS4nRi
 XqyYsA8WsUcyWOY6WGG+PMMJLyhBUYj2TKKx+CBVhWfLPP7d+4gsOsJ9cAGaug==
Date: Mon, 6 Feb 2023 16:53:11 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <20230206165311.0777ec69@xps-13>
In-Reply-To: <20230206153432.1017282-1-daniel.lezcano@linaro.org>
References: <20230206153432.1017282-1-daniel.lezcano@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
 Amit Kucheria <amitk@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Guillaume La Roque <glaroque@baylibre.com>,
 Minghao Chi <chi.minghao@zte.com.cn>, Alim Akhtar <alim.akhtar@samsung.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Fabio Estevam <festevam@gmail.com>, "moderated list:ARM/STM32
 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>,
 "open list:RENESAS R-CAR THERMAL
 DRIVERS" <linux-renesas-soc@vger.kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>, Haowen Bai <baihaowen@meizu.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, rafael.j.wysocki@intel.com,
 Ricardo Neri <ricardo.neri-calderon@linux.intel.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Andy Gross <agross@kernel.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 NXP Linux Team <linux-imx@nxp.com>, ye xingchen <ye.xingchen@zte.com.cn>,
 Zhang Rui <rui.zhang@intel.com>, Thara Gopinath <thara.gopinath@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-pm@vger.kernel.org,
 Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 "open list:SAMSUNG THERMAL
 DRIVER" <linux-samsung-soc@vger.kernel.org>, "moderated list:BROADCOM
 BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>,
 "open list:TEGRA ARCHITECTURE
 SUPPORT" <linux-tegra@vger.kernel.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Scott Branden <sbranden@broadcom.com>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Niklas =?UTF-8?B?U8O2ZGVybHVuZA==?= <niklas.soderlund@ragnatech.se>,
 Shawn Guo <shawnguo@kernel.org>
Subject: Re: [Linux-stm32] [PATCH] thermal: Remove core header inclusion
	from drivers
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

SGkgRGFuaWVsLAoKZGFuaWVsLmxlemNhbm9AbGluYXJvLm9yZyB3cm90ZSBvbiBNb24sICA2IEZl
YiAyMDIzIDE2OjM0OjI5ICswMTAwOgoKPiBBcyB0aGUgbmFtZSBzdGF0ZXMgInRoZXJtYWxfY29y
ZS5oIiBpcyB0aGUgaGVhZGVyIGZpbGUgZm9yIHRoZSBjb3JlCj4gY29tcG9uZW50cyBvZiB0aGUg
dGhlcm1hbCBmcmFtZXdvcmsuCj4gCj4gVG9vIG1hbnkgZHJpdmVycyBhcmUgaW5jbHVkaW5nIGl0
LiBIb3BlZnVsbHkgdGhlIHJlY2VudCBjbGVhbnVwcwo+IGhlbHBlZCB0byBzZWxmIGVuY2Fwc3Vs
YXRlIHRoZSBjb2RlIGEgYml0IG1vcmUgYW5kIHByZXZlbnRlZCB0aGUKPiBkcml2ZXJzIHRvIG5l
ZWQgdGhpcyBoZWFkZXIuCj4gCj4gUmVtb3ZlIHRoaXMgaW5jbHVzaW9uIGluIGV2ZXJ5IHBsYWNl
IHdoZXJlIGl0IGlzIHBvc3NpYmxlLgo+IAo+IFNvbWUgb3RoZXIgZHJpdmVycyBkaWQgYSBjb25m
dXNpb24gd2l0aCB0aGUgY29yZSBoZWFkZXIgYW5kIHRoZSBvbmUKPiBleHBvcnRlZCBpbiBsaW51
eC90aGVybWFsLmguIFRoZXkgaW5jbHVkZSB0aGUgZm9ybWVyIGluc3RlYWQgb2YgdGhlCj4gbGF0
dGVyLiBUaGUgY2hhbmdlcyBhbHNvIGZpeCB0aGlzLgo+IAo+IFRoZSB0ZWdyYS9zb2N0aGVybSBk
cml2ZXIgc3RpbGwgcmVtYWlucyBhcyBpdCB1c2VzIGFuIGludGVybmFsCj4gZnVuY3Rpb24gd2hp
Y2ggbmVlZCB0byBiZSByZXBsYWNlZC4KPiAKPiBUaGUgSW50ZWwgSEZJIGRyaXZlciB1c2VzIHRo
ZSBuZXRsaW5rIGludGVybmFsIGZyYW1ld29yayBjb3JlIGFuZAo+IHNob3VsZCBiZSBjaGFuZ2Vk
IHRvIHByZXZlbnQgdG8gZGVhbCB3aXRoIHRoZSBpbnRlcm5hbHMuCj4gCj4gTm8gZnVuY3Rpb25h
bCBjaGFuZ2VzCj4gCj4gWyBBcHBsaWVzIHRvIHRoZXJtYWwvbGludXgtbmV4dCBvciBsaW51eC1w
bS9saW51eC1uZXh0IF0KPiAKPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgTGV6Y2FubyA8ZGFuaWVs
LmxlemNhbm9AbGluYXJvLm9yZz4KPiAtLS0KPiAgZHJpdmVycy90aGVybWFsL2FtbG9naWNfdGhl
cm1hbC5jICAgICAgICAgICB8IDEgLQo+ICBkcml2ZXJzL3RoZXJtYWwvYXJtYWRhX3RoZXJtYWwu
YyAgICAgICAgICAgIHwgMiAtLQoKRm9yIGFybWFkYV90aGVybWFsLmM6CgpSZXZpZXdlZC1ieTog
TWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KCj4gIGRyaXZlcnMvdGhl
cm1hbC9icm9hZGNvbS9iY20yODM1X3RoZXJtYWwuYyAgfCAxIC0KPiAgZHJpdmVycy90aGVybWFs
L2hpc2lfdGhlcm1hbC5jICAgICAgICAgICAgICB8IDMgKy0tCj4gIGRyaXZlcnMvdGhlcm1hbC9p
bXg4bW1fdGhlcm1hbC5jICAgICAgICAgICAgfCAxIC0KPiAgZHJpdmVycy90aGVybWFsL2lteF9z
Y190aGVybWFsLmMgICAgICAgICAgICB8IDEgLQo+ICBkcml2ZXJzL3RoZXJtYWwvaW50ZWwvaW50
ZWxfaGZpLmMgICAgICAgICAgIHwgMyArKy0KPiAgZHJpdmVycy90aGVybWFsL3Fjb20vcWNvbS1z
cG1pLXRlbXAtYWxhcm0uYyB8IDEgLQo+ICBkcml2ZXJzL3RoZXJtYWwvcW9yaXFfdGhlcm1hbC5j
ICAgICAgICAgICAgIHwgMSAtCj4gIGRyaXZlcnMvdGhlcm1hbC9yY2FyX2dlbjNfdGhlcm1hbC5j
ICAgICAgICAgfCAxIC0KPiAgZHJpdmVycy90aGVybWFsL3NhbXN1bmcvZXh5bm9zX3RtdS5jICAg
ICAgICB8IDMgKy0tCj4gIGRyaXZlcnMvdGhlcm1hbC9zdC9zdG1fdGhlcm1hbC5jICAgICAgICAg
ICAgfCAxIC0KPiAgZHJpdmVycy90aGVybWFsL3RlZ3JhL3RlZ3JhMzAtdHNlbnNvci5jICAgICB8
IDEgLQo+ICBkcml2ZXJzL3RoZXJtYWwvdW5pcGhpZXJfdGhlcm1hbC5jICAgICAgICAgIHwgMiAt
LQo+ICAxNCBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDE4IGRlbGV0aW9ucygtKQo+
IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3RoZXJtYWwvYW1sb2dpY190aGVybWFsLmMgYi9kcml2
ZXJzL3RoZXJtYWwvYW1sb2dpY190aGVybWFsLmMKPiBpbmRleCBkMzBjYjc5MWU2M2MuLjkyMzVm
ZGE0ZWMxZSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3RoZXJtYWwvYW1sb2dpY190aGVybWFsLmMK
PiArKysgYi9kcml2ZXJzL3RoZXJtYWwvYW1sb2dpY190aGVybWFsLmMKPiBAQCAtMjgsNyArMjgs
NiBAQAo+ICAjaW5jbHVkZSA8bGludXgvcmVnbWFwLmg+Cj4gICNpbmNsdWRlIDxsaW51eC90aGVy
bWFsLmg+Cj4gIAo+IC0jaW5jbHVkZSAidGhlcm1hbF9jb3JlLmgiCj4gICNpbmNsdWRlICJ0aGVy
bWFsX2h3bW9uLmgiCj4gIAo+ICAjZGVmaW5lIFRTRU5TT1JfQ0ZHX1JFRzEJCQkweDQKClRoYW5r
cywKTWlxdcOobApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9s
aXN0aW5mby9saW51eC1zdG0zMgo=
