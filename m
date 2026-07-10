Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qLvaM5TJUGps5AIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Jul 2026 12:29:40 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 54FC6739B3D
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Jul 2026 12:29:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EC174C8F274;
	Fri, 10 Jul 2026 10:29:39 +0000 (UTC)
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com
 [74.125.224.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2CA6EC6C859
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jul 2026 10:29:38 +0000 (UTC)
Received: by mail-yx1-f41.google.com with SMTP id
 956f58d0204a3-66771ded50aso1273221d50.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jul 2026 03:29:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783679377; x=1784284177;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=HsVN2cPDw+/JUxMMLcOD68aRVLlq59TmevfTz9ChQ+g=;
 b=E/B29Bh/uQ20szre468GnKKsCg5sar/uJp9wZoW86M8okzYgFVxhVS3RYRI9tBFJlh
 NPwsW94KQKBmRef4seT+nsLdTi3DhWUgvGhZiC/hyQRw62+x7XcyunVMzpAGp+cuduE8
 lnSU1sOv1BOs5NsmrXLHoDZ7CnHphNx5GsF1Wjgrm7WlIMl25tlYkNwwoUAlGSHpkrg6
 gSQrnS3wKxHThRoGcklxMmxPGqQ4lbKCqDoeEk/SGg6XmU2JdqP7k6FyQCKgqGT3lVxa
 k9ZXS+8PYEhW5gazZGCE3Ec9XUSvdengDjz0yu3XZxixGYBxMnBFtcrnWXm1hoGZx++X
 1ucQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RrcrMzUDgRW45NfcFrgYYjCC0oI+hPtMHDZipfYqipVusB5c1sFHoLQSH1ArQP9NtPA8uWuUf1BQy+4OQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx+rDyM04sN+y6YRtkeRbFcnnn8exnzb9l7DLASGZgwdCrVYucb
 7IMCyf/CTdAsFNmEJHKvZ1kOgA7FEv4496Bc2PDvEkVCRC+BmjmJAAIP73qOlVk04eM=
X-Gm-Gg: AfdE7cmkdrZNmOT1RSgEsq+zAiL/YgDQsMb+T+RvmXiaJRRCRa12S/2R700BTPM7Cee
 3MX9aF4ITGEA3Qd1PwCBUmNKAOyB1SPRAFAbcoDKlRwSDrR9MmAxkdjsbFPXa55GghyhnGr+dDv
 gJMZT+oA5/edUsHgiZW7cGhBDiSLFfarNgn7ws+QNOTwO99Ql35IYoVIKqi2cqHLt9z3lqLY0GD
 YFf4lrx8hwdYuJvZb5aYlxzOH9BZHh8RsejPJ05BDp5XWBzoj8bVphPiF2/gK6LokSbwGwj0DGg
 /2RRpVgHSFXti2FhYxHyqvhOqHOPLrTAkPnDQGOTomc2LCAP9jsuSw7Qv95zUUOCxqpKEF8Tyxa
 o6rfg1JwOwL61f90U+Vso3YZVf9+76PmweTCMMLW92NnXt+MCYbeeaTQiLwA7OJdYg+DlrSCRsA
 sRSWz/Rf1RJGsUYYamyuJOkM1UhQc8rA6lKWp6z7IfScr2lkUV4Z3kb01neA2UReZv
X-Received: by 2002:a05:690e:4188:b0:667:6f8a:cbca with SMTP id
 956f58d0204a3-6679efcbef8mr6712323d50.8.1783679376710; 
 Fri, 10 Jul 2026 03:29:36 -0700 (PDT)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com.
 [209.85.128.174]) by smtp.gmail.com with ESMTPSA id
 956f58d0204a3-6678779e37fsm6440192d50.5.2026.07.10.03.29.36
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jul 2026 03:29:36 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-80d33d13a23so9673417b3.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jul 2026 03:29:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AHgh+Rqnple/lHFCnJVTtLnKZPtjCc4enyGHw80N+m1uEWHQ4mBMMIW8q00SrTSQZago+TOGthk9TsCSGL+Krg==@st-md-mailman.stormreply.com
X-Received: by 2002:a05:6102:3911:b0:726:e608:6658 with SMTP id
 ada2fe7eead31-744dff43a82mr6415934137.11.1783678885257; Fri, 10 Jul 2026
 03:21:25 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1783615311.git.u.kleine-koenig@baylibre.com>
 <e5cc82aa51da5f545f745b126923fdd6085a68a0.1783615311.git.u.kleine-koenig@baylibre.com>
In-Reply-To: <e5cc82aa51da5f545f745b126923fdd6085a68a0.1783615311.git.u.kleine-koenig@baylibre.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 10 Jul 2026 12:21:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW4Thb0en6jeD23KhDp4pTe2F8o5GcBx4fnB+JAxPG-bQ@mail.gmail.com>
X-Gm-Features: AUfX_mxlLApCIjqxIsg4l7Qhe6Rgf_3Xy6YCZC9GZlPPApUQFkmqIVPuBIh_jUI
Message-ID: <CAMuHMdW4Thb0en6jeD23KhDp4pTe2F8o5GcBx4fnB+JAxPG-bQ@mail.gmail.com>
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?=
 <u.kleine-koenig@baylibre.com>
Cc: imx@lists.linux.dev, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Tony Lindgren <tony@atomide.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Frank Li <Frank.Li@nxp.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 patches@opensource.cirrus.com, Jernej Skrabec <jernej.skrabec@gmail.com>,
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
 Chunyan Zhang <zhang.lyra@gmail.com>, Linus Walleij <linusw@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Heiko Stuebner <heiko@sntech.de>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 asahi@lists.linux.dev, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 Ben Bright <ben.bright@cirrus.com>, Neal Gompa <neal@gompa.dev>,
 David Rhodes <david.rhodes@cirrus.com>, linux-sunxi@lists.linux.dev
Subject: Re: [Linux-stm32] [PATCH v3 21/23] mfd: Unify style of of_device_id
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
X-Spamd-Result: default: False [2.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,bootlin.com,linaro.org,atomide.com,kernel.org,nxp.com,tuxon.dev,opensource.cirrus.com,gmail.com,samsung.com,cirrus.com,jannau.net,st-md-mailman.stormreply.com,vger.kernel.org,broadcom.com,iki.fi,kemnade.info,baylibre.com,arm.com,pengutronix.de,gateworks.com,gmx.net,lists.infradead.org,linux.alibaba.com,collabora.com,diasemi.com,sholland.org,sntech.de,microchip.com,gompa.dev];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_RECIPIENTS(0.00)[m:u.kleine-koenig@baylibre.com,m:imx@lists.linux.dev,m:alexandre.belloni@bootlin.com,m:andre.draszik@linaro.org,m:tony@atomide.com,m:lpieralisi@kernel.org,m:Frank.Li@nxp.com,m:claudiu.beznea@tuxon.dev,m:patches@opensource.cirrus.com,m:jernej.skrabec@gmail.com,m:alim.akhtar@samsung.com,m:fred.treven@cirrus.com,m:j@jannau.net,m:linux-stm32@st-md-mailman.stormreply.com,m:marek.vasut+renesas@gmail.com,m:linux-samsung-soc@vger.kernel.org,m:florian.fainelli@broadcom.com,m:aaro.koskinen@iki.fi,m:festevam@gmail.com,m:lee@kernel.org,m:magnus.damm@gmail.com,m:krzk@kernel.org,m:peter.griffin@linaro.org,m:cw00.choi@samsung.com,m:linux-omap@vger.kernel.org,m:andreas@kemnade.info,m:bcm-kernel-feedback-list@broadcom.com,m:khilman@baylibre.com,m:linux-arm-msm@vger.kernel.org,m:orsonzhai@gmail.com,m:liviu.dudau@arm.com,m:luca.ceresoli@bootlin.com,m:s.hauer@pengutronix.de,m:mcoquelin.stm32@gmail.com,m:ckeepax@opensource.cirrus.com,m:sravanhome@gmail.com,m:mazziesaccount@gmail.
 com,m:rjui@broadcom.com,m:tharvey@gateworks.com,m:mfd@lists.linux.dev,m:j.neuschaefer@gmx.net,m:linux-sound@vger.kernel.org,m:rogerq@kernel.org,m:rf@opensource.cirrus.com,m:linux-mediatek@lists.infradead.org,m:linux-rpi-kernel@lists.infradead.org,m:baolin.wang@linux.alibaba.com,m:matthias.bgg@gmail.com,m:linux-amlogic@lists.infradead.org,m:sven@kernel.org,m:wens@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:angelogioacchino.delregno@collabora.com,m:jogletre@opensource.cirrus.com,m:neil.armstrong@linaro.org,m:support.opensource@diasemi.com,m:sbranden@broadcom.com,m:sudeep.holla@kernel.org,m:zhang.lyra@gmail.com,m:linusw@kernel.org,m:samuel@sholland.org,m:heiko@sntech.de,m:nicolas.ferre@microchip.com,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:asahi@lists.linux.dev,m:kernel@pengutronix.de,m:mathieu.dubois-briand@bootlin.com,m:ben.bright@cirrus.com,m:neal@gompa.dev,m:david.rhodes@cirrus.com,m:linux-sunxi@lists.linux.de
 v,m:jernejskrabec@gmail.com,m:marekvasut@gmail.com,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[73];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 54FC6739B3D

T24gVGh1LCA5IEp1bCAyMDI2IGF0IDE5OjAwLCBVd2UgS2xlaW5lLUvDtm5pZyAoVGhlIENhcGFi
bGUgSHViKQo8dS5rbGVpbmUta29lbmlnQGJheWxpYnJlLmNvbT4gd3JvdGU6Cj4gVGhlc2UgYXJy
YXlzIGFscmVhZHkgbW9zdGx5IG1hdGNoIHRoZSBtb3N0IHVzZWQgYW5kIGdlbmVyYWxseQo+IHJl
Y29tbWVuZGVkIGNvZGluZyBzdHlsZS4gVGhhdCBpczoKPgo+ICAtIG5vIGNvbW1hIGFmdGVyIHRo
ZSBsaXN0IHRlcm1pbmF0b3I7Cj4gIC0gYSBjb21tYSBhZnRlciBhbiBpbml0aWFsaXplciBpZiAo
YW5kIG9ubHkgaWYpIHRoZSBjbG9zaW5nIH0gaXMgbm90Cj4gICAgZGlyZWN0bHkgZm9sbG93aW5n
Owo+ICAtIG5vIGV4cGxpY2l0IHplcm9zIGluIHRoZSBsaXN0IHRlcm1pbmF0b3I7Cj4gIC0gYSBz
cGFjZSBhZnRlciBhbiBvcGVuaW5nIHsgYW5kIGJlZm9yZSBhIGNsb3NpbmcgfSwgYSBzaW5nbGUg
c3BhY2UgaW4KPiAgICB0aGUgbGlzdCB0ZXJtaW5hdG9yOwo+Cj4gQWRhcHQgdGhlIG9mZmVuZGVy
cyBhY2NvcmRpbmdseS4KPgo+IFJldmlld2VkLWJ5OiBBbmRyw6kgRHJhc3ppayA8YW5kcmUuZHJh
c3ppa0BsaW5hcm8ub3JnPiAjIGZvciBNYXhpbSBNQVg3Nzc1OQo+IFJldmlld2VkLWJ5OiBDaGFy
bGVzIEtlZXBheCA8Y2tlZXBheEBvcGVuc291cmNlLmNpcnJ1cy5jb20+Cj4gU2lnbmVkLW9mZi1i
eTogVXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1YikgPHUua2xlaW5lLWtvZW5pZ0Bi
YXlsaWJyZS5jb20+Cgo+ICBkcml2ZXJzL21mZC9yei1tdHUzLmMgICAgICAgICAgfCAgMiArLQoK
UmV2aWV3ZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+
ICMgcmVuZXNhcwoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAgICAgICAgICAgICAgICBH
ZWVydAoKLS0gCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5
b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlv
bnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hl
biBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBz
b21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExp
bnVzIFRvcnZhbGRzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
