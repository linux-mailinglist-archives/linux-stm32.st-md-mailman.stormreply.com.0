Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6C6154603
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Feb 2020 15:24:37 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1B634C36B0B;
	Thu,  6 Feb 2020 14:24:37 +0000 (UTC)
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0D2FBC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Feb 2020 14:24:34 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id j9so3198373pfa.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 06 Feb 2020 06:24:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2k1+BmAg/PACALQSiYk+3lsPVNBiCnjdKk4ZEAWEMAo=;
 b=D/EBBAtUCOsUg+i5bc2KUgV/GljhCwwCEpfUQIBNM6QpF/qcvleiiWUPzWuhRHg8vI
 mDk35foTgP7jqdshD7/iiIlVKlV2x7GldZeLGYzETC2/QlYsZUOna04O9EwJaZrng0M9
 hC2lth/uBHlK0Kg47gN2csh+tnTUb3bYoIJm2kriip+fzAyCn2vigf4DFqe9hV1sRi9e
 Od17WHXkwoXftisbxh/kTJRQLidKXb/tewXkYnYDAdzzPLBJFMOKDFNkWbPuIE0LlILx
 dbnOF4b2+CIsfQhgW8mhX1W+t4KNDy9nv+BTOkn953zm+roBm1fpl17o2yF+riu8Yl1c
 oyJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2k1+BmAg/PACALQSiYk+3lsPVNBiCnjdKk4ZEAWEMAo=;
 b=LQuGPWL66Ha0JmcMdI5eDojpGJoDup+oJnL2qZ8p0MGeAbkNL6m3ybFk3j4elZlubW
 SjYMmqDlqhoht6nOpScjrwvSZr8Er3x5l2FmNocZyKDBSrTjRo/A32tDUECFDmilDTDB
 PTwmmoFOF3NYa07pTCSDHk8aRcWpOUDJNiePkTGTgenCOLSrvO9sqP39xG+q5GXqq75W
 2DpIiVc0OPDnPtTK1D9rsNyqureFf3/JyKegFClmqmaa6S2KFoYaC7OMm0NPYzqhEMH3
 pe/UorrLvIw1UHxgS16hfDRZuWaUQ0Efw2v2buup7arkbiNOFLWRUMSGZwaz+qxRShgf
 elbw==
X-Gm-Message-State: APjAAAWCShtQTw8CpNjL/JGsYpRiSj2FAs8gBi894tYpreVy/xXhB3s8
 xvrZkROSGWPFfF7GYSKCI/M=
X-Google-Smtp-Source: APXvYqy6t80R5aju+KrOh4xsVYVlB/QZyNhzW81TIqyD1gUzeCv+aNGJ92Oc695aN7ezOXOQMcC/BA==
X-Received: by 2002:a63:ba19:: with SMTP id k25mr4089647pgf.333.1580999072575; 
 Thu, 06 Feb 2020 06:24:32 -0800 (PST)
Received: from localhost (104.128.80.227.16clouds.com. [104.128.80.227])
 by smtp.gmail.com with ESMTPSA id q12sm3595749pfh.158.2020.02.06.06.24.30
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 06 Feb 2020 06:24:31 -0800 (PST)
From: Dejin Zheng <zhengdejin5@gmail.com>
To: peppe.cavallaro@st.com, alexandre.torgue@st.com, joabreu@synopsys.com,
 davem@davemloft.net, mcoquelin.stm32@gmail.com, netdev@vger.kernel.org
Date: Thu,  6 Feb 2020 22:24:03 +0800
Message-Id: <20200206142404.24980-2-zhengdejin5@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200206142404.24980-1-zhengdejin5@gmail.com>
References: <20200206142404.24980-1-zhengdejin5@gmail.com>
MIME-Version: 1.0
Cc: Dejin Zheng <zhengdejin5@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 1/2] net: stmmac: use readl_poll_timeout()
	function in init_systime()
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

The init_systime() function use an open coded of readl_poll_timeout().
Replace the open coded handling with the proper function.

Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
---
 .../net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c  | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
index 020159622559..2a24e2a7db3b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
@@ -10,6 +10,7 @@
 *******************************************************************************/
 
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/delay.h>
 #include "common.h"
 #include "stmmac_ptp.h"
@@ -53,8 +54,8 @@ static void config_sub_second_increment(void __iomem *ioaddr,
 
 static int init_systime(void __iomem *ioaddr, u32 sec, u32 nsec)
 {
-	int limit;
 	u32 value;
+	int err;
 
 	writel(sec, ioaddr + PTP_STSUR);
 	writel(nsec, ioaddr + PTP_STNSUR);
@@ -64,13 +65,10 @@ static int init_systime(void __iomem *ioaddr, u32 sec, u32 nsec)
 	writel(value, ioaddr + PTP_TCR);
 
 	/* wait for present system time initialize to complete */
-	limit = 10;
-	while (limit--) {
-		if (!(readl(ioaddr + PTP_TCR) & PTP_TCR_TSINIT))
-			break;
-		mdelay(10);
-	}
-	if (limit < 0)
+	err = readl_poll_timeout(ioaddr + PTP_TCR, value,
+				 !(value & PTP_TCR_TSINIT),
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
