Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B73FE851715
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Feb 2024 15:35:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 655D7C6C859;
	Mon, 12 Feb 2024 14:35:37 +0000 (UTC)
Received: from ni.piap.pl (ni.piap.pl [195.187.100.5])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3592DC6DD93
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Feb 2024 13:14:34 +0000 (UTC)
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
 by ni.piap.pl (Postfix) with ESMTPS id 9C86DC3F2A7D;
 Wed,  7 Feb 2024 14:14:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl 9C86DC3F2A7D
From: =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <9d1e99b0-892d-4a72-a9b3-886b8ed094b0@xs4all.nl> (Hans Verkuil's
 message of "Tue, 6 Feb 2024 15:44:45 +0100")
References: <87ttmmnvzh.wl-kuninori.morimoto.gx@renesas.com>
 <87r0hqnvxc.wl-kuninori.morimoto.gx@renesas.com>
 <20240206134155.GB2827@pendragon.ideasonboard.com>
 <9d1e99b0-892d-4a72-a9b3-886b8ed094b0@xs4all.nl>
Date: Wed, 07 Feb 2024 14:14:33 +0100
Message-ID: <m3eddoza9y.fsf@t19.piap.pl>
MIME-Version: 1.0
X-KLMS-Rule-ID: 3
X-KLMS-Message-Action: skipped
X-KLMS-AntiSpam-Status: not scanned, whitelist
X-KLMS-AntiPhishing: not scanned, whitelist
X-KLMS-AntiVirus: Kaspersky Security for Linux Mail Server, version 8.0.3.30,
 not scanned, whitelist
X-Mailman-Approved-At: Mon, 12 Feb 2024 14:35:35 +0000
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 dri-devel@lists.freedesktop.org, Nicolas Ferre <nicolas.ferre@microchip.com>,
 "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
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

SGFucywKCkhhbnMgVmVya3VpbCA8aHZlcmt1aWwtY2lzY29AeHM0YWxsLm5sPiB3cml0ZXM6Cgo+
IElkZWFsbHkgc29tZW9uZSB3b3VsZCBoYXZlIHRvIGFjdHVhbGx5IHRlc3QgdGhpcywgcGVyaGFw
cyB3aXRoIG9uZSBvZiB0aG9zZQo+IFJlbmVzYXMgYm9hcmRzLiBXaGlsZSBJIGRvIGhhdmUgb25l
LCBpdCBnb3QgYnJpY2tlZCBhZnRlciBJIGF0dGVtcHRlZCBhCj4gdS1ib290IHVwZGF0ZSA6LSgK
Ck1heSBiZSByZXZlcnNpYmxlLCB0aG91Z2guCi0tIApLcnp5c3p0b2YgIkNocmlzIiBIYcWCYXNh
CgpTaWXEhyBCYWRhd2N6YSDFgXVrYXNpZXdpY3oKUHJ6ZW15c8WCb3d5IEluc3R5dHV0IEF1dG9t
YXR5a2kgaSBQb21pYXLDs3cgUElBUApBbC4gSmVyb3pvbGltc2tpZSAyMDIsIDAyLTQ4NiBXYXJz
emF3YQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5m
by9saW51eC1zdG0zMgo=
