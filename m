Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AQEpNgFMUWo+CAMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Jul 2026 21:46:09 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A1173DE9A
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Jul 2026 21:46:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=HkSsEg0f;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=kernel.org (policy=quarantine);
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 19CAAC7A833;
	Fri, 10 Jul 2026 19:46:09 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 91520C58D7C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jul 2026 19:46:07 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 52BF743EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jul 2026 19:46:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35FCD1F00AC4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jul 2026 19:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1783712766;
 bh=sZDwGaUkGBLrMyNSIpb3kLYEJV1iPNS+5Pn9t9xv6aE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc;
 b=HkSsEg0fbPswpwBbq7msyQoTQ/fzpUpBAWCJeyoo47JBrl1F4fLCAocKnijbpM/p6
 GDbOtWqNLNjYAx3W000zcCbmXpLxeTYg1+fMSzkuksy7ydBzM8bj7gC6WXw6wQdRD6
 vVdMHXz0K1GVFdtb/usTM0mXhAL+ZZsfcP7DWwsuADXRD4a5scfpg85ktfSdSrmGEW
 RX91BEivy4ThHjiAFPD10y6OZy6KCaoROgurcEirnNXtZytmK4+Y7XIXkAVzwQgQnS
 tWsz1C57JTWtsEG565sIfsiTVX1EO3rFjDmmROr8HMl9MVJMK0AKwMlgTnovI0C4jj
 cqjPm+xX37wIg==
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-5aeae350e0aso1544549e87.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jul 2026 12:46:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AHgh+Ron3HL/CuUCd9tu665YT547kuViJYWpYLwMMJI7RVXXNAqGMtVBLCSA0IyOLoEJpemys1CR1cww8Z5lvQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw8pX9oVDRBp1D9+nNvXRM51CbHlyfxFrntMdoAaPRAKABW/sdI
 qS3OtgH8gCcs0apGGRKOEsF6r3XBVgvrPvy9vGunoYIVqmtFKawFsW7n9ggBwI6vSL7unhGnohY
 B1C1RRbXHVWVw9wHTXMl5ZlCn6p55CtY=
X-Received: by 2002:a05:6512:32cf:b0:5ae:b792:7f1e with SMTP id
 2adb3069b0e04-5b0236a3891mr89821e87.30.1783712764308; Fri, 10 Jul 2026
 12:46:04 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1783615311.git.u.kleine-koenig@baylibre.com>
In-Reply-To: <cover.1783615311.git.u.kleine-koenig@baylibre.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 10 Jul 2026 21:45:51 +0200
X-Gmail-Original-Message-ID: <CAD++jLkJthrzmVCDE=BopUDMECBpMtPOpCJ9S0CKWRg--Zfz3A@mail.gmail.com>
X-Gm-Features: AUfX_mx_vh7ziiGHTkkaiMBQb1TjjZ8vahBxzqeJira0tID9YqDdR27A_6wUme0
Message-ID: <CAD++jLkJthrzmVCDE=BopUDMECBpMtPOpCJ9S0CKWRg--Zfz3A@mail.gmail.com>
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?=
 <u.kleine-koenig@baylibre.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Marek Vasut <marek.vasut+renesas@gmail.com>, linux-samsung-soc@vger.kernel.org,
 Aaro Koskinen <aaro.koskinen@iki.fi>, Kevin Hilman <khilman@baylibre.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, linux-sunxi@lists.linux.dev,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-sound@vger.kernel.org,
 Sudeep Holla <sudeep.holla@kernel.org>, Sven Peter <sven@kernel.org>,
 linux-omap@vger.kernel.org, Andy Shevchenko <andy@kernel.org>,
 Scott Branden <sbranden@broadcom.com>, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 David Rhodes <david.rhodes@cirrus.com>, Guenter Roeck <groeck@chromium.org>,
 chrome-platform@lists.linux.dev, Chunyan Zhang <zhang.lyra@gmail.com>,
 Lee Jones <lee@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 linux-rockchip@lists.infradead.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Michael Hennerich <michael.hennerich@analog.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>, linux-arm-msm@vger.kernel.org,
 Roger Quadros <rogerq@kernel.org>, linux-rpi-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, Chen-Yu Tsai <wens@kernel.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Richard <thomas.richard@bootlin.com>,
 Samuel Holland <samuel@sholland.org>, linux-renesas-soc@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, imx@lists.linux.dev,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Tom Rix <trix@redhat.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Frank Li <Frank.Li@nxp.com>, Qunqin Zhao <zhaoqunqin@loongson.cn>,
 Krzysztof Kozlowski <krzk@kernel.org>, Fred Treven <fred.treven@cirrus.com>,
 Fabio Estevam <festevam@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andreas Kemnade <andreas@kemnade.info>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Orson Zhai <orsonzhai@gmail.com>, Ray Jui <rjui@broadcom.com>,
 Tim Harvey <tharvey@gateworks.com>,
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Benson Leung <bleung@chromium.org>, Samuel Kayode <samkay014@gmail.com>,
 Support Opensource <support.opensource@diasemi.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, asahi@lists.linux.dev,
 Zha Qipeng <qipeng.zha@intel.com>, Neal Gompa <neal@gompa.dev>,
 Xu Yilun <yilun.xu@intel.com>, Tony Lindgren <tony@atomide.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Peter Tyser <ptyser@xes-inc.com>,
 Janne Grunau <j@jannau.net>, Florian Fainelli <florian.fainelli@broadcom.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 Saravanan Sekar <sravanhome@gmail.com>, mfd@lists.linux.dev,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 James Ogletree <jogletre@opensource.cirrus.com>, patches@opensource.cirrus.com,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Colin Foster <colin.foster@in-advantage.com>,
 Ben Bright <ben.bright@cirrus.com>, linux@ew.tq-group.com
Subject: Re: [Linux-stm32] [PATCH v3 00/23] mfd: Use named initializers for
	arrays of *_device_data
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
	FORGED_RECIPIENTS(0.00)[m:u.kleine-koenig@baylibre.com,m:heiko@sntech.de,m:geert+renesas@glider.be,m:alim.akhtar@samsung.com,m:linux-stm32@st-md-mailman.stormreply.com,m:marek.vasut+renesas@gmail.com,m:linux-samsung-soc@vger.kernel.org,m:aaro.koskinen@iki.fi,m:khilman@baylibre.com,m:cw00.choi@samsung.com,m:luca.ceresoli@bootlin.com,m:linux-sunxi@lists.linux.dev,m:s.hauer@pengutronix.de,m:linux-sound@vger.kernel.org,m:sudeep.holla@kernel.org,m:sven@kernel.org,m:linux-omap@vger.kernel.org,m:andy@kernel.org,m:sbranden@broadcom.com,m:linux-kernel@vger.kernel.org,m:linux-crypto@vger.kernel.org,m:kernel@pengutronix.de,m:alexandre.belloni@bootlin.com,m:david.rhodes@cirrus.com,m:groeck@chromium.org,m:chrome-platform@lists.linux.dev,m:zhang.lyra@gmail.com,m:lee@kernel.org,m:magnus.damm@gmail.com,m:linux-rockchip@lists.infradead.org,m:ckeepax@opensource.cirrus.com,m:michael.hennerich@analog.com,m:mazziesaccount@gmail.com,m:linux-arm-msm@vger.kernel.org,m:rogerq@kernel.org,m:linux-rpi-kernel@l
 ists.infradead.org,m:linux-amlogic@lists.infradead.org,m:wens@kernel.org,m:mika.westerberg@linux.intel.com,m:linux-arm-kernel@lists.infradead.org,m:neil.armstrong@linaro.org,m:thomas.richard@bootlin.com,m:samuel@sholland.org,m:linux-renesas-soc@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:mathieu.dubois-briand@bootlin.com,m:imx@lists.linux.dev,m:andre.draszik@linaro.org,m:trix@redhat.com,m:lpieralisi@kernel.org,m:Frank.Li@nxp.com,m:zhaoqunqin@loongson.cn,m:krzk@kernel.org,m:fred.treven@cirrus.com,m:festevam@gmail.com,m:jernej.skrabec@gmail.com,m:andreas@kemnade.info,m:bcm-kernel-feedback-list@broadcom.com,m:orsonzhai@gmail.com,m:rjui@broadcom.com,m:tharvey@gateworks.com,m:j.neuschaefer@gmx.net,m:rf@opensource.cirrus.com,m:baolin.wang@linux.alibaba.com,m:bleung@chromium.org,m:samkay014@gmail.com,m:support.opensource@diasemi.com,m:claudiu.beznea@tuxon.dev,m:asahi@lists.linux.dev,m:qipeng.zha@intel.com,m:neal@gompa.dev,m:yilun.xu@intel.com,m:tony@atomide.com,m:liviu.dudau@arm.com,m:pt
 yser@xes-inc.com,m:j@jannau.net,m:florian.fainelli@broadcom.com,m:peter.griffin@linaro.org,m:sravanhome@gmail.com,m:mfd@lists.linux.dev,m:linux-mediatek@lists.infradead.org,m:matthias.bgg@gmail.com,m:andriy.shevchenko@linux.intel.com,m:angelogioacchino.delregno@collabora.com,m:jogletre@opensource.cirrus.com,m:patches@opensource.cirrus.com,m:nicolas.ferre@microchip.com,m:colin.foster@in-advantage.com,m:ben.bright@cirrus.com,m:linux@ew.tq-group.com,m:geert@glider.be,m:marekvasut@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[sntech.de,glider.be,samsung.com,st-md-mailman.stormreply.com,gmail.com,vger.kernel.org,iki.fi,baylibre.com,bootlin.com,lists.linux.dev,pengutronix.de,kernel.org,broadcom.com,cirrus.com,chromium.org,lists.infradead.org,opensource.cirrus.com,analog.com,linux.intel.com,linaro.org,sholland.org,redhat.com,nxp.com,loongson.cn,kemnade.info,gateworks.com,gmx.net,linux.alibaba.com,diasemi.com,tuxon.dev,intel.com,gompa.dev,atomide.com,arm.com,xes-inc.com,jannau.net,collabora.com,microchip.com,in-advantage.com,ew.tq-group.com];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCPT_COUNT_GT_50(0.00)[90];
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
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 64A1173DE9A

T24gVGh1LCBKdWwgOSwgMjAyNiBhdCA2OjU54oCvUE0gVXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBD
YXBhYmxlIEh1YikKPHUua2xlaW5lLWtvZW5pZ0BiYXlsaWJyZS5jb20+IHdyb3RlOgoKPiBUaGUg
b2JqZWN0aXZlIGZvciB0aGlzIHNlcmllcyBpcyB0byBwcmVwYXJlIG1mZCBmb3IgY2hhbmdpbmcK
PiBvZl9kZXZpY2VfaWQgYW5kIHRoZSBvdGhlcnMgdG8gbWFrZSBkcml2ZXJfZGF0YSBhIHVuaW9u
LCBzZWUKPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvY292ZXIuMTc4MDA0ODkyNS5naXQu
dS5rbGVpbmUta29lbmlnQGJheWxpYnJlLmNvbS8KPiBmb3IgdGhlIGlkZWEgYmVoaW5kIGl0LgoK
VGhlIHNlcmllczoKUmV2aWV3ZWQtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVzd0BrZXJuZWwub3Jn
PgoKWW91cnMsCkxpbnVzIFdhbGxlaWoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
