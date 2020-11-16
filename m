Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DFED72B4E75
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Nov 2020 18:51:49 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AD002C3FAD7;
	Mon, 16 Nov 2020 17:51:49 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 27BB3C3FAD7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Nov 2020 17:51:47 +0000 (UTC)
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch
 [84.226.167.205])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7DF3D206D9;
 Mon, 16 Nov 2020 17:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605549105;
 bh=01bBWQt5m1BIflz7aF7nD81bGfvALRAb9nF6NGbIkcU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=U2UW4VXWuTDtBuFpoj1xY+LVIZTNLSkksUJ1l2FtrLmYrgVqUb2At42olz/GaNfpx
 5nOw8xiTubsQUOsqncgjLFzyGIs43D/4A2ivwhvOpaAVwur+ZNLmXSCexvhN4RAjlo
 xIns/j1qFCUCWQ3EZl2cyuAZenpc1ZZnEvWyWO7M=
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
Date: Mon, 16 Nov 2020 18:51:31 +0100
Message-Id: <20201116175133.402553-2-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201116175133.402553-1-krzk@kernel.org>
References: <20201116175133.402553-1-krzk@kernel.org>
MIME-Version: 1.0
Cc: kernel test robot <lkp@intel.com>, Krzysztof Kozlowski <krzk@kernel.org>
Subject: [Linux-stm32] [PATCH 2/4] ASoC: sh: depend on COMMON_CLK to fix
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

The SH4 FSI sound drivers use SuperH clocks thus they cannot be built on
platforms without proper clock support (e.g. compile test on MIPS with
RALINK and SOC_RT305X):

    /usr/bin/mips-linux-gnu-ld: sound/soc/sh/fsi.o: in function `fsi_clk_set_rate_external':
    fsi.c:(.text+0x2714): undefined reference to `clk_set_parent'

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 sound/soc/sh/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sh/Kconfig b/sound/soc/sh/Kconfig
index ef8a29b9f641..346c806ba390 100644
--- a/sound/soc/sh/Kconfig
+++ b/sound/soc/sh/Kconfig
@@ -23,6 +23,7 @@ config SND_SOC_SH4_SSI
 
 config SND_SOC_SH4_FSI
 	tristate "SH4 FSI support"
+	depends on SUPERH || COMMON_CLK
 	select SND_SIMPLE_CARD
 	help
 	  This option enables FSI sound support
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
