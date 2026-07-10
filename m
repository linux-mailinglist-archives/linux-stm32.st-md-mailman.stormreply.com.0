Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id isSPEMNJUWrSBwMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Jul 2026 21:36:35 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB0273DD86
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Jul 2026 21:36:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=UJQjFMO5;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=kernel.org (policy=quarantine);
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 72235C7A836;
	Fri, 10 Jul 2026 19:36:34 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 43906C58D7C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jul 2026 19:36:33 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 3E8696111A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jul 2026 19:36:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE9151F01569
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jul 2026 19:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1783712192;
 bh=WfoUlWEeuKtg5ji7K2r6ODJIVODJRvoxIKC//T1cf3I=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc;
 b=UJQjFMO5Ru2ypG3zOfZ4hEANXRTwjm/9ejCDdL+TooLEtRU0lvKPAW1D8BqKGZ5DN
 zEvvZ5IrQFu2HlBI3YhN2lLdHplytIRiFJEYVKL5uQ6zKJSNEZcCZ/PvddjkctsLek
 ih3/t2hRqRPK4J0+kCQXiVOKCSvhe5higOtJ7/3l2k1z+YjT0o1ItDEZFSxD6dtV4x
 2Vo6d2iq/8Gns/ljNTKgJujR8e16p/tPYYz+2Ta1p+GlwWvhRPl+3uc9dAhpowXSfc
 P/J9a1UZInP7coH4/Q7zbMykGiVkgBjPrY1eX9612k4wVRs+hGMHFD5WQf5IGIG3yC
 MEBCiE5QSDZKg==
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-39c9452244aso13759051fa.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jul 2026 12:36:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AHgh+Rq1WX8dS8OLlAwOBQfkyHA/geWfEOoK/ZyTNdTM9vJMdI2DUp/1NnNxiM8/CjEqSzivQOgDE4nGpzEPdA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwGH0eUH3XCyGKIoj09lm3pfL3prYpdfuc7cfbsln6Lj7htUq+W
 452DoTkdSu9FsDSQ5wt7ot68iPLDNGQ10Kt2uuuSu5nsRc7+wXpao4sM4GyHLbliVrZ7mCj19F1
 U7+cyK60QfUE6vJYYA4vyiwbXuwBO+HQ=
X-Received: by 2002:a05:6512:40c4:20b0:5ae:c454:3740 with SMTP id
 2adb3069b0e04-5b0236ec2f0mr64636e87.60.1783712190489; Fri, 10 Jul 2026
 12:36:30 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1783507945.git.u.kleine-koenig@baylibre.com>
 <ce43f6ec640a7835d64d3d696ff09229c3d31075.1783507945.git.u.kleine-koenig@baylibre.com>
In-Reply-To: <ce43f6ec640a7835d64d3d696ff09229c3d31075.1783507945.git.u.kleine-koenig@baylibre.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 10 Jul 2026 21:36:17 +0200
X-Gmail-Original-Message-ID: <CAD++jLkhkEVsLyoYobV9ZfD0o7YWXh74cNsy2rcFrajna4mRjg@mail.gmail.com>
X-Gm-Features: AUfX_mxF7aXm1NUaeKv9tRmJ75XIeUyINM_M0uEJT4kZsHp0a8M3V6ZUZMQlacY
Message-ID: <CAD++jLkhkEVsLyoYobV9ZfD0o7YWXh74cNsy2rcFrajna4mRjg@mail.gmail.com>
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?=
 <u.kleine-koenig@baylibre.com>
Cc: imx@lists.linux.dev, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Tony Lindgren <tony@atomide.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, patches@opensource.cirrus.com,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Fred Treven <fred.treven@cirrus.com>,
 Janne Grunau <j@jannau.net>, linux-stm32@st-md-mailman.stormreply.com,
 Marek Vasut <marek.vasut+renesas@gmail.com>, linux-samsung-soc@vger.kernel.org,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Aaro Koskinen <aaro.koskinen@iki.fi>, Fabio Estevam <festevam@gmail.com>,
 Lee Jones <lee@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>, Chanwoo Choi <cw00.choi@samsung.com>,
 linux-omap@vger.kernel.org, Andreas Kemnade <andreas@kemnade.info>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-arm-msm@vger.kernel.org,
 Orson Zhai <orsonzhai@gmail.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Saravanan Sekar <sravanhome@gmail.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>, Ray Jui <rjui@broadcom.com>,
 Tim Harvey <tharvey@gateworks.com>, mfd@lists.linux.dev,
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 linux-sound@vger.kernel.org, Roger Quadros <rogerq@kernel.org>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 Sven Peter <sven@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 James Ogletree <jogletre@opensource.cirrus.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Support Opensource <support.opensource@diasemi.com>,
 Scott Branden <sbranden@broadcom.com>, Sudeep Holla <sudeep.holla@kernel.org>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, asahi@lists.linux.dev,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 Ben Bright <ben.bright@cirrus.com>, Neal Gompa <neal@gompa.dev>,
 David Rhodes <david.rhodes@cirrus.com>, linux-sunxi@lists.linux.dev
Subject: Re: [Linux-stm32] [PATCH v2 21/23] mfd: Unify style of of_device_id
	arrays
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [4.89 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20260515];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:u.kleine-koenig@baylibre.com,m:imx@lists.linux.dev,m:alexandre.belloni@bootlin.com,m:andre.draszik@linaro.org,m:geert+renesas@glider.be,m:tony@atomide.com,m:lpieralisi@kernel.org,m:Frank.Li@nxp.com,m:claudiu.beznea@tuxon.dev,m:patches@opensource.cirrus.com,m:jernej.skrabec@gmail.com,m:alim.akhtar@samsung.com,m:fred.treven@cirrus.com,m:j@jannau.net,m:linux-stm32@st-md-mailman.stormreply.com,m:marek.vasut+renesas@gmail.com,m:linux-samsung-soc@vger.kernel.org,m:florian.fainelli@broadcom.com,m:aaro.koskinen@iki.fi,m:festevam@gmail.com,m:lee@kernel.org,m:magnus.damm@gmail.com,m:krzk@kernel.org,m:peter.griffin@linaro.org,m:cw00.choi@samsung.com,m:linux-omap@vger.kernel.org,m:andreas@kemnade.info,m:bcm-kernel-feedback-list@broadcom.com,m:khilman@baylibre.com,m:linux-arm-msm@vger.kernel.org,m:orsonzhai@gmail.com,m:liviu.dudau@arm.com,m:luca.ceresoli@bootlin.com,m:s.hauer@pengutronix.de,m:mcoquelin.stm32@gmail.com,m:ckeepax@opensource.cirrus.com,m:sravanhome@gmail.c
 om,m:mazziesaccount@gmail.com,m:rjui@broadcom.com,m:tharvey@gateworks.com,m:mfd@lists.linux.dev,m:j.neuschaefer@gmx.net,m:linux-sound@vger.kernel.org,m:rogerq@kernel.org,m:rf@opensource.cirrus.com,m:linux-mediatek@lists.infradead.org,m:linux-rpi-kernel@lists.infradead.org,m:baolin.wang@linux.alibaba.com,m:matthias.bgg@gmail.com,m:linux-amlogic@lists.infradead.org,m:sven@kernel.org,m:wens@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:angelogioacchino.delregno@collabora.com,m:jogletre@opensource.cirrus.com,m:neil.armstrong@linaro.org,m:support.opensource@diasemi.com,m:sbranden@broadcom.com,m:sudeep.holla@kernel.org,m:zhang.lyra@gmail.com,m:samuel@sholland.org,m:nicolas.ferre@microchip.com,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:asahi@lists.linux.dev,m:kernel@pengutronix.de,m:mathieu.dubois-briand@bootlin.com,m:ben.bright@cirrus.com,m:neal@gompa.dev,m:david.rhodes@cirrus.com,m:linux-sunxi@lists.linux.dev,m:geert@glider.be,m:jernejskrabec@gmail.com,m:m
 arekvasut@gmail.com,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FREEMAIL_CC(0.00)[lists.linux.dev,bootlin.com,linaro.org,glider.be,atomide.com,kernel.org,nxp.com,tuxon.dev,opensource.cirrus.com,gmail.com,samsung.com,cirrus.com,jannau.net,st-md-mailman.stormreply.com,vger.kernel.org,broadcom.com,iki.fi,kemnade.info,baylibre.com,arm.com,pengutronix.de,gateworks.com,gmx.net,lists.infradead.org,linux.alibaba.com,collabora.com,diasemi.com,sholland.org,microchip.com,gompa.dev];
	DKIM_TRACE(0.00)[kernel.org:-];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCPT_COUNT_GT_50(0.00)[71];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,renesas];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,baylibre.com:email,st-md-mailman.stormreply.com:from_smtp,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BEB0273DD86

T24gV2VkLCBKdWwgOCwgMjAyNiBhdCAxOjE34oCvUE0gVXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBD
YXBhYmxlIEh1YikKPHUua2xlaW5lLWtvZW5pZ0BiYXlsaWJyZS5jb20+IHdyb3RlOgoKPiBUaGVz
ZSBhcnJheXMgYWxyZWFkeSBtb3N0bHkgbWF0Y2ggdGhlIG1vc3QgdXNlZCBhbmQgZ2VuZXJhbGx5
Cj4gcmVjb21tZW5kZWQgY29kaW5nIHN0eWxlLiBUaGF0IGlzOgo+Cj4gIC0gbm8gY29tbWEgYWZ0
ZXIgdGhlIGxpc3QgdGVybWluYXRvcjsKPiAgLSBhIGNvbW1hIGFmdGVyIGFuIGluaXRpYWxpemVy
IGlmIChhbmQgb25seSBpZikgdGhlIGNsb3NpbmcgfSBpcyBub3QKPiAgICBkaXJlY3RseSBmb2xs
b3dpbmc7Cj4gIC0gbm8gZXhwbGljaXQgemVyb3MgaW4gdGhlIGxpc3QgdGVybWluYXRvcjsKPiAg
LSBhIHNwYWNlIGFmdGVyIGFuIG9wZW5pbmcgeyBhbmQgYmVmb3JlIGEgY2xvc2luZyB9LCBhIHNp
bmdsZSBzcGFjZSBpbgo+ICAgIHRoZSBsaXN0IHRlcm1pbmF0b3I7Cj4KPiBBZGFwdCB0aGUgb2Zm
ZW5kZXJzIGFjY29yZGluZ2x5Lgo+Cj4gU2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcg
KFRoZSBDYXBhYmxlIEh1YikgPHUua2xlaW5lLWtvZW5pZ0BiYXlsaWJyZS5jb20+CgpSZXZpZXdl
ZC1ieTogTGludXMgV2FsbGVpaiA8bGludXN3QGtlcm5lbC5vcmc+CgpZb3VycywKTGludXMgV2Fs
bGVpagpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5m
by9saW51eC1zdG0zMgo=
