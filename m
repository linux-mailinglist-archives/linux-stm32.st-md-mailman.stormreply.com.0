Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AD41018618B
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Mar 2020 03:33:11 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 74FAEC36B0B;
	Mon, 16 Mar 2020 02:33:11 +0000 (UTC)
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 46B47C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Mar 2020 02:33:10 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id t24so8840718pgj.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 15 Mar 2020 19:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UOxHJj4HdQ88hqvaq4HbY/GpiedINXJyx4lWisWkp0c=;
 b=CEKGHAhjNx5OVWJ6pH6qnuCyJDP4H6nJmuCMA1rGBhvKab++FPyywXOWYZQIEjkvfX
 l5zkH83RqCkyGX3ALgRUtORxDk/eEq2uMefH7QwOWOPqcWDukZFnHV+ESaJqE2c176k9
 pL3+4a/k1vj/2jfuiqPtj+JQN17QrOTG9ptDxrvRTxZWRuzde+oYSbsNMQJYL0lRMPlF
 MDa9oM4iRszS161T7Y7Q86mGUJ+w2hZutedTIclbRr8pYSVy0MhZpb/C20YRttwh1fV1
 aHcEThV/TOfHsSnJZaEecxz0VT9RaWsOSMdWfCDyKvPac85CbNjJCBI0Y5yuVC8sJGzN
 fZjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UOxHJj4HdQ88hqvaq4HbY/GpiedINXJyx4lWisWkp0c=;
 b=VuPF8In6WX0DIwT4rhh+TxtOjFy8P9G4f7iyZu+dTrCAXWGSXEuLZoRYhGKLfOPzh8
 z0MYB0WewWCTmJ2OLXcwDABvDQwr/LNPa5J9Bs94kA94ZVS4QeR1OhcleQmtP3HSEz8p
 6sPzdPY0AnIhF6LeJyqxluHT92Vg9dZqAG4Cdna7JYROEwShntXtbWzAgcgf2C/zdri9
 K3/AWYPk+kLfyHqZh1bFd4B71IOvKUctpb+2DPtYEAlFfcAfRrtHSOw4lJa95EFfFAK7
 5q28AogkRTqf2bPY+h+6sZtUd/IpOMkFh8B6gO9P4tIn8XjurPM5UbwX/U91AP38YLjB
 SPgg==
X-Gm-Message-State: ANhLgQ2WCaukxULlbeykTIlFRKQjfQo8rpoZh+UXpEp65iNvEL/leesi
 DqoebT0Z3RgBm6jud8OMz2g=
X-Google-Smtp-Source: ADFU+vvjAcrdfpaC4Q9vMkz/EG7skwYb7zOD0ZKqUax3cK1CE/FEMScMnyrZrKrtsDbyLMmpSNvtqQ==
X-Received: by 2002:a63:ba5d:: with SMTP id l29mr4428057pgu.67.1584325988849; 
 Sun, 15 Mar 2020 19:33:08 -0700 (PDT)
Received: from localhost (216.24.188.11.16clouds.com. [216.24.188.11])
 by smtp.gmail.com with ESMTPSA id w188sm2510059pfb.198.2020.03.15.19.33.07
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 15 Mar 2020 19:33:08 -0700 (PDT)
From: Dejin Zheng <zhengdejin5@gmail.com>
To: peppe.cavallaro@st.com, alexandre.torgue@st.com, joabreu@synopsys.com,
 davem@davemloft.net, mcoquelin.stm32@gmail.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, andrew@lunn.ch
Date: Mon, 16 Mar 2020 10:32:54 +0800
Message-Id: <20200316023254.13201-3-zhengdejin5@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200316023254.13201-1-zhengdejin5@gmail.com>
References: <20200316023254.13201-1-zhengdejin5@gmail.com>
MIME-Version: 1.0
Cc: Dejin Zheng <zhengdejin5@gmail.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v3 2/2] net: stmmac: use
	readl_poll_timeout() function in dwmac4_dma_reset()
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
v2 -> v3:
	- return whatever error code by readl_poll_timeout() returned.
v1 -> v2:
	- no changed.

 drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c
index 9becca280074..6e30d7eb4983 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/delay.h>
 #include "common.h"
 #include "dwmac4_dma.h"
@@ -14,22 +15,14 @@
 int dwmac4_dma_reset(void __iomem *ioaddr)
 {
 	u32 value = readl(ioaddr + DMA_BUS_MODE);
-	int limit;
 
 	/* DMA SW reset */
 	value |= DMA_BUS_MODE_SFT_RESET;
 	writel(value, ioaddr + DMA_BUS_MODE);
-	limit = 10;
-	while (limit--) {
-		if (!(readl(ioaddr + DMA_BUS_MODE) & DMA_BUS_MODE_SFT_RESET))
-			break;
-		mdelay(10);
-	}
-
-	if (limit < 0)
-		return -EBUSY;
 
-	return 0;
+	return readl_poll_timeout(ioaddr + DMA_BUS_MODE, value,
+				 !(value & DMA_BUS_MODE_SFT_RESET),
+				 10000, 100000);
 }
 
 void dwmac4_set_rx_tail_ptr(void __iomem *ioaddr, u32 tail_ptr, u32 chan)
-- 
2.25.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
