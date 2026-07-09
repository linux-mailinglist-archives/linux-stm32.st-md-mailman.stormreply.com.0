Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wbyANYDTT2pUowIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 09 Jul 2026 18:59:44 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED02733A46
	for <lists+linux-stm32@lfdr.de>; Thu, 09 Jul 2026 18:59:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=baylibre.com header.s=google header.b=Jj5+Iqga;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1688EC8F299;
	Thu,  9 Jul 2026 16:59:44 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D7F97C7BF8B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Jul 2026 16:59:42 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-47ddf7b09aaso70060f8f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 09 Jul 2026 09:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre.com; s=google; t=1783616382; x=1784221182;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=VJDhVAwwnuJynU+rK7XaHmDAD2JyG8RU5Caf9YS1vZM=;
 b=Jj5+Iqgapz+IjpV83MTXgVy7nE/SVqd6jTBBE747+AR4Wt4W38mJOcxyFLfauBfbZ3
 fE0IZK1vSaWhgf3hW2IlrswktxW9qiwc8vcszVp713ShBCDb9y91RKhftJoim56meCNd
 9BjuUCtORZD6zt5GqMRUHL9JjriRDxhQnMJfjn1ymCnMlotwQ9Kyi+Mb86M7fFHNT9if
 adcgRjc+gNXM4x8QOlJ2yHqkBfChdr9wQ2XoCOtW5pznH+hhfAV+0TNSPZfKsltjFHtj
 qcFPpD2ADwgzCez8v6swf0ktcdIukABVuq545EBU2/+66hNX59tdIpj5/p8BLQ3H34Fx
 8mCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783616382; x=1784221182;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=VJDhVAwwnuJynU+rK7XaHmDAD2JyG8RU5Caf9YS1vZM=;
 b=rzT0+Z7lF4LggepQoAgfLGQYqbIlqAqsy2jrfGFeQE/oEOD+FS1waazX6SeUkbMUkN
 wfU9ETX7uEe8m9udWX58hwRXoBCre4PeaMMJS0sqmuL7sbhJESG1nVdIt8GS+8LUBbUb
 efDzQNIh7Did24Xd0ee2zDoaNdVNHRZ3jnqg//vE/3NeaRtiu2f2qXMfv+R35gxKheL4
 y4fg+wvUz4mLUOmILu88MLLaSvzfh3f6TWTQ1FaJAyV5dZM+Yejw+gbXMtQvnsLTiCi3
 idLAjR7jyz4/KBcv0boaowNvE/PNmqWBYCRW4jhlVjIIazhp+3ytaOXwJUEzUh/PRurw
 L8bw==
X-Forwarded-Encrypted: i=1;
 AHgh+RoYN0dWh2WT00AMDHvv1GTjJJ1343ZKrP9uA2pCaYSmLhuUrLeqim2NRAjAJGtg+OXnWgjzS/fAxqRhqw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzRwbJqCn7dOdFKilSne3EUjk1/ET6tRaCTZvd9ZtVevLq1/UI1
 KgJgeb3ZhehkK5xv4xgkIrtN5J9at2vJBRGa0xh3PoyzoggJ6mCi33gRf3bFh2J28G4=
X-Gm-Gg: AfdE7cmoBL/wssQfkx7DEYsJZJWehYGVUABvq23wyNWgf8nVB40YBp3uA+uwvxf5E7p
 va2vlhAT9gCWQ6ZYvdj88l9ckDn0f/z/gLYw1Y06iZUDX6/gIxFXqyk5iWCggT0VBxeaUb7yY5R
 59z9PLs+ZRrXQmvN1dtdEjrWafIGltRzyQme2YXey0askwtPCc/vT5t/hYWZgytecRj5Og3sdt1
 8uJkGT/oBDnfZHzvtB5PYu9Eyi2+NkSO2RB4Fg6IRoHUj9knCpotjcDNhAM+1oXPHM7Gg1Ucxry
 oNew53GINaUtZCNtCkKvUIDW8jvR72R/bcjnj+QEbup0gPkYp28JuB6SPXKxViD3E6/wDVUqmlD
 3MWVtPv1DZhIdVKmv2zS6hTTmW7KpwDecLgvyCa96rNC0ZYYvHQjHd8iHyX4m51wJskMrk1tr7y
 VD4P2tRfwIxUxgSP0Jes+GqGUvwGpIz+9HA07myW6cUu/mFNqfVK4XfioslwKPUJFqtgE+4A8oZ
 5Tx
X-Received: by 2002:a05:6000:41fe:b0:47d:efd0:c026 with SMTP id
 ffacd0b85a97d-47df071e085mr8532732f8f.11.1783616382067; 
 Thu, 09 Jul 2026 09:59:42 -0700 (PDT)
Received: from localhost
 (p200300f65f47db043de98c19b374aa68.dip0.t-ipconnect.de.
 [2003:f6:5f47:db04:3de9:8c19:b374:aa68])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-47aa039b0cesm53752742f8f.22.2026.07.09.09.59.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2026 09:59:41 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?=
 <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Date: Thu,  9 Jul 2026 18:58:19 +0200
Message-ID: <cover.1783615311.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=10849;
 i=u.kleine-koenig@baylibre.com; h=from:subject:message-id;
 bh=x7I7jx1xlGkYcQ0g2wKbDdhKkfSw89TrgshWMQXyV+I=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqT9Mwgnh31BxHKY/FZjAXkPNmcm0bzYeRgOl6T
 cuiTlTVXeCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCak/TMAAKCRCPgPtYfRL+
 TjY5B/4trUacM2VOnrdO7ml6L9pBXtZl5zaoNd5/YBFCQiq3bOhzl8d7o4FccdkGs2bFKjHkS4v
 Z6nqRY6Y5LACAyYQ1lTm6yna4lBkYMK+YNhz7N0wZfXi/wcumQ3qB1NUXcIqrOtVsoWzRjwIVq5
 tkwaeRbvvdVgPa9JyKz68aUBkfo78fyZ778y+VJIvkbupkEfBcnfDIGtUaNg3533ZsMq8uHK516
 LXGdCz3u66d8ucj/6SA+/se0nKD9+UCjj+SkVZnqkUOKZVXh+Ntr1ZeP+SKzz1RbE/MhXrQh9Ku
 YordR+qBAJ+oKLXaovmVD5vvRlMmuiNqGroU1DqPj32i9taA
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
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
 Magnus Damm <magnus.damm@gmail.com>, linux-rockchip@lists.infradead.org,
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
 Linus Walleij <linusw@kernel.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 asahi@lists.linux.dev, Zha Qipeng <qipeng.zha@intel.com>,
 Neal Gompa <neal@gompa.dev>, Xu Yilun <yilun.xu@intel.com>,
 Tony Lindgren <tony@atomide.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Peter Tyser <ptyser@xes-inc.com>, Janne Grunau <j@jannau.net>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 Saravanan Sekar <sravanhome@gmail.com>, mfd@lists.linux.dev,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 James Ogletree <jogletre@opensource.cirrus.com>, patches@opensource.cirrus.com,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Colin Foster <colin.foster@in-advantage.com>,
 Ben Bright <ben.bright@cirrus.com>, linux@ew.tq-group.com
Subject: [Linux-stm32] [PATCH v3 00/23] mfd: Use named initializers for
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
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:heiko@sntech.de,m:geert+renesas@glider.be,m:alim.akhtar@samsung.com,m:linux-stm32@st-md-mailman.stormreply.com,m:marek.vasut+renesas@gmail.com,m:linux-samsung-soc@vger.kernel.org,m:aaro.koskinen@iki.fi,m:khilman@baylibre.com,m:cw00.choi@samsung.com,m:luca.ceresoli@bootlin.com,m:linux-sunxi@lists.linux.dev,m:s.hauer@pengutronix.de,m:linux-sound@vger.kernel.org,m:sudeep.holla@kernel.org,m:sven@kernel.org,m:linux-omap@vger.kernel.org,m:andy@kernel.org,m:sbranden@broadcom.com,m:linux-kernel@vger.kernel.org,m:linux-crypto@vger.kernel.org,m:kernel@pengutronix.de,m:alexandre.belloni@bootlin.com,m:david.rhodes@cirrus.com,m:groeck@chromium.org,m:chrome-platform@lists.linux.dev,m:zhang.lyra@gmail.com,m:magnus.damm@gmail.com,m:linux-rockchip@lists.infradead.org,m:ckeepax@opensource.cirrus.com,m:michael.hennerich@analog.com,m:mazziesaccount@gmail.com,m:linux-arm-msm@vger.kernel.org,m:rogerq@kernel.org,m:linux-rpi-kernel@lists.infradead.org,m:linux-amlo
 gic@lists.infradead.org,m:wens@kernel.org,m:mika.westerberg@linux.intel.com,m:linux-arm-kernel@lists.infradead.org,m:neil.armstrong@linaro.org,m:thomas.richard@bootlin.com,m:samuel@sholland.org,m:linux-renesas-soc@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:mathieu.dubois-briand@bootlin.com,m:imx@lists.linux.dev,m:andre.draszik@linaro.org,m:trix@redhat.com,m:lpieralisi@kernel.org,m:Frank.Li@nxp.com,m:zhaoqunqin@loongson.cn,m:krzk@kernel.org,m:fred.treven@cirrus.com,m:festevam@gmail.com,m:jernej.skrabec@gmail.com,m:andreas@kemnade.info,m:bcm-kernel-feedback-list@broadcom.com,m:orsonzhai@gmail.com,m:rjui@broadcom.com,m:tharvey@gateworks.com,m:j.neuschaefer@gmx.net,m:rf@opensource.cirrus.com,m:baolin.wang@linux.alibaba.com,m:bleung@chromium.org,m:samkay014@gmail.com,m:support.opensource@diasemi.com,m:linusw@kernel.org,m:claudiu.beznea@tuxon.dev,m:asahi@lists.linux.dev,m:qipeng.zha@intel.com,m:neal@gompa.dev,m:yilun.xu@intel.com,m:tony@atomide.com,m:liviu.dudau@arm.com,m:ptyser@xes-in
 c.com,m:j@jannau.net,m:florian.fainelli@broadcom.com,m:peter.griffin@linaro.org,m:sravanhome@gmail.com,m:mfd@lists.linux.dev,m:linux-mediatek@lists.infradead.org,m:matthias.bgg@gmail.com,m:andriy.shevchenko@linux.intel.com,m:angelogioacchino.delregno@collabora.com,m:jogletre@opensource.cirrus.com,m:patches@opensource.cirrus.com,m:nicolas.ferre@microchip.com,m:colin.foster@in-advantage.com,m:ben.bright@cirrus.com,m:linux@ew.tq-group.com,m:geert@glider.be,m:marekvasut@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[u.kleine-koenig@baylibre.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,meta];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[sntech.de,glider.be,samsung.com,st-md-mailman.stormreply.com,gmail.com,vger.kernel.org,iki.fi,baylibre.com,bootlin.com,lists.linux.dev,pengutronix.de,kernel.org,broadcom.com,cirrus.com,chromium.org,lists.infradead.org,opensource.cirrus.com,analog.com,linux.intel.com,linaro.org,sholland.org,redhat.com,nxp.com,loongson.cn,kemnade.info,gateworks.com,gmx.net,linux.alibaba.com,diasemi.com,tuxon.dev,intel.com,gompa.dev,atomide.com,arm.com,xes-inc.com,jannau.net,collabora.com,microchip.com,in-advantage.com,ew.tq-group.com];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCPT_COUNT_GT_50(0.00)[90];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,renesas];
	DKIM_TRACE(0.00)[baylibre.com:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:mid,baylibre.com:from_mime,stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5ED02733A46

SGVsbG8sCgp2MiBvZiB0aGlzIHNlcmllcyBjYW4gYmUgZm91bmQgYXQKaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvbGttbC9jb3Zlci4xNzgzNTA3OTQ1LmdpdC51LmtsZWluZS1rb2VuaWdAYmF5bGli
cmUuY29tCi4KClRoZSBvYmplY3RpdmUgZm9yIHRoaXMgc2VyaWVzIGlzIHRvIHByZXBhcmUgbWZk
IGZvciBjaGFuZ2luZwpvZl9kZXZpY2VfaWQgYW5kIHRoZSBvdGhlcnMgdG8gbWFrZSBkcml2ZXJf
ZGF0YSBhIHVuaW9uLCBzZWUKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsL2NvdmVyLjE3ODAw
NDg5MjUuZ2l0LnUua2xlaW5lLWtvZW5pZ0BiYXlsaWJyZS5jb20vCmZvciB0aGUgaWRlYSBiZWhp
bmQgaXQuCgpDaGFuZ2VzIHNpbmNlIHYyOgogLSBBZGRlZCB0aGUgdmFyaW91cyByZXZpZXcgdGFn
cyBJIHJlY2VpdmVkOwogLSBTYXNoaWtvIGZvdW5kIGFuIGlzc3VlIGluIHBhdGNoICMzICgibWZk
OiBrZW1wbGQ6IFNpbXBsaWZ5IGRldmljZQogICBhYnN0cmFjdGlvbiIpLiBUaGUgY29uY2VybiB3
YXMgdmFsaWQgYW5kIHRoYXQgbWFkZSBtZSByZWFsaXplIHRoYXQgSQogICBjb3VsZCBzaW1wbGlm
eSB0aGF0IGRyaXZlciBldmVuIGZ1cnRoZXI7CiAtIEZvciBkcml2ZXJzL21mZC9yc211X2kyYy5j
IEkgZGlkIGEgd3Jvbmcgc3BsaXQuIEluIHRoZSBtaWRkbGUgb2YgdGhlCiAgIHNlcmllcyB0aGUg
aTJjX2RldmljZV9pZCBhcnJheSBsYWNrZWQgdGhlIHRlcm1pbmF0b3IuIChOb3RpY2VkIGJ5CiAg
IFNhc2hpa28pOwogLSBUaGUgb2ZfZGV2aWNlX2lkIGNoYW5nZXMgd2VyZSBkb25lIGJ5IGhhbmQg
Zm9yIHYyLCBJIGNyZWF0ZWQgYSBzY3JpcHQKICAgZm9yIHRoYXQgbm93IGFuZCBjYXRjaGVkIGEg
ZmV3IG1vcmUgaXNzdWVzIChwb2ludGVkIG91dCBieSBTYXNoaWtvKTsKIC0gdHJpdmlhbGx5IHJl
YmFzZWQgdG8gbmV4dC0yMDI2MDcwOCwgbm8gY2hhbmdlcyBpbnRyb2R1Y2VkIGJ5IHRoYXQ7CgpT
YXNoaWtvIGlkZW50aWZ5ZWQgYSBidW5jaCBvZiBwcmVleGlzdGluZyBpc3N1ZXMsIHRoYXQgSSBk
aWRuJ3QgYWRkcmVzcy4KVGhlc2UgYXJlIGJldHRlciBoYW5kbGVkIGJ5IHNvbWVvbmUgaGF2aW5n
IHRoZSBoYXJkd2FyZSBJIGd1ZXNzLgoKQW5keSBzdWdnZXN0ZWQgc3BsaXR0aW5nIHBhdGNoICMx
OCAoIm1mZDogVW5pZnkgc3R5bGUgb2YgYWNwaV9kZXZpY2VfaWQKYXJyYXlzIikgaW50byBvbmUg
Zm9yIHRoZSBwbWljIGRyaXZlcnMgYW5kIHRoZW4gb25lIHBlciBkcml2ZXIuIEkgZGlkbid0CmRv
IHRoYXQgYXMgaXQgc2VlbXMgYXJiaXRyYXJ5IHRvIG1lLiBMZWUsIHBsZWFzZSB2b2ljZSB5b3Vy
IHByZWZlcmVuY2UKaWYgeW91IGRpc2FncmVlIHdpdGggdGhlIHBhdGNoIHNlcGFyYXRpb24gaGVy
ZS4KCkJlc3QgcmVnYXJkcwpVd2UKClV3ZSBLbGVpbmUtS8O2bmlnIChUaGUgQ2FwYWJsZSBIdWIp
ICgyMyk6CiAgbWZkOiBiY20yODM1LXBtOiBSZW1vdmUgbWVtYmVyIG9mIHN0cnVjdCBiY20yODM1
X3BtIHRoYXQgaXMgb25seSB1c2VkCiAgICBsb2NhbGx5CiAgbWZkOiBiY20yODM1LXBtOiBEcm9w
IHVudXNlZCBoZWFkZXIKICBtZmQ6IGtlbXBsZDogU2ltcGxpZnkgZGV2aWNlIGFic3RyYWN0aW9u
CiAgbWZkOiBscDg3NTY1OiBFeHBsaWNpdGx5IHNldCBkcml2ZXIgZGF0YSBmb3IgdGhlIGdlbmVy
aWMgZHQgY29tcGF0aWJsZQogIG1mZDogbXQ2MzYwOiBEcm9wIGlycmVsZXZhbnQgX19tYXliZV91
bnVzZWQKICBtZmQ6IHJ0NDgzMTogRHJvcCBpcnJlbGV2YW50IF9fbWF5YmVfdW51c2VkCiAgbWZk
OiBsb29uZ3Nvbi1zZTogRHJvcCB1bnVzZWQgYXNzaWdubWVudCBvZiBhY3BpX2RldmljZV9pZCBk
cml2ZXIgZGF0YQogIG1mZDogRHJvcCB1bnVzZWQgYXNzaWdubWVudCBvZiBpMmNfZGV2aWNlX2lk
IGRyaXZlciBkYXRhCiAgbWZkOiBEcm9wIHVudXNlZCBhc3NpZ25tZW50IG9mIHBsYXRmb3JtX2Rl
dmljZV9pZCBkcml2ZXIgZGF0YQogIG1mZDogRHJvcCB1bnVzZWQgYXNzaWdubWVudCBvZiBzcGlf
ZGV2aWNlX2lkIGRyaXZlciBkYXRhCiAgbWZkOiBVc2UgbmFtZWQgaW5pdGlhbGl6ZXJzIGZvciBh
Y3BpX2RldmljZV9pZCBhcnJheXMKICBtZmQ6IGludGVsLW0xMC1ibWMtcG1jaTogVXNlIG5hbWVk
IGluaXRpYWxpemVycyBmb3IgZGZsX2RldmljZV9pZAogICAgYXJyYXkKICBtZmQ6IFVzZSBuYW1l
ZCBpbml0aWFsaXplcnMgZm9yIGFycmF5cyBvZiBpMmNfZGV2aWNlX2lkCiAgbWZkOiB0d2w2MDMw
OiBVc2UgbmFtZWQgaW5pdGlhbGl6ZXJzIGZvciBvZl9kZXZpY2VfaWQKICBtZmQ6IFVzZSBQQ0lf
REVWSUNFKiBtYWNyb3MgdG8gaW5pdGlhbGl6ZSBwY2lfZGV2aWNlX2lkIGFycmF5cwogIG1mZDog
VXNlIG5hbWVkIGluaXRpYWxpemVycyBmb3IgcGxhdGZvcm1fZGV2aWNlX2lkIGFycmF5CiAgbWZk
OiBVc2UgbmFtZWQgaW5pdGlhbGl6ZXJzIGZvciBhcnJheXMgb2Ygc3BpX2RldmljZV9pZAogIG1m
ZDogVW5pZnkgc3R5bGUgb2YgYWNwaV9kZXZpY2VfaWQgYXJyYXlzCiAgbWZkOiBVbmlmeSBzdHls
ZSBvZiBkbWlfc3lzdGVtX2lkIGFycmF5cwogIG1mZDogVW5pZnkgc3R5bGUgb2YgaTJjX2Rldmlj
ZV9pZCBhcnJheXMKICBtZmQ6IFVuaWZ5IHN0eWxlIG9mIG9mX2RldmljZV9pZCBhcnJheXMKICBt
ZmQ6IFVuaWZ5IHN0eWxlIG9mIHBjaV9kZXZpY2VfaWQgYXJyYXlzCiAgbWZkOiBVbmlmeSBzdHls
ZSBvZiBzcGlfZGV2aWNlX2lkIGFycmF5cwoKIGRyaXZlcnMvbWZkLzg4cG04MDAuYyAgICAgICAg
ICAgICAgICAgfCAgNCArLQogZHJpdmVycy9tZmQvODhwbTgwNS5jICAgICAgICAgICAgICAgICB8
ICA0ICstCiBkcml2ZXJzL21mZC84OHBtODYweC1jb3JlLmMgICAgICAgICAgIHwgIDggKy0tCiBk
cml2ZXJzL21mZC9hYXQyODcwLWNvcmUuYyAgICAgICAgICAgIHwgIDIgKy0KIGRyaXZlcnMvbWZk
L2FiODUwMC1jb3JlLmMgICAgICAgICAgICAgfCAgOCArLS0KIGRyaXZlcnMvbWZkL2FiODUwMC1z
eXNjdHJsLmMgICAgICAgICAgfCAgNCArLQogZHJpdmVycy9tZmQvYWMxMDAuYyAgICAgICAgICAg
ICAgICAgICB8ICAyICstCiBkcml2ZXJzL21mZC9hY3Q4OTQ1YS5jICAgICAgICAgICAgICAgIHwg
IDggKy0tCiBkcml2ZXJzL21mZC9hZHA1NTIwLmMgICAgICAgICAgICAgICAgIHwgIDQgKy0KIGRy
aXZlcnMvbWZkL2FsdGVyYS1hMTBzci5jICAgICAgICAgICAgfCAgNCArLQogZHJpdmVycy9tZmQv
YWx0ZXJhLXN5c21nci5jICAgICAgICAgICB8ICAyICstCiBkcml2ZXJzL21mZC9hcml6b25hLWky
Yy5jICAgICAgICAgICAgIHwgMTQgKysrLS0tCiBkcml2ZXJzL21mZC9hcml6b25hLXNwaS5jICAg
ICAgICAgICAgIHwgMTQgKysrLS0tCiBkcml2ZXJzL21mZC9hczM3MTEuYyAgICAgICAgICAgICAg
ICAgIHwgIDggKy0tCiBkcml2ZXJzL21mZC9hczM3MjIuYyAgICAgICAgICAgICAgICAgIHwgIDgg
Ky0tCiBkcml2ZXJzL21mZC9hdG1lbC1obGNkYy5jICAgICAgICAgICAgIHwgIDIgKy0KIGRyaXZl
cnMvbWZkL2F0bWVsLXNtYy5jICAgICAgICAgICAgICAgfCAgMiArLQogZHJpdmVycy9tZmQvYXhw
MjB4LWkyYy5jICAgICAgICAgICAgICB8IDI2ICsrKysrLS0tLS0KIGRyaXZlcnMvbWZkL2F4cDIw
eC1yc2IuYyAgICAgICAgICAgICAgfCAgMiArLQogZHJpdmVycy9tZmQvYmNtMjgzNS1wbS5jICAg
ICAgICAgICAgICB8IDE1ICsrKystLQogZHJpdmVycy9tZmQvYmNtNTkweHguYyAgICAgICAgICAg
ICAgICB8ICA0ICstCiBkcml2ZXJzL21mZC9iZDk1NzFtd3YuYyAgICAgICAgICAgICAgIHwgIDYg
Ky0tCiBkcml2ZXJzL21mZC9icTI1N3h4LmMgICAgICAgICAgICAgICAgIHwgIDggKy0tCiBkcml2
ZXJzL21mZC9jZ2JjLWNvcmUuYyAgICAgICAgICAgICAgIHwgIDIgKy0KIGRyaXZlcnMvbWZkL2Ny
b3NfZWNfZGV2LmMgICAgICAgICAgICAgfCAgMiArLQogZHJpdmVycy9tZmQvY3M0MGw1MC1pMmMu
YyAgICAgICAgICAgICB8ICA2ICstLQogZHJpdmVycy9tZmQvY3M0MGw1MC1zcGkuYyAgICAgICAg
ICAgICB8ICA2ICstLQogZHJpdmVycy9tZmQvY3M0Mmw0My1pMmMuYyAgICAgICAgICAgICB8ICA4
ICstLQogZHJpdmVycy9tZmQvY3M1NTM1LW1mZC5jICAgICAgICAgICAgICB8ICAyICstCiBkcml2
ZXJzL21mZC9kYTkwM3guYyAgICAgICAgICAgICAgICAgIHwgIDYgKy0tCiBkcml2ZXJzL21mZC9k
YTkwNTItaTJjLmMgICAgICAgICAgICAgIHwgMTIgKystLS0KIGRyaXZlcnMvbWZkL2RhOTA1Mi1z
cGkuYyAgICAgICAgICAgICAgfCAxMiArKy0tLQogZHJpdmVycy9tZmQvZGE5MDU1LWkyYy5jICAg
ICAgICAgICAgICB8ICA0ICstCiBkcml2ZXJzL21mZC9kYTkwNjItY29yZS5jICAgICAgICAgICAg
IHwgIDQgKy0KIGRyaXZlcnMvbWZkL2RhOTA2My1pMmMuYyAgICAgICAgICAgICAgfCAxMSArKyst
LQogZHJpdmVycy9tZmQvZGE5MTUwLWNvcmUuYyAgICAgICAgICAgICB8ICA0ICstCiBkcml2ZXJz
L21mZC9kYjg1MDAtcHJjbXUuYyAgICAgICAgICAgIHwgIDQgKy0KIGRyaXZlcnMvbWZkL2V4eW5v
cy1scGFzcy5jICAgICAgICAgICAgfCAgMiArLQogZHJpdmVycy9tZmQvZ2F0ZXdvcmtzLWdzYy5j
ICAgICAgICAgICB8ICAyICstCiBkcml2ZXJzL21mZC9oaTY0MjEtcG1pYy1jb3JlLmMgICAgICAg
IHwgIDYgKy0tCiBkcml2ZXJzL21mZC9oaTY1NXgtcG1pYy5jICAgICAgICAgICAgIHwgIDQgKy0K
IGRyaXZlcnMvbWZkL2ludGVsLWxwc3MtYWNwaS5jICAgICAgICAgfCA1OCArKysrKysrKysrKy0t
LS0tLS0tLS0tCiBkcml2ZXJzL21mZC9pbnRlbC1tMTAtYm1jLXBtY2kuYyAgICAgIHwgIDIgKy0K
IGRyaXZlcnMvbWZkL2ludGVsLW0xMC1ibWMtc3BpLmMgICAgICAgfCAgNiArLS0KIGRyaXZlcnMv
bWZkL2ludGVsX3BtY19ieHQuYyAgICAgICAgICAgfCAgMiArLQogZHJpdmVycy9tZmQvaW50ZWxf
cXVhcmtfaTJjX2dwaW8uYyAgICB8ICA2ICstLQogZHJpdmVycy9tZmQvaW50ZWxfc29jX3BtaWNf
Ynh0d2MuYyAgICB8ICAyICstCiBkcml2ZXJzL21mZC9pbnRlbF9zb2NfcG1pY19jaHRkY190aS5j
IHwgIDQgKy0KIGRyaXZlcnMvbWZkL2ludGVsX3NvY19wbWljX2NodHdjLmMgICAgfCAgMiArLQog
ZHJpdmVycy9tZmQvaW50ZWxfc29jX3BtaWNfY3JjLmMgICAgICB8ICA2ICstLQogZHJpdmVycy9t
ZmQvaW50ZWxfc29jX3BtaWNfbXJmbGQuYyAgICB8ICA0ICstCiBkcml2ZXJzL21mZC9pb2MzLmMg
ICAgICAgICAgICAgICAgICAgIHwgIDQgKy0KIGRyaXZlcnMvbWZkL2phbnotY21vZGlvLmMgICAg
ICAgICAgICAgfCAxNCArKystLS0KIGRyaXZlcnMvbWZkL2tlbXBsZC1jb3JlLmMgICAgICAgICAg
ICAgfCA3MCArKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0KIGRyaXZlcnMvbWZkL2toYWRhcy1t
Y3UuYyAgICAgICAgICAgICAgfCAgNCArLQogZHJpdmVycy9tZmQvbG0zNTMzLWNvcmUuYyAgICAg
ICAgICAgICB8ICAyICstCiBkcml2ZXJzL21mZC9sb2NobmFnYXItaTJjLmMgICAgICAgICAgIHwg
IDIgKy0KIGRyaXZlcnMvbWZkL2xvb25nc29uLXNlLmMgICAgICAgICAgICAgfCAgMiArLQogZHJp
dmVycy9tZmQvbHAzOTQzLmMgICAgICAgICAgICAgICAgICB8ICA0ICstCiBkcml2ZXJzL21mZC9s
cDg3M3guYyAgICAgICAgICAgICAgICAgIHwgIDggKy0tCiBkcml2ZXJzL21mZC9scDg3NTY1LmMg
ICAgICAgICAgICAgICAgIHwgIDkgKystLQogZHJpdmVycy9tZmQvbHA4Nzg4LmMgICAgICAgICAg
ICAgICAgICB8ICAyICstCiBkcml2ZXJzL21mZC9scGNfaWNoLmMgICAgICAgICAgICAgICAgIHwg
IDIgKy0KIGRyaXZlcnMvbWZkL21hY3NtYy5jICAgICAgICAgICAgICAgICAgfCAgMiArLQogZHJp
dmVycy9tZmQvbWFkZXJhLWNvcmUuYyAgICAgICAgICAgICB8ICAyICstCiBkcml2ZXJzL21mZC9t
YWRlcmEtaTJjLmMgICAgICAgICAgICAgIHwgMTggKysrLS0tLQogZHJpdmVycy9tZmQvbWFkZXJh
LXNwaS5jICAgICAgICAgICAgICB8IDE4ICsrKy0tLS0KIGRyaXZlcnMvbWZkL21heDE0NTc3LmMg
ICAgICAgICAgICAgICAgfCAgNiArLS0KIGRyaXZlcnMvbWZkL21heDczNjAuYyAgICAgICAgICAg
ICAgICAgfCAgMiArLQogZHJpdmVycy9tZmQvbWF4Nzc1NDEuYyAgICAgICAgICAgICAgICB8ICA0
ICstCiBkcml2ZXJzL21mZC9tYXg3NzYyMC5jICAgICAgICAgICAgICAgIHwgIDggKy0tCiBkcml2
ZXJzL21mZC9tYXg3NzY4Ni5jICAgICAgICAgICAgICAgIHwgIDIgKy0KIGRyaXZlcnMvbWZkL21h
eDc3NjkzLmMgICAgICAgICAgICAgICAgfCAgNCArLQogZHJpdmVycy9tZmQvbWF4Nzc3MTQuYyAg
ICAgICAgICAgICAgICB8ICAyICstCiBkcml2ZXJzL21mZC9tYXg3Nzc1OS5jICAgICAgICAgICAg
ICAgIHwgIDQgKy0KIGRyaXZlcnMvbWZkL21heDc3ODQzLmMgICAgICAgICAgICAgICAgfCAgOCAr
LS0KIGRyaXZlcnMvbWZkL21heDg5MDcuYyAgICAgICAgICAgICAgICAgfCAgNiArLS0KIGRyaXZl
cnMvbWZkL21heDg5MjUtaTJjLmMgICAgICAgICAgICAgfCAgNiArLS0KIGRyaXZlcnMvbWZkL21h
eDg5OTcuYyAgICAgICAgICAgICAgICAgfCAgNiArLS0KIGRyaXZlcnMvbWZkL21heDg5OTguYyAg
ICAgICAgICAgICAgICAgfCAgNiArLS0KIGRyaXZlcnMvbWZkL21jMTN4eHgtc3BpLmMgICAgICAg
ICAgICAgfCAgNiArLS0KIGRyaXZlcnMvbWZkL21lbmVsYXVzLmMgICAgICAgICAgICAgICAgfCAg
MiArLQogZHJpdmVycy9tZmQvbWVuZjIxYm1jLmMgICAgICAgICAgICAgICB8ICAyICstCiBkcml2
ZXJzL21mZC9tb3Rvcm9sYS1jcGNhcC5jICAgICAgICAgIHwgMTIgKystLS0KIGRyaXZlcnMvbWZk
L21wMjYyOS5jICAgICAgICAgICAgICAgICAgfCAgMiArLQogZHJpdmVycy9tZmQvbXQ2MzYwLWNv
cmUuYyAgICAgICAgICAgICB8ICA2ICstLQogZHJpdmVycy9tZmQvbXQ2MzcwLmMgICAgICAgICAg
ICAgICAgICB8ICAyICstCiBkcml2ZXJzL21mZC9tdDYzOTctY29yZS5jICAgICAgICAgICAgIHwg
IDQgKy0KIGRyaXZlcnMvbWZkL214cy1scmFkYy5jICAgICAgICAgICAgICAgfCAgNCArLQogZHJp
dmVycy9tZmQvbnR4ZWMuYyAgICAgICAgICAgICAgICAgICB8ICA0ICstCiBkcml2ZXJzL21mZC9v
Y2Vsb3Qtc3BpLmMgICAgICAgICAgICAgIHwgIDIgKy0KIGRyaXZlcnMvbWZkL29tYXAtdXNiLWhv
c3QuYyAgICAgICAgICAgfCAgNCArLQogZHJpdmVycy9tZmQvcGFsbWFzLmMgICAgICAgICAgICAg
ICAgICB8ICA4ICstLQogZHJpdmVycy9tZmQvcGYxNTUwLmMgICAgICAgICAgICAgICAgICB8ICAy
ICstCiBkcml2ZXJzL21mZC9xY29tLXBtODAwOC5jICAgICAgICAgICAgIHwgIDQgKy0KIGRyaXZl
cnMvbWZkL3Fjb20tcG04eHh4LmMgICAgICAgICAgICAgfCAgNiArLS0KIGRyaXZlcnMvbWZkL3Jh
dmUtc3AuYyAgICAgICAgICAgICAgICAgfCAgNCArLQogZHJpdmVycy9tZmQvcmM1dDU4My5jICAg
ICAgICAgICAgICAgICB8ICA0ICstCiBkcml2ZXJzL21mZC9yZGMzMjF4LXNvdXRoYnJpZGdlLmMg
ICAgIHwgIDIgKy0KIGRyaXZlcnMvbWZkL3JldHUtbWZkLmMgICAgICAgICAgICAgICAgfCAgNCAr
LQogZHJpdmVycy9tZmQvcms4eHgtaTJjLmMgICAgICAgICAgICAgICB8ICAyICstCiBkcml2ZXJz
L21mZC9yazh4eC1zcGkuYyAgICAgICAgICAgICAgIHwgIDQgKy0KIGRyaXZlcnMvbWZkL3JvaG0t
YmQ3MTgyOC5jICAgICAgICAgICAgfCAgNCArLQogZHJpdmVycy9tZmQvcm9obS1iZDk1NzYuYyAg
ICAgICAgICAgICB8ICA2ICstLQogZHJpdmVycy9tZmQvcnNtdV9pMmMuYyAgICAgICAgICAgICAg
ICB8IDE4ICsrKy0tLS0KIGRyaXZlcnMvbWZkL3JzbXVfc3BpLmMgICAgICAgICAgICAgICAgfCAx
NCArKystLS0KIGRyaXZlcnMvbWZkL3J0NDgzMS5jICAgICAgICAgICAgICAgICAgfCAgNiArLS0K
IGRyaXZlcnMvbWZkL3J0NTAzMy5jICAgICAgICAgICAgICAgICAgfCAgNCArLQogZHJpdmVycy9t
ZmQvcnQ1MTIwLmMgICAgICAgICAgICAgICAgICB8ICAyICstCiBkcml2ZXJzL21mZC9yei1tdHUz
LmMgICAgICAgICAgICAgICAgIHwgIDIgKy0KIGRyaXZlcnMvbWZkL3NlYy1hY3BtLmMgICAgICAg
ICAgICAgICAgfCAgNiArLS0KIGRyaXZlcnMvbWZkL3NlYy1pMmMuYyAgICAgICAgICAgICAgICAg
fCAyMiArKysrLS0tLS0KIGRyaXZlcnMvbWZkL3NpNDc2eC1pMmMuYyAgICAgICAgICAgICAgfCAg
OCArLS0KIGRyaXZlcnMvbWZkL3NpbXBsZS1tZmQtaTJjLmMgICAgICAgICAgfCAgMiArLQogZHJp
dmVycy9tZmQvc2t5ODE0NTIuYyAgICAgICAgICAgICAgICB8ICA0ICstCiBkcml2ZXJzL21mZC9z
bTUwMS5jICAgICAgICAgICAgICAgICAgIHwgIDQgKy0KIGRyaXZlcnMvbWZkL3NtcHJvLWNvcmUu
YyAgICAgICAgICAgICAgfCAgMiArLQogZHJpdmVycy9tZmQvc3ByZC1zYzI3eHgtc3BpLmMgICAg
ICAgICB8ICA0ICstCiBkcml2ZXJzL21mZC9zc2JpLmMgICAgICAgICAgICAgICAgICAgIHwgIDIg
Ky0KIGRyaXZlcnMvbWZkL3N0bTMyLWxwdGltZXIuYyAgICAgICAgICAgfCAgNCArLQogZHJpdmVy
cy9tZmQvc3RtMzItdGltZXJzLmMgICAgICAgICAgICB8ICA0ICstCiBkcml2ZXJzL21mZC9zdG1m
eC5jICAgICAgICAgICAgICAgICAgIHwgIDQgKy0KIGRyaXZlcnMvbWZkL3N0bXBlLWkyYy5jICAg
ICAgICAgICAgICAgfCAzNCArKysrKystLS0tLS0tCiBkcml2ZXJzL21mZC9zdG1wZS1zcGkuYyAg
ICAgICAgICAgICAgIHwgMjYgKysrKystLS0tLQogZHJpdmVycy9tZmQvc3RwbWljMS5jICAgICAg
ICAgICAgICAgICB8ICA0ICstCiBkcml2ZXJzL21mZC9zdHc0ODF4LmMgICAgICAgICAgICAgICAg
IHwgIDggKy0tCiBkcml2ZXJzL21mZC9zdW42aS1wcmNtLmMgICAgICAgICAgICAgIHwgIDIgKy0K
IGRyaXZlcnMvbWZkL3RjMzU4OXguYyAgICAgICAgICAgICAgICAgfCAxNCArKystLS0KIGRyaXZl
cnMvbWZkL3RpLWxtdS5jICAgICAgICAgICAgICAgICAgfCAxMCArKy0tCiBkcml2ZXJzL21mZC90
aW1iZXJkYWxlLmMgICAgICAgICAgICAgIHwgIDIgKy0KIGRyaXZlcnMvbWZkL3RwczYxMDV4LmMg
ICAgICAgICAgICAgICAgfCAgNiArLS0KIGRyaXZlcnMvbWZkL3RwczY1MDEwLmMgICAgICAgICAg
ICAgICAgfCAxMCArKy0tCiBkcml2ZXJzL21mZC90cHM2NTA3eC5jICAgICAgICAgICAgICAgIHwg
IDYgKy0tCiBkcml2ZXJzL21mZC90cHM2NTA4Ni5jICAgICAgICAgICAgICAgIHwgIDQgKy0KIGRy
aXZlcnMvbWZkL3RwczY1MDkwLmMgICAgICAgICAgICAgICAgfCAgNiArLS0KIGRyaXZlcnMvbWZk
L3RwczY1MjE3LmMgICAgICAgICAgICAgICAgfCAgNiArLS0KIGRyaXZlcnMvbWZkL3RwczY1MjE4
LmMgICAgICAgICAgICAgICAgfCAgOCArLS0KIGRyaXZlcnMvbWZkL3RwczY1MjE5LmMgICAgICAg
ICAgICAgICAgfCAgOCArLS0KIGRyaXZlcnMvbWZkL3RwczY1ODZ4LmMgICAgICAgICAgICAgICAg
fCAgNiArLS0KIGRyaXZlcnMvbWZkL3RwczY1OTEwLmMgICAgICAgICAgICAgICAgfCAxMiArKy0t
LQogZHJpdmVycy9tZmQvdHBzNjU5MTItaTJjLmMgICAgICAgICAgICB8ICA0ICstCiBkcml2ZXJz
L21mZC90cHM2NTkxMi1zcGkuYyAgICAgICAgICAgIHwgIDQgKy0KIGRyaXZlcnMvbWZkL3RwczY1
OTQtaTJjLmMgICAgICAgICAgICAgfCAxMiArKy0tLQogZHJpdmVycy9tZmQvdHBzNjU5NC1zcGku
YyAgICAgICAgICAgICB8IDEyICsrLS0tCiBkcml2ZXJzL21mZC90cW14ODYuYyAgICAgICAgICAg
ICAgICAgIHwgIDIgKy0KIGRyaXZlcnMvbWZkL3R3bC1jb3JlLmMgICAgICAgICAgICAgICAgfCAy
MiArKysrLS0tLS0KIGRyaXZlcnMvbWZkL3R3bDQwMzAtYXVkaW8uYyAgICAgICAgICAgfCAgNCAr
LQogZHJpdmVycy9tZmQvdHdsNDAzMC1wb3dlci5jICAgICAgICAgICB8ICAyICstCiBkcml2ZXJz
L21mZC90d2w2MDMwLWlycS5jICAgICAgICAgICAgIHwgIDYgKy0tCiBkcml2ZXJzL21mZC90d2w2
MDQwLmMgICAgICAgICAgICAgICAgIHwgIDQgKy0KIGRyaXZlcnMvbWZkL3VwYm9hcmQtZnBnYS5j
ICAgICAgICAgICAgfCAgNiArLS0KIGRyaXZlcnMvbWZkL3ZleHByZXNzLXN5c3JlZy5jICAgICAg
ICAgfCAgNCArLQogZHJpdmVycy9tZmQvdng4NTUuYyAgICAgICAgICAgICAgICAgICB8ICAyICst
CiBkcml2ZXJzL21mZC93bTgzMXgtY29yZS5jICAgICAgICAgICAgIHwgIDIgKy0KIGRyaXZlcnMv
bWZkL3dtODMxeC1pMmMuYyAgICAgICAgICAgICAgfCAxNCArKystLS0KIGRyaXZlcnMvbWZkL3dt
ODMxeC1zcGkuYyAgICAgICAgICAgICAgfCAxNiArKystLS0KIGRyaXZlcnMvbWZkL3dtODM1MC1p
MmMuYyAgICAgICAgICAgICAgfCAgNiArLS0KIGRyaXZlcnMvbWZkL3dtODQwMC1jb3JlLmMgICAg
ICAgICAgICAgfCAgNCArLQogZHJpdmVycy9tZmQvd204OTk0LWNvcmUuYyAgICAgICAgICAgICB8
ICA4ICstLQogaW5jbHVkZS9saW51eC9tZmQvYmNtMjgzNS1wbS5oICAgICAgICB8ICA5IC0tLS0K
IGluY2x1ZGUvbGludXgvbWZkL2tlbXBsZC5oICAgICAgICAgICAgfCAxMiAtLS0tLQogMTYxIGZp
bGVzIGNoYW5nZWQsIDUzNiBpbnNlcnRpb25zKCspLCA1NzggZGVsZXRpb25zKC0pCgoKYmFzZS1j
b21taXQ6IGI5ODEwY2Q3NWI5ZmI1NmEzNDI1ZDM5MWNiYTNmNjA4NTAyYmQ0NzQKLS0gCjIuNTUu
MC4xMS5nMTUzNjY2YTdkOWJiCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20v
bWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
