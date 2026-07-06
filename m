Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id i/ujFoqGS2qmUgEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 06 Jul 2026 12:42:18 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DD53670F5E2
	for <lists+linux-stm32@lfdr.de>; Mon, 06 Jul 2026 12:42:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=niCT3sGc;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=kernel.org (policy=quarantine);
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A55B2C8F274;
	Mon,  6 Jul 2026 10:42:17 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0F90CC7BF8B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Jul 2026 10:42:15 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 0E33061383;
 Mon,  6 Jul 2026 10:42:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A9351F000E9;
 Mon,  6 Jul 2026 10:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1783334534;
 bh=IPNGdHh56ZVB5CsH+UE6uKclV6wrHeJiGGx7ee1V988=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=niCT3sGc0nhu+MKE15cOmixqFTzPAzuM+JXHh8UIXYk/QBka7MHhqMK31Rs7xrUui
 xWGDcEAn0KH3fSUj83doKefDip0SFnyx16083vHWs+Kz/7ZVvzznmcx5qDRVfg8LRe
 3OGHJyq88POyqmD9Q0N+dHeptgzoKsLXAQyY56gXSsYYda9+mWdnG9RnCgZrXYhEbn
 w1koFeCcrUiwzWK3rjzPQ5TtnKvznRG4e/kjkMKoZSJ0vBmrMiHW0HZ0h857QzKX6G
 LzLqYxYxRMqnNvvlH6/OgMEZS0QJvZ9Ej3lAOZ6ChIR0MJF9B15eOAaE5AqCdfcyMC
 H0rD9sCNUcMXQ==
Message-ID: <f5fad349-7086-4b3a-a91f-5a471f340c14@kernel.org>
Date: Mon, 6 Jul 2026 12:41:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?=
 <u.kleine-koenig@baylibre.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
References: <cover.1783263835.git.ukleinek@kernel.org>
 <20de6cd60c2938aad2d21397b92742849418ab1b.1783263835.git.ukleinek@kernel.org>
 <973f3d6f-6ff4-4685-9c9f-b07987f74d98@linux.dev> <aktWoIfY_DdO6gb4@monoceros>
 <bc697542-b1e2-41c2-af36-b708ca4aad5c@oss.qualcomm.com>
 <akuFirxGTqu_gt4O@monoceros>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <akuFirxGTqu_gt4O@monoceros>
Cc: Sean Anderson <sean.anderson@linux.dev>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Michael Walle <mwalle@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>, imx@lists.linux.dev,
 Frank Li <Frank.Li@nxp.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Paul Cercueil <paul@crapouillou.net>,
 Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
 Alim Akhtar <alim.akhtar@samsung.com>, Guenter Roeck <groeck@chromium.org>,
 linux-riscv@lists.infradead.org, Michal Simek <michal.simek@amd.com>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>,
 Hammer Hsieh <hammerh0314@gmail.com>, linux-samsung-soc@vger.kernel.org,
 Florian Fainelli <florian.fainelli@broadcom.com>, asahi@lists.linux.dev,
 Janne Grunau <j@jannau.net>, Magnus Damm <magnus.damm@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
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
 Chunyan Zhang <zhang.lyra@gmail.com>,
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
 Kevin Hilman <khilman@baylibre.com>, Paul Walmsley <pjw@kernel.org>,
 Neal Gompa <neal@gompa.dev>, sophgo@lists.linux.dev
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
X-Spamd-Result: default: False [4.89 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20260515];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:u.kleine-koenig@baylibre.com,m:philmd@oss.qualcomm.com,m:sean.anderson@linux.dev,m:alexandre.belloni@bootlin.com,m:mwalle@kernel.org,m:heiko@sntech.de,m:geert+renesas@glider.be,m:imx@lists.linux.dev,m:Frank.Li@nxp.com,m:claudiu.beznea@tuxon.dev,m:paul@crapouillou.net,m:nobuhiro.iwamatsu.x90@mail.toshiba,m:alim.akhtar@samsung.com,m:groeck@chromium.org,m:linux-riscv@lists.infradead.org,m:michal.simek@amd.com,m:festevam@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-kernel@vger.kernel.org,m:jbrunet@baylibre.com,m:hammerh0314@gmail.com,m:linux-samsung-soc@vger.kernel.org,m:florian.fainelli@broadcom.com,m:asahi@lists.linux.dev,m:j@jannau.net,m:magnus.damm@gmail.com,m:jernej.skrabec@gmail.com,m:peter.griffin@linaro.org,m:linux-rockchip@lists.infradead.org,m:bcm-kernel-feedback-list@broadcom.com,m:orsonzhai@gmail.com,m:linux-mips@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:piotr.wojtaszczyk@timesys.com,m:linux-pwm@vger.kernel.org,m:mcoquelin.stm3
 2@gmail.com,m:chrome-platform@lists.linux.dev,m:martin.blumenstingl@googlemail.com,m:rjui@broadcom.com,m:s.hauer@pengutronix.de,m:vz@mleia.com,m:linux-mediatek@lists.infradead.org,m:linux-rpi-kernel@lists.infradead.org,m:baolin.wang@linux.alibaba.com,m:zhang.lyra@gmail.com,m:matthias.bgg@gmail.com,m:linux-amlogic@lists.infradead.org,m:sven@kernel.org,m:wens@kernel.org,m:bleung@chromium.org,m:linux-arm-kernel@lists.infradead.org,m:angelogioacchino.delregno@collabora.com,m:neil.armstrong@linaro.org,m:sbranden@broadcom.com,m:inochiama@gmail.com,m:nicolas.ferre@microchip.com,m:samuel.holland@sifive.com,m:linux-renesas-soc@vger.kernel.org,m:alchark@gmail.com,m:chen.wang@linux.dev,m:kernel@pengutronix.de,m:khilman@baylibre.com,m:pjw@kernel.org,m:neal@gompa.dev,m:sophgo@lists.linux.dev,m:geert@glider.be,m:magnusdamm@gmail.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	RCPT_COUNT_GT_50(0.00)[65];
	ALIAS_RESOLVED(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[linux.dev,bootlin.com,kernel.org,sntech.de,glider.be,lists.linux.dev,nxp.com,tuxon.dev,crapouillou.net,mail.toshiba,samsung.com,chromium.org,lists.infradead.org,amd.com,gmail.com,st-md-mailman.stormreply.com,vger.kernel.org,baylibre.com,broadcom.com,jannau.net,linaro.org,timesys.com,googlemail.com,pengutronix.de,mleia.com,linux.alibaba.com,collabora.com,microchip.com,sifive.com,gompa.dev];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,renesas];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,wikipedia.org:url,st-md-mailman.stormreply.com:from_smtp,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DD53670F5E2

T24gMDYvMDcvMjAyNiAxMjozOSwgVXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1Yikg
d3JvdGU6Cj4gSGVsbG8sCj4gCj4gT24gTW9uLCBKdWwgMDYsIDIwMjYgYXQgMTA6Mjg6MTZBTSAr
MDIwMCwgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgd3JvdGU6Cj4+IEhpIFV3ZSwKPj4KPj4gT24g
Ni83LzI2IDA5OjE5LCBVd2UgS2xlaW5lLUvDg8K2bmlnIChUaGUgQ2FwYWJsZSBIdWIpIHdyb3Rl
Ogo+Pj4gSGVsbG8gQ2hlbiwKPj4+Cj4+PiBPbiBNb24sIEp1bCAwNiwgMjAyNiBhdCAwODozMzo0
N0FNICswODAwLCBDaGVuIFdhbmcgd3JvdGU6Cj4+Pj4gT24gNy81LzIwMjYgMTE6MTQgUE0sIFV3
ZSBLbGVpbmUtS8O2bmlnIChUaGUgQ2FwYWJsZSBIdWIpIHdyb3RlOgo+Pj4+PiAgICAtIFVzZSBh
IHNpbmdsZSBzcGFjZSBpbiBhIG9mX2RldmljZV9pZCBhcnJheSB0ZXJtaW5hdG9yOyBBIHNpbmds
ZSBzcGFjZQo+Pj4+PiAgICAgIGFmdGVyIHRoZSBvcGVuaW5nIHsgYW5kIGJlZm9yZSB0aGUgY2xv
c2luZyB9IGluIG5vbi1lbXB0eQo+Pj4+PiAgICAgIGluaXRpYWxpemVyczsKPj4+Pj4gICAgLSBO
byBjb21tYSBhZnRlciBhbiBhcnJheSB0ZXJtaW5hdG9yOwo+Pj4+PiAgICAtIEFsc28gbm8gdHJh
aWxpbmcgY29tbWEgYWZ0ZXIgYSBuYW1lZCBpbml0aWFsaXplciBpZmYgdGhlCj4+Pj4gaWZmIC0+
IGlmCj4+Pgo+Pj4gVGhpcyBpcyBhY3R1YWxseSBpbnRlbmRlZC4gaWZmID0gImlmIGFuZCBvbmx5
IGlmIiwgc2VlIGUuZy4KPj4+IGh0dHBzOi8vZW4ud2lraXBlZGlhLm9yZy93aWtpL0lmX2FuZF9v
bmx5X2lmIC4KPj4KPj4gSSBhZ3JlZSB0aGlzIHNjaWVudGlmaWMgaWRpb21hdGljIGV4cHJlc3Np
b24gaXMgbm90IHdlbGwga25vd24KPj4gYnkgbm9uLW5hdGl2ZSBFbmdsaXNoIHNwZWFrZXJzLCBh
bmQgdXNpbmcgdGhlIGV4cGFuZGVkIGZvcm0gaXMKPj4ganVzdCBzaW1wbGVyIHRvIHJldmlldyAo
dGhpbmtpbmcgYXQgbm9uLW5hdGl2ZSBFbmdsaXNoIHNwZWFrZXIKPj4gcmVhZGluZyB5b3VyIGNv
bW1pdCBpbiB0aGUgZnV0dXJlKS4KPiAKPiBmaW5lIGZvciBtZSwgSSdsbCBmaXh1cCB0byAKCk5v
b29vLCByZWFsbHksIHRoaXMgaXMgbml0cGlja2luZyBvbiB0aGlzIGNvbW1pdC4gTm90IHRoYXQg
SSBsaWtlIHRoYXQKY29tbWl0IC0gaXQncyBqdXN0IGNodXJuIC0gYnV0ICdpZmYnIGlzIHdpZGVs
eSBrbm93biBhbmQgd2lkZWx5IHVzZWQgaW4KTGludXgga2VybmVsLiBJdCdzIGNvbXBsZXRlbHkg
Y29ycmVjdCwgaXQgaXMgY29tbW9uIGFuZCBleHBlY3RlZC4KCkl0IGlzIG5vdCBzY2llbnRpZmlj
IGV4cHJlc3Npb24uIEl0IGlzIGNvbW1vbiBpbiB0aGUga2VybmVsIGRvY3MuCgpCZXN0IHJlZ2Fy
ZHMsCktyenlzenRvZgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1h
bi9saXN0aW5mby9saW51eC1zdG0zMgo=
