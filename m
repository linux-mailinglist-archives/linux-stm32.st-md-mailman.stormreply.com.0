Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 10442474B9C
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Dec 2021 20:10:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 86049C5E2C5;
	Tue, 14 Dec 2021 19:10:48 +0000 (UTC)
Received: from metanate.com (dougal.metanate.com [90.155.101.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7B3BFC597BA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Dec 2021 19:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=metanate.com; s=stronger; h=Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Content-Type:Reply-To:Content-ID:Content-Description:
 In-Reply-To:References; bh=XsmCqJao1bqLigheUsyxqJhjt/PPR1l+mc8RxY9x2iQ=; b=H0
 CFCxlxGEzAFTR6neO9QTDh6LY+bZ1Zc7fFXBjm1KanTVI4Vwn6ktU/hcyHxL9NvgTYrPcKz/sYKSR
 OazQuw4/rE5cV3f8OYGEDQISIMpCct0yYpP7uS0jKsxtEauLKDEHVaK9BjLTW0M35OjNrVtS9qbvk
 7u2PZzj+jkj1CmrzlNKb7Y3+YHUc0wvjbDSo5zguKAID9Tlnnp7Sg15DDnOIKLjveFybXPR01q6Ay
 P0FSgEnI5zyK2trbI9b92QCFjq/kKFsOrV/1JvfrSAnSHJcpudVl2qxLQPc1wcfkZxmwQC6a95L4m
 AH1ILmzIJ4n6cYcmY21A0pQDiPwyWftQ==;
Received: from [81.174.171.191] (helo=donbot.metanate.com)
 by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.93) (envelope-from <john@metanate.com>)
 id 1mxDBt-0000nB-0n; Tue, 14 Dec 2021 19:10:21 +0000
From: John Keeping <john@metanate.com>
To: netdev@vger.kernel.org
Date: Tue, 14 Dec 2021 19:10:09 +0000
Message-Id: <20211214191009.2454599-1-john@metanate.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Authenticated: YES
Cc: linux-kernel@vger.kernel.org, David Wu <david.wu@rock-chips.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-rockchip@lists.infradead.org,
 Jose Abreu <joabreu@synopsys.com>, John Keeping <john@metanate.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] net: stmmac: dwmac-rk: fix oob read in
	rk_gmac_setup
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

KASAN reports an out-of-bounds read in rk_gmac_setup on the line:

	while (ops->regs[i]) {

This happens for most platforms since the regs flexible array member is
empty, so the memory after the ops structure is being read here.  It
seems that mostly this happens to contain zero anyway, so we get lucky
and everything still works.

To avoid adding redundant data to nearly all the ops structures, add a
new flag to indicate whether the regs field is valid and avoid this loop
when it is not.

Fixes: 3bb3d6b1c195 ("net: stmmac: Add RK3566/RK3568 SoC support")
Signed-off-by: John Keeping <john@metanate.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index 6924a6aacbd5..c469abc91fa1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -33,6 +33,7 @@ struct rk_gmac_ops {
 	void (*set_rgmii_speed)(struct rk_priv_data *bsp_priv, int speed);
 	void (*set_rmii_speed)(struct rk_priv_data *bsp_priv, int speed);
 	void (*integrated_phy_powerup)(struct rk_priv_data *bsp_priv);
+	bool regs_valid;
 	u32 regs[];
 };
 
@@ -1092,6 +1093,7 @@ static const struct rk_gmac_ops rk3568_ops = {
 	.set_to_rmii = rk3568_set_to_rmii,
 	.set_rgmii_speed = rk3568_set_gmac_speed,
 	.set_rmii_speed = rk3568_set_gmac_speed,
+	.regs_valid = true,
 	.regs = {
 		0xfe2a0000, /* gmac0 */
 		0xfe010000, /* gmac1 */
@@ -1383,7 +1385,7 @@ static struct rk_priv_data *rk_gmac_setup(struct platform_device *pdev,
 	 * to be distinguished.
 	 */
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (res) {
+	if (res && ops->regs_valid) {
 		int i = 0;
 
 		while (ops->regs[i]) {
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
