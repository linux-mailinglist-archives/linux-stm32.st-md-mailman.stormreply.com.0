Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 63BDA6DA95B
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Apr 2023 09:22:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 162D6C6B453;
	Fri,  7 Apr 2023 07:22:36 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A9E9DC6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Apr 2023 17:30:20 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9ED9664A7A;
 Thu,  6 Apr 2023 17:30:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A998C433D2;
 Thu,  6 Apr 2023 17:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680802219;
 bh=ZJKba0+w5vwtN3goyHbArkfj6XhrRd7mEr46lY1n1Ag=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=A/aOGZg8KrdEMzpZI1ZeCrSP4OnuuIbmN7t1goTxUddA3EpT32t4hIgRvxTsJ/jst
 ZwNNbKdwws39ddAoVRaU1QVsD95W0ubL/CnuF+zr/fpO+t+fQp+cI72uMBpi7lS3Kn
 NLfYa7tGHwTPUkWdexCqfEznsGxvrzHKvuOmtwPzcpqwJjPerGnHofRBDNTUWt1xgx
 j7ZFOI45igB4whQCI+izb+bW8ETqlztIK2h57iYMlbEP2eZoXyl7nUVssesLGOj1bW
 vGgTA16WwcSQYNcakf/rYoZ5F+Dbud8uFg6SWG4dnUkg1DLiw7aldFriFo2r/NnA9m
 a5qZwJJhOm11g==
From: Simon Horman <horms@kernel.org>
Date: Thu, 06 Apr 2023 19:30:09 +0200
MIME-Version: 1.0
Message-Id: <20230406-dwmac-anarion-sparse-v1-1-b0c866c8be9d@kernel.org>
References: <20230406-dwmac-anarion-sparse-v1-0-b0c866c8be9d@kernel.org>
In-Reply-To: <20230406-dwmac-anarion-sparse-v1-0-b0c866c8be9d@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Paolo Abeni <pabeni@redhat.com>
X-Mailer: b4 0.12.2
X-Mailman-Approved-At: Fri, 07 Apr 2023 07:22:33 +0000
Cc: netdev@vger.kernel.org, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 1/2] net: stmmac: dwmac-anarion: Use
 annotation __iomem for register base
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

Use __iomem annotation the register base: the ctl_block field of struct
anarion_gmac. I believe this is the normal practice for such variables.

By doing so some casting is avoided.
And sparse no longer reports:

 .../dwmac-anarion.c:29:23: warning: incorrect type in argument 1 (different address spaces)
 .../dwmac-anarion.c:29:23:    expected void const volatile [noderef] __iomem *addr
 .../dwmac-anarion.c:29:23:    got void *
 .../dwmac-anarion.c:34:22: warning: incorrect type in argument 2 (different address spaces)
 .../dwmac-anarion.c:34:22:    expected void volatile [noderef] __iomem *addr
 .../dwmac-anarion.c:34:22:    got void *

No functional change intended.
Compile tested only.

Signed-off-by: Simon Horman <horms@kernel.org>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-anarion.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-anarion.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-anarion.c
index dfbaea06d108..2357e77434fb 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-anarion.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-anarion.c
@@ -20,18 +20,18 @@
 #define  GMAC_CONFIG_INTF_RGMII		(0x1 << 0)
 
 struct anarion_gmac {
-	uintptr_t ctl_block;
+	void __iomem *ctl_block;
 	uint32_t phy_intf_sel;
 };
 
 static uint32_t gmac_read_reg(struct anarion_gmac *gmac, uint8_t reg)
 {
-	return readl((void *)(gmac->ctl_block + reg));
+	return readl(gmac->ctl_block + reg);
 };
 
 static void gmac_write_reg(struct anarion_gmac *gmac, uint8_t reg, uint32_t val)
 {
-	writel(val, (void *)(gmac->ctl_block + reg));
+	writel(val, gmac->ctl_block + reg);
 }
 
 static int anarion_gmac_init(struct platform_device *pdev, void *priv)
@@ -77,7 +77,7 @@ static struct anarion_gmac *anarion_config_dt(struct platform_device *pdev)
 	if (!gmac)
 		return ERR_PTR(-ENOMEM);
 
-	gmac->ctl_block = (uintptr_t)ctl_block;
+	gmac->ctl_block = ctl_block;
 
 	err = of_get_phy_mode(pdev->dev.of_node, &phy_mode);
 	if (err)

-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
