Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id H2IyA7tgS2qsQQEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 06 Jul 2026 10:00:59 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8708B70DDB3
	for <lists+linux-stm32@lfdr.de>; Mon, 06 Jul 2026 10:00:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 38E5BC7BF8B;
	Mon,  6 Jul 2026 08:00:58 +0000 (UTC)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com
 [209.85.221.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EA020C7BF8B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Jul 2026 08:00:56 +0000 (UTC)
Received: by mail-vk1-f175.google.com with SMTP id
 71dfb90a1353d-5bbd26a2729so2044808e0c.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 06 Jul 2026 01:00:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783324856; x=1783929656;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=xlcdnSGCAGaaD3Qtz41jPpd7wkV1TEYjW94sOKYd3zY=;
 b=jzRBgkF9hl5oewg4hvqoz+krU6VTEBx5RsfhOx3v5fPs4FWkv8UJ44GssI96di0nYT
 YaVCy/wvMq3d7ZyUZ+FgZWMvrtbDcHWxUQj819jikov8PgkZ+bibFJPr3OArtqGtM8cl
 8UDNgxFNfXzbTtyjtluIMn8kug0IwIu7TC0e4GSlwHF2pGOFvLqgy2fmrC+nHP2mPz8E
 BvQiBd/mqMjW0WHe7nc5Z80x3so/Ln/CaU6I8+1Rdlu4LLVbrEPR31ZFYFMKz8kFBgGm
 cMB4+FPyaCla+1zS5pM5YAF/Z36XF3F75+98LVR4fmUKQ8KoWHuy0bb5NTATGYehPrzr
 IEIA==
X-Forwarded-Encrypted: i=1;
 AHgh+RoNUR4MDK1mafPDK58eOFkSYNgq9Q6RNL632vGHEE9/pfbIJl4dqI2Wk3/5kFVEUMLk9ychJpVXJ+y3RA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwhMwIzwLncAJgaj1vSnsyb8p+zUzn075JA6hhqXnRd3IFyPGJu
 8waqvaQbkE6ReAYa1L43Qx49s+e0OWAR1tafDbXUlj6YQFyq13b4YbidNIp5cVHc
X-Gm-Gg: AfdE7cnuscaRPtvMmxHNENPZ432WaYvTowVM48MvvH8KK8QZBr8w3MVh3C7sfu4tQVt
 iLpLYAJYL2dUEpW7917HuVBfP5f+GYcEp7OQ/ov5ziptUujSrihXtg87cknkzAT9zQUGzbcoMk8
 1VO59Atv3a0e15iu694k3MszmU+qzJUC4W30xY9Z06MxMigjatwMRrb1BD12s6Y62teH4XJob5l
 r2xXnkieIx96vbmgQ9s1V1Hg0t6J8ToWxsJdyQMgIOZV0gefIcUEV+QEfXAL8LvDGQ+DQd/bOYa
 K54GmbhppP63DHis6Xgbba9VUXz6mjAHJpMP/iEc7eJ7HhiWPaekia7VhethD7YXCkq+jymEqqK
 +ghGBtDVGKXD5KZc31xOLoHdff5kLItpfEoG07h+nj5J6DEnbDGNgYUKGu4JDav5PGBf2+IXmeT
 XOeO0GnDLnf+RfDJ62drhyuo0N+bc9ikptOHxxrhX9uidC4dZEj9daoA==
X-Received: by 2002:a05:6102:5785:b0:739:77a7:90bc with SMTP id
 ada2fe7eead31-7427f46099cmr2939066137.23.1783324855804; 
 Mon, 06 Jul 2026 01:00:55 -0700 (PDT)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com.
 [209.85.221.172]) by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-73e1c9f8e71sm4960594137.10.2026.07.06.01.00.55
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jul 2026 01:00:55 -0700 (PDT)
Received: by mail-vk1-f172.google.com with SMTP id
 71dfb90a1353d-5bbd26a2729so2044782e0c.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 06 Jul 2026 01:00:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AHgh+RpTntKDel4WYaq+zAsfqgAevPU1In7n/D+kNbWiNH29pK50BnhH0Byex2SoknPaW5EkLzSz+uHYHlaAJw==@st-md-mailman.stormreply.com
X-Received: by 2002:a05:6102:800d:b0:722:826e:1423 with SMTP id
 ada2fe7eead31-7427f0478a0mr3286706137.20.1783324855096; Mon, 06 Jul 2026
 01:00:55 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1783263835.git.ukleinek@kernel.org>
 <20de6cd60c2938aad2d21397b92742849418ab1b.1783263835.git.ukleinek@kernel.org>
In-Reply-To: <20de6cd60c2938aad2d21397b92742849418ab1b.1783263835.git.ukleinek@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 6 Jul 2026 10:00:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXKyFJ20N6qKafvMZ_0sVj5+XTxcod_6wGkwTsokn7dvw@mail.gmail.com>
X-Gm-Features: AVVi8CfQACxAMot5VlqKHI6FXvkOZpEWhTZp1dlkgWSruFHOk1f-I-dS5kVo31s
Message-ID: <CAMuHMdXKyFJ20N6qKafvMZ_0sVj5+XTxcod_6wGkwTsokn7dvw@mail.gmail.com>
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?=
 <u.kleine-koenig@baylibre.com>
Cc: Sean Anderson <sean.anderson@linux.dev>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Michael Walle <mwalle@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>, imx@lists.linux.dev,
 Frank Li <Frank.Li@nxp.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Paul Cercueil <paul@crapouillou.net>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Guenter Roeck <groeck@chromium.org>,
 Janne Grunau <j@jannau.net>, Michal Simek <michal.simek@amd.com>,
 Fabio Estevam <festevam@gmail.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>,
 Hammer Hsieh <hammerh0314@gmail.com>, linux-samsung-soc@vger.kernel.org,
 Florian Fainelli <florian.fainelli@broadcom.com>, asahi@lists.linux.dev,
 Kevin Hilman <khilman@baylibre.com>, Magnus Damm <magnus.damm@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Peter Griffin <peter.griffin@linaro.org>, linux-rockchip@lists.infradead.org,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Orson Zhai <orsonzhai@gmail.com>, linux-mips@vger.kernel.org,
 linux-sunxi@lists.linux.dev, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 linux-pwm@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 chrome-platform@lists.linux.dev,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Vladimir Zapolskiy <vz@mleia.com>, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 Sven Peter <sven@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Benson Leung <bleung@chromium.org>, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Scott Branden <sbranden@broadcom.com>, Inochi Amaoto <inochiama@gmail.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Samuel Holland <samuel.holland@sifive.com>, linux-renesas-soc@vger.kernel.org,
 Alexey Charkov <alchark@gmail.com>, Chen Wang <chen.wang@linux.dev>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Paul Walmsley <pjw@kernel.org>,
 Neal Gompa <neal@gompa.dev>, sophgo@lists.linux.dev,
 Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>
Subject: Re: [Linux-stm32] [PATCH v1 4/5] pwm: Unify coding style of
	of_device_id arrays
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
	FREEMAIL_CC(0.00)[linux.dev,bootlin.com,kernel.org,sntech.de,glider.be,lists.linux.dev,nxp.com,tuxon.dev,crapouillou.net,gmail.com,samsung.com,chromium.org,jannau.net,amd.com,lists.infradead.org,vger.kernel.org,baylibre.com,broadcom.com,st-md-mailman.stormreply.com,linaro.org,timesys.com,googlemail.com,pengutronix.de,mleia.com,linux.alibaba.com,collabora.com,microchip.com,sifive.com,gompa.dev,mail.toshiba];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_RECIPIENTS(0.00)[m:u.kleine-koenig@baylibre.com,m:sean.anderson@linux.dev,m:alexandre.belloni@bootlin.com,m:mwalle@kernel.org,m:heiko@sntech.de,m:geert+renesas@glider.be,m:imx@lists.linux.dev,m:Frank.Li@nxp.com,m:claudiu.beznea@tuxon.dev,m:paul@crapouillou.net,m:jernej.skrabec@gmail.com,m:alim.akhtar@samsung.com,m:groeck@chromium.org,m:j@jannau.net,m:michal.simek@amd.com,m:festevam@gmail.com,m:linux-riscv@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:jbrunet@baylibre.com,m:hammerh0314@gmail.com,m:linux-samsung-soc@vger.kernel.org,m:florian.fainelli@broadcom.com,m:asahi@lists.linux.dev,m:khilman@baylibre.com,m:magnus.damm@gmail.com,m:krzk@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:peter.griffin@linaro.org,m:linux-rockchip@lists.infradead.org,m:bcm-kernel-feedback-list@broadcom.com,m:orsonzhai@gmail.com,m:linux-mips@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:piotr.wojtaszczyk@timesys.com,m:linux-pwm@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:chrome-p
 latform@lists.linux.dev,m:martin.blumenstingl@googlemail.com,m:rjui@broadcom.com,m:s.hauer@pengutronix.de,m:vz@mleia.com,m:linux-mediatek@lists.infradead.org,m:linux-rpi-kernel@lists.infradead.org,m:baolin.wang@linux.alibaba.com,m:matthias.bgg@gmail.com,m:linux-amlogic@lists.infradead.org,m:sven@kernel.org,m:wens@kernel.org,m:bleung@chromium.org,m:linux-arm-kernel@lists.infradead.org,m:angelogioacchino.delregno@collabora.com,m:neil.armstrong@linaro.org,m:sbranden@broadcom.com,m:inochiama@gmail.com,m:nicolas.ferre@microchip.com,m:samuel.holland@sifive.com,m:linux-renesas-soc@vger.kernel.org,m:alchark@gmail.com,m:chen.wang@linux.dev,m:kernel@pengutronix.de,m:zhang.lyra@gmail.com,m:pjw@kernel.org,m:neal@gompa.dev,m:sophgo@lists.linux.dev,m:nobuhiro.iwamatsu.x90@mail.toshiba,m:geert@glider.be,m:jernejskrabec@gmail.com,m:magnusdamm@gmail.com,s:lists@lfdr.de];
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
	RCPT_COUNT_GT_50(0.00)[65];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,baylibre.com:email,linux-m68k.org:from_mime,linux-m68k.org:email,stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8708B70DDB3

T24gU3VuLCA1IEp1bCAyMDI2IGF0IDE3OjE0LCBVd2UgS2xlaW5lLUvDtm5pZyAoVGhlIENhcGFi
bGUgSHViKQo8dS5rbGVpbmUta29lbmlnQGJheWxpYnJlLmNvbT4gd3JvdGU6Cj4gIC0gVXNlIGEg
c2luZ2xlIHNwYWNlIGluIGEgb2ZfZGV2aWNlX2lkIGFycmF5IHRlcm1pbmF0b3I7IEEgc2luZ2xl
IHNwYWNlCj4gICAgYWZ0ZXIgdGhlIG9wZW5pbmcgeyBhbmQgYmVmb3JlIHRoZSBjbG9zaW5nIH0g
aW4gbm9uLWVtcHR5Cj4gICAgaW5pdGlhbGl6ZXJzOwo+ICAtIE5vIGNvbW1hIGFmdGVyIGFuIGFy
cmF5IHRlcm1pbmF0b3I7Cj4gIC0gQWxzbyBubyB0cmFpbGluZyBjb21tYSBhZnRlciBhIG5hbWVk
IGluaXRpYWxpemVyIGlmZiB0aGUKPiAgICBjbG9zaW5nIH0gaXMgb24gdGhlIHNhbWUgbGluZTsK
Pgo+IFNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIChUaGUgQ2FwYWJsZSBIdWIpIDx1
LmtsZWluZS1rb2VuaWdAYmF5bGlicmUuY29tPgoKPiAgZHJpdmVycy9wd20vcHdtLXJjYXIuYyAg
ICAgICAgICAgIHwgIDQgKystLQo+ICBkcml2ZXJzL3B3bS9wd20tcmVuZXNhcy10cHUuYyAgICAg
fCAxMCArKysrKy0tLS0tCj4gIGRyaXZlcnMvcHdtL3B3bS1yemcybC1ncHQuYyAgICAgICB8ICAy
ICstCgpSZXZpZXdlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRl
ci5iZT4gIyByZW5lc2FzCgpHcntvZXRqZSxlZXRpbmd9cywKCiAgICAgICAgICAgICAgICAgICAg
ICAgIEdlZXJ0CgotLSAKR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51
eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZwoKSW4gcGVyc29uYWwgY29udmVy
c2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1
dAp3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIi
IG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
LS0gTGludXMgVG9ydmFsZHMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21h
aWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
