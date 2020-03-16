Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E4318618A
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Mar 2020 03:33:08 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 69D28C36B0B;
	Mon, 16 Mar 2020 02:33:08 +0000 (UTC)
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 60BB6C36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Mar 2020 02:33:05 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id x2so8708416pfn.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 15 Mar 2020 19:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xb6eGJlkZ3RraRHjQRFPyKktg2A5qqYgiyd1407X5EA=;
 b=Pohao3v5ffnYH82Bpcrje8LKI2euQ7YrSlftyPJ4Jc8Ec8NGvKWcpvmRoeKHikOb3r
 837gsq8lUXizljokzz8H5PbW+/TMjuq5HHwLgIX9GMuTOAdR/bSTcNds2bavWHp3xtpn
 Z6Alq41OV466QZ0ADWh0RCa9Nmw+00oHWfTiktPK/HxXYCe87p8hGVoInDwkiqoRul9q
 ztYtexo7kVkl10voUg3TbX6aUdZXncEGICG/ETcp2Uo4UAOP1MCM9xTymmbVdwvj07ns
 x/d7VCj7LY8DKxVUDClu2udaKd7lVnY+dTSNUKrxFswTxdPFU61qjwu5kf1FiwKL1gKH
 vOaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xb6eGJlkZ3RraRHjQRFPyKktg2A5qqYgiyd1407X5EA=;
 b=FPJUC9I0Glz5S5ysUWoyEvfQVnoAmnqQ3AIEai+40A7Gxn/FstH31AjXNrNf5L6Aty
 x29x8x1lsRSICOYVNupz043blzA0SXMTWyv+jo9UT+iwgS/XU9ovMhukIQ52ES+1xDCh
 Vp9a0btluIV4fBhcb16J3xt6vDojU0Yir8cZvbY3xLI/Cw6xt7m9C29XuM16Doh7iFpA
 Xqy1jXFzrhSqLD55H67S4ZOksVbZ0imTsSuY8FJ3NyZW6JzEXY3DbglltlND03TzShJu
 mjevn9RaLxeJ2Qc47n4JFDaJhJIFrDMbv+AXQZVvTS77g2ZuMxghqQntXDlbcrEc7f8y
 7YIQ==
X-Gm-Message-State: ANhLgQ3XmwWyISy9JQRtrA6DoU5gYyuz23mdBjh37lYg6PoSqoauSLtb
 ilhaRogaYvCuRhmHBbLRhxM=
X-Google-Smtp-Source: ADFU+vsxw9h2MVwPsE6eZQTxRHk3CCZ6ymGRtR278/lnLeTe6Ya8bd+1lmtqV6ceAlKNVHLfVDeY6w==
X-Received: by 2002:aa7:9307:: with SMTP id 7mr22826246pfj.273.1584325983934; 
 Sun, 15 Mar 2020 19:33:03 -0700 (PDT)
Received: from localhost (216.24.188.11.16clouds.com. [216.24.188.11])
 by smtp.gmail.com with ESMTPSA id f19sm54950752pgf.33.2020.03.15.19.33.03
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 15 Mar 2020 19:33:03 -0700 (PDT)
From: Dejin Zheng <zhengdejin5@gmail.com>
To: peppe.cavallaro@st.com, alexandre.torgue@st.com, joabreu@synopsys.com,
 davem@davemloft.net, mcoquelin.stm32@gmail.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, andrew@lunn.ch
Date: Mon, 16 Mar 2020 10:32:53 +0800
Message-Id: <20200316023254.13201-2-zhengdejin5@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200316023254.13201-1-zhengdejin5@gmail.com>
References: <20200316023254.13201-1-zhengdejin5@gmail.com>
MIME-Version: 1.0
Cc: Dejin Zheng <zhengdejin5@gmail.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v3 1/2] net: stmmac: use
	readl_poll_timeout() function in init_systime()
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
v2 -> v3:
	- return whatever error code by readl_poll_timeout() returned.
v1 -> v2:
	- no changed.

 .../net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
index 020159622559..fcf080243a0f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
@@ -10,6 +10,7 @@
 *******************************************************************************/
 
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/delay.h>
 #include "common.h"
 #include "stmmac_ptp.h"
@@ -53,7 +54,6 @@ static void config_sub_second_increment(void __iomem *ioaddr,
 
 static int init_systime(void __iomem *ioaddr, u32 sec, u32 nsec)
 {
-	int limit;
 	u32 value;
 
 	writel(sec, ioaddr + PTP_STSUR);
@@ -64,16 +64,9 @@ static int init_systime(void __iomem *ioaddr, u32 sec, u32 nsec)
 	writel(value, ioaddr + PTP_TCR);
 
 	/* wait for present system time initialize to complete */
-	limit = 10;
-	while (limit--) {
-		if (!(readl(ioaddr + PTP_TCR) & PTP_TCR_TSINIT))
-			break;
-		mdelay(10);
-	}
-	if (limit < 0)
-		return -EBUSY;
-
-	return 0;
+	return readl_poll_timeout(ioaddr + PTP_TCR, value,
+				 !(value & PTP_TCR_TSINIT),
+				 10000, 100000);
 }
 
 static int config_addend(void __iomem *ioaddr, u32 addend)
-- 
2.25.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
