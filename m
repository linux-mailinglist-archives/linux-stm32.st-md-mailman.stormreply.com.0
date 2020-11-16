Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D16652B4E77
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Nov 2020 18:51:57 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9F8A9C3FAD7;
	Mon, 16 Nov 2020 17:51:57 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D93C7C36B25
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Nov 2020 17:51:54 +0000 (UTC)
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch
 [84.226.167.205])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 300F820B80;
 Mon, 16 Nov 2020 17:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605549113;
 bh=eEsYH55eH+FauXTIeKvQAw4mnoGY2nOsaUiqsTf/7WQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ilLlQscxULowt4Lmlymi7n8TbrOjii1m9ZEPk6XgeI7cDozEVjFUbCO/t7yxdIQtv
 PbKmDIJE0fSsLticdAx3N74gXSbLw3U77x8yrKf/PMn9hQyRP+eG+uFFpq+jQT83PY
 Bxckzm+EH04bt+SaoLDQmmBZIAA//eY4lludgWcs=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Olivier Moysan <olivier.moysan@st.com>,
 Arnaud Pouliquen <arnaud.pouliquen@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Date: Mon, 16 Nov 2020 18:51:33 +0100
Message-Id: <20201116175133.402553-4-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201116175133.402553-1-krzk@kernel.org>
References: <20201116175133.402553-1-krzk@kernel.org>
MIME-Version: 1.0
Cc: kernel test robot <lkp@intel.com>, Krzysztof Kozlowski <krzk@kernel.org>
Subject: [Linux-stm32] [PATCH 4/4] ASoC: ti: depend on COMMON_CLK to fix
	compile tests
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

The TI/OMAP sound drivers use Common Clock Framework thus they cannot be
built on platforms without it (e.g. compile test on MIPS with RALINK and
SOC_RT305X):

    /usr/bin/mips-linux-gnu-ld: sound/soc/ti/davinci-mcasp.o:davinci-mcasp.c:(.text+0x1c64): more undefined references to `clk_set_parent' follow
    /usr/bin/mips-linux-gnu-ld: sound/soc/ti/omap-dmic.o: in function `omap_dmic_set_dai_sysclk':
    omap-dmic.c:(.text+0xa5c): undefined reference to `clk_get_parent'

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 sound/soc/ti/Kconfig | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/sound/soc/ti/Kconfig b/sound/soc/ti/Kconfig
index 9775393d46b6..698d7bc84dcf 100644
--- a/sound/soc/ti/Kconfig
+++ b/sound/soc/ti/Kconfig
@@ -26,6 +26,7 @@ config SND_SOC_DAVINCI_ASP
 
 config SND_SOC_DAVINCI_MCASP
 	tristate "Multichannel Audio Serial Port (McASP) support"
+	depends on COMMON_CLK
 	select SND_SOC_TI_EDMA_PCM
 	select SND_SOC_TI_SDMA_PCM
 	select SND_SOC_TI_UDMA_PCM
@@ -47,7 +48,7 @@ config SND_SOC_DAVINCI_VCIF
 
 config SND_SOC_OMAP_DMIC
 	tristate "Digital Microphone Module (DMIC) support"
-	depends on ARCH_OMAP4 || SOC_OMAP5 || COMPILE_TEST
+	depends on ARCH_OMAP4 || SOC_OMAP5 || COMPILE_TEST && COMMON_CLK
 	select SND_SOC_TI_SDMA_PCM
 	help
 	  Say Y or M here if you want to have support for DMIC IP found in
@@ -55,7 +56,7 @@ config SND_SOC_OMAP_DMIC
 
 config SND_SOC_OMAP_MCBSP
 	tristate "Multichannel Buffered Serial Port (McBSP) support"
-	depends on ARCH_OMAP || ARCH_OMAP1 || COMPILE_TEST
+	depends on ARCH_OMAP || ARCH_OMAP1 || COMPILE_TEST && COMMON_CLK
 	select SND_SOC_TI_SDMA_PCM
 	help
 	  Say Y or M here if you want to have support for McBSP IP found in
@@ -99,7 +100,7 @@ config SND_SOC_OMAP3_PANDORA
 
 config SND_SOC_OMAP3_TWL4030
 	tristate "SoC Audio support for OMAP3 based boards with twl4030 codec"
-	depends on ARCH_OMAP3 || COMPILE_TEST
+	depends on ARCH_OMAP3 || COMPILE_TEST && COMMON_CLK
 	depends on TWL4030_CORE
 	select SND_SOC_OMAP_MCBSP
 	select SND_SOC_TWL4030
@@ -221,7 +222,7 @@ config SND_SOC_DM365_VOICE_CODEC_MODULE
 
 config SND_SOC_J721E_EVM
 	tristate "SoC Audio support for j721e EVM"
-	depends on ARCH_K3 || COMPILE_TEST
+	depends on ARCH_K3 || COMPILE_TEST && COMMON_CLK
 	depends on I2C
 	select SND_SOC_PCM3168A_I2C
 	select SND_SOC_DAVINCI_MCASP
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
