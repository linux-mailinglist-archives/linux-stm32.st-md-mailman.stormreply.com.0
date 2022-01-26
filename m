Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1FA49D02A
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Jan 2022 18:00:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A435FC5F1E1;
	Wed, 26 Jan 2022 17:00:00 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9596CC57183
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jan 2022 16:59:58 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6042961AB9;
 Wed, 26 Jan 2022 16:59:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06852C340E7;
 Wed, 26 Jan 2022 16:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643216396;
 bh=erkUnUzFbvhJS7cgGj2rH0FT37mFoWDGUog4NFCmXCE=;
 h=From:To:Cc:Subject:Date:From;
 b=pVLd3kzSw24G5WC1fXL8IGWEgBYtT4RK9RHXc3ACLHOg+GTYqYIEdwASpHzx+nbnZ
 feyq9SmGeKn544CDJGgqLQzl9iQg1g7iTfXsYXgXB3+U+hP42I/1QAewIlkmrWsV+O
 ORPEpsqqx/MW1t7bZZ07vswxRvwXb55f/sAUFTTmuVJmnBGx3oHeAyaQJgRMkSJwhz
 0tuOBjrHUqiVnTvtETNvRlsX/o29ZqPzw265GU22G4CpMS1LtwCnxLxvlngI9706XJ
 RseHThzC5PWpPQgAZoPt3g06ndEpSw36CiY26jwPhp21ANvW94zTECwLhheRlqxv2n
 UadygWUuR1Gbw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
Date: Thu, 27 Jan 2022 00:52:15 +0800
Message-Id: <20220126165215.1921-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject: [Linux-stm32] [PATCH] net: stmmac: dwmac-sun8i: use return val of
	readl_poll_timeout()
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

When readl_poll_timeout() timeout, we'd better directly use its return
value.

Before this patch:
[    2.145528] dwmac-sun8i: probe of 4500000.ethernet failed with error -14

After this patch:
[    2.138520] dwmac-sun8i: probe of 4500000.ethernet failed with error -110

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index 617d0e4c6495..09644ab0d87a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -756,7 +756,7 @@ static int sun8i_dwmac_reset(struct stmmac_priv *priv)
 
 	if (err) {
 		dev_err(priv->device, "EMAC reset timeout\n");
-		return -EFAULT;
+		return err;
 	}
 	return 0;
 }
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
