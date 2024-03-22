Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC05886F93
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Mar 2024 16:13:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A121AC6DD95;
	Fri, 22 Mar 2024 15:13:25 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 16574C6B45E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Mar 2024 15:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1711120404; x=1742656404;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=F50EgZ2lJjv6pHduFkF5MM5IKGV69nz1KM4YNtLhMAs=;
 b=12ucSHZ+DqEPx0lk8fCAj40jl3zRhbjJ0fvp1MB63a672iXu4iq57o6C
 p315xXPdsnXT3/zkDJcQRCmgBzKy0wK/0tG3ADvpa8qjg2X5oIAsJYEQW
 MK0R/53b/+PNtv4MzYvmmv3rADXN6SdH1QZhNui8gOl0YZ7WFcrbwm0rc
 nSZ31t4gAakxyAkrx+O9QYwnkJYWotG4BfnUNiyDqlrj4Gi40y9uNTcxD
 9868sWV9qF9xWUb4S6ZlOyqfnuwetorZOutY9bS21Sqalb9qWWKb9DHM3
 YjXt2cPHn0Ub+t1MysUKSJRbmn/h7de2CEHDIUWxnX3M/EANxxzzAwtM5 g==;
X-CSE-ConnectionGUID: X1l3K2T7QvGR7YYL+xW82w==
X-CSE-MsgGUID: FtnGXb0RSl6ESGuAQ94UKg==
X-IronPort-AV: E=Sophos;i="6.07,146,1708412400"; d="scan'208";a="185306479"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Mar 2024 08:13:19 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 22 Mar 2024 08:13:07 -0700
Received: from [10.159.245.205] (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 22 Mar 2024 08:12:51 -0700
Message-ID: <e8dff9d4-ed15-44e9-ae9a-2e77845ec40b@microchip.com>
Date: Fri, 22 Mar 2024 16:11:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, fr-FR
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 <linux-i2c@vger.kernel.org>
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
 <20240322132619.6389-65-wsa+renesas@sang-engineering.com>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
In-Reply-To: <20240322132619.6389-65-wsa+renesas@sang-engineering.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Shyam Sundar S K <shyam-sundar.s-k@amd.com>,
 Tomer Maimon <tmaimon77@gmail.com>, Ajay Gupta <ajayg@nvidia.com>,
 Viresh Kumar <viresh.kumar@linaro.org>, Linus
 Walleij <linus.walleij@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Dmitry Osipenko <digetx@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Jerome Brunet <jbrunet@baylibre.com>, linux-samsung-soc@vger.kernel.org,
 Robert Foss <rfoss@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Michael Ellerman <mpe@ellerman.id.au>, Khalil Blaiech <kblaiech@nvidia.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Oleksij
 Rempel <o.rempel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>,
 Nicholas Piggin <npiggin@gmail.com>, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Yicong Yang <yangyicong@hisilicon.com>, Laxman Dewangan <ldewangan@nvidia.com>,
 Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev,
 Fabio Estevam <festevam@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 "Aneesh
 Kumar K.V" <aneesh.kumar@kernel.org>, Ryan Wanner <Ryan.Wanner@microchip.com>,
 Andi Shyti <andi.shyti@kernel.org>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org,
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
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Codrin
 Ciubotariu <codrin.ciubotariu@microchip.com>, Robert Richter <rric@kernel.org>,
 Asmaa Mnebhi <asmaa@nvidia.com>, Vladimir
 Zapolskiy <vz@mleia.com>, Conghui Chen <conghui.chen@intel.com>,
 Benson Leung <bleung@chromium.org>, Qii Wang <qii.wang@mediatek.com>,
 Avi Fishman <avifishman70@gmail.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jarkko Nikula <jarkko.nikula@linux.intel.com>, asahi@lists.linux.dev,
 Shawn Guo <shawnguo@kernel.org>, Vignesh R <vigneshr@ti.com>,
 Tony Lindgren <tony@atomide.com>, Tali Perry <tali.perry1@gmail.com>,
 Paul Cercueil <paul@crapouillou.net>, Jan Dabros <jsd@semihalf.com>,
 openbmc@lists.ozlabs.org, Janusz Krzysztofik <jmkrzyszt@gmail.com>,
 Sven Peter <sven@svenpeter.dev>, virtualization@lists.linux.dev,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Loic Poulain <loic.poulain@linaro.org>, Patrick Venture <venture@google.com>,
 Bjorn Andersson <andersson@kernel.org>, linux-mips@vger.kernel.org, Krzysztof
 Kozlowski <krzysztof.kozlowski@linaro.org>, linuxppc-dev@lists.ozlabs.org
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

On 22/03/2024 at 14:25, Wolfram Sang wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Match the wording in i2c_algorithm in I2C drivers wrt. the newest I2C
> v7, SMBus 3.2, I3C specifications and replace "master/slave" with more
> appropriate terms. For some drivers, this means no more conversions are
> needed. For the others more work needs to be done but this will be
> performed incrementally along with API changes/improvements. All these
> changes here are simple search/replace results.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---

[..]

>   drivers/i2c/busses/i2c-at91-master.c       |  2 +-
>   drivers/i2c/busses/i2c-at91-slave.c        |  8 ++++----

[..]

Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com> # for at91
Probably file names themselves will need some care, in a second time.

Thanks. Regards,
   Nicolas

[..]

> --
> 2.43.0
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
