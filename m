Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8A3889453
	for <lists+linux-stm32@lfdr.de>; Mon, 25 Mar 2024 08:54:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 906BAC6B444;
	Mon, 25 Mar 2024 07:54:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4E824C6907A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Mar 2024 07:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711353247; x=1742889247;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=G9pVMPBkGeSCKm7GL4349gPmBncBHLw8Di6BWoQcag0=;
 b=Mc9Mh8omFeu+qkHM4/uuWotjT8DXxIfXZuFFgkqORLssjc+DXTxrSQxh
 hp2CclwPAIuKpV9d6Q7pXS6v1XN/pLxjbIjEbDUJsN82HlihVTTxNpfDI
 Q+9WX6uEo35dj2YgDfnV4aytx1lSgtmkd3ZbvEEz8+qXyNN4WNDpUBs9V
 LRSOUtquQx/I/yn5J+xESCx98tDEF2NyV9zKvDNBxQg6SsOnaQLxVaq6R
 WlKK3KC6MMjggEGsg+Wjes0MQh1uOWAh09U8e9FoXpSiq8/qik7HzoHvO
 d7RDGkfxr+O+E+e+zGjBIpERTLifT3T96Infjh6P2Ftdiqaz3iV3O5ddT g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="6199185"
X-IronPort-AV: E=Sophos;i="6.07,152,1708416000"; 
   d="scan'208";a="6199185"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 00:54:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,152,1708416000"; d="scan'208";a="16197266"
Received: from marquiz-s-2.fi.intel.com (HELO [10.237.72.58]) ([10.237.72.58])
 by orviesa008.jf.intel.com with ESMTP; 25 Mar 2024 00:53:46 -0700
Message-ID: <1f1e59a4-359e-4679-8ea9-3d915a930e91@linux.intel.com>
Date: Mon, 25 Mar 2024 09:53:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
 <20240322132619.6389-65-wsa+renesas@sang-engineering.com>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20240322132619.6389-65-wsa+renesas@sang-engineering.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Shyam Sundar S K <shyam-sundar.s-k@amd.com>,
 Tomer Maimon <tmaimon77@gmail.com>, Ajay Gupta <ajayg@nvidia.com>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Dmitry Osipenko <digetx@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 linux-samsung-soc@vger.kernel.org, Robert Foss <rfoss@kernel.org>,
 Aaro Koskinen <aaro.koskinen@iki.fi>, Michael Ellerman <mpe@ellerman.id.au>,
 Khalil Blaiech <kblaiech@nvidia.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Nicholas Piggin <npiggin@gmail.com>,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Yicong Yang <yangyicong@hisilicon.com>, Laxman Dewangan <ldewangan@nvidia.com>,
 Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev,
 Fabio Estevam <festevam@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Nick Hawkins <nick.hawkins@hpe.com>, linux-amlogic@lists.infradead.org,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, Hector Martin <marcan@marcan.st>,
 linux-renesas-soc@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-mediatek@lists.infradead.org,
 imx@lists.linux.dev, Jean-Marie Verdun <verdun@hpe.com>,
 linux-tegra@vger.kernel.org, Elie Morisse <syniurge@gmail.com>,
 Krzysztof Adamski <krzysztof.adamski@nokia.com>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Peter Korsgaard <peter@korsgaard.com>, Benjamin Fair <benjaminfair@google.com>,
 Michal Simek <michal.simek@amd.com>, Nancy Yuen <yuenn@google.com>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 Robert Richter <rric@kernel.org>, Asmaa Mnebhi <asmaa@nvidia.com>,
 Vladimir Zapolskiy <vz@mleia.com>, Conghui Chen <conghui.chen@intel.com>,
 Benson Leung <bleung@chromium.org>, Qii Wang <qii.wang@mediatek.com>,
 Avi Fishman <avifishman70@gmail.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, asahi@lists.linux.dev,
 Shawn Guo <shawnguo@kernel.org>, Vignesh R <vigneshr@ti.com>,
 Tony Lindgren <tony@atomide.com>, Tali Perry <tali.perry1@gmail.com>,
 Paul Cercueil <paul@crapouillou.net>, Jan Dabros <jsd@semihalf.com>,
 openbmc@lists.ozlabs.org, Janusz Krzysztofik <jmkrzyszt@gmail.com>,
 Sven Peter <sven@svenpeter.dev>, virtualization@lists.linux.dev,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Loic Poulain <loic.poulain@linaro.org>, Patrick Venture <venture@google.com>,
 Bjorn Andersson <andersson@kernel.org>, linux-mips@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [Linux-stm32] [PATCH 64/64] i2c: reword i2c_algorithm in
 drivers according to newest specification
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 3/22/24 3:25 PM, Wolfram Sang wrote:
> Match the wording in i2c_algorithm in I2C drivers wrt. the newest I2C
> v7, SMBus 3.2, I3C specifications and replace "master/slave" with more
> appropriate terms. For some drivers, this means no more conversions are
> needed. For the others more work needs to be done but this will be
> performed incrementally along with API changes/improvements. All these
> changes here are simple search/replace results.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>   drivers/i2c/busses/i2c-amd-mp2-plat.c      |  2 +-
>   drivers/i2c/busses/i2c-at91-master.c       |  2 +-
>   drivers/i2c/busses/i2c-at91-slave.c        |  8 ++++----
>   drivers/i2c/busses/i2c-axxia.c             | 10 +++++-----
>   drivers/i2c/busses/i2c-cros-ec-tunnel.c    |  2 +-
>   drivers/i2c/busses/i2c-designware-master.c |  2 +-
>   drivers/i2c/busses/i2c-designware-slave.c  |  8 ++++----
>   drivers/i2c/busses/i2c-diolan-u2c.c        |  2 +-
>   drivers/i2c/busses/i2c-exynos5.c           |  4 ++--
>   drivers/i2c/busses/i2c-gxp.c               | 12 ++++++------
>   drivers/i2c/busses/i2c-hisi.c              |  4 ++--
>   drivers/i2c/busses/i2c-img-scb.c           |  2 +-
>   drivers/i2c/busses/i2c-imx.c               | 12 ++++++------
>   drivers/i2c/busses/i2c-jz4780.c            |  2 +-
>   drivers/i2c/busses/i2c-kempld.c            |  2 +-
>   drivers/i2c/busses/i2c-meson.c             |  4 ++--
>   drivers/i2c/busses/i2c-mlxbf.c             |  8 ++++----
>   drivers/i2c/busses/i2c-mt65xx.c            |  2 +-
>   drivers/i2c/busses/i2c-mxs.c               |  2 +-
>   drivers/i2c/busses/i2c-nomadik.c           |  2 +-
>   drivers/i2c/busses/i2c-npcm7xx.c           | 12 ++++++------
>   drivers/i2c/busses/i2c-nvidia-gpu.c        |  4 ++--
>   drivers/i2c/busses/i2c-ocores.c            |  8 ++++----
>   drivers/i2c/busses/i2c-octeon-platdrv.c    |  2 +-
>   drivers/i2c/busses/i2c-omap.c              |  4 ++--
>   drivers/i2c/busses/i2c-opal.c              |  4 ++--
>   drivers/i2c/busses/i2c-pasemi-core.c       |  2 +-
>   drivers/i2c/busses/i2c-pnx.c               |  2 +-
>   drivers/i2c/busses/i2c-pxa.c               | 12 ++++++------
>   drivers/i2c/busses/i2c-qcom-cci.c          |  2 +-
>   drivers/i2c/busses/i2c-qcom-geni.c         |  2 +-
>   drivers/i2c/busses/i2c-robotfuzz-osif.c    |  2 +-
>   drivers/i2c/busses/i2c-rzv2m.c             |  8 ++++----
>   drivers/i2c/busses/i2c-s3c2410.c           |  4 ++--
>   drivers/i2c/busses/i2c-stm32f7.c           | 14 +++++++-------
>   drivers/i2c/busses/i2c-tegra-bpmp.c        |  4 ++--
>   drivers/i2c/busses/i2c-tegra.c             |  4 ++--
>   drivers/i2c/busses/i2c-thunderx-pcidrv.c   |  2 +-
>   drivers/i2c/busses/i2c-virtio.c            |  2 +-
>   drivers/i2c/busses/i2c-wmt.c               |  2 +-
>   drivers/i2c/busses/i2c-xiic.c              |  2 +-
>   41 files changed, 95 insertions(+), 95 deletions(-)
> 

> diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
> index c7e56002809a..14c61b31f877 100644
> --- a/drivers/i2c/busses/i2c-designware-master.c
> +++ b/drivers/i2c/busses/i2c-designware-master.c
> @@ -832,7 +832,7 @@ i2c_dw_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
>   }
>   
>   static const struct i2c_algorithm i2c_dw_algo = {
> -	.master_xfer = i2c_dw_xfer,
> +	.xfer = i2c_dw_xfer,
>   	.functionality = i2c_dw_func,
>   };
>   
> diff --git a/drivers/i2c/busses/i2c-designware-slave.c b/drivers/i2c/busses/i2c-designware-slave.c
> index 2e079cf20bb5..b47ad6b16814 100644
> --- a/drivers/i2c/busses/i2c-designware-slave.c
> +++ b/drivers/i2c/busses/i2c-designware-slave.c
> @@ -58,7 +58,7 @@ static int i2c_dw_init_slave(struct dw_i2c_dev *dev)
>   	return 0;
>   }
>   
> -static int i2c_dw_reg_slave(struct i2c_client *slave)
> +static int i2c_dw_reg_target(struct i2c_client *slave)
>   {
>   	struct dw_i2c_dev *dev = i2c_get_adapdata(slave->adapter);
>   
> @@ -83,7 +83,7 @@ static int i2c_dw_reg_slave(struct i2c_client *slave)
>   	return 0;
>   }
>   
> -static int i2c_dw_unreg_slave(struct i2c_client *slave)
> +static int i2c_dw_unreg_target(struct i2c_client *slave)
>   {
>   	struct dw_i2c_dev *dev = i2c_get_adapdata(slave->adapter);
>   
> @@ -214,8 +214,8 @@ static irqreturn_t i2c_dw_isr_slave(int this_irq, void *dev_id)
>   
>   static const struct i2c_algorithm i2c_dw_algo = {
>   	.functionality = i2c_dw_func,
> -	.reg_slave = i2c_dw_reg_slave,
> -	.unreg_slave = i2c_dw_unreg_slave,
> +	.reg_target = i2c_dw_reg_target,
> +	.unreg_target = i2c_dw_unreg_target,
>   };

Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
