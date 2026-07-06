Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VsZUDspHS2pYOgEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 06 Jul 2026 08:14:34 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 40CE270CD0A
	for <lists+linux-stm32@lfdr.de>; Mon, 06 Jul 2026 08:14:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=linux.dev header.s=key1 header.b=mLsuUED9;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=linux.dev (policy=none);
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E31F5C8F293;
	Mon,  6 Jul 2026 06:14:31 +0000 (UTC)
Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com
 [91.218.175.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1724DC7A831
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Jul 2026 00:34:21 +0000 (UTC)
Message-ID: <973f3d6f-6ff4-4685-9c9f-b07987f74d98@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1783298059;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wYrjdzAhnc0P88BFwUH/b6uj52WFQfIRb2R1u4QFCds=;
 b=mLsuUED9ENIp3ed3h8bdKFYcEwFgoRzOELLNc1jLIXF6taZ+WEztXLwd9/BAKQWvUz2Hs3
 3EKLIatmB5Z+Df3dgdlCr8bmpTJQbWFj3Jp6WCvzaQnW40BXVB4LUsJRj7jQdhncagFIYu
 oCbFYryMjDBm1fu5il4d+x3rl9gBRyM=
Date: Mon, 6 Jul 2026 08:33:47 +0800
MIME-Version: 1.0
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?=
 <u.kleine-koenig@baylibre.com>, linux-pwm@vger.kernel.org
References: <cover.1783263835.git.ukleinek@kernel.org>
 <20de6cd60c2938aad2d21397b92742849418ab1b.1783263835.git.ukleinek@kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Chen Wang <chen.wang@linux.dev>
In-Reply-To: <20de6cd60c2938aad2d21397b92742849418ab1b.1783263835.git.ukleinek@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Mon, 06 Jul 2026 06:14:30 +0000
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
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Kevin Hilman <khilman@baylibre.com>, Magnus Damm <magnus.damm@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
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
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 Sven Peter <sven@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Benson Leung <bleung@chromium.org>, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Scott Branden <sbranden@broadcom.com>, Inochi Amaoto <inochiama@gmail.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Samuel Holland <samuel.holland@sifive.com>, linux-renesas-soc@vger.kernel.org,
 Alexey Charkov <alchark@gmail.com>, asahi@lists.linux.dev,
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[linux.dev:s=key1];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[linux.dev : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[chen.wang@linux.dev,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:u.kleine-koenig@baylibre.com,m:linux-pwm@vger.kernel.org,m:sean.anderson@linux.dev,m:alexandre.belloni@bootlin.com,m:mwalle@kernel.org,m:heiko@sntech.de,m:geert+renesas@glider.be,m:imx@lists.linux.dev,m:Frank.Li@nxp.com,m:claudiu.beznea@tuxon.dev,m:paul@crapouillou.net,m:jernej.skrabec@gmail.com,m:alim.akhtar@samsung.com,m:groeck@chromium.org,m:j@jannau.net,m:michal.simek@amd.com,m:festevam@gmail.com,m:linux-riscv@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:jbrunet@baylibre.com,m:hammerh0314@gmail.com,m:linux-samsung-soc@vger.kernel.org,m:florian.fainelli@broadcom.com,m:khilman@baylibre.com,m:magnus.damm@gmail.com,m:krzk@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:peter.griffin@linaro.org,m:linux-rockchip@lists.infradead.org,m:bcm-kernel-feedback-list@broadcom.com,m:orsonzhai@gmail.com,m:linux-mips@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:piotr.wojtaszczyk@timesys.com,m:mcoquelin.stm32@gmail.com,m:chrome-platform@lists.linux.dev,
 m:martin.blumenstingl@googlemail.com,m:rjui@broadcom.com,m:s.hauer@pengutronix.de,m:vz@mleia.com,m:linux-mediatek@lists.infradead.org,m:linux-rpi-kernel@lists.infradead.org,m:baolin.wang@linux.alibaba.com,m:matthias.bgg@gmail.com,m:linux-amlogic@lists.infradead.org,m:sven@kernel.org,m:wens@kernel.org,m:bleung@chromium.org,m:linux-arm-kernel@lists.infradead.org,m:angelogioacchino.delregno@collabora.com,m:neil.armstrong@linaro.org,m:sbranden@broadcom.com,m:inochiama@gmail.com,m:nicolas.ferre@microchip.com,m:samuel.holland@sifive.com,m:linux-renesas-soc@vger.kernel.org,m:alchark@gmail.com,m:asahi@lists.linux.dev,m:kernel@pengutronix.de,m:zhang.lyra@gmail.com,m:pjw@kernel.org,m:neal@gompa.dev,m:sophgo@lists.linux.dev,m:nobuhiro.iwamatsu.x90@mail.toshiba,m:geert@glider.be,m:jernejskrabec@gmail.com,m:magnusdamm@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[linux.dev,bootlin.com,kernel.org,sntech.de,glider.be,lists.linux.dev,nxp.com,tuxon.dev,crapouillou.net,gmail.com,samsung.com,chromium.org,jannau.net,amd.com,lists.infradead.org,vger.kernel.org,baylibre.com,broadcom.com,st-md-mailman.stormreply.com,linaro.org,timesys.com,googlemail.com,pengutronix.de,mleia.com,linux.alibaba.com,collabora.com,microchip.com,sifive.com,gompa.dev,mail.toshiba];
	DKIM_TRACE(0.00)[linux.dev:-];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCPT_COUNT_GT_50(0.00)[64];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chen.wang@linux.dev,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCVD_COUNT_TWO(0.00)[2];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:from_smtp,st-md-mailman.stormreply.com:rdns,baylibre.com:email,linux.dev:from_mime,linux.dev:email,linux.dev:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 40CE270CD0A

Ck9uIDcvNS8yMDI2IDExOjE0IFBNLCBVd2UgS2xlaW5lLUvDtm5pZyAoVGhlIENhcGFibGUgSHVi
KSB3cm90ZToKPiAgIC0gVXNlIGEgc2luZ2xlIHNwYWNlIGluIGEgb2ZfZGV2aWNlX2lkIGFycmF5
IHRlcm1pbmF0b3I7IEEgc2luZ2xlIHNwYWNlCj4gICAgIGFmdGVyIHRoZSBvcGVuaW5nIHsgYW5k
IGJlZm9yZSB0aGUgY2xvc2luZyB9IGluIG5vbi1lbXB0eQo+ICAgICBpbml0aWFsaXplcnM7Cj4g
ICAtIE5vIGNvbW1hIGFmdGVyIGFuIGFycmF5IHRlcm1pbmF0b3I7Cj4gICAtIEFsc28gbm8gdHJh
aWxpbmcgY29tbWEgYWZ0ZXIgYSBuYW1lZCBpbml0aWFsaXplciBpZmYgdGhlCmlmZiAtPiBpZgo+
ICAgICBjbG9zaW5nIH0gaXMgb24gdGhlIHNhbWUgbGluZTsKPgo+IFNpZ25lZC1vZmYtYnk6IFV3
ZSBLbGVpbmUtS8O2bmlnIChUaGUgQ2FwYWJsZSBIdWIpIDx1LmtsZWluZS1rb2VuaWdAYmF5bGli
cmUuY29tPgoKWy4uLi4uLl0KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcHdtL3B3bS1zb3BoZ28t
c2cyMDQyLmMgYi9kcml2ZXJzL3B3bS9wd20tc29waGdvLXNnMjA0Mi5jCj4gaW5kZXggN2QwN2Iw
Y2E3ZDI5Li4wYjY0NjExNzJlNmEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9wd20vcHdtLXNvcGhn
by1zZzIwNDIuYwo+ICsrKyBiL2RyaXZlcnMvcHdtL3B3bS1zb3BoZ28tc2cyMDQyLmMKPiBAQCAt
MjI1LDExICsyMjUsMTAgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBzZzIwNDJfY2hpcF9kYXRhIHNn
MjA0NF9jaGlwX2RhdGEgPSB7Cj4gICBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBz
ZzIwNDJfcHdtX2lkc1tdID0gewo+ICAgCXsKPiAgIAkJLmNvbXBhdGlibGUgPSAic29waGdvLHNn
MjA0Mi1wd20iLAo+IC0JCS5kYXRhID0gJnNnMjA0Ml9jaGlwX2RhdGEKPiAtCX0sCj4gLQl7Cj4g
KwkJLmRhdGEgPSAmc2cyMDQyX2NoaXBfZGF0YSwKPiArCX0sIHsKPiAgIAkJLmNvbXBhdGlibGUg
PSAic29waGdvLHNnMjA0NC1wd20iLAo+IC0JCS5kYXRhID0gJnNnMjA0NF9jaGlwX2RhdGEKPiAr
CQkuZGF0YSA9ICZzZzIwNDRfY2hpcF9kYXRhLAo+ICAgCX0sCj4gICAJeyB9Cj4gICB9OwoKQ2hh
bmdlcyB0byBzb3BoZ28gcmVsYXRlZCBmaWxlc++8mgoKUmV2aWV3ZWQtYnk6IENoZW4gV2FuZyA8
Y2hlbi53YW5nQGxpbnV4LmRldj4KClRoYW5rcywKCkNoZW4KClsuLi4uLi5dCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGlu
ZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9z
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
