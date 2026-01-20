Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yN3BJBrWb2mVRQAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Jan 2026 20:23:06 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 42CBF4A3A4
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Jan 2026 20:23:06 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0A477C349C4;
	Tue, 20 Jan 2026 19:23:06 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C4099C36B3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Jan 2026 19:23:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 865C6409A9;
 Tue, 20 Jan 2026 19:23:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEA9BC16AAE;
 Tue, 20 Jan 2026 19:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768936983;
 bh=8rZs4ctIFUWV+s7flKGQlMaVzkDSCztd/ihtff8Ht6w=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=jgX58MKi+zjgv/xDIQx4cHK0wTdbY5WHIpWy6zaWGiyru1YA6cG7Qbw7G8M9RhL3S
 SSiru+ZKHzsLIh6rtTpzRanq5020WDpXXkfsUjC/Hil6perlOH41PXAjqsRSipdXvS
 IPP61htVkOsCqcy9Pqn5fLS8BPsTMosoZ9eOUO70Q6cEURtv9hoJC0lOmTM5QlYWiG
 wz6tqUkz/prRaWfMAFRhQ1iN0dHrXg8oROA8glqKMy/5Onkhv0z+Jp0+qs66q2UQYi
 BzO1NPQx1qqbWombFmTG5JqwfCmxs4g31+tAPZmi39pA4KsUWJBmYbw0vvIV/lZYxv
 FMvcuLOxsC4SQ==
From: Mark Brown <broonie@kernel.org>
To: Varshini Rajendran <varshini.rajendran@microchip.com>, 
 Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Haotian Zhang <vulab@iscas.ac.cn>, Sunny Luo <sunny.luo@amlogic.com>, 
 Janne Grunau <j@jannau.net>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Chen-Yu Tsai <wens@kernel.org>, 
 Amelie Delaunay <amelie.delaunay@foss.st.com>, 
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, CL Wang <cl634@andestech.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Heiko Stuebner <heiko@sntech.de>, 
 William Zhang <william.zhang@broadcom.com>, 
 =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
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
 Qianfeng Rong <rongqianfeng@vivo.com>, Haibo Chen <haibo.chen@nxp.com>, 
 Gabor Juhos <j4g8y7@gmail.com>, Md Sadre Alam <quic_mdalam@quicinc.com>, 
 Rosen Penev <rosenp@gmail.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
 Luis de Arquer <luis.dearquer@inertim.com>, 
 Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Longbin Li <looong.bin@gmail.com>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>, 
 Alessandro Grassi <alessandro.grassi@mailbox.org>, 
 Darshan R <rathod.darshan.0896@gmail.com>, 
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
In-Reply-To: <20260112203534.4186261-1-andriy.shevchenko@linux.intel.com>
References: <20260112203534.4186261-1-andriy.shevchenko@linux.intel.com>
Message-Id: <176893695845.778248.8132133480043006428.b4-ty@kernel.org>
Date: Tue, 20 Jan 2026 19:22:38 +0000
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-47773
Cc: Kursad Oney <kursad.oney@broadcom.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Lixu Zhang <lixu.zhang@intel.com>, Jean-Marie Verdun <verdun@hpe.com>,
 Frank Li <Frank.Li@nxp.com>, David Rhodes <david.rhodes@cirrus.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Conor Dooley <conor.dooley@microchip.com>,
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
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ryan Wanner <ryan.wanner@microchip.com>, Anand Gore <anand.gore@broadcom.com>,
 Andi Shyti <andi.shyti@kernel.org>,
 Michael Hennerich <michael.hennerich@analog.com>, Ray Jui <rjui@broadcom.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Jassi Brar <jaswinder.singh@linaro.org>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Nick Hawkins <nick.hawkins@hpe.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Han Xu <han.xu@nxp.com>, Sven Peter <sven@kernel.org>,
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Michal Simek <michal.simek@amd.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Yang Shen <shenyang39@huawei.com>,
 Neal Gompa <neal@gompa.dev>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Scott Branden <sbranden@broadcom.com>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Patrick Venture <venture@google.com>, Linus Walleij <linusw@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Samuel Holland <samuel.holland@sifive.com>, Tali Perry <tali.perry1@gmail.com>,
 Avi Fishman <avifishman70@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>, Ray Liu <ray.liu@airoha.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Paul Walmsley <pjw@kernel.org>,
 Vladimir Oltean <olteanv@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Daniel Mack <daniel@zonque.org>
Subject: Re: [Linux-stm32] [PATCH v2 0/4] spi: Make SPI core to take care of
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:varshini.rajendran@microchip.com,m:mikhail.kshevetskiy@iopsys.eu,m:angelogioacchino.delregno@collabora.com,m:vulab@iscas.ac.cn,m:sunny.luo@amlogic.com,m:j@jannau.net,m:martin.blumenstingl@googlemail.com,m:geert+renesas@glider.be,m:wens@kernel.org,m:amelie.delaunay@foss.st.com,m:chin-ting_kuo@aspeedtech.com,m:cl634@andestech.com,m:patrice.chotard@foss.st.com,m:heiko@sntech.de,m:william.zhang@broadcom.com,m:clg@kaod.org,m:manikandan.m@microchip.com,m:dlechner@baylibre.com,m:florian.fainelli@broadcom.com,m:jonas.gorski@gmail.com,m:929513338@qq.com,m:jun.guo@cixtech.com,m:phasta@kernel.org,m:ckeepax@opensource.cirrus.com,m:brgl@kernel.org,m:benoit.monin@bootlin.com,m:yangshiji66@outlook.com,m:james.clark@linaro.org,m:jonathan@marek.ca,m:carlos.song@nxp.com,m:sakari.ailus@linux.intel.com,m:chenhuacai@kernel.org,m:xianwei.zhao@amlogic.com,m:prajna.rajendrakumar@microchip.com,m:sperezglz@gmail.com,m:rongqianfeng@vivo.com,m:haibo.chen@nxp.com,m:j4g8y7@gmail.com,m:q
 uic_mdalam@quicinc.com,m:rosenp@gmail.com,m:m.szyprowski@samsung.com,m:luis.dearquer@inertim.com,m:cosmin-gabriel.tanislav.xa@renesas.com,m:tudor.ambarus@linaro.org,m:krzk@kernel.org,m:looong.bin@gmail.com,m:hayashi.kunihiko@socionext.com,m:clement.legoffic@foss.st.com,m:alessandro.grassi@mailbox.org,m:rathod.darshan.0896@gmail.com,m:webgeek1234@gmail.com,m:va@nvidia.com,m:quic_haixcui@quicinc.com,m:darshanrathod475@gmail.com,m:linux-spi@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-amlogic@lists.infradead.org,m:asahi@lists.linux.dev,m:linux-aspeed@lists.ozlabs.org,m:openbmc@lists.ozlabs.org,m:linux-rpi-kernel@lists.infradead.org,m:linux-sound@vger.kernel.org,m:patches@opensource.cirrus.com,m:imx@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:linux-rockchip@lists.infradead.org,m:linux-renesas-soc@vger.kernel.org,m:linux-samsung-soc@vger.kernel.org,m:linux-stm32@s
 t-md-mailman.stormreply.com,m:linux-sunxi@lists.linux.dev,m:linux-tegra@vger.kernel.org,m:virtualization@lists.linux.dev,m:andriy.shevchenko@linux.intel.com,m:kursad.oney@broadcom.com,m:alexandre.belloni@bootlin.com,m:lixu.zhang@intel.com,m:verdun@hpe.com,m:Frank.Li@nxp.com,m:david.rhodes@cirrus.com,m:jcmvbkbc@gmail.com,m:conor.dooley@microchip.com,m:ldewangan@nvidia.com,m:jernej.skrabec@gmail.com,m:alim.akhtar@samsung.com,m:claudiu.beznea@tuxon.dev,m:rafal@milecki.pl,m:masahisa.kojima@linaro.org,m:festevam@gmail.com,m:jbrunet@baylibre.com,m:lhjeff911@gmail.com,m:benjaminfair@google.com,m:yogeshgaur.83@gmail.com,m:khilman@baylibre.com,m:tmaimon77@gmail.com,m:zhuyinbo@loongson.cn,m:jonathanh@nvidia.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[microchip.com,iopsys.eu,collabora.com,iscas.ac.cn,amlogic.com,jannau.net,googlemail.com,glider.be,kernel.org,foss.st.com,aspeedtech.com,andestech.com,sntech.de,broadcom.com,kaod.org,baylibre.com,gmail.com,qq.com,cixtech.com,opensource.cirrus.com,bootlin.com,outlook.com,linaro.org,marek.ca,nxp.com,linux.intel.com,vivo.com,quicinc.com,samsung.com,inertim.com,renesas.com,socionext.com,mailbox.org,nvidia.com,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org,st-md-mailman.stormreply.com];
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
	RCPT_COUNT_GT_50(0.00)[148];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[broadcom.com,bootlin.com,intel.com,hpe.com,nxp.com,cirrus.com,gmail.com,microchip.com,nvidia.com,samsung.com,tuxon.dev,milecki.pl,linaro.org,baylibre.com,google.com,loongson.cn,jms.id.au,codeconstruct.com.au,kernel.org,analog.com,pengutronix.de,gmx.net,opensource.cirrus.com,alliedtelesis.co.nz,renesas.com,amd.com,huawei.com,gompa.dev,linux.alibaba.com,free.fr,sifive.com,airoha.com,zonque.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stormreply.com:email,stormreply.com:url]
X-Rspamd-Queue-Id: 42CBF4A3A4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gTW9uLCAxMiBKYW4gMjAyNiAyMToyMToyMiArMDEwMCwgQW5keSBTaGV2Y2hlbmtvIHdyb3Rl
Ogo+IEl0IHNlZW1zIGFsbCBvZiB0aGUgU1BJIGRyaXZlcnMgd2FudCB0byBwcm9wYWdhdGUgZndu
b2RlIChvciBvZl9ub2RlKQo+IG9mIHRoZSBwaHlzaWNhbCBkZXZpY2UgdG8gdGhlIFNQSSBkZXZp
Y2UuIE1ha2Ugc3VyZSB3ZSBkb24ndCBkdXBsaWNhdGUKPiBpdCBvdmVyIGFuZCBvdmVyIGluIGVh
Y2ggbmV3IGRyaXZlciAoKzIgaW4gdGhpcyBjeWNsZSkgYnkgbWFraW5nIGNvcmUKPiB0byB0YWtl
IGNhcmUgb2YgdGhhdC4gTm90ZSwgc2ltaWxhciBpcyBkb25lIGFscmVhZHkgYnkgSUlPIGFuZAo+
IEnCskMgc3Vic3lzdGVtcy4KPiAKPiBUaGVyZSBpcyBvbmUgbm90aWNlYWJsZSBhbmQgcXVpdGUg
c3BlY2lmaWMgY2FzZSB0aGF0IGlzIHRha2VuIGNhcmUgaW4KPiB0aGUgZmlyc3QgcGF0Y2ggYW5k
IG5vdyB3ZSBoYXZlIGEgY29uZmlybWF0aW9uIGZyb20gQ2lycnVzIHRoYXQgZXZlcnl0aGluZwo+
IGlzIG9rYXkuICBUaGUgcmVzdCBpcyBqdXN0IGEgbWVjaGFuaWNhbCBjb252ZXJzaW9uIGFmdGVy
IGNoZWNraW5nIHRoYXQKPiB0aGUgcGFyZW50IGRldmljZSBpcyBhc3NpZ25lZCB0byB0aGUgc2Ft
ZSB0aGF0IHByb3ZpZGVzIHRoZSByZXNwZWN0aXZlCj4gZndub2RlLgo+IAo+IFsuLi5dCgpBcHBs
aWVkIHRvCgogICBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dp
dC9icm9vbmllL3NwaS5naXQgZm9yLW5leHQKClRoYW5rcyEKClsxLzRdIHNwaTogUHJvcGFnYXRl
IGRlZmF1bHQgZndub2RlIHRvIHRoZSBTUEkgY29udHJvbGxlciBkZXZpY2UKICAgICAgY29tbWl0
OiBmMmQxYTMzMThlYjFlYzg2MDk5OWRiNDhjYjhkMTNiNDMyNjE2MjRkClsyLzRdIHNwaTogRHJv
cCBkdXBsaWNhdGUgb2Zfbm9kZSBhc3NpZ25tZW50CiAgICAgIGNvbW1pdDogMzk3NGE1ODViZTc4
YTFkYzkwYTE5ZDVjZjE4NDZhOTk5NTRlMzg0MgpbMy80XSBzcGk6IERyb3AgZHVwbGljYXRlIGZ3
bm9kZSBhc3NpZ25tZW50CiAgICAgIGNvbW1pdDogMTAzYzUxMGUxYzY4MzI3MjAwNTk3NTZkMTU1
ZGQxM2E0MmJhYTdhYgpbNC80XSBzcGk6IERyb3AgZHVwbGljYXRlIGRldmljZV9zZXRfbm9kZSgp
IGNhbGwKICAgICAgY29tbWl0OiAzN2ZiYzFhYjBmMjI1ZDIzZjA4MzkyNjBhMTEzNzViNGYxZjdj
ZjhjCgpBbGwgYmVpbmcgd2VsbCB0aGlzIG1lYW5zIHRoYXQgaXQgd2lsbCBiZSBpbnRlZ3JhdGVk
IGludG8gdGhlIGxpbnV4LW5leHQKdHJlZSAodXN1YWxseSBzb21ldGltZSBpbiB0aGUgbmV4dCAy
NCBob3VycykgYW5kIHNlbnQgdG8gTGludXMgZHVyaW5nCnRoZSBuZXh0IG1lcmdlIHdpbmRvdyAo
b3Igc29vbmVyIGlmIGl0IGlzIGEgYnVnIGZpeCksIGhvd2V2ZXIgaWYKcHJvYmxlbXMgYXJlIGRp
c2NvdmVyZWQgdGhlbiB0aGUgcGF0Y2ggbWF5IGJlIGRyb3BwZWQgb3IgcmV2ZXJ0ZWQuCgpZb3Ug
bWF5IGdldCBmdXJ0aGVyIGUtbWFpbHMgcmVzdWx0aW5nIGZyb20gYXV0b21hdGVkIG9yIG1hbnVh
bCB0ZXN0aW5nCmFuZCByZXZpZXcgb2YgdGhlIHRyZWUsIHBsZWFzZSBlbmdhZ2Ugd2l0aCBwZW9w
bGUgcmVwb3J0aW5nIHByb2JsZW1zIGFuZApzZW5kIGZvbGxvd3VwIHBhdGNoZXMgYWRkcmVzc2lu
ZyBhbnkgaXNzdWVzIHRoYXQgYXJlIHJlcG9ydGVkIGlmIG5lZWRlZC4KCklmIGFueSB1cGRhdGVz
IGFyZSByZXF1aXJlZCBvciB5b3UgYXJlIHN1Ym1pdHRpbmcgZnVydGhlciBjaGFuZ2VzIHRoZXkK
c2hvdWxkIGJlIHNlbnQgYXMgaW5jcmVtZW50YWwgdXBkYXRlcyBhZ2FpbnN0IGN1cnJlbnQgZ2l0
LCBleGlzdGluZwpwYXRjaGVzIHdpbGwgbm90IGJlIHJlcGxhY2VkLgoKUGxlYXNlIGFkZCBhbnkg
cmVsZXZhbnQgbGlzdHMgYW5kIG1haW50YWluZXJzIHRvIHRoZSBDQ3Mgd2hlbiByZXBseWluZwp0
byB0aGlzIG1haWwuCgpUaGFua3MsCk1hcmsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBz
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
