Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA56D0612B
	for <lists+linux-stm32@lfdr.de>; Thu, 08 Jan 2026 21:30:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ED50EC8F287;
	Thu,  8 Jan 2026 20:30:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BB908C8F286
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Jan 2026 20:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767904240; x=1799440240;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gweGXKEQGc4/hwMnHXoXPIZG21hxC6IQVTr9HcEdhzU=;
 b=khPQG38KKaoILw1+CGqYktTwBgz0h06EJmzVxbBzeVuFCYhu22dylAdm
 /qVzn1Vt+n8166aBSp9MbkivA578/oBvOjYRsYunCyQfqsrCuXYaRhhBP
 Y345W4EJbzoFnPZJqKuLLTVAB+vAojLKDF7dAR5X/kvCaYKV2Fiez6oIg
 vZms0H/FEMeiNsDBCHutRBKZsiFFqqI/mrvU64WPVyDPuztDnOl0gzx3N
 y+2iLa9kNNublroRBgI3nSbBBAuO4A/piKu2prbFl1fAiPbrPX6cBF1B/
 6CAL0EueGBNxaEYrjU9OtZrWgaOK1FFRa7UZtNNaqF22QywJrnr4xtCv6 w==;
X-CSE-ConnectionGUID: SyIOar4DS3+ncxGcb+8ISQ==
X-CSE-MsgGUID: Y00a9o3iTdS3mNM43e0dDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="68486023"
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; d="scan'208";a="68486023"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 12:30:37 -0800
X-CSE-ConnectionGUID: nOEw7AxLRH+oqOtO0nbFhg==
X-CSE-MsgGUID: Sloao9zrQne3aKaUlEruyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; d="scan'208";a="226706614"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa002.fm.intel.com with ESMTP; 08 Jan 2026 12:30:27 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
 id 65F759B; Thu, 08 Jan 2026 21:30:18 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>,
 Varshini Rajendran <varshini.rajendran@microchip.com>,
 Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Sunny Luo <sunny.luo@amlogic.com>, Janne Grunau <j@jannau.net>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
 CL Wang <cl634@andestech.com>,
 Manikandan Muralidharan <manikandan.m@microchip.com>,
 David Lechner <dlechner@baylibre.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Jonas Gorski <jonas.gorski@gmail.com>, Hang Zhou <929513338@qq.com>,
 Jun Guo <jun.guo@cixtech.com>, Philipp Stanner <phasta@kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Bartosz Golaszewski <brgl@kernel.org>,
 =?UTF-8?q?Beno=C3=AEt=20Monin?= <benoit.monin@bootlin.com>,
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
 =?UTF-8?q?Cl=C3=A9ment=20Le=20Goffic?= <clement.legoffic@foss.st.com>,
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
 linux-tegra@vger.kernel.org, virtualization@lists.linux.dev
Date: Thu,  8 Jan 2026 21:23:40 +0100
Message-ID: <20260108203004.3538449-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260108203004.3538449-1-andriy.shevchenko@linux.intel.com>
References: <20260108203004.3538449-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
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
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
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
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Jassi Brar <jaswinder.singh@linaro.org>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Nick Hawkins <nick.hawkins@hpe.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Han Xu <han.xu@nxp.com>, Sven Peter <sven@kernel.org>,
 =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
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
Subject: [Linux-stm32] [PATCH v1 3/4] spi: Drop duplicate fwnode assignment
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

The SPI core provides the default fwnode for the controller,
inherited from the actual (parent) device. No need to repeat it
in the driver.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/spi/spi-hisi-kunpeng.c | 1 -
 drivers/spi/spi-synquacer.c    | 3 ---
 2 files changed, 4 deletions(-)

diff --git a/drivers/spi/spi-hisi-kunpeng.c b/drivers/spi/spi-hisi-kunpeng.c
index dadf558dd9c0..afe51adcc507 100644
--- a/drivers/spi/spi-hisi-kunpeng.c
+++ b/drivers/spi/spi-hisi-kunpeng.c
@@ -497,7 +497,6 @@ static int hisi_spi_probe(struct platform_device *pdev)
 	host->cleanup = hisi_spi_cleanup;
 	host->transfer_one = hisi_spi_transfer_one;
 	host->handle_err = hisi_spi_handle_err;
-	host->dev.fwnode = dev->fwnode;
 	host->min_speed_hz = DIV_ROUND_UP(host->max_speed_hz, CLK_DIV_MAX);
 
 	hisi_spi_hw_init(hs);
diff --git a/drivers/spi/spi-synquacer.c b/drivers/spi/spi-synquacer.c
index eaf560487591..d0a875249910 100644
--- a/drivers/spi/spi-synquacer.c
+++ b/drivers/spi/spi-synquacer.c
@@ -600,7 +600,6 @@ static irqreturn_t sq_spi_tx_handler(int irq, void *priv)
 
 static int synquacer_spi_probe(struct platform_device *pdev)
 {
-	struct device_node *np = pdev->dev.of_node;
 	struct spi_controller *host;
 	struct synquacer_spi *sspi;
 	int ret;
@@ -699,8 +698,6 @@ static int synquacer_spi_probe(struct platform_device *pdev)
 		goto disable_clk;
 	}
 
-	host->dev.of_node = np;
-	host->dev.fwnode = pdev->dev.fwnode;
 	host->auto_runtime_pm = true;
 	host->bus_num = pdev->id;
 
-- 
2.50.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
