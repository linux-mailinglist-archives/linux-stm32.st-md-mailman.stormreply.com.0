Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sJBsKgHWb2mgMQAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Jan 2026 20:22:41 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 410C34A359
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Jan 2026 20:22:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E19E1C349C4;
	Tue, 20 Jan 2026 19:22:40 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C2756C36B3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Jan 2026 19:22:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5B2A54403E;
 Tue, 20 Jan 2026 19:22:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3BB5C19422;
 Tue, 20 Jan 2026 19:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768936958;
 bh=OVmbkw3k7fJ26f3GTMylBqqrvRkFQLNjf2AcM9UevMU=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=YlIDWci6NaIrYvDjAq2yhQz8tWegT2Dg6owXkPTtWwCCNZy6TIGjxdkf0SjWMqrBS
 HZ1OYluozzxuGUb+8XWZyPhjHzhZZBTdn+x4fAQviriIGxbMX1dqT/c1f/SDma9EII
 glDqd9riC4rVx6B2QSNL57WNsH5WjpCsMft/TEmFUb+YsHy2dFuwVHN2w/p0QKAC/w
 5Sj7i2icD1/pyQOPwPNE/B2LChkgA736lCjfJaMApcMxmC8AfGe77IDEawz4zO7gsp
 7BnFoBJwZbhJtt0PHorTsf9ENVZR5l7hg6xF7YMzjdh3zo3J0vrT/Hr5cse6h9pQHI
 VNOGdReIfciTA==
From: Mark Brown <broonie@kernel.org>
To: Varshini Rajendran <varshini.rajendran@microchip.com>, 
 Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sunny Luo <sunny.luo@amlogic.com>, Janne Grunau <j@jannau.net>, 
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, CL Wang <cl634@andestech.com>, 
 Manikandan Muralidharan <manikandan.m@microchip.com>, 
 David Lechner <dlechner@baylibre.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Jonas Gorski <jonas.gorski@gmail.com>, Hang Zhou <929513338@qq.com>, 
 Jun Guo <jun.guo@cixtech.com>, Philipp Stanner <phasta@kernel.org>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 Shiji Yang <yangshiji66@outlook.com>, James Clark <james.clark@linaro.org>, 
 Jonathan Marek <jonathan@marek.ca>, Carlos Song <carlos.song@nxp.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Huacai Chen <chenhuacai@kernel.org>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>, 
 Sergio Perez Gonzalez <sperezglz@gmail.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Qianfeng Rong <rongqianfeng@vivo.com>, Haibo Chen <haibo.chen@nxp.com>, 
 Gabor Juhos <j4g8y7@gmail.com>, Md Sadre Alam <quic_mdalam@quicinc.com>, 
 Rosen Penev <rosenp@gmail.com>, Luis de Arquer <luis.dearquer@inertim.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Longbin Li <looong.bin@gmail.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>, 
 Alessandro Grassi <alessandro.grassi@mailbox.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Darshan R <rathod.darshan.0896@gmail.com>, 
 Aaron Kling <webgeek1234@gmail.com>, Vishwaroop A <va@nvidia.com>, 
 Haixu Cui <quic_haixcui@quicinc.com>, 
 Darshan Rathod <darshanrathod475@gmail.com>, linux-spi@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, asahi@lists.linux.dev, 
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
 linux-rpi-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, imx@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
 linux-tegra@vger.kernel.org, virtualization@lists.linux.dev, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
In-Reply-To: <20260108203004.3538449-1-andriy.shevchenko@linux.intel.com>
References: <20260108203004.3538449-1-andriy.shevchenko@linux.intel.com>
Message-Id: <176893693352.778248.9155805475563647239.b4-ty@kernel.org>
Date: Tue, 20 Jan 2026 19:22:13 +0000
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-47773
Cc: Kursad Oney <kursad.oney@broadcom.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Lixu Zhang <lixu.zhang@intel.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Jean-Marie Verdun <verdun@hpe.com>, Frank Li <Frank.Li@nxp.com>,
 David Rhodes <david.rhodes@cirrus.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Laxman Dewangan <ldewangan@nvidia.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>,
 Masahisa Kojima <masahisa.kojima@linaro.org>,
 Fabio Estevam <festevam@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Li-hao Kuo <lhjeff911@gmail.com>, Benjamin Fair <benjaminfair@google.com>,
 Yogesh Gaur <yogeshgaur.83@gmail.com>, Kevin Hilman <khilman@baylibre.com>,
 Tomer Maimon <tmaimon77@gmail.com>, Yinbo Zhu <zhuyinbo@loongson.cn>,
 Jonathan Hunter <jonathanh@nvidia.com>, Nancy Yuen <yuenn@google.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Joel Stanley <joel@jms.id.au>, Orson Zhai <orsonzhai@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Kamal Dasu <kamal.dasu@broadcom.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ryan Wanner <ryan.wanner@microchip.com>, Anand Gore <anand.gore@broadcom.com>,
 William Zhang <william.zhang@broadcom.com>,
 Michael Hennerich <michael.hennerich@analog.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Jassi Brar <jaswinder.singh@linaro.org>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Nick Hawkins <nick.hawkins@hpe.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Han Xu <han.xu@nxp.com>, Sven Peter <sven@kernel.org>,
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Yang Shen <shenyang39@huawei.com>,
 Vladimir Oltean <olteanv@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Scott Branden <sbranden@broadcom.com>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Patrick Venture <venture@google.com>, Linus Walleij <linusw@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Samuel Holland <samuel.holland@sifive.com>, Tali Perry <tali.perry1@gmail.com>,
 Avi Fishman <avifishman70@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>, Ray Liu <ray.liu@airoha.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Paul Walmsley <pjw@kernel.org>,
 Neal Gompa <neal@gompa.dev>, Shawn Guo <shawnguo@kernel.org>,
 Daniel Mack <daniel@zonque.org>
Subject: Re: [Linux-stm32] [PATCH v1 0/4] spi: Make SPI core to take care of
 fwnode assignment
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
X-Spamd-Result: default: False [4.89 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:varshini.rajendran@microchip.com,m:mikhail.kshevetskiy@iopsys.eu,m:angelogioacchino.delregno@collabora.com,m:sunny.luo@amlogic.com,m:j@jannau.net,m:chin-ting_kuo@aspeedtech.com,m:cl634@andestech.com,m:manikandan.m@microchip.com,m:dlechner@baylibre.com,m:florian.fainelli@broadcom.com,m:jonas.gorski@gmail.com,m:929513338@qq.com,m:jun.guo@cixtech.com,m:phasta@kernel.org,m:ckeepax@opensource.cirrus.com,m:brgl@kernel.org,m:benoit.monin@bootlin.com,m:yangshiji66@outlook.com,m:james.clark@linaro.org,m:jonathan@marek.ca,m:carlos.song@nxp.com,m:sakari.ailus@linux.intel.com,m:chenhuacai@kernel.org,m:xianwei.zhao@amlogic.com,m:prajna.rajendrakumar@microchip.com,m:sperezglz@gmail.com,m:miquel.raynal@bootlin.com,m:rongqianfeng@vivo.com,m:haibo.chen@nxp.com,m:j4g8y7@gmail.com,m:quic_mdalam@quicinc.com,m:rosenp@gmail.com,m:luis.dearquer@inertim.com,m:geert+renesas@glider.be,m:cosmin-gabriel.tanislav.xa@renesas.com,m:tudor.ambarus@linaro.org,m:krzk@kernel.org,m:looong.bin@
 gmail.com,m:patrice.chotard@foss.st.com,m:clement.legoffic@foss.st.com,m:alessandro.grassi@mailbox.org,m:wens@kernel.org,m:rathod.darshan.0896@gmail.com,m:webgeek1234@gmail.com,m:va@nvidia.com,m:quic_haixcui@quicinc.com,m:darshanrathod475@gmail.com,m:linux-spi@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-amlogic@lists.infradead.org,m:asahi@lists.linux.dev,m:linux-aspeed@lists.ozlabs.org,m:openbmc@lists.ozlabs.org,m:linux-rpi-kernel@lists.infradead.org,m:linux-sound@vger.kernel.org,m:patches@opensource.cirrus.com,m:imx@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:linux-rockchip@lists.infradead.org,m:linux-renesas-soc@vger.kernel.org,m:linux-samsung-soc@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-sunxi@lists.linux.dev,m:linux-tegra@vger.kernel.org,m:virtualization@lists.linux.dev,m:andriy.shevchenko@linux.intel.com,m:kursad.oney@broadcom.c
 om,m:alexandre.belloni@bootlin.com,m:lixu.zhang@intel.com,m:hayashi.kunihiko@socionext.com,m:verdun@hpe.com,m:Frank.Li@nxp.com,m:david.rhodes@cirrus.com,m:jcmvbkbc@gmail.com,m:conor.dooley@microchip.com,m:ldewangan@nvidia.com,m:jernej.skrabec@gmail.com,m:alim.akhtar@samsung.com,m:claudiu.beznea@tuxon.dev,m:rafal@milecki.pl,m:masahisa.kojima@linaro.org,m:festevam@gmail.com,m:jbrunet@baylibre.com,m:lhjeff911@gmail.com,m:benjaminfair@google.com,m:yogeshgaur.83@gmail.com,m:khilman@baylibre.com,m:tmaimon77@gmail.com,m:zhuyinbo@loongson.cn,m:jonathanh@nvidia.com,m:yuenn@google.com,m:bcm-kernel-feedback-list@broadcom.com,m:joel@jms.id.au,m:orsonzhai@gmail.com,m:andrew@codeconstruct.com.au,m:lorenzo@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[microchip.com,iopsys.eu,collabora.com,amlogic.com,jannau.net,aspeedtech.com,andestech.com,baylibre.com,broadcom.com,gmail.com,qq.com,cixtech.com,kernel.org,opensource.cirrus.com,bootlin.com,outlook.com,linaro.org,marek.ca,nxp.com,linux.intel.com,vivo.com,quicinc.com,inertim.com,glider.be,renesas.com,foss.st.com,mailbox.org,nvidia.com,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org,st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[broonie@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCPT_COUNT_GT_50(0.00)[146];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[broadcom.com,bootlin.com,intel.com,socionext.com,hpe.com,nxp.com,cirrus.com,gmail.com,microchip.com,nvidia.com,samsung.com,tuxon.dev,milecki.pl,linaro.org,baylibre.com,google.com,loongson.cn,jms.id.au,codeconstruct.com.au,kernel.org,renesas.com,analog.com,googlemail.com,pengutronix.de,gmx.net,opensource.cirrus.com,alliedtelesis.co.nz,kaod.org,amd.com,huawei.com,linux.alibaba.com,sntech.de,free.fr,sifive.com,airoha.com,gompa.dev,zonque.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:email,stormreply.com:url,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 410C34A359
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gVGh1LCAwOCBKYW4gMjAyNiAyMToyMzozNyArMDEwMCwgQW5keSBTaGV2Y2hlbmtvIHdyb3Rl
Ogo+IEl0IHNlZW1zIGFsbCBvZiB0aGUgU1BJIGRyaXZlcnMgd2FudCB0byBwcm9wYWdhdGUgZndu
b2RlIChvciBvZl9ub2RlKQo+IG9mIHRoZSBwaHlzaWNhbCBkZXZpY2UgdG8gdGhlIFNQSSBkZXZp
Y2UuIE1ha2Ugc3VyZSB3ZSBkb24ndCBkdXBsaWNhdGUKPiBpdCBvdmVyIGFuZCBvdmVyIGluIGVh
Y2ggbmV3IGRyaXZlciAoKzIgaW4gdGhpcyBjeWNsZSkgYnkgbWFraW5nIGNvcmUKPiB0byB0YWtl
IGNhcmUgb2YgdGhhdC4gTm90ZSwgc2ltaWxhciBpcyBkb25lIGFscmVhZHkgYnkgSUlPIGFuZAo+
IEnCskMgc3Vic3lzdGVtcy4KPiAKPiBUaGVyZSBpcyBvbmUgbm90aWNlYWJsZSBhbmQgcXVpdGUg
c3BlY2lmaWMgY2FzZSB0aGF0IGlzIHRha2VuIGNhcmUgaW4KPiB0aGUgZmlyc3QgcGF0Y2ggYW5k
IHdvdWxkIGJlIG5pY2UgdG8gaGF2ZSBhIGNvbmZpcm1hdGlvbiBmcm9tIENpcnJ1cwo+IHRoYXQg
ZXZlcnl0aGluZyBpcyBva2F5LiBUaGUgcmVzdCBpcyBqdXN0IGEgbWVjaGFuaWNhbCBjb252ZXJz
aW9uLgo+IAo+IFsuLi5dCgpBcHBsaWVkIHRvCgogICBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1
Yi9zY20vbGludXgva2VybmVsL2dpdC9icm9vbmllL3NwaS5naXQgZm9yLW5leHQKClRoYW5rcyEK
ClsxLzRdIHNwaTogUHJvcGFnYXRlIGRlZmF1bHQgZndub2RlIHRvIHRoZSBTUEkgY29udHJvbGxl
ciBkZXZpY2UKICAgICAgY29tbWl0OiBmMmQxYTMzMThlYjFlYzg2MDk5OWRiNDhjYjhkMTNiNDMy
NjE2MjRkClsyLzRdIHNwaTogRHJvcCBkdXBsaWNhdGUgb2Zfbm9kZSBhc3NpZ25tZW50CiAgICAg
IGNvbW1pdDogMzk3NGE1ODViZTc4YTFkYzkwYTE5ZDVjZjE4NDZhOTk5NTRlMzg0MgpbMy80XSBz
cGk6IERyb3AgZHVwbGljYXRlIGZ3bm9kZSBhc3NpZ25tZW50CiAgICAgIGNvbW1pdDogMTAzYzUx
MGUxYzY4MzI3MjAwNTk3NTZkMTU1ZGQxM2E0MmJhYTdhYgpbNC80XSBzcGk6IERyb3AgZHVwbGlj
YXRlIGRldmljZV9zZXRfbm9kZSgpIGNhbGwKICAgICAgY29tbWl0OiAzN2ZiYzFhYjBmMjI1ZDIz
ZjA4MzkyNjBhMTEzNzViNGYxZjdjZjhjCgpBbGwgYmVpbmcgd2VsbCB0aGlzIG1lYW5zIHRoYXQg
aXQgd2lsbCBiZSBpbnRlZ3JhdGVkIGludG8gdGhlIGxpbnV4LW5leHQKdHJlZSAodXN1YWxseSBz
b21ldGltZSBpbiB0aGUgbmV4dCAyNCBob3VycykgYW5kIHNlbnQgdG8gTGludXMgZHVyaW5nCnRo
ZSBuZXh0IG1lcmdlIHdpbmRvdyAob3Igc29vbmVyIGlmIGl0IGlzIGEgYnVnIGZpeCksIGhvd2V2
ZXIgaWYKcHJvYmxlbXMgYXJlIGRpc2NvdmVyZWQgdGhlbiB0aGUgcGF0Y2ggbWF5IGJlIGRyb3Bw
ZWQgb3IgcmV2ZXJ0ZWQuCgpZb3UgbWF5IGdldCBmdXJ0aGVyIGUtbWFpbHMgcmVzdWx0aW5nIGZy
b20gYXV0b21hdGVkIG9yIG1hbnVhbCB0ZXN0aW5nCmFuZCByZXZpZXcgb2YgdGhlIHRyZWUsIHBs
ZWFzZSBlbmdhZ2Ugd2l0aCBwZW9wbGUgcmVwb3J0aW5nIHByb2JsZW1zIGFuZApzZW5kIGZvbGxv
d3VwIHBhdGNoZXMgYWRkcmVzc2luZyBhbnkgaXNzdWVzIHRoYXQgYXJlIHJlcG9ydGVkIGlmIG5l
ZWRlZC4KCklmIGFueSB1cGRhdGVzIGFyZSByZXF1aXJlZCBvciB5b3UgYXJlIHN1Ym1pdHRpbmcg
ZnVydGhlciBjaGFuZ2VzIHRoZXkKc2hvdWxkIGJlIHNlbnQgYXMgaW5jcmVtZW50YWwgdXBkYXRl
cyBhZ2FpbnN0IGN1cnJlbnQgZ2l0LCBleGlzdGluZwpwYXRjaGVzIHdpbGwgbm90IGJlIHJlcGxh
Y2VkLgoKUGxlYXNlIGFkZCBhbnkgcmVsZXZhbnQgbGlzdHMgYW5kIG1haW50YWluZXJzIHRvIHRo
ZSBDQ3Mgd2hlbiByZXBseWluZwp0byB0aGlzIG1haWwuCgpUaGFua3MsCk1hcmsKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxp
bmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8v
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMy
Cg==
