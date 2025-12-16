Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 05AE8CC3D24
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Dec 2025 16:07:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 985F0C7A834;
	Tue, 16 Dec 2025 15:07:53 +0000 (UTC)
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7283BC01FBF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Dec 2025 15:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:To:Subject:Date:Message-Id; bh=wg9Xf8V8em1zSRB
 5KPAJPFBdeTO21Kdvkx26K1bPMoE=; b=TytGPF1YqVKWl4BoIq5EE8XbYRAQ7LM
 ZOYiYT9hIFOq4ZeqQdQRn66lpVV2V6mmUGAKCOuJQT/bSB4bzbX+/GGRWPG8vxYd
 eTnrY0Dn5/jmRwjGk8TT7zvFL9R5n9Ta0NFrThm6kH4UCjOogKEYcBqxBWuFwHm+
 o52c5miM5uls=
Received: from localhost.localdomain (unknown [])
 by gzsmtp2 (Coremail) with SMTP id PSgvCgDnD+lkdUFpZsvsIQ--.30056S2;
 Tue, 16 Dec 2025 23:06:28 +0800 (CST)
From: Lizhe <sensor1010@163.com>
To: heiko@sntech.de, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com
Date: Tue, 16 Dec 2025 07:06:11 -0800
Message-Id: <20251216150611.3616-1-sensor1010@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: PSgvCgDnD+lkdUFpZsvsIQ--.30056S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tFW5Xw4xCrWfXFyDurWrAFb_yoW8Xr47pa
 97AF9Fyw1kJryxGa12qFsrZa45Cw47try0gF1xZ34fuF13u34qqr10yrW0yF1UKrWkWF9I
 yF4UA3Z7C3W7CrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piG2NtUUUUU=
X-Originating-IP: [223.65.97.179]
X-CM-SenderInfo: 5vhq20jurqiii6rwjhhfrp/xtbC3RQl0GlBdXRpeQAA3F
Cc: Lizhe <sensor1010@163.com>, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/2] [PATCH net-next v2 1/2] net: stmmac:
	dwmac-rk: rename phy_power_on to avoid conflict
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Rename local function 'phy_power_on' to 'rk_phy_power_set' to avoid
conflict with PHY subsystem function. Keep original error handling.

Signed-off-by: Lizhe <sensor1010@163.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index 0a95f54e725e..2f5a65c235aa 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -1498,7 +1498,7 @@ static int gmac_clk_enable(struct rk_priv_data *bsp_priv, bool enable)
 	return 0;
 }
 
-static int phy_power_on(struct rk_priv_data *bsp_priv, bool enable)
+static int rk_phy_power_set(struct rk_priv_data *bsp_priv, bool enable)
 {
 	struct regulator *ldo = bsp_priv->regulator;
 	struct device *dev = bsp_priv->dev;
@@ -1692,7 +1692,7 @@ static int rk_gmac_powerup(struct rk_priv_data *bsp_priv)
 		dev_err(dev, "NO interface defined!\n");
 	}
 
-	ret = phy_power_on(bsp_priv, true);
+	ret = rk_phy_power_set(bsp_priv, true);
 	if (ret) {
 		gmac_clk_enable(bsp_priv, false);
 		return ret;
@@ -1713,7 +1713,7 @@ static void rk_gmac_powerdown(struct rk_priv_data *gmac)
 
 	pm_runtime_put_sync(gmac->dev);
 
-	phy_power_on(gmac, false);
+	rk_phy_power_set(gmac, false);
 	gmac_clk_enable(gmac, false);
 }
 
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
