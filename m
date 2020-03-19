Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E4D18B534
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Mar 2020 14:16:49 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F13FEC36B0B;
	Thu, 19 Mar 2020 13:16:48 +0000 (UTC)
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 929B3C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2020 13:16:47 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id x7so1263891pgh.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2020 06:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nqJw5vg4Nil/Y9pZjcpy6DTelU/teueaanPhC3c5U58=;
 b=T+cYXbZAHaDkG0GNHDjApa0wSTlshXtBKTVMP29hon48mbyn2rSVvYi8nKMBRhYv9j
 MaKesS8Pu3GoCeHrmfoHRCXKVwIARQ+N1VF8r9mMjrHKehag+deLDFwHqy1/FTUkY05S
 sVFv9NZdiGYRSgp05pOjM0JIVbyLu+ZxdRZxdviw9Je8WpmC/i2tyZNZz+Te2KvU9QW8
 kdwYoB2a2CEZcw/nAJpp1R7rHtdDIZKpe9p5irMpWk6Wzn/6LtM5AysvML1Dnh/9sa3O
 Kr6n9MBkKJjOY7RyLAJSwa7bpppLJSIOzc7Ly3KI+uiKWassksQrMsoh1gxvZTIgRr/o
 pY3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nqJw5vg4Nil/Y9pZjcpy6DTelU/teueaanPhC3c5U58=;
 b=W+vwttNBqdm/QnvYcny2VmtPTWCD1dnBShSpy4cZ5gHIqnZvxbff4GaFs/V1UqKn/t
 Cd4+d/xfZ/1naiZPdwWQ8bV9vlj0jrPRPp4tujh9xKl0U8dctTIj4JLYu9UYa4HP1O/U
 PC3ysND4e8SRrKFo3t0MkUEwJPGGNhIjWn/l+ceTvaDVaWvDdLkNjgJ/kAwpd7IxIpxc
 MXujUMPri4YMgquR7+k88GUIfIxQgNsb6JIP/gVt0yxEjs605oqIF2etV0QPiDUAcoZq
 7RhBVCTxjTSJrRFKB4UwP7zr59wD4bo6T8gFiYADcx7QMLbKSPvZkx11/C8U1iZwqVkR
 CHeQ==
X-Gm-Message-State: ANhLgQ1S9TqiVaOYoJlBacqbcuq3F3pEuQEx09e1lSsB8QY8CRV5xEQr
 840O4cqjmRiZ2EPggxG/oRY=
X-Google-Smtp-Source: ADFU+vsVUcop1IJD5Y5GJDWMkZo9mIv9UFBUlK2kkpeO2PwWiaR6FToo9iw+OWXW3qnKj5G8oMYMrA==
X-Received: by 2002:a63:fd0d:: with SMTP id d13mr2905382pgh.302.1584623806046; 
 Thu, 19 Mar 2020 06:16:46 -0700 (PDT)
Received: from localhost ([216.24.188.11])
 by smtp.gmail.com with ESMTPSA id j38sm2383940pgi.51.2020.03.19.06.16.44
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 19 Mar 2020 06:16:45 -0700 (PDT)
From: Dejin Zheng <zhengdejin5@gmail.com>
To: peppe.cavallaro@st.com, alexandre.torgue@st.com, joabreu@synopsys.com,
 davem@davemloft.net, mcoquelin.stm32@gmail.com, netdev@vger.kernel.org
Date: Thu, 19 Mar 2020 21:16:38 +0800
Message-Id: <20200319131638.12936-1-zhengdejin5@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Cc: Dejin Zheng <zhengdejin5@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH net-next v2] net: stmmac: dwmac_lib: remove
	unnecessary checks in dwmac_dma_reset()
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

it will check the return value of dwmac_dma_reset() in the
stmmac_init_dma_engine() function and report an error if the
return value is not zero. so don't need check here.

Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
---
v1 -> v2:
	changed subject-prefix to [PATCH net-next v2] from [PATCH]

 drivers/net/ethernet/stmicro/stmmac/dwmac_lib.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac_lib.c b/drivers/net/ethernet/stmicro/stmmac/dwmac_lib.c
index 688d36095333..cb87d31a99df 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac_lib.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac_lib.c
@@ -16,19 +16,14 @@
 int dwmac_dma_reset(void __iomem *ioaddr)
 {
 	u32 value = readl(ioaddr + DMA_BUS_MODE);
-	int err;
 
 	/* DMA SW reset */
 	value |= DMA_BUS_MODE_SFT_RESET;
 	writel(value, ioaddr + DMA_BUS_MODE);
 
-	err = readl_poll_timeout(ioaddr + DMA_BUS_MODE, value,
+	return readl_poll_timeout(ioaddr + DMA_BUS_MODE, value,
 				 !(value & DMA_BUS_MODE_SFT_RESET),
 				 10000, 100000);
-	if (err)
-		return -EBUSY;
-
-	return 0;
 }
 
 /* CSR1 enables the transmit DMA to check for new descriptor */
-- 
2.25.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
