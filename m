Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2EE84CC05
	for <lists+linux-stm32@lfdr.de>; Wed,  7 Feb 2024 14:51:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 45192C6DD68;
	Wed,  7 Feb 2024 13:51:53 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 59491C65E4C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Feb 2024 13:51:52 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B239CA27;
 Wed,  7 Feb 2024 14:50:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1707313826;
 bh=IrHVlnm6x2iQ3sJqDD2XcdDUYN/ea4m9XhtfLUcYLRo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Uo1ED493OWShznBB1m74nJMBfekm23VcQoncmAmnupESyyT21h1VfXdXOR+ccLxgd
 E4oPsPYOw7o9HYG4QWKNJOKv4Z1zSzaJA78Rw1gk+7FZaZxTx3mQ3r1+wEf6Pg1k7c
 oVYhIDwShUBZgEJoVjoVvUf1D6jPTm6iUr10s5oU=
Date: Wed, 7 Feb 2024 15:51:52 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>
Message-ID: <20240207135152.GG2827@pendragon.ideasonboard.com>
References: <87ttmmnvzh.wl-kuninori.morimoto.gx@renesas.com>
 <87r0hqnvxc.wl-kuninori.morimoto.gx@renesas.com>
 <20240206134155.GB2827@pendragon.ideasonboard.com>
 <9d1e99b0-892d-4a72-a9b3-886b8ed094b0@xs4all.nl>
 <m3eddoza9y.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <m3eddoza9y.fsf@t19.piap.pl>
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
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
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
 Daniel Vetter <daniel@ffwll.ch>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 linux-rpi-kernel@lists.infradead.org
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

T24gV2VkLCBGZWIgMDcsIDIwMjQgYXQgMDI6MTQ6MzNQTSArMDEwMCwgS3J6eXN6dG9mIEhhxYJh
c2Egd3JvdGU6Cj4gSGFucywKPiAKPiBIYW5zIFZlcmt1aWwgPGh2ZXJrdWlsLWNpc2NvQHhzNGFs
bC5ubD4gd3JpdGVzOgo+IAo+ID4gSWRlYWxseSBzb21lb25lIHdvdWxkIGhhdmUgdG8gYWN0dWFs
bHkgdGVzdCB0aGlzLCBwZXJoYXBzIHdpdGggb25lIG9mIHRob3NlCj4gPiBSZW5lc2FzIGJvYXJk
cy4gV2hpbGUgSSBkbyBoYXZlIG9uZSwgaXQgZ290IGJyaWNrZWQgYWZ0ZXIgSSBhdHRlbXB0ZWQg
YQo+ID4gdS1ib290IHVwZGF0ZSA6LSgKPiAKPiBNYXkgYmUgcmV2ZXJzaWJsZSwgdGhvdWdoLgoK
TWF5YmUgTW9yaW1vdG8tc2FuIGNvdWxkIGhlbHAgPyA6LSkgV2hhdCBib2FyZCBkaWQgeW91IHVz
ZSBIYW5zID8KCi0tIApSZWdhcmRzLAoKTGF1cmVudCBQaW5jaGFydApfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QK
TGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
