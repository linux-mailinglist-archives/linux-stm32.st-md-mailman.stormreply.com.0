Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4E584CC15
	for <lists+linux-stm32@lfdr.de>; Wed,  7 Feb 2024 14:55:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8F52CC6C85A;
	Wed,  7 Feb 2024 13:55:10 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B201FC65E4C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Feb 2024 13:55:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1D6A561782;
 Wed,  7 Feb 2024 13:55:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07488C433F1;
 Wed,  7 Feb 2024 13:54:58 +0000 (UTC)
Message-ID: <9bc65445-8f50-4227-ad3c-04dd32832419@xs4all.nl>
Date: Wed, 7 Feb 2024 14:54:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, nl
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 =?UTF-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
References: <87ttmmnvzh.wl-kuninori.morimoto.gx@renesas.com>
 <87r0hqnvxc.wl-kuninori.morimoto.gx@renesas.com>
 <20240206134155.GB2827@pendragon.ideasonboard.com>
 <9d1e99b0-892d-4a72-a9b3-886b8ed094b0@xs4all.nl> <m3eddoza9y.fsf@t19.piap.pl>
 <20240207135152.GG2827@pendragon.ideasonboard.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20240207135152.GG2827@pendragon.ideasonboard.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 dri-devel@lists.freedesktop.org, Nicolas Ferre <nicolas.ferre@microchip.com>,
 "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, David Airlie <airlied@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-omap@vger.kernel.org,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>, Helge Deller <deller@gmx.de>,
 Alexey Brodkin <abrodkin@synopsys.com>, Russell King <linux@armlinux.org.uk>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, linux-media@vger.kernel.org,
 Jacopo Mondi <jacopo@jmondi.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Tim Harvey <tharvey@gateworks.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Eugen Hristev <eugen.hristev@collabora.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-samsung-soc@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 linux-fbdev@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, linux-rpi-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/4] media: i2c: replace
	of_graph_get_next_endpoint()
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

T24gMDcvMDIvMjAyNCAxNDo1MSwgTGF1cmVudCBQaW5jaGFydCB3cm90ZToKPiBPbiBXZWQsIEZl
YiAwNywgMjAyNCBhdCAwMjoxNDozM1BNICswMTAwLCBLcnp5c3p0b2YgSGHFgmFzYSB3cm90ZToK
Pj4gSGFucywKPj4KPj4gSGFucyBWZXJrdWlsIDxodmVya3VpbC1jaXNjb0B4czRhbGwubmw+IHdy
aXRlczoKPj4KPj4+IElkZWFsbHkgc29tZW9uZSB3b3VsZCBoYXZlIHRvIGFjdHVhbGx5IHRlc3Qg
dGhpcywgcGVyaGFwcyB3aXRoIG9uZSBvZiB0aG9zZQo+Pj4gUmVuZXNhcyBib2FyZHMuIFdoaWxl
IEkgZG8gaGF2ZSBvbmUsIGl0IGdvdCBicmlja2VkIGFmdGVyIEkgYXR0ZW1wdGVkIGEKPj4+IHUt
Ym9vdCB1cGRhdGUgOi0oCj4+Cj4+IE1heSBiZSByZXZlcnNpYmxlLCB0aG91Z2guCj4gCj4gTWF5
YmUgTW9yaW1vdG8tc2FuIGNvdWxkIGhlbHAgPyA6LSkgV2hhdCBib2FyZCBkaWQgeW91IHVzZSBI
YW5zID8KPiAKCkkgaGF2ZSBhIEtvZWxzY2guIEkgdHJpZWQgdG8gdXBkYXRlIHVib290IGF0IG9u
ZSB0aW1lLCBidXQgYnJpY2tlZCBpdCBhbmQgd2FzCnVuYWJsZSB0byBnZXQgYSBkaWZmZXJlbnQg
dWJvb3QgaW5zdGFsbGVkLgoKSXQgd291bGQgYmUgbmljZSBpZiBpdCBjYW4gYmUgcmV2aXZlZC4K
ClJlZ2FyZHMsCgoJSGFucwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFp
bG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
