Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CWkSI5cxTmpmFgIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 08 Jul 2026 13:16:39 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C59724C4C
	for <lists+linux-stm32@lfdr.de>; Wed, 08 Jul 2026 13:16:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=baylibre.com header.s=google header.b=SSOSIAxr;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BDC60C8F274;
	Wed,  8 Jul 2026 11:16:38 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0CB74C1A979
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Jul 2026 11:16:36 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-493c7902f47so3885175e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 08 Jul 2026 04:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre.com; s=google; t=1783509396; x=1784114196;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=mrywEV0ctTdfJBRbqMucCmD8SIRnDB8S2VGVl/K2tlQ=;
 b=SSOSIAxrpyd5i57RlVGzfkYU6hVx5yy3yN0ySR3O2nJzsHPkMFrW5RNTkCfsSJBZ2b
 ODj32iziJli6jiTRQxFw3wc7Z/mdVqSRESZQBX2ioSbRLasbURPg11XojatiX6JnJIX4
 dKIbcBkWhZ3kIMIJOVpjAS4bZV9eqOPHbpmROYjGkq5XiWP71fDng9sLswWusqH/wKLq
 bemuet/VzeJJsCUpCB/UYW9xFAzXGTrn7+BEt75HUcRtLDGkkhwIRhLg9ScXhvL3wal6
 b7aEyETybBKFFV+ZwKqelgHTYQ+HN5elrZjsxWa3sNO0iAQQqwfu6aFFap8nJ4lhEOiI
 PveA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783509396; x=1784114196;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=mrywEV0ctTdfJBRbqMucCmD8SIRnDB8S2VGVl/K2tlQ=;
 b=jS7FYSsMxtrEN62760CJ0hO4Jp1pHdoZIpuRVQVNgaJb3gJ0uEE9QKGcqD+Q0kTFMd
 t2twP0Y3T+1a5AEzt+mPPqDIVNnbJ4QifwDcaTV0vye2WRTQsdVjDBbp9BMx1Uzevg55
 2qiKFb0jZliWkMsV0QNGpLT5t1DmKilqwjCKimaqbB4pAQwonJbC74eBN3WoI9Nr1THL
 AiJZqkpdq8nXWVwgauSOjvNnhFVL7QPJlwP5viGjuiDrszxS4JtptT6wcFH/uLLvmIOi
 eHd1efm64BfFzaF10OEbukLFIu2pnfsg3aCODFKElstoYFAKeMKow01SxRuH3n++KpBo
 JsrA==
X-Forwarded-Encrypted: i=1;
 AHgh+RrvV4NUIKlFdRgbUBy9RzVGH9+u9DUV6rD3MYo6Sk4rKXFoVemEZgLKXltfClxFD912XAvHLRjt1Xh4Tg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxJJYKPO9702QQCxIOdOij4L28wncKb8An4PIEhnkuPukWJ9DXI
 J6uJWsRuFrIW+83/QtwrcDk//IACpRt68vMClH2oP27czAF5ksv0F8Qk/D/I52dGqes=
X-Gm-Gg: AfdE7cn0AULBtzq+1GRhxdrM2sk5DQm16JREApa+uzTdPaWPEC2bzmeZydpgrOcT2wt
 DbV8gDuc01nDevWW1LmL+0eL9xp1PcJgxge66JVNX6PcUbaQ8Opg2QdH92dvPNg70AqME+hDEnU
 LF7ucY7RQZlzYydh/ZE2UFT8yhVN1iC3x1SC+uvzBbo+Ekc+QUTJlQe8nXv/xjH5+dGFlJ0QplG
 xbDfbR5Rr3bm2gc1tc3pUOoqr3/gA8IorkDwkMcEjVhPoIIirpXKQ5MuzEBsx7SfkrkFnzt5AXj
 uVzcVCgqgfn47th/EV38vHcZ2Cyx0B8+U2HZc2gjLiozkMBzNzCHJ9BTfHvF7eKFHSsVbCCbLOf
 7/N/4AQwWz5az8iPNv6ALiST9O0OWtjm/Bhedlj9L7uDmpTvRA/l3i8IoDgqCEA4wkNtkAp68oD
 PgF0wYdCuzGMxrD7PHY04XMi4pYzcGCsJ2bMVtPQbiO7xh7J/NPqJCY4mLuDdDROxRxI64ASSFE
 T7q
X-Received: by 2002:a05:600c:3e07:b0:493:d0b2:bc46 with SMTP id
 5b1f17b1804b1-493e6868818mr22405785e9.28.1783509395617; 
 Wed, 08 Jul 2026 04:16:35 -0700 (PDT)
Received: from localhost
 (p200300f65f47db04930dc5bd4534e1e5.dip0.t-ipconnect.de.
 [2003:f6:5f47:db04:930d:c5bd:4534:e1e5])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-47aa0f2186bsm40991012f8f.36.2026.07.08.04.16.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jul 2026 04:16:35 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?=
 <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Date: Wed,  8 Jul 2026 13:15:07 +0200
Message-ID: <cover.1783507945.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=10455;
 i=u.kleine-koenig@baylibre.com; h=from:subject:message-id;
 bh=E3FC72ljteUGOGcVpTGBp/YrOoyfgnbCfRcJyfB8Y/0=;
 b=owGbwMvMwMXY3/A7olbonx/jabUkhiw/Q5s+Y/k2o7lHpivyHIncWbh850X+jPRNklNv1OUu/
 aWVzvewk9GYhYGRi0FWTJHFvnFNplWVXGTn2n+XYQaxMoFMYeDiFICJ6DzjYNhU8rM+z2p9eUKp
 X1D4b7MgQ+8ZqyOSv7Hly5nxhf09eenT9602CQJvrz87OONjYenZm5cfbCrentXdUvfpl1LULqm
 vCz+Y/NeomcT78CvDzuQarcm2nqbGuxt+nDQy9Fvl4jj12VypDMGQn2tfsjCqzT+Q8exTr5y7uW
 1Mof0UwSWvw9kDPv6Sl/9QEb55R4O8Z50Na0JXpv3mojvlJ3IaPimrTq5j8NnI/GBy80pWY1425
 8WWlXaaqq8Xd//uqxOqmf4rfH2+SPMx1jutu47e3ee2fXXW8kPuV/jsZF92d/2/JDI33HRW8VXe
 lcY/VdmSz/ZZ3L/rLG5q2aFRGFnzmTVxnUrCasvcTyvdAQ==
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
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
 Magnus Damm <magnus.damm@gmail.com>,
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Tom Rix <trix@redhat.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Frank Li <Frank.Li@nxp.com>, Qunqin Zhao <zhaoqunqin@loongson.cn>,
 Krzysztof Kozlowski <krzk@kernel.org>, Fred Treven <fred.treven@cirrus.com>,
 Fabio Estevam <festevam@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andreas Kemnade <andreas@kemnade.info>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Orson Zhai <orsonzhai@gmail.com>, Ray Jui <rjui@broadcom.com>,
 Tim Harvey <tharvey@gateworks.com>,
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Benson Leung <bleung@chromium.org>, Samuel Kayode <samkay014@gmail.com>,
 Support Opensource <support.opensource@diasemi.com>,
 Andreas Werner <andreas.werner@men.de>, Linus Walleij <linusw@kernel.org>,
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
Subject: [Linux-stm32] [PATCH v2 00/23] mfd: Use named initializers for
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
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[baylibre.com:s=google];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[baylibre.com];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:geert+renesas@glider.be,m:alim.akhtar@samsung.com,m:linux-stm32@st-md-mailman.stormreply.com,m:marek.vasut+renesas@gmail.com,m:linux-samsung-soc@vger.kernel.org,m:aaro.koskinen@iki.fi,m:khilman@baylibre.com,m:cw00.choi@samsung.com,m:luca.ceresoli@bootlin.com,m:linux-sunxi@lists.linux.dev,m:s.hauer@pengutronix.de,m:linux-sound@vger.kernel.org,m:sudeep.holla@kernel.org,m:sven@kernel.org,m:linux-omap@vger.kernel.org,m:andy@kernel.org,m:sbranden@broadcom.com,m:linux-kernel@vger.kernel.org,m:linux-crypto@vger.kernel.org,m:kernel@pengutronix.de,m:alexandre.belloni@bootlin.com,m:david.rhodes@cirrus.com,m:groeck@chromium.org,m:chrome-platform@lists.linux.dev,m:zhang.lyra@gmail.com,m:magnus.damm@gmail.com,m:ckeepax@opensource.cirrus.com,m:michael.hennerich@analog.com,m:mazziesaccount@gmail.com,m:linux-arm-msm@vger.kernel.org,m:rogerq@kernel.org,m:linux-rpi-kernel@lists.infradead.org,m:linux-amlogic@lists.infradead.org,m:wens@kernel.org,m:mika.wester
 berg@linux.intel.com,m:linux-arm-kernel@lists.infradead.org,m:neil.armstrong@linaro.org,m:thomas.richard@bootlin.com,m:samuel@sholland.org,m:linux-renesas-soc@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:mathieu.dubois-briand@bootlin.com,m:imx@lists.linux.dev,m:andre.draszik@linaro.org,m:trix@redhat.com,m:lpieralisi@kernel.org,m:Frank.Li@nxp.com,m:zhaoqunqin@loongson.cn,m:krzk@kernel.org,m:fred.treven@cirrus.com,m:festevam@gmail.com,m:jernej.skrabec@gmail.com,m:andreas@kemnade.info,m:bcm-kernel-feedback-list@broadcom.com,m:orsonzhai@gmail.com,m:rjui@broadcom.com,m:tharvey@gateworks.com,m:j.neuschaefer@gmx.net,m:rf@opensource.cirrus.com,m:baolin.wang@linux.alibaba.com,m:bleung@chromium.org,m:samkay014@gmail.com,m:support.opensource@diasemi.com,m:andreas.werner@men.de,m:linusw@kernel.org,m:claudiu.beznea@tuxon.dev,m:asahi@lists.linux.dev,m:qipeng.zha@intel.com,m:neal@gompa.dev,m:yilun.xu@intel.com,m:tony@atomide.com,m:liviu.dudau@arm.com,m:ptyser@xes-inc.com,m:j@jannau.net,m:florian.
 fainelli@broadcom.com,m:peter.griffin@linaro.org,m:sravanhome@gmail.com,m:mfd@lists.linux.dev,m:linux-mediatek@lists.infradead.org,m:matthias.bgg@gmail.com,m:andriy.shevchenko@linux.intel.com,m:angelogioacchino.delregno@collabora.com,m:jogletre@opensource.cirrus.com,m:patches@opensource.cirrus.com,m:nicolas.ferre@microchip.com,m:colin.foster@in-advantage.com,m:ben.bright@cirrus.com,m:linux@ew.tq-group.com,m:geert@glider.be,m:marekvasut@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[u.kleine-koenig@baylibre.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,meta];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[glider.be,samsung.com,st-md-mailman.stormreply.com,gmail.com,vger.kernel.org,iki.fi,baylibre.com,bootlin.com,lists.linux.dev,pengutronix.de,kernel.org,broadcom.com,cirrus.com,chromium.org,opensource.cirrus.com,analog.com,lists.infradead.org,linux.intel.com,linaro.org,sholland.org,redhat.com,nxp.com,loongson.cn,kemnade.info,gateworks.com,gmx.net,linux.alibaba.com,diasemi.com,men.de,tuxon.dev,intel.com,gompa.dev,atomide.com,arm.com,xes-inc.com,jannau.net,collabora.com,microchip.com,in-advantage.com,ew.tq-group.com];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCPT_COUNT_GT_50(0.00)[89];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,renesas];
	DKIM_TRACE(0.00)[baylibre.com:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:mid,baylibre.com:from_mime,stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:from_smtp,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 17C59724C4C

SGVsbG8sCgp0aGlzIHNlcmllcyBzdXBlcnNlZWRzIG15IHByZXZpb3VzIHBhdGNoICJbUEFUQ0gg
djFdIG1mZDogVXNlIG5hbWVkCmluaXRpYWxpemVycyBmb3IgYXJyYXlzIG9mIGkyY19kZXZpY2Vf
ZGF0YSIKKGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyNjA1MTUwOTU4MzkuNDAwNTQ2
MC0yLXUua2xlaW5lLWtvZW5pZ0BiYXlsaWJyZS5jb20pCnRoYXQgTGVlIGFza2VkIG1lIHRvIHJl
YmFzZSBhbmQgYWxzbyB0aGUgc2VyaWVzICJbUEFUQ0ggdjEgMC8zXSBtZmQ6CkluaXRpYWxpemUg
c3BpX2RldmljZV9pZCBhcnJheXMgdXNpbmcgbWVtYmVyIG5hbWVzIgooaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvbGttbC9jb3Zlci4xNzgzMDAzMjU2LmdpdC51LmtsZWluZS1rb2VuaWdAYmF5bGli
cmUuY29tKS4KClRoZSBvYmplY3RpdmUgZm9yIHRoaXMgc2VyaWVzIGlzIHRvIHByZXBhcmUgbWZk
IGZvciBjaGFuZ2luZwpvZl9kZXZpY2VfaWQgZXRjIHRvIG1ha2UgZHJpdmVyX2RhdGEgYSB1bmlv
biwgc2VlCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9jb3Zlci4xNzgwMDQ4OTI1LmdpdC51
LmtsZWluZS1rb2VuaWdAYmF5bGlicmUuY29tLwpmb3IgdGhlIGlkZWEgYmVoaW5kIGl0LgoKVGhp
cyBzZXJpZXMgaXMgYmFzZWQgb24geWVzdGVyZGF5J3MgbmV4dC9tYXN0ZXIgYW5kIGl0IGRvZXMg
dGhlCnJlc3RydWN0dXJpbmcgbm90IG9ubHkgZm9yIGkyYyBhbmQgc3BpIChhcyB0aGUgdHdvIHNl
cmllcyBtZW50aW9uZWQKYWJvdmUpLCBidXQgZm9yIGFsbCAqX2RldmljZV9pZCBzdHJ1Y3R1cmVz
IHRoYXQgSSBpbnRlbmQgdG8gbW9kaWZ5IHdpdGgKYSB1bmlvbiB0aGF0IGFmZmVjdCBtZmQuIFNv
IChJIGhvcGUpIHRoaXMgaXMgdGhlIG9ubHkgcGF0Y2ggc2VyaWVzCmFmZmVjdGluZyBtZmQgZm9y
IHRoaXMgcXVlc3QuCgpJIGRvbid0IGNhcmUgbXVjaCBhYm91dCB0aGUgbGFzdCBmZXcgcGF0Y2hl
cyB1bmlmeWluZyB0aGUgY29kaW5nIHN0eWxlLgpJIHRoaW5rIGl0J3MgYSBnb29kIG9wcG9ydHVu
aXR5IHRvIGRvIHRoYXQsIGJ1dCBpZiB5b3UgZG9uJ3QgbGlrZSB0aGVtLApqdXN0IGRvbid0IGFw
cGx5IHRoZXNlLgoKQmVzdCByZWdhcmRzClV3ZQoKVXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBh
YmxlIEh1YikgKDIzKToKICBtZmQ6IGJjbTI4MzUtcG06IFJlbW92ZSBtZW1iZXIgb2Ygc3RydWN0
IGJjbTI4MzVfcG0gdGhhdCBpcyBvbmx5IHVzZWQKICAgIGxvY2FsbHkKICBtZmQ6IGJjbTI4MzUt
cG06IERyb3AgdW51c2VkIGhlYWRlcgogIG1mZDoga2VtcGxkOiBTaW1wbGlmeSBkZXZpY2UgYWJz
dHJhY3Rpb24KICBtZmQ6IGxwODc1NjU6IEV4cGxpY2l0bHkgc2V0IGRyaXZlciBkYXRhIGZvciB0
aGUgZ2VuZXJpYyBkdCBjb21wYXRpYmxlCiAgbWZkOiBtdDYzNjA6IERyb3AgaXJyZWxldmFudCBf
X21heWJlX3VudXNlZAogIG1mZDogcnQ0ODMxOiBEcm9wIGlycmVsZXZhbnQgX19tYXliZV91bnVz
ZWQKICBtZmQ6IGxvb25nc29uLXNlOiBEcm9wIHVudXNlZCBhc3NpZ25tZW50IG9mIGFjcGlfZGV2
aWNlX2lkIGRyaXZlciBkYXRhCiAgbWZkOiBEcm9wIHVudXNlZCBhc3NpZ25tZW50IG9mIGkyY19k
ZXZpY2VfaWQgZHJpdmVyIGRhdGEKICBtZmQ6IERyb3AgdW51c2VkIGFzc2lnbm1lbnQgb2YgcGxh
dGZvcm1fZGV2aWNlX2lkIGRyaXZlciBkYXRhCiAgbWZkOiBEcm9wIHVudXNlZCBhc3NpZ25tZW50
IG9mIHNwaV9kZXZpY2VfaWQgZHJpdmVyIGRhdGEKICBtZmQ6IFVzZSBuYW1lZCBpbml0aWFsaXpl
cnMgZm9yIGFjcGlfZGV2aWNlX2lkIGFycmF5cwogIG1mZDogaW50ZWwtbTEwLWJtYy1wbWNpOiBV
c2UgbmFtZWQgaW5pdGlhbGl6ZXJzIGZvciBkZmxfZGV2aWNlX2lkCiAgICBhcnJheQogIG1mZDog
VXNlIG5hbWVkIGluaXRpYWxpemVycyBmb3IgYXJyYXlzIG9mIGkyY19kZXZpY2VfaWQKICBtZmQ6
IHR3bDYwMzA6IFVzZSBuYW1lZCBpbml0aWFsaXplcnMgZm9yIG9mX2RldmljZV9pZAogIG1mZDog
VXNlIFBDSV9ERVZJQ0UqIG1hY3JvcyB0byBpbml0aWFsaXplIHBjaV9kZXZpY2VfaWQgYXJyYXlz
CiAgbWZkOiBVc2UgbmFtZWQgaW5pdGlhbGl6ZXJzIGZvciBwbGF0Zm9ybV9kZXZpY2VfaWQgYXJy
YXkKICBtZmQ6IFVzZSBuYW1lZCBpbml0aWFsaXplcnMgZm9yIGFycmF5cyBvZiBzcGlfZGV2aWNl
X2lkCiAgbWZkOiBVbmlmeSBzdHlsZSBvZiBhY3BpX2RldmljZV9pZCBhcnJheXMKICBtZmQ6IFVu
aWZ5IHN0eWxlIG9mIGRtaV9zeXN0ZW1faWQgYXJyYXlzCiAgbWZkOiBVbmlmeSBzdHlsZSBvZiBp
MmNfZGV2aWNlX2lkIGFycmF5cwogIG1mZDogVW5pZnkgc3R5bGUgb2Ygb2ZfZGV2aWNlX2lkIGFy
cmF5cwogIG1mZDogVW5pZnkgc3R5bGUgb2YgcGNpX2RldmljZV9pZCBhcnJheXMKICBtZmQ6IFVu
aWZ5IHN0eWxlIG9mIHNwaV9kZXZpY2VfaWQgYXJyYXlzCgogZHJpdmVycy9tZmQvODhwbTgwMC5j
ICAgICAgICAgICAgICAgICB8ICA0ICstCiBkcml2ZXJzL21mZC84OHBtODA1LmMgICAgICAgICAg
ICAgICAgIHwgIDQgKy0KIGRyaXZlcnMvbWZkLzg4cG04NjB4LWNvcmUuYyAgICAgICAgICAgfCAg
OCArKy0tCiBkcml2ZXJzL21mZC9hYXQyODcwLWNvcmUuYyAgICAgICAgICAgIHwgIDIgKy0KIGRy
aXZlcnMvbWZkL2FiODUwMC1jb3JlLmMgICAgICAgICAgICAgfCAgOCArKy0tCiBkcml2ZXJzL21m
ZC9hYjg1MDAtc3lzY3RybC5jICAgICAgICAgIHwgIDQgKy0KIGRyaXZlcnMvbWZkL2FjMTAwLmMg
ICAgICAgICAgICAgICAgICAgfCAgMiArLQogZHJpdmVycy9tZmQvYWN0ODk0NWEuYyAgICAgICAg
ICAgICAgICB8ICA4ICsrLS0KIGRyaXZlcnMvbWZkL2FkcDU1MjAuYyAgICAgICAgICAgICAgICAg
fCAgNCArLQogZHJpdmVycy9tZmQvYWx0ZXJhLWExMHNyLmMgICAgICAgICAgICB8ICA0ICstCiBk
cml2ZXJzL21mZC9hbHRlcmEtc3lzbWdyLmMgICAgICAgICAgIHwgIDIgKy0KIGRyaXZlcnMvbWZk
L2FyaXpvbmEtaTJjLmMgICAgICAgICAgICAgfCAxNCArKystLS0tCiBkcml2ZXJzL21mZC9hcml6
b25hLXNwaS5jICAgICAgICAgICAgIHwgMTQgKysrLS0tLQogZHJpdmVycy9tZmQvYXMzNzExLmMg
ICAgICAgICAgICAgICAgICB8ICA4ICsrLS0KIGRyaXZlcnMvbWZkL2FzMzcyMi5jICAgICAgICAg
ICAgICAgICAgfCAgOCArKy0tCiBkcml2ZXJzL21mZC9hdG1lbC1obGNkYy5jICAgICAgICAgICAg
IHwgIDIgKy0KIGRyaXZlcnMvbWZkL2F0bWVsLXNtYy5jICAgICAgICAgICAgICAgfCAgMiArLQog
ZHJpdmVycy9tZmQvYXhwMjB4LWkyYy5jICAgICAgICAgICAgICB8IDI2ICsrKysrKy0tLS0tLQog
ZHJpdmVycy9tZmQvYXhwMjB4LXJzYi5jICAgICAgICAgICAgICB8ICAyICstCiBkcml2ZXJzL21m
ZC9iY20yODM1LXBtLmMgICAgICAgICAgICAgIHwgMTUgKysrKystLQogZHJpdmVycy9tZmQvYmNt
NTkweHguYyAgICAgICAgICAgICAgICB8ICA0ICstCiBkcml2ZXJzL21mZC9iZDk1NzFtd3YuYyAg
ICAgICAgICAgICAgIHwgIDYgKy0tCiBkcml2ZXJzL21mZC9icTI1N3h4LmMgICAgICAgICAgICAg
ICAgIHwgIDggKystLQogZHJpdmVycy9tZmQvY2diYy1jb3JlLmMgICAgICAgICAgICAgICB8ICAy
ICstCiBkcml2ZXJzL21mZC9jcm9zX2VjX2Rldi5jICAgICAgICAgICAgIHwgIDIgKy0KIGRyaXZl
cnMvbWZkL2NzNDBsNTAtaTJjLmMgICAgICAgICAgICAgfCAgNiArLS0KIGRyaXZlcnMvbWZkL2Nz
NDBsNTAtc3BpLmMgICAgICAgICAgICAgfCAgNiArLS0KIGRyaXZlcnMvbWZkL2NzNDJsNDMtaTJj
LmMgICAgICAgICAgICAgfCAgOCArKy0tCiBkcml2ZXJzL21mZC9jczU1MzUtbWZkLmMgICAgICAg
ICAgICAgIHwgIDIgKy0KIGRyaXZlcnMvbWZkL2RhOTAzeC5jICAgICAgICAgICAgICAgICAgfCAg
NiArLS0KIGRyaXZlcnMvbWZkL2RhOTA1Mi1pMmMuYyAgICAgICAgICAgICAgfCAxMiArKystLS0K
IGRyaXZlcnMvbWZkL2RhOTA1Mi1zcGkuYyAgICAgICAgICAgICAgfCAxMiArKystLS0KIGRyaXZl
cnMvbWZkL2RhOTA1NS1pMmMuYyAgICAgICAgICAgICAgfCAgMiArLQogZHJpdmVycy9tZmQvZGE5
MDYyLWNvcmUuYyAgICAgICAgICAgICB8ICA0ICstCiBkcml2ZXJzL21mZC9kYTkwNjMtaTJjLmMg
ICAgICAgICAgICAgIHwgMTEgKystLS0KIGRyaXZlcnMvbWZkL2RhOTE1MC1jb3JlLmMgICAgICAg
ICAgICAgfCAgNCArLQogZHJpdmVycy9tZmQvZGI4NTAwLXByY211LmMgICAgICAgICAgICB8ICA0
ICstCiBkcml2ZXJzL21mZC9leHlub3MtbHBhc3MuYyAgICAgICAgICAgIHwgIDIgKy0KIGRyaXZl
cnMvbWZkL2dhdGV3b3Jrcy1nc2MuYyAgICAgICAgICAgfCAgMiArLQogZHJpdmVycy9tZmQvaGk2
NDIxLXBtaWMtY29yZS5jICAgICAgICB8ICA2ICstLQogZHJpdmVycy9tZmQvaGk2NTV4LXBtaWMu
YyAgICAgICAgICAgICB8ICA0ICstCiBkcml2ZXJzL21mZC9pbnRlbC1scHNzLWFjcGkuYyAgICAg
ICAgIHwgNTggKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tCiBkcml2ZXJzL21mZC9pbnRlbC1t
MTAtYm1jLXBtY2kuYyAgICAgIHwgIDIgKy0KIGRyaXZlcnMvbWZkL2ludGVsLW0xMC1ibWMtc3Bp
LmMgICAgICAgfCAgNiArLS0KIGRyaXZlcnMvbWZkL2ludGVsX3BtY19ieHQuYyAgICAgICAgICAg
fCAgMiArLQogZHJpdmVycy9tZmQvaW50ZWxfcXVhcmtfaTJjX2dwaW8uYyAgICB8ICA2ICstLQog
ZHJpdmVycy9tZmQvaW50ZWxfc29jX3BtaWNfYnh0d2MuYyAgICB8ICAyICstCiBkcml2ZXJzL21m
ZC9pbnRlbF9zb2NfcG1pY19jaHRkY190aS5jIHwgIDQgKy0KIGRyaXZlcnMvbWZkL2ludGVsX3Nv
Y19wbWljX2NodHdjLmMgICAgfCAgMiArLQogZHJpdmVycy9tZmQvaW50ZWxfc29jX3BtaWNfY3Jj
LmMgICAgICB8ICA2ICstLQogZHJpdmVycy9tZmQvaW50ZWxfc29jX3BtaWNfbXJmbGQuYyAgICB8
ICA0ICstCiBkcml2ZXJzL21mZC9pb2MzLmMgICAgICAgICAgICAgICAgICAgIHwgIDQgKy0KIGRy
aXZlcnMvbWZkL2phbnotY21vZGlvLmMgICAgICAgICAgICAgfCAxNCArKystLS0tCiBkcml2ZXJz
L21mZC9rZW1wbGQtY29yZS5jICAgICAgICAgICAgIHwgMjkgKysrKysrLS0tLS0tLS0KIGRyaXZl
cnMvbWZkL2toYWRhcy1tY3UuYyAgICAgICAgICAgICAgfCAgNCArLQogZHJpdmVycy9tZmQvbG0z
NTMzLWNvcmUuYyAgICAgICAgICAgICB8ICAyICstCiBkcml2ZXJzL21mZC9sb2NobmFnYXItaTJj
LmMgICAgICAgICAgIHwgIDIgKy0KIGRyaXZlcnMvbWZkL2xvb25nc29uLXNlLmMgICAgICAgICAg
ICAgfCAgMiArLQogZHJpdmVycy9tZmQvbHAzOTQzLmMgICAgICAgICAgICAgICAgICB8ICA0ICst
CiBkcml2ZXJzL21mZC9scDg3M3guYyAgICAgICAgICAgICAgICAgIHwgIDQgKy0KIGRyaXZlcnMv
bWZkL2xwODc1NjUuYyAgICAgICAgICAgICAgICAgfCAgOSArKystLQogZHJpdmVycy9tZmQvbHA4
Nzg4LmMgICAgICAgICAgICAgICAgICB8ICAyICstCiBkcml2ZXJzL21mZC9scGNfaWNoLmMgICAg
ICAgICAgICAgICAgIHwgIDIgKy0KIGRyaXZlcnMvbWZkL21hY3NtYy5jICAgICAgICAgICAgICAg
ICAgfCAgMiArLQogZHJpdmVycy9tZmQvbWFkZXJhLWNvcmUuYyAgICAgICAgICAgICB8ICAyICst
CiBkcml2ZXJzL21mZC9tYWRlcmEtaTJjLmMgICAgICAgICAgICAgIHwgMTggKysrKy0tLS0tCiBk
cml2ZXJzL21mZC9tYWRlcmEtc3BpLmMgICAgICAgICAgICAgIHwgMTggKysrKy0tLS0tCiBkcml2
ZXJzL21mZC9tYXgxNDU3Ny5jICAgICAgICAgICAgICAgIHwgIDQgKy0KIGRyaXZlcnMvbWZkL21h
eDczNjAuYyAgICAgICAgICAgICAgICAgfCAgMiArLQogZHJpdmVycy9tZmQvbWF4Nzc1NDEuYyAg
ICAgICAgICAgICAgICB8ICA0ICstCiBkcml2ZXJzL21mZC9tYXg3NzYyMC5jICAgICAgICAgICAg
ICAgIHwgIDggKystLQogZHJpdmVycy9tZmQvbWF4Nzc2ODYuYyAgICAgICAgICAgICAgICB8ICAy
ICstCiBkcml2ZXJzL21mZC9tYXg3NzY5My5jICAgICAgICAgICAgICAgIHwgIDIgKy0KIGRyaXZl
cnMvbWZkL21heDc3NzE0LmMgICAgICAgICAgICAgICAgfCAgMiArLQogZHJpdmVycy9tZmQvbWF4
Nzc3NTkuYyAgICAgICAgICAgICAgICB8ICA0ICstCiBkcml2ZXJzL21mZC9tYXg3Nzg0My5jICAg
ICAgICAgICAgICAgIHwgIDggKystLQogZHJpdmVycy9tZmQvbWF4ODkwNy5jICAgICAgICAgICAg
ICAgICB8ICA2ICstLQogZHJpdmVycy9tZmQvbWF4ODkyNS1pMmMuYyAgICAgICAgICAgICB8ICA0
ICstCiBkcml2ZXJzL21mZC9tYXg4OTk3LmMgICAgICAgICAgICAgICAgIHwgIDYgKy0tCiBkcml2
ZXJzL21mZC9tYXg4OTk4LmMgICAgICAgICAgICAgICAgIHwgIDYgKy0tCiBkcml2ZXJzL21mZC9t
YzEzeHh4LXNwaS5jICAgICAgICAgICAgIHwgIDYgKy0tCiBkcml2ZXJzL21mZC9tZW5lbGF1cy5j
ICAgICAgICAgICAgICAgIHwgIDIgKy0KIGRyaXZlcnMvbWZkL21lbmYyMWJtYy5jICAgICAgICAg
ICAgICAgfCAgMiArLQogZHJpdmVycy9tZmQvbW90b3JvbGEtY3BjYXAuYyAgICAgICAgICB8IDEy
ICsrKy0tLQogZHJpdmVycy9tZmQvbXAyNjI5LmMgICAgICAgICAgICAgICAgICB8ICAyICstCiBk
cml2ZXJzL21mZC9tdDYzNjAtY29yZS5jICAgICAgICAgICAgIHwgIDYgKy0tCiBkcml2ZXJzL21m
ZC9tdDYzNzAuYyAgICAgICAgICAgICAgICAgIHwgIDIgKy0KIGRyaXZlcnMvbWZkL210NjM5Ny1j
b3JlLmMgICAgICAgICAgICAgfCAgNCArLQogZHJpdmVycy9tZmQvbXhzLWxyYWRjLmMgICAgICAg
ICAgICAgICB8ICA0ICstCiBkcml2ZXJzL21mZC9udHhlYy5jICAgICAgICAgICAgICAgICAgIHwg
IDQgKy0KIGRyaXZlcnMvbWZkL29jZWxvdC1zcGkuYyAgICAgICAgICAgICAgfCAgMiArLQogZHJp
dmVycy9tZmQvb21hcC11c2ItaG9zdC5jICAgICAgICAgICB8ICA0ICstCiBkcml2ZXJzL21mZC9w
YWxtYXMuYyAgICAgICAgICAgICAgICAgIHwgIDggKystLQogZHJpdmVycy9tZmQvcGYxNTUwLmMg
ICAgICAgICAgICAgICAgICB8ICAyICstCiBkcml2ZXJzL21mZC9xY29tLXBtODAwOC5jICAgICAg
ICAgICAgIHwgIDQgKy0KIGRyaXZlcnMvbWZkL3Fjb20tcG04eHh4LmMgICAgICAgICAgICAgfCAg
NiArLS0KIGRyaXZlcnMvbWZkL3JjNXQ1ODMuYyAgICAgICAgICAgICAgICAgfCAgNCArLQogZHJp
dmVycy9tZmQvcmRjMzIxeC1zb3V0aGJyaWRnZS5jICAgICB8ICAyICstCiBkcml2ZXJzL21mZC9y
ZXR1LW1mZC5jICAgICAgICAgICAgICAgIHwgIDQgKy0KIGRyaXZlcnMvbWZkL3JrOHh4LWkyYy5j
ICAgICAgICAgICAgICAgfCAgMiArLQogZHJpdmVycy9tZmQvcms4eHgtc3BpLmMgICAgICAgICAg
ICAgICB8ICAyICstCiBkcml2ZXJzL21mZC9yb2htLWJkNzE4MjguYyAgICAgICAgICAgIHwgIDQg
Ky0KIGRyaXZlcnMvbWZkL3JvaG0tYmQ5NTc2LmMgICAgICAgICAgICAgfCAgNiArLS0KIGRyaXZl
cnMvbWZkL3JzbXVfaTJjLmMgICAgICAgICAgICAgICAgfCAxOCArKysrLS0tLS0KIGRyaXZlcnMv
bWZkL3JzbXVfc3BpLmMgICAgICAgICAgICAgICAgfCAxNCArKystLS0tCiBkcml2ZXJzL21mZC9y
dDQ4MzEuYyAgICAgICAgICAgICAgICAgIHwgIDYgKy0tCiBkcml2ZXJzL21mZC9ydDUwMzMuYyAg
ICAgICAgICAgICAgICAgIHwgIDQgKy0KIGRyaXZlcnMvbWZkL3J6LW10dTMuYyAgICAgICAgICAg
ICAgICAgfCAgMiArLQogZHJpdmVycy9tZmQvc2VjLWFjcG0uYyAgICAgICAgICAgICAgICB8ICA2
ICstLQogZHJpdmVycy9tZmQvc2VjLWkyYy5jICAgICAgICAgICAgICAgICB8IDIyICsrKysrLS0t
LS0KIGRyaXZlcnMvbWZkL3NpNDc2eC1pMmMuYyAgICAgICAgICAgICAgfCAgOCArKy0tCiBkcml2
ZXJzL21mZC9zaW1wbGUtbWZkLWkyYy5jICAgICAgICAgIHwgIDIgKy0KIGRyaXZlcnMvbWZkL3Nr
eTgxNDUyLmMgICAgICAgICAgICAgICAgfCAgNCArLQogZHJpdmVycy9tZmQvc201MDEuYyAgICAg
ICAgICAgICAgICAgICB8ICA0ICstCiBkcml2ZXJzL21mZC9zbXByby1jb3JlLmMgICAgICAgICAg
ICAgIHwgIDIgKy0KIGRyaXZlcnMvbWZkL3NwcmQtc2MyN3h4LXNwaS5jICAgICAgICAgfCAgNCAr
LQogZHJpdmVycy9tZmQvc3NiaS5jICAgICAgICAgICAgICAgICAgICB8ICAyICstCiBkcml2ZXJz
L21mZC9zdG0zMi1scHRpbWVyLmMgICAgICAgICAgIHwgIDQgKy0KIGRyaXZlcnMvbWZkL3N0bTMy
LXRpbWVycy5jICAgICAgICAgICAgfCAgNCArLQogZHJpdmVycy9tZmQvc3RtZnguYyAgICAgICAg
ICAgICAgICAgICB8ICA0ICstCiBkcml2ZXJzL21mZC9zdG1wZS1pMmMuYyAgICAgICAgICAgICAg
IHwgMzQgKysrKysrKystLS0tLS0tLQogZHJpdmVycy9tZmQvc3RtcGUtc3BpLmMgICAgICAgICAg
ICAgICB8IDI2ICsrKysrKy0tLS0tLQogZHJpdmVycy9tZmQvc3R3NDgxeC5jICAgICAgICAgICAg
ICAgICB8ICA4ICsrLS0KIGRyaXZlcnMvbWZkL3N1bjZpLXByY20uYyAgICAgICAgICAgICAgfCAg
MiArLQogZHJpdmVycy9tZmQvdGMzNTg5eC5jICAgICAgICAgICAgICAgICB8IDE0ICsrKy0tLS0K
IGRyaXZlcnMvbWZkL3RpLWxtdS5jICAgICAgICAgICAgICAgICAgfCAxMCArKy0tLQogZHJpdmVy
cy9tZmQvdGltYmVyZGFsZS5jICAgICAgICAgICAgICB8ICAyICstCiBkcml2ZXJzL21mZC90cHM2
MTA1eC5jICAgICAgICAgICAgICAgIHwgIDYgKy0tCiBkcml2ZXJzL21mZC90cHM2NTAxMC5jICAg
ICAgICAgICAgICAgIHwgMTAgKystLS0KIGRyaXZlcnMvbWZkL3RwczY1MDd4LmMgICAgICAgICAg
ICAgICAgfCAgNiArLS0KIGRyaXZlcnMvbWZkL3RwczY1MDg2LmMgICAgICAgICAgICAgICAgfCAg
NCArLQogZHJpdmVycy9tZmQvdHBzNjUwOTAuYyAgICAgICAgICAgICAgICB8ICA2ICstLQogZHJp
dmVycy9tZmQvdHBzNjUyMTcuYyAgICAgICAgICAgICAgICB8ICA2ICstLQogZHJpdmVycy9tZmQv
dHBzNjUyMTguYyAgICAgICAgICAgICAgICB8ICA4ICsrLS0KIGRyaXZlcnMvbWZkL3RwczY1MjE5
LmMgICAgICAgICAgICAgICAgfCAgOCArKy0tCiBkcml2ZXJzL21mZC90cHM2NTg2eC5jICAgICAg
ICAgICAgICAgIHwgIDYgKy0tCiBkcml2ZXJzL21mZC90cHM2NTkxMC5jICAgICAgICAgICAgICAg
IHwgMTIgKysrLS0tCiBkcml2ZXJzL21mZC90cHM2NTkxMi1pMmMuYyAgICAgICAgICAgIHwgIDQg
Ky0KIGRyaXZlcnMvbWZkL3RwczY1OTEyLXNwaS5jICAgICAgICAgICAgfCAgNCArLQogZHJpdmVy
cy9tZmQvdHBzNjU5NC1pMmMuYyAgICAgICAgICAgICB8IDEyICsrKy0tLQogZHJpdmVycy9tZmQv
dHBzNjU5NC1zcGkuYyAgICAgICAgICAgICB8IDEyICsrKy0tLQogZHJpdmVycy9tZmQvdHFteDg2
LmMgICAgICAgICAgICAgICAgICB8ICAyICstCiBkcml2ZXJzL21mZC90d2wtY29yZS5jICAgICAg
ICAgICAgICAgIHwgMjIgKysrKystLS0tLQogZHJpdmVycy9tZmQvdHdsNDAzMC1hdWRpby5jICAg
ICAgICAgICB8ICA0ICstCiBkcml2ZXJzL21mZC90d2w0MDMwLXBvd2VyLmMgICAgICAgICAgIHwg
IDIgKy0KIGRyaXZlcnMvbWZkL3R3bDYwMzAtaXJxLmMgICAgICAgICAgICAgfCAgNiArLS0KIGRy
aXZlcnMvbWZkL3R3bDYwNDAuYyAgICAgICAgICAgICAgICAgfCAgNCArLQogZHJpdmVycy9tZmQv
dXBib2FyZC1mcGdhLmMgICAgICAgICAgICB8ICA2ICstLQogZHJpdmVycy9tZmQvdmV4cHJlc3Mt
c3lzcmVnLmMgICAgICAgICB8ICA0ICstCiBkcml2ZXJzL21mZC92eDg1NS5jICAgICAgICAgICAg
ICAgICAgIHwgIDIgKy0KIGRyaXZlcnMvbWZkL3dtODMxeC1jb3JlLmMgICAgICAgICAgICAgfCAg
MiArLQogZHJpdmVycy9tZmQvd204MzF4LWkyYy5jICAgICAgICAgICAgICB8IDE0ICsrKy0tLS0K
IGRyaXZlcnMvbWZkL3dtODMxeC1zcGkuYyAgICAgICAgICAgICAgfCAxNiArKysrLS0tLQogZHJp
dmVycy9tZmQvd204MzUwLWkyYy5jICAgICAgICAgICAgICB8ICA2ICstLQogZHJpdmVycy9tZmQv
d204NDAwLWNvcmUuYyAgICAgICAgICAgICB8ICA0ICstCiBkcml2ZXJzL21mZC93bTg5OTQtY29y
ZS5jICAgICAgICAgICAgIHwgIDggKystLQogaW5jbHVkZS9saW51eC9tZmQvYmNtMjgzNS1wbS5o
ICAgICAgICB8ICA5IC0tLS0tCiBpbmNsdWRlL2xpbnV4L21mZC9rZW1wbGQuaCAgICAgICAgICAg
IHwgIDIgLQogMTU4IGZpbGVzIGNoYW5nZWQsIDUxOCBpbnNlcnRpb25zKCspLCA1MjEgZGVsZXRp
b25zKC0pCgoKYmFzZS1jb21taXQ6IDhlOTY4NWQzYzQxYzM1ZGQxYjM3ZGY3MGQ4NTQxMzdhYmNi
MmZiYWMKLS0gCjIuNTUuMC4xMS5nMTUzNjY2YTdkOWJiCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgt
c3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
