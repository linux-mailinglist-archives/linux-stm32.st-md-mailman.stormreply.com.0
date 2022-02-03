Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 285584AC55D
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Feb 2022 17:21:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CF7DBC6046C;
	Mon,  7 Feb 2022 16:21:27 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3C0D7C60464
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Feb 2022 16:21:26 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 23276B835A4;
 Thu,  3 Feb 2022 20:36:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 523B2C340EB;
 Thu,  3 Feb 2022 20:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643920572;
 bh=v8lP6EEDA/v9fJnTYb2UloIEPhnQ0fkNOq4kTJaU4l4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rRYuPCsWvanyTxL4i9H2Nlfaelk794BfvoYG6Zw6y0+UFlD+HewShv1dMq26x9Vzx
 TSrels+uRF0dgaswSsNk+0tBU7sjYD/EAYszr1535r3gMrSfoV1vlH45n2DMsj8y7y
 SmBDbnY3PI30/8JehGEFbebDagnDaKjMrBUR5HyK1Njwr7xtcyJLR6kst5sEn2XPFb
 rY4rbfhp6SYYr2AdbLjCiahtHMJD6lAha1La3ks5z3PpTgtAZ/1nIeHUxXnTN7tI/6
 imWxREtK3g5bDHixZU98wC6biaHbO2EsAybzXdz5n6CLBKczKv0hjOZOiFPpkm3i+p
 jxF/nnKWwdynA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Thu,  3 Feb 2022 15:35:45 -0500
Message-Id: <20220203203545.3879-15-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220203203545.3879-1-sashal@kernel.org>
References: <20220203203545.3879-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, alexandre.torgue@foss.st.com,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, wens@csie.org, joabreu@synopsys.com,
 mripard@kernel.org, Jisheng Zhang <jszhang@kernel.org>, kuba@kernel.org,
 peppe.cavallaro@st.com, linux-sunxi@lists.linux.dev,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH AUTOSEL 5.4 15/15] net: stmmac: dwmac-sun8i:
	use return val of readl_poll_timeout()
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

From: Jisheng Zhang <jszhang@kernel.org>

[ Upstream commit 9e0db41e7a0b6f1271cbcfb16dbf5b8641b4e440 ]

When readl_poll_timeout() timeout, we'd better directly use its return
value.

Before this patch:
[    2.145528] dwmac-sun8i: probe of 4500000.ethernet failed with error -14

After this patch:
[    2.138520] dwmac-sun8i: probe of 4500000.ethernet failed with error -110

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: David S. Miller <davem@davemloft.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index 2f6258ca95155..7c73d296b940d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -718,7 +718,7 @@ static int sun8i_dwmac_reset(struct stmmac_priv *priv)
 
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
