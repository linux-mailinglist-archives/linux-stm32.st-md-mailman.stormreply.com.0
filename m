Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id crpfKtx0SmrDDQEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sun, 05 Jul 2026 17:14:36 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7FA70A6C0
	for <lists+linux-stm32@lfdr.de>; Sun, 05 Jul 2026 17:14:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=baylibre.com header.s=google header.b="aN/4lXZu";
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A54E3C8F263;
	Sun,  5 Jul 2026 15:14:35 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 85CE5C424DE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  5 Jul 2026 15:14:34 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-493ba701891so16757145e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 05 Jul 2026 08:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre.com; s=google; t=1783264474; x=1783869274;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=W1sbIzpLoPVOsWAp5a91/2b+hubQz3OERKvp78vmABs=;
 b=aN/4lXZuWUCM4/9cWFhNocboHx3KjF8nBPU9o89GY+bKAexiyJuRWZrAbyZPYU7xsn
 10C70J9Y5jy6z2+7sz8OrUBbn3RFHjBg1KGjlqNi8z4rSA2sSyY6EfGhxliN/Inm/KfD
 XWQ5/uYDTysAmxx0t+Yc9c5/iy0jk6Di2nbEd0xrJDs/+wmiVrHZTAXVvoAtj4g+GJaf
 MtLpMEvzK48QfKiz7KW0EScRr0kaMAczA/VLK4JunirSvYZ1u5MDIM5R8TlWji6I2YZc
 H18863tcZRYLnfsJqBQ/lQ+9y5GDaGd6awsHq0UjMn/N18VUYgWW1m/+Y9pAtsBzEiMl
 6z/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783264474; x=1783869274;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=W1sbIzpLoPVOsWAp5a91/2b+hubQz3OERKvp78vmABs=;
 b=sd/Mm0MQEjyf6JknE2dVLKNuN6tqOyfA/v/2vjBV/pSnFtIv4rrInPnJp/1EjVbC+e
 G6lqICl+qXuW//Uucvoyys9VzgKMWlancK3DK+YbjydDtV7nLZQTVrLbqQeEVll4fI8i
 Um+f2mgLzY6HNYg+o4jCedKyhoQ8/3N/zbgowK1hJUucx66vvD+557lWb0LnG6+Ne9H2
 32VRPLPM+CDPhZXTsZIksTk5sG/htv7mH7484peOYXe65IkU08iIGHZUHgd960rMQ6pK
 pPkRDntVDEMX6eonTGbkBWJXZTIrSkrp6K8H6qcaEx/BMutoyMHkYynIfpCMZnqMwGFK
 +d0g==
X-Forwarded-Encrypted: i=1;
 AFNElJ/iLjrFh+sYL/iRdMpP6Gdl434ZEE3c1nrMdPUOVM0JISIVJFVfDVS1l8Tn3zzybE72FQBusbI/gyLEEA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx1mwBXhMrbI7kdpwRkpmie/ATfYwMtCdcQ4N8whahvbUcF23y8
 +lEi/LvHV0QKFjHOp09CgHQhCO+Nbu5PWMYSnUrHR/BDi5+icMnThRHenHaAb1BmKjM=
X-Gm-Gg: AfdE7cm9tkzXgdkeVpXm1+2jXLqmYv5LXmox+7XXyfG3hz9O4jBRs9c5mxJoYZP6rWk
 G2hXBolGs3n3LlQCRSXthWBMuxePJo5snKTKS5G8fZonDQYQwFE/GtCPB139jmnqGg7MylvwSMR
 uO0+t/BNi8KciOz/dIAiGol/n9s11nLv6DJrrd97EXx1nAniSKImu0TlWah2+S3+xCQgsHaANwz
 qsLS/OvNSnb9gAg/9peZiZzZ/ywIzGHrsrIEme4GNtSsxkDZWsIAaEBWmC9Zq4EK1azy7aAHmnI
 gPkOjacVexMiZW7ejNI0+xMNLoX5Yp1XcJTgLEZknErErfu4QaCH5d5YfpxIedNGt66ADM7Ojyf
 LIvXfJAYn66J5T/kk9kKeVYWiaO9IDdu0K1AA1u+ts72DzXeDf7RbkHiRFS3D+COjcYYw91jVyt
 LjeWCsmwHf2YvXVRQsrg==
X-Received: by 2002:a05:600c:8b61:b0:492:7084:32af with SMTP id
 5b1f17b1804b1-493d11f4b80mr87345205e9.23.1783264473096; 
 Sun, 05 Jul 2026 08:14:33 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-493c63b6f8csm262180195e9.11.2026.07.05.08.14.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jul 2026 08:14:32 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?=
 <u.kleine-koenig@baylibre.com>
To: linux-pwm@vger.kernel.org
Date: Sun,  5 Jul 2026 17:14:12 +0200
Message-ID: <cover.1783263835.git.ukleinek@kernel.org>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3597;
 i=u.kleine-koenig@baylibre.com; h=from:subject:message-id;
 bh=/ARYZ3nMFNE4qw1dHISvtgGeE92jI229vSRxfVl732s=;
 b=owEBbAGT/pANAwAKAY+A+1h9Ev5OAcsmYgBqSnTF02HXaqUpIDE1Mt23JzG4uWfnR2u11awWU
 3umjMoAUj+JATIEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCakp0xQAKCRCPgPtYfRL+
 TnxCB/i0tqSm4WRb5bStOYawCPIjfRWQcr4xSi/+9osjT9WCMkOFcdJIALH3OTjRDssO1bo27Lf
 HlxVL0NC+cyu2/kdQnTKxCwlN4Mr+K0ubzHhjQG0p5hKoo0E+ymyawDtJ372H29L5zSSYeZCvIo
 x4WE6N9MvkYqMFbIYzoBUakF9cYdVbu6ohyBqtXYSqr1ZwGjdHd4MWHija/sPCTtV/LrwSg4fhc
 gQCbrGPW2Y9VKehuNTAzHv2wje5Cu3eNO+c3uV15dBMdPgO9DfEp3EXIwH2ZR09Uaz5HwWXbYK9
 FN+Z8CfZYziZ0D7HLlPGgse2ncweWpObjQ6pQzued8YQFKE=
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Cc: Sean Anderson <sean.anderson@linux.dev>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Michael Walle <mwalle@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>, imx@lists.linux.dev,
 Frank Li <Frank.Li@nxp.com>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Guenter Roeck <groeck@chromium.org>,
 linux-riscv@lists.infradead.org, Michal Simek <michal.simek@amd.com>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Jerome Brunet <jbrunet@baylibre.com>, Hammer Hsieh <hammerh0314@gmail.com>,
 linux-samsung-soc@vger.kernel.org,
 Florian Fainelli <florian.fainelli@broadcom.com>, asahi@lists.linux.dev,
 Binbin Zhou <zhoubinbin@loongson.cn>, Janne Grunau <j@jannau.net>,
 Magnus Damm <magnus.damm@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>, linux-rockchip@lists.infradead.org,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Orson Zhai <orsonzhai@gmail.com>, linux-mips@vger.kernel.org,
 linux-sunxi@lists.linux.dev, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, chrome-platform@lists.linux.dev,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Vladimir Zapolskiy <vz@mleia.com>, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 Sven Peter <sven@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Benson Leung <bleung@chromium.org>, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Scott Branden <sbranden@broadcom.com>, Inochi Amaoto <inochiama@gmail.com>,
 linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>,
 linux-renesas-soc@vger.kernel.org, Alexey Charkov <alchark@gmail.com>,
 Chen Wang <chen.wang@linux.dev>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Kevin Hilman <khilman@baylibre.com>, Paul Walmsley <pjw@kernel.org>,
 Neal Gompa <neal@gompa.dev>, sophgo@lists.linux.dev,
 Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>
Subject: [Linux-stm32] [PATCH v1 0/5] pwm: Unify arrays of various
	*_device_id
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
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[baylibre.com:s=google];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:linux-pwm@vger.kernel.org,m:sean.anderson@linux.dev,m:alexandre.belloni@bootlin.com,m:mwalle@kernel.org,m:heiko@sntech.de,m:geert+renesas@glider.be,m:imx@lists.linux.dev,m:Frank.Li@nxp.com,m:nicolas.ferre@microchip.com,m:paul@crapouillou.net,m:jernej.skrabec@gmail.com,m:alim.akhtar@samsung.com,m:claudiu.beznea@tuxon.dev,m:groeck@chromium.org,m:linux-riscv@lists.infradead.org,m:michal.simek@amd.com,m:festevam@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:jbrunet@baylibre.com,m:hammerh0314@gmail.com,m:linux-samsung-soc@vger.kernel.org,m:florian.fainelli@broadcom.com,m:asahi@lists.linux.dev,m:zhoubinbin@loongson.cn,m:j@jannau.net,m:magnus.damm@gmail.com,m:krzk@kernel.org,m:peter.griffin@linaro.org,m:linux-rockchip@lists.infradead.org,m:bcm-kernel-feedback-list@broadcom.com,m:orsonzhai@gmail.com,m:linux-mips@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:piotr.wojtaszczyk@timesys.com,m:mcoquelin.stm32@gmail.com,m:chrome-platform@lists.linux.dev,m:mart
 in.blumenstingl@googlemail.com,m:rjui@broadcom.com,m:s.hauer@pengutronix.de,m:vz@mleia.com,m:linux-mediatek@lists.infradead.org,m:linux-rpi-kernel@lists.infradead.org,m:baolin.wang@linux.alibaba.com,m:zhang.lyra@gmail.com,m:matthias.bgg@gmail.com,m:linux-amlogic@lists.infradead.org,m:sven@kernel.org,m:wens@kernel.org,m:bleung@chromium.org,m:linux-arm-kernel@lists.infradead.org,m:angelogioacchino.delregno@collabora.com,m:neil.armstrong@linaro.org,m:sbranden@broadcom.com,m:inochiama@gmail.com,m:linux-kernel@vger.kernel.org,m:samuel.holland@sifive.com,m:linux-renesas-soc@vger.kernel.org,m:alchark@gmail.com,m:chen.wang@linux.dev,m:kernel@pengutronix.de,m:khilman@baylibre.com,m:pjw@kernel.org,m:neal@gompa.dev,m:sophgo@lists.linux.dev,m:nobuhiro.iwamatsu.x90@mail.toshiba,m:geert@glider.be,m:jernejskrabec@gmail.com,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[u.kleine-koenig@baylibre.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linux.dev,bootlin.com,kernel.org,sntech.de,glider.be,lists.linux.dev,nxp.com,microchip.com,crapouillou.net,gmail.com,samsung.com,tuxon.dev,chromium.org,lists.infradead.org,amd.com,st-md-mailman.stormreply.com,baylibre.com,vger.kernel.org,broadcom.com,loongson.cn,jannau.net,linaro.org,timesys.com,googlemail.com,pengutronix.de,mleia.com,linux.alibaba.com,collabora.com,sifive.com,gompa.dev,mail.toshiba];
	DKIM_TRACE(0.00)[baylibre.com:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCPT_COUNT_GT_50(0.00)[65];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2F7FA70A6C0

SGVsbG8sCgp0aGlzIHNlcmllcyBpcyBwYXJ0IG9mIGEgcHJlcGFyYXRpb24gZm9yIGNoYW5naW5n
IC5kcml2ZXJfZGF0YSAoYW5kCnNpbWlsYXJpbHkgbmFtZWQgbWVtYmVycykgb2YgKl9kZXZpY2Vf
aWQgdG8gYW4gYW5vbnltb3VzIHVuaW9uLgpTZWUgZS5nLgpodHRwczovL2xvcmUua2VybmVsLm9y
Zy9hbGwvY292ZXIuMTc4MDA0ODkyNS5naXQudS5rbGVpbmUta29lbmlnQGJheWxpYnJlLmNvbS8K
Zm9yIHRoZSBpZGVhIGJlaGluZCBpdC4gSSBhbHNvIGdyYWJiZWQgdGhlIG9wcG9ydHVuaXR5IHRv
IHVuaWZ5IHRoZQpjb2Rpbmcgc3R5bGUgZm9yIGFsbCB0aGVzZSBhcnJheXMgd2hpbGUgZ29pbmcg
dGhyb3VnaCB0aGVzZS4KClRoZSBwYXRjaCBzZXJpZXMgaXMgYmFzZWQgb24gcHdtL2Zvci1uZXh0
ICsgInB3bTogcHhhOiBEZXBlbmQgb24gT0YgYW5kCnNpbXBsaWZ5IGFjY29yZGluZ2x5IiBbMV0u
CgpCZXN0IHJlZ2FyZHMKVXdlCgpbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcHdt
LzIwMjYwNzA1MDgzOTEwLjM1MDIyMDctMi11LmtsZWluZS1rb2VuaWdAYmF5bGlicmUuY29tCgpV
d2UgS2xlaW5lLUvDtm5pZyAoVGhlIENhcGFibGUgSHViKSAoNSk6CiAgcHdtOiBwY2E5Njg1OiBE
cm9wIHVudXNlZCBhc3NpZ25tZW50IG9mIGFjcGlfZGV2aWNlX2lkIGRyaXZlciBkYXRhCiAgcHdt
OiBVc2UgbmFtZWQgaW5pdGlhbGl6ZXJzIGZvciBhcnJheXMgb2YgYWNwaV9kZXZpY2VfaWQKICBw
d206IFVuaWZ5IGNvZGluZyBzdHlsZSBvZiBhY3BpX2RldmljZV9pZCBhcnJheXMKICBwd206IFVu
aWZ5IGNvZGluZyBzdHlsZSBvZiBvZl9kZXZpY2VfaWQgYXJyYXlzCiAgcHdtOiBscHNzLXBjaTog
VW5pZnkgY29kaW5nIHN0eWxlIG9mIHBjaV9kZXZpY2VfaWQgYXJyYXkKCiBkcml2ZXJzL3B3bS9w
d20tYXBwbGUuYyAgICAgICAgICAgfCAgMiArLQogZHJpdmVycy9wd20vcHdtLWFyZ29uLWZhbi1o
YXQuYyAgIHwgIDIgKy0KIGRyaXZlcnMvcHdtL3B3bS1hdG1lbC1obGNkYy5jICAgICB8IDE1ICsr
KysrKy0tLS0tLS0tLQogZHJpdmVycy9wd20vcHdtLWF0bWVsLXRjYi5jICAgICAgIHwgIDYgKysr
LS0tCiBkcml2ZXJzL3B3bS9wd20tYXRtZWwuYyAgICAgICAgICAgfCAgMyArLS0KIGRyaXZlcnMv
cHdtL3B3bS1iY20taXByb2MuYyAgICAgICB8ICAyICstCiBkcml2ZXJzL3B3bS9wd20tYmNtLWtv
bmEuYyAgICAgICAgfCAgMiArLQogZHJpdmVycy9wd20vcHdtLWJjbTI4MzUuYyAgICAgICAgIHwg
IDIgKy0KIGRyaXZlcnMvcHdtL3B3bS1iZXJsaW4uYyAgICAgICAgICB8ICAyICstCiBkcml2ZXJz
L3B3bS9wd20tYnJjbXN0Yi5jICAgICAgICAgfCAgMiArLQogZHJpdmVycy9wd20vcHdtLWNsay5j
ICAgICAgICAgICAgIHwgIDIgKy0KIGRyaXZlcnMvcHdtL3B3bS1jbHBzNzExeC5jICAgICAgICB8
ICAyICstCiBkcml2ZXJzL3B3bS9wd20tY3Jvcy1lYy5jICAgICAgICAgfCAgMiArLQogZHJpdmVy
cy9wd20vcHdtLWhpYnZ0LmMgICAgICAgICAgIHwgIDIgKy0KIGRyaXZlcnMvcHdtL3B3bS1pbXgt
dHBtLmMgICAgICAgICB8ICAyICstCiBkcml2ZXJzL3B3bS9wd20taW14MS5jICAgICAgICAgICAg
fCAgMiArLQogZHJpdmVycy9wd20vcHdtLWlteDI3LmMgICAgICAgICAgIHwgIDIgKy0KIGRyaXZl
cnMvcHdtL3B3bS1pcHEuYyAgICAgICAgICAgICB8ICA0ICsrLS0KIGRyaXZlcnMvcHdtL3B3bS1q
ejQ3NDAuYyAgICAgICAgICB8ICAyICstCiBkcml2ZXJzL3B3bS9wd20tbG9vbmdzb24uYyAgICAg
ICAgfCAgMiArLQogZHJpdmVycy9wd20vcHdtLWxwMzk0My5jICAgICAgICAgIHwgIDIgKy0KIGRy
aXZlcnMvcHdtL3B3bS1scGMxOHh4LXNjdC5jICAgICB8ICAyICstCiBkcml2ZXJzL3B3bS9wd20t
bHBjMzJ4eC5jICAgICAgICAgfCAgMiArLQogZHJpdmVycy9wd20vcHdtLWxwc3MtcGNpLmMgICAg
ICAgIHwgIDIgKy0KIGRyaXZlcnMvcHdtL3B3bS1scHNzLXBsYXRmb3JtLmMgICB8IDEwICsrKysr
LS0tLS0KIGRyaXZlcnMvcHdtL3B3bS1tZWRpYXRlay5jICAgICAgICB8ICAyICstCiBkcml2ZXJz
L3B3bS9wd20tbWVzb24uYyAgICAgICAgICAgfCAgOSArKysrLS0tLS0KIGRyaXZlcnMvcHdtL3B3
bS1tdGstZGlzcC5jICAgICAgICB8ICA4ICsrKystLS0tCiBkcml2ZXJzL3B3bS9wd20tbXhzLmMg
ICAgICAgICAgICAgfCAgMiArLQogZHJpdmVycy9wd20vcHdtLW9tYXAtZG10aW1lci5jICAgIHwg
IDQgKystLQogZHJpdmVycy9wd20vcHdtLXBjYTk2ODUuYyAgICAgICAgIHwgIDYgKysrLS0tCiBk
cml2ZXJzL3B3bS9wd20tcHhhLmMgICAgICAgICAgICAgfCAgOCArKysrLS0tLQogZHJpdmVycy9w
d20vcHdtLXJhc3BiZXJyeXBpLXBvZS5jIHwgIDIgKy0KIGRyaXZlcnMvcHdtL3B3bS1yY2FyLmMg
ICAgICAgICAgICB8ICA0ICsrLS0KIGRyaXZlcnMvcHdtL3B3bS1yZW5lc2FzLXRwdS5jICAgICB8
IDEwICsrKysrLS0tLS0KIGRyaXZlcnMvcHdtL3B3bS1yb2NrY2hpcC5jICAgICAgICB8ICA4ICsr
KystLS0tCiBkcml2ZXJzL3B3bS9wd20tcnpnMmwtZ3B0LmMgICAgICAgfCAgMiArLQogZHJpdmVy
cy9wd20vcHdtLXNhbXN1bmcuYyAgICAgICAgIHwgIDIgKy0KIGRyaXZlcnMvcHdtL3B3bS1zaWZp
dmUuYyAgICAgICAgICB8ICAyICstCiBkcml2ZXJzL3B3bS9wd20tc2wyOGNwbGQuYyAgICAgICAg
fCAgMiArLQogZHJpdmVycy9wd20vcHdtLXNvcGhnby1zZzIwNDIuYyAgIHwgIDcgKysrLS0tLQog
ZHJpdmVycy9wd20vcHdtLXNwcmQuYyAgICAgICAgICAgIHwgIDQgKystLQogZHJpdmVycy9wd20v
cHdtLXN0aS5jICAgICAgICAgICAgIHwgIDIgKy0KIGRyaXZlcnMvcHdtL3B3bS1zdG0zMi1scC5j
ICAgICAgICB8ICA0ICsrLS0KIGRyaXZlcnMvcHdtL3B3bS1zdG0zMi5jICAgICAgICAgICB8ICA2
ICsrKy0tLQogZHJpdmVycy9wd20vcHdtLXN1bjRpLmMgICAgICAgICAgIHwgIDIgKy0KIGRyaXZl
cnMvcHdtL3B3bS1zdW5wbHVzLmMgICAgICAgICB8ICA0ICsrLS0KIGRyaXZlcnMvcHdtL3B3bS10
aWVjYXAuYyAgICAgICAgICB8ICA2ICsrKy0tLQogZHJpdmVycy9wd20vcHdtLXRpZWhycHdtLmMg
ICAgICAgIHwgIDIgKy0KIGRyaXZlcnMvcHdtL3B3bS10d2wtbGVkLmMgICAgICAgICB8ICAyICst
CiBkcml2ZXJzL3B3bS9wd20tdHdsLmMgICAgICAgICAgICAgfCAgMiArLQogZHJpdmVycy9wd20v
cHdtLXZpc2NvbnRpLmMgICAgICAgIHwgIDIgKy0KIGRyaXZlcnMvcHdtL3B3bS12dDg1MDAuYyAg
ICAgICAgICB8ICAyICstCiBkcml2ZXJzL3B3bS9wd20teGlsaW54LmMgICAgICAgICAgfCAgNCAr
Ky0tCiA1NCBmaWxlcyBjaGFuZ2VkLCA5NiBpbnNlcnRpb25zKCspLCAxMDIgZGVsZXRpb25zKC0p
CgoKYmFzZS1jb21taXQ6IDFhNDkyMDk0MGViZmQ4ZDkwNzg1OGFiZDhmOGRkMDliMTM3NTI5NDYK
cHJlcmVxdWlzaXRlLXBhdGNoLWlkOiBiNDIzYTlkMDQ5YjQ1MjBlZjM3YjQwNjM1Yzk1MDA0MzYz
ZWNmNjkyCi0tIAoyLjU1LjAuMTEuZzE1MzY2NmE3ZDliYgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4
LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
