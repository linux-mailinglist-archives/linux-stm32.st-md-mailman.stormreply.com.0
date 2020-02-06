Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB41154605
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Feb 2020 15:24:44 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 27B7EC36B0B;
	Thu,  6 Feb 2020 14:24:44 +0000 (UTC)
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 167C8C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Feb 2020 14:24:42 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id j9so3198550pfa.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 06 Feb 2020 06:24:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wQjSqjPnCsGymzsifLNmUAkPPkBxHXDH/G5MVJ/Zpj4=;
 b=kSGiazQopCo0sSM9TFubaUcSJ9VVWKx13crgeyVQCTvzSjYif/Wb8scZXxOpvzP3R8
 5lMbn0lWbpXhTYcfPDnCMO1jWlHa1cBXW0/UCYvX51l+0XuXRq3A2hv8Z+zLQa6CRoPf
 ElPVZGAAZyez6DheqHu+MOderzBYHe6YQ1utfO/z+J3KZKUK53ogL8WEnBScEOoCzyNE
 dTPoTD/etB51NoXMilmYL09pmcWdqOgUzOhFveK0FQeTwsWo7grckVxpMc9xc8UIk302
 ITl4W1Jy+9/xq9kT7tqRM/KZJ7cpr5D5gOOqNMJTUiW5tGXSUYKX79iNjHIj8t7f5ewX
 mkfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wQjSqjPnCsGymzsifLNmUAkPPkBxHXDH/G5MVJ/Zpj4=;
 b=PdVJCvZqkGX6Ni6b+GFmTbAMSrKYzTPCqilTvPSOjHA2jlCDHI19PakblJSF8DUUT2
 8Q1jNcSwvKRiYrqWVEZzUu8BP/jLf71fegj2zC7ZojtNJfmt+iQoaFAVXjQaOBSa/Stb
 QcXKl8FcuLV23VsJlQSRk2O1Y8K4Z34GAVJuJ2Qk7M/R0HwemcA6uGzldaXX9MEYRP1S
 gVqkbSGHlMFrKFWgX+2gQKPmMGm75ITHPOClsB8KY7MufFHFGhqV6o+aBdmSjlJcaL1i
 5zsIV/8ETHfIuipvoG61Bcow7Vj1izHuwkSPXplntL4L21NZZB+d0oTXkSuKDynHoGL2
 1GPw==
X-Gm-Message-State: APjAAAXJTTgfcZwM+zjE8piUFmRfwlaYCniGnfCxiA4makPQbLQaUumT
 THjl66ao3R5bwLEmmNvV1hI=
X-Google-Smtp-Source: APXvYqxIpANX4/2P10i3M0tJgchopDXvDHoETQqvb5iNVXRpjk0EH55o246IT+xkuYsVLXZtkB+X+A==
X-Received: by 2002:a63:5157:: with SMTP id r23mr3723390pgl.81.1580999080676; 
 Thu, 06 Feb 2020 06:24:40 -0800 (PST)
Received: from localhost (104.128.80.227.16clouds.com. [104.128.80.227])
 by smtp.gmail.com with ESMTPSA id m101sm3416844pje.13.2020.02.06.06.24.39
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 06 Feb 2020 06:24:40 -0800 (PST)
From: Dejin Zheng <zhengdejin5@gmail.com>
To: peppe.cavallaro@st.com, alexandre.torgue@st.com, joabreu@synopsys.com,
 davem@davemloft.net, mcoquelin.stm32@gmail.com, netdev@vger.kernel.org
Date: Thu,  6 Feb 2020 22:24:04 +0800
Message-Id: <20200206142404.24980-3-zhengdejin5@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200206142404.24980-1-zhengdejin5@gmail.com>
References: <20200206142404.24980-1-zhengdejin5@gmail.com>
MIME-Version: 1.0
Cc: Dejin Zheng <zhengdejin5@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 2/2] net: stmmac: use readl_poll_timeout()
	function in dwmac4_dma_reset()
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

The dwmac4_dma_reset() function use an open coded of readl_poll_timeout().
Replace the open coded handling with the proper function.

Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c
index f2a29a90e085..6b911e360e27 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/delay.h>
 #include "common.h"
 #include "dwmac4_dma.h"
@@ -14,19 +15,16 @@
 int dwmac4_dma_reset(void __iomem *ioaddr)
 {
 	u32 value = readl(ioaddr + DMA_BUS_MODE);
-	int limit;
+	int err;
 
 	/* DMA SW reset */
 	value |= DMA_BUS_MODE_SFT_RESET;
 	writel(value, ioaddr + DMA_BUS_MODE);
-	limit = 10;
-	while (limit--) {
-		if (!(readl(ioaddr + DMA_BUS_MODE) & DMA_BUS_MODE_SFT_RESET))
-			break;
-		mdelay(10);
-	}
 
-	if (limit < 0)
+	err = readl_poll_timeout(ioaddr + DMA_BUS_MODE, value,
+				 !(value & DMA_BUS_MODE_SFT_RESET),
+				 10000, 100000);
+	if (err)
 		return -EBUSY;
 
 	return 0;
-- 
2.25.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
