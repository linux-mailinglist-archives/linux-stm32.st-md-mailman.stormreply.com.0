Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B48C0886EAF
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Mar 2024 15:34:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 54537C6DD95;
	Fri, 22 Mar 2024 14:34:48 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 69030C6B45E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Mar 2024 14:34:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 304D8CE1729;
 Fri, 22 Mar 2024 14:34:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BB7FC43390;
 Fri, 22 Mar 2024 14:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711118083;
 bh=hlZVhqXG5tZdnG9IkzH2tQNrjKC3YWqFEQJmVE1j798=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=L9YIH9mHGzkuhZa5ZVgbm1uCmpXH/UdC5VoAAU2ZdmPoXXqtpJMpUbovXd3gDgO41
 CU2DUUw+SMa8RxrldgPU79Ss9iLOQN6UmBrNuMgrwYhLnrE/9pIW897R2ohFddMIXc
 fKAcsdytm6UayuPjZsV6voe6BUrX1bROQ4UC5NTMEIiFIp4Cdztw4DnZ0J1u/GaohG
 CdPO8YbPjtOS9u2k4iiFhrL81vXJ7YZxlQaIdf2NetJ3ZGrkO0LeJuDCMVwOrjUrRl
 LZee8y5F+DzlqtMhPwLn2YgOsuJFmKXvTh9GCAuztPZGuK4AA8IAS+C6YSkEmDZmew
 YKo4qspd4j+2A==
Date: Fri, 22 Mar 2024 09:34:35 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Message-ID: <zdgzj3oemsmlsqz2ctxb3ew6xkohiuew2e4djvxileiew66su5@3pjbsgqdbf3f>
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
 <20240322132619.6389-65-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Disposition: inline
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
 linux-i2c@vger.kernel.org, Guenter Roeck <groeck@chromium.org>,
 chrome-platform@lists.linux.dev, Fabio Estevam <festevam@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
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
 linux-mips@vger.kernel.org,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Fri, Mar 22, 2024 at 02:25:57PM +0100, Wolfram Sang wrote:
> Match the wording in i2c_algorithm in I2C drivers wrt. the newest I2C
> v7, SMBus 3.2, I3C specifications and replace "master/slave" with more
> appropriate terms. For some drivers, this means no more conversions are
> needed. For the others more work needs to be done but this will be
> performed incrementally along with API changes/improvements. All these
> changes here are simple search/replace results.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
