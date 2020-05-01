Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 18AE71C1744
	for <lists+linux-stm32@lfdr.de>; Fri,  1 May 2020 16:10:24 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B9E64C36B0F;
	Fri,  1 May 2020 14:10:23 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AE5EEC36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 May 2020 14:10:22 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1jUWMr-0000uj-19; Fri, 01 May 2020 14:10:17 +0000
From: Colin King <colin.king@canonical.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Date: Fri,  1 May 2020 15:10:16 +0100
Message-Id: <20200501141016.290699-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH] net: stmmac: gmac5+: fix potential integer
	overflow on 32 bit multiply
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

From: Colin Ian King <colin.king@canonical.com>

The multiplication of cfg->ctr[1] by 1000000000 is performed using a
32 bit multiplication (since cfg->ctr[1] is a u32) and this can lead
to a potential overflow. Fix this by making the constant a ULL to
ensure a 64 bit multiply occurs.

Fixes: 504723af0d85 ("net: stmmac: Add basic EST support for GMAC5+")
Addresses-Coverity: ("Unintentional integer overflow")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac5.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac5.c b/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
index 494c859b4ade..67ba67ed0cb9 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
@@ -624,7 +624,7 @@ int dwmac5_est_configure(void __iomem *ioaddr, struct stmmac_est *cfg,
 		total_offset += offset;
 	}
 
-	total_ctr = cfg->ctr[0] + cfg->ctr[1] * 1000000000;
+	total_ctr = cfg->ctr[0] + cfg->ctr[1] * 1000000000ULL;
 	total_ctr += total_offset;
 
 	ctr_low = do_div(total_ctr, 1000000000);
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
