Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4BB185DBC
	for <lists+linux-stm32@lfdr.de>; Sun, 15 Mar 2020 16:03:19 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 40E7BC36B0B;
	Sun, 15 Mar 2020 15:03:19 +0000 (UTC)
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8C12FC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 15 Mar 2020 15:03:17 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id t3so6672450plz.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 15 Mar 2020 08:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Akk5s7VpQ8EMc3QKWawmMJ2LR47WbqMiE93Yj41PNp4=;
 b=EXVKyar0oLMU5KHLP0/MgDHqO3OiUnDESNs5UJzJ9S7k4L+/ZVkySEuCx/dQsAJgjn
 q55m/TgfP+pwRhJyzcVffNuDndrcKrBLJkDgIRjck9pG3QXOAiuPj1CLQJB/t4YABVtf
 Mdp06gQ2T9rjOyUBBPJiY3vW+kKqe5xGnZI9/RYwaozLNgskqApBbDCe3ur3lkxGDCQJ
 8xyK0OQhgRK+hB4pcClarUopyNQ3SVqU1x6Yl2Y/iYmbUI7XlD8j56JpwBgYZit8F833
 xMFCP3mi2p1jXS+LV9IWS8pEQcfFSgj5eVHp+4iZJTfPGqd9gfD4PMGCwe57khOZFYeU
 GADQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Akk5s7VpQ8EMc3QKWawmMJ2LR47WbqMiE93Yj41PNp4=;
 b=Idv/Oh+bVm2x8pU9sm9glwYo75sTm7E+D+ISHPdM1OEoAI6L2/f6bi6QyJg0oeSvEC
 /4C6U3Y5gtUdqBe8JrUTFV/2/g2woZkCkA/vVPBDJhNYxOdLwGIeyDpPZPF1Z9SVtnw0
 ZRZi2vEDBbRV0HP1dBe+TA9kJZJW17+r5SSVt32Z/xURb4kGU1hBnSHLO7QpUGlW5Osd
 o7YdJTRjKGdafnuhSmrKdRyY8j74C/hjbAjy7wlk8U7naV/vGIWWgiT6AKEDEs/I5i1j
 A6YZPWnalxmvo77EENYvldSSXl6CCQf/RGWXscaSaubdWhy0DKP7kuHMtUlrs7jo2aqa
 HOxQ==
X-Gm-Message-State: ANhLgQ36uzv4BkbqW7g/3HAab6W4JD74W9SZPaAVW9/i3x2ptkBx1/bL
 hwj4fzSBDKhlQ9RmbweqS6Y=
X-Google-Smtp-Source: ADFU+vuRkV82PozUwcHEZyF4En2HI40Sx1yE+v/Qbqok6rp0jWAkSiIAPTyMe9knTgb7aSiGk0Ofbw==
X-Received: by 2002:a17:90a:d80b:: with SMTP id
 a11mr20775016pjv.21.1584284596078; 
 Sun, 15 Mar 2020 08:03:16 -0700 (PDT)
Received: from localhost (216.24.188.11.16clouds.com. [216.24.188.11])
 by smtp.gmail.com with ESMTPSA id j21sm16849584pji.13.2020.03.15.08.03.15
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 15 Mar 2020 08:03:15 -0700 (PDT)
From: Dejin Zheng <zhengdejin5@gmail.com>
To: peppe.cavallaro@st.com, alexandre.torgue@st.com, joabreu@synopsys.com,
 davem@davemloft.net, mcoquelin.stm32@gmail.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Date: Sun, 15 Mar 2020 23:03:01 +0800
Message-Id: <20200315150301.32129-3-zhengdejin5@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200315150301.32129-1-zhengdejin5@gmail.com>
References: <20200315150301.32129-1-zhengdejin5@gmail.com>
MIME-Version: 1.0
Cc: Dejin Zheng <zhengdejin5@gmail.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 2/2] net: stmmac: use
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
v1 -> v2:
	- no changed.

 drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c
index 9becca280074..af68ef952cd6 100644
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
