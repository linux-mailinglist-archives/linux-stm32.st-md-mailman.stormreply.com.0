Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id H1sqHLFjT2okfwIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 09 Jul 2026 11:02:41 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7027E72EA08
	for <lists+linux-stm32@lfdr.de>; Thu, 09 Jul 2026 11:02:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=linaro.org header.s=google header.b=sCaWdBYs;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=linaro.org (policy=none);
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 32E8CC8F298;
	Thu,  9 Jul 2026 09:02:40 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 86CF5C7A832
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Jul 2026 12:58:07 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-c126b8118afso89860366b.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 08 Jul 2026 05:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783515487; x=1784120287;
 darn=st-md-mailman.stormreply.com; 
 h=mime-version:user-agent:content-transfer-encoding:content-type
 :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=rcoRsbC0BO6uVEMaG71BCowfWGAxbSpWO+tIQGO84C8=;
 b=sCaWdBYsBmdkxUoNIgCSUQJtfDbG9EX9Cwvqcd9Swb+9YvWDpQTNsrYZNBjZ/5ccw5
 dSUNqGtb1yxMT8SNhXW9uzZKmEHEclau/+LZPJOhDs3Y1ZUf1q+JPmDgo5fkvsLzhCAn
 980izYNe1Y8VZoLuvFrj2sEprNvUGOJrripq5S1qIoLkyPUdAMdxJuZGpUh3kdAwyPm1
 F+u2m21LerkleiQeDuS8OSf8hvlgYNjMyrYtpzBoTn0HuJ3IiTPA1j90meR1Ct6uvGlX
 RpdV/XgUWXHTMvi78OlXmypinzrJ4OszzIHLUU33s7RtusvlLjgwndTWfefGZ70toSp/
 G3tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783515487; x=1784120287;
 h=mime-version:user-agent:content-transfer-encoding:content-type
 :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=rcoRsbC0BO6uVEMaG71BCowfWGAxbSpWO+tIQGO84C8=;
 b=mXA/1EKg1UEba9Yf0+Kn4goabpi9r0cRMnynAZYD2gnAt2sQS7Nkg93jsObhBVI2CO
 gyIUSqXur6L7bC0c+ulap132raTjScvh6sAd6npArHXylG0lkiaOOePPrk5kK5MCcQGm
 FPgbrSE0w7In0ailUqTGOsBnxNb7kic7o77kkNotc2h6iJzFJ84fo54uaJ1ZwcEbQhQY
 dZuFRLisuQYSz2sk/DQQDJYYTexzhByIn/pKwJ1IHPuhe8Y0s3I6NuAf6iYR5udZBOJa
 BH+Z8MPDv+SmeGn58e7jy9rYkqC0we3Hev0BuH6xVtsLTsrpAP/d54Ece4D+fWxkOAek
 y67A==
X-Forwarded-Encrypted: i=1;
 AHgh+RpUL/cKXeTMpLda476NzhJ01W1oM3OFWNMk5E9G8cDVlNBlYU8aA9iTzGV+efafrbdYjXM2/pry7b+Snw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yxl3vvD0xmMfduawkJiFnSY+xNV1sEa+AS+RFspfmWfMcB5665m
 QlryvVsauFFJEgaNaaDTFJO/SYrj+bb7XWXz1q0hd7EZuU86sY19XVIAABX6JJ+vkH4=
X-Gm-Gg: AfdE7cnSAJxUUql3jSQh5YxZQcG1XbWNcE9bmcPWQyqwwc5mfXIsGLbcZ6hz3Pj+9Q4
 ptOz5RuAd6izyBLoFvp/NVenjdLVbMErOOAULYMQzJ4Wii/D+szCo+4gix6NgimsUdp88QZeKDv
 GP/pdAs9+zyEbOh9y90c5BO+Ivqg7rETuqxOC2S35BwrvjPCODNDPGojrso4JyH2hFEAGWcYhPE
 BLryJtFSaTJXkTJcUrWA9czK1GZqzwfD8RgN4SmMFzeOg84+//ppimW8IfmQZm45+2ESyuBQsTt
 Yy/bkirQY9BW8UJpzjn4Fasv82ftAo7Ix3mf7ucO0I36qkjvL0D0r+nRPWDQeOFtyOLSg12vB1Y
 lk7UPQvPSFtjcDnhWhb0xt6hrW85lmLLEiHYNDS+H6lug/OFxzyRoujIH5HvfXjcCU9Yb8y96U1
 Vm8p9XkDHp3vMr34QJfr8=
X-Received: by 2002:a17:907:7211:b0:c12:4597:601f with SMTP id
 a640c23a62f3a-c15ce131902mr120160066b.53.1783515486648; 
 Wed, 08 Jul 2026 05:58:06 -0700 (PDT)
Received: from draszik.lan ([212.129.81.171]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c15ad84c636sm324005266b.22.2026.07.08.05.58.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jul 2026 05:58:06 -0700 (PDT)
Message-ID: <eed86cadd335597d7c7a4278a9a09706913ba6a3.camel@linaro.org>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= "(The Capable Hub)"
 <u.kleine-koenig@baylibre.com>
Date: Wed, 08 Jul 2026 13:58:20 +0100
In-Reply-To: <ce43f6ec640a7835d64d3d696ff09229c3d31075.1783507945.git.u.kleine-koenig@baylibre.com>
References: <cover.1783507945.git.u.kleine-koenig@baylibre.com>
 <ce43f6ec640a7835d64d3d696ff09229c3d31075.1783507945.git.u.kleine-koenig@baylibre.com>
User-Agent: Evolution 3.56.2-8+build1 
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 09 Jul 2026 09:02:39 +0000
Cc: imx@lists.linux.dev, Alexandre Belloni <alexandre.belloni@bootlin.com>,
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
 Jonathan =?ISO-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
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
 Samuel Holland <samuel@sholland.org>,
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
X-Spamd-Result: default: False [3.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[linaro.org:s=google];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[linaro.org : SPF not aligned (relaxed),none];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:u.kleine-koenig@baylibre.com,m:imx@lists.linux.dev,m:alexandre.belloni@bootlin.com,m:geert+renesas@glider.be,m:tony@atomide.com,m:lpieralisi@kernel.org,m:Frank.Li@nxp.com,m:claudiu.beznea@tuxon.dev,m:patches@opensource.cirrus.com,m:jernej.skrabec@gmail.com,m:alim.akhtar@samsung.com,m:fred.treven@cirrus.com,m:j@jannau.net,m:linux-stm32@st-md-mailman.stormreply.com,m:marek.vasut+renesas@gmail.com,m:linux-samsung-soc@vger.kernel.org,m:florian.fainelli@broadcom.com,m:aaro.koskinen@iki.fi,m:festevam@gmail.com,m:lee@kernel.org,m:magnus.damm@gmail.com,m:krzk@kernel.org,m:peter.griffin@linaro.org,m:cw00.choi@samsung.com,m:linux-omap@vger.kernel.org,m:andreas@kemnade.info,m:bcm-kernel-feedback-list@broadcom.com,m:khilman@baylibre.com,m:linux-arm-msm@vger.kernel.org,m:orsonzhai@gmail.com,m:liviu.dudau@arm.com,m:luca.ceresoli@bootlin.com,m:s.hauer@pengutronix.de,m:mcoquelin.stm32@gmail.com,m:ckeepax@opensource.cirrus.com,m:sravanhome@gmail.com,m:mazziesaccount@gmail.c
 om,m:rjui@broadcom.com,m:tharvey@gateworks.com,m:mfd@lists.linux.dev,m:j.neuschaefer@gmx.net,m:linux-sound@vger.kernel.org,m:rogerq@kernel.org,m:rf@opensource.cirrus.com,m:linux-mediatek@lists.infradead.org,m:linux-rpi-kernel@lists.infradead.org,m:baolin.wang@linux.alibaba.com,m:matthias.bgg@gmail.com,m:linux-amlogic@lists.infradead.org,m:sven@kernel.org,m:wens@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:angelogioacchino.delregno@collabora.com,m:jogletre@opensource.cirrus.com,m:neil.armstrong@linaro.org,m:support.opensource@diasemi.com,m:sbranden@broadcom.com,m:sudeep.holla@kernel.org,m:zhang.lyra@gmail.com,m:linusw@kernel.org,m:samuel@sholland.org,m:nicolas.ferre@microchip.com,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:asahi@lists.linux.dev,m:kernel@pengutronix.de,m:mathieu.dubois-briand@bootlin.com,m:ben.bright@cirrus.com,m:neal@gompa.dev,m:david.rhodes@cirrus.com,m:linux-sunxi@lists.linux.dev,m:geert@glider.be,m:jernejskrabec@gmail.com,m:marekvas
 ut@gmail.com,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[andre.draszik@linaro.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:-];
	RCPT_COUNT_GT_50(0.00)[71];
	ALIAS_RESOLVED(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[andre.draszik@linaro.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,bootlin.com,glider.be,atomide.com,kernel.org,nxp.com,tuxon.dev,opensource.cirrus.com,gmail.com,samsung.com,cirrus.com,jannau.net,st-md-mailman.stormreply.com,vger.kernel.org,broadcom.com,iki.fi,linaro.org,kemnade.info,baylibre.com,arm.com,pengutronix.de,gateworks.com,gmx.net,lists.infradead.org,linux.alibaba.com,collabora.com,diasemi.com,sholland.org,microchip.com,gompa.dev];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,renesas];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:from_mime,linaro.org:email,linaro.org:mid,st-md-mailman.stormreply.com:from_smtp,st-md-mailman.stormreply.com:rdns,baylibre.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7027E72EA08

T24gV2VkLCAyMDI2LTA3LTA4IGF0IDEzOjE1ICswMjAwLCBVd2UgS2xlaW5lLUvDtm5pZyAoVGhl
IENhcGFibGUgSHViKSB3cm90ZToKPiBUaGVzZSBhcnJheXMgYWxyZWFkeSBtb3N0bHkgbWF0Y2gg
dGhlIG1vc3QgdXNlZCBhbmQgZ2VuZXJhbGx5Cj4gcmVjb21tZW5kZWQgY29kaW5nIHN0eWxlLiBU
aGF0IGlzOgo+IAo+IMKgLSBubyBjb21tYSBhZnRlciB0aGUgbGlzdCB0ZXJtaW5hdG9yOwo+IMKg
LSBhIGNvbW1hIGFmdGVyIGFuIGluaXRpYWxpemVyIGlmIChhbmQgb25seSBpZikgdGhlIGNsb3Np
bmcgfSBpcyBub3QKPiDCoMKgIGRpcmVjdGx5IGZvbGxvd2luZzsKPiDCoC0gbm8gZXhwbGljaXQg
emVyb3MgaW4gdGhlIGxpc3QgdGVybWluYXRvcjsKPiDCoC0gYSBzcGFjZSBhZnRlciBhbiBvcGVu
aW5nIHsgYW5kIGJlZm9yZSBhIGNsb3NpbmcgfSwgYSBzaW5nbGUgc3BhY2UgaW4KPiDCoMKgIHRo
ZSBsaXN0IHRlcm1pbmF0b3I7Cj4gCj4gQWRhcHQgdGhlIG9mZmVuZGVycyBhY2NvcmRpbmdseS4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyAoVGhlIENhcGFibGUgSHViKSA8
dS5rbGVpbmUta29lbmlnQGJheWxpYnJlLmNvbT4KPiAtLS0KPiDCoGRyaXZlcnMvbWZkL21heDc3
NzU5LmPCoMKgwqDCoMKgwqDCoMKgIHzCoCAyICstCgpSZXZpZXdlZC1ieTogQW5kcsOpIERyYXN6
aWsgPGFuZHJlLmRyYXN6aWtAbGluYXJvLm9yZz4gIyBmb3IgTWF4aW0gTUFYNzc3NTkKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFp
bGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6
Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3Rt
MzIK
