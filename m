Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AE90DB275EE
	for <lists+linux-stm32@lfdr.de>; Fri, 15 Aug 2025 04:35:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 17F0BC349C3;
	Fri, 15 Aug 2025 02:35:36 +0000 (UTC)
Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9497FC36B31
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Aug 2025 02:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
 s=altu2504; t=1755225324;
 bh=18Y2FqPHGv9yTsq2i+bvrkK1Nwx8p+K4AcbHDTl42W4=;
 h=From:To:Subject:Date:Message-Id;
 b=PETpp5hCLUcbcER3obgNFK4HJ4dRfaiQY5neZxAyGWT9oHS6C7TNOk8NGLY3YwNm2
 WrgWK6Xu5ak/FzdeixmMXUoY9bgcZsjX+CvwnnWAaG3ycTlY77pHz0ofnlrdtFu+Zz
 vk6GXv5IWZPTCjMsLxl+xFTyEhsJkQt/Nv8kFHkI=
X-QQ-mid: zesmtpgz1t1755225322taec13901
X-QQ-Originating-IP: EIRDYySQ/vTVoXNlfnhjpk64A+oYYEctZ9g7jsLXhaQ=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Fri, 15 Aug 2025 10:35:19 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7637992239138858937
From: Chaoyi Chen <kernel@airkyi.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Jonas Karlman <jonas@kwiboo.se>, David Wu <david.wu@rock-chips.com>
Date: Fri, 15 Aug 2025 10:35:15 +0800
Message-Id: <20250815023515.114-1-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: NpfbsqbTlzxU0xuPeWYtNukpwE62jbX8VpEz+YiW2F01Loeu5BNit1Z7
 0zPzpG0EyVej11uEyyyg+mUp3HEeadmg/jdKTa11Qf/R0HS7hAbW4I6aGX6OVSfu5vHrObR
 GTqHoltcZlwGxVRutjWmsNyGkR/G8qqlg++sotMkjowx8bWX9Vp9y8SAGCSSru7Bl5GVHR5
 PuaDAiJ8IlXs4tMkOMCYXU+ZXdziT45coXw9+cNB5rrjcPHT3+nlBjC+s3r14nJ5l8iK3/U
 m+r5f2Lg5EZBEEbXzUjcobTXu3v8fKrwulWp4YkDXcqMIXCmp7eweiUf1PTV5otC0U8aisn
 uLCPhCqmNu0ku66r3Eq8w+oUupxaP5XB2BKeNZhTQmN9Naqt9G4aUMODUsnZdxK6UKuW6+9
 5/bM4yoXrrh90fFsB20+gIKnxN8+PnUFTUWiRw2uUg1ppLKb0QXBMkSvU2Vln71ceAQtYI4
 qJZV3Mkndtqu1E6nholDMtRfuVJ23bbGOhxCg0hUzn8QLV7LjHQY1+CJFLfdBFhHCZfThlR
 +6Ky6XW9ExZpzrzBiXeod8HDGZvNWE4YgyKFJuy8bPGn84FCJ6jv2i/cLEIwzjfQK+7Jxh0
 z50/YM626l6VUEJmslLbnizCUpR27jPJxU7hNv6Yfvs6/uslp2eHASEkBCM7MzooREzfdMi
 bbjWlA2wQ14CM4QkAiZIDzvn1B4VdstS0oTlNNLtpSKbRlpaWcmerysmyHqXO9J6BkMhkRo
 QNLXBrTtm8dglsx01Zhm42xZUW5dqeTTPWWehNyzZulZxVznHhQFt7R9kWg1RWePE2z8ckN
 ldvSci7JkOrMcpYme6hPy3NNWlKqapspnk+qFoQAQzzdadB/97Dm5jNtd8tHCOwJ6QIB6v/
 wcofv0umlpqRnUIKNLWyy659l1ZpaxADpZu0J9ZXfB5nCvXw489j7LFIEc0TgAMcyyGkXrn
 uB7QNfx48EvjKTtvL9qOIGoU704av5DmJFdAz1JsrvWZ0hjU7uAkB12z+
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
X-QQ-RECHKSPAM: 0
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v3] net: ethernet: stmmac: dwmac-rk:
	Make the clk_phy could be used for external phy
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

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

For external phy, clk_phy should be optional, and some external phy
need the clock input from clk_phy. This patch adds support for setting
clk_phy for external phy.

Signed-off-by: David Wu <david.wu@rock-chips.com>
Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---

Changes in v3:
- Link to V2: https://lore.kernel.org/netdev/20250812012127.197-1-kernel@airkyi.com/
- Rebase to net-next/main

Changes in v2:
- Link to V1: https://lore.kernel.org/netdev/20250806011405.115-1-kernel@airkyi.com/
- Remove get clock frequency from DT prop

 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index ac8288301994..5d921e62c2f5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -1412,12 +1412,15 @@ static int rk_gmac_clk_init(struct plat_stmmacenet_data *plat)
 		clk_set_rate(plat->stmmac_clk, 50000000);
 	}
 
-	if (plat->phy_node && bsp_priv->integrated_phy) {
+	if (plat->phy_node) {
 		bsp_priv->clk_phy = of_clk_get(plat->phy_node, 0);
 		ret = PTR_ERR_OR_ZERO(bsp_priv->clk_phy);
-		if (ret)
-			return dev_err_probe(dev, ret, "Cannot get PHY clock\n");
-		clk_set_rate(bsp_priv->clk_phy, 50000000);
+		/* If it is not integrated_phy, clk_phy is optional */
+		if (bsp_priv->integrated_phy) {
+			if (ret)
+				return dev_err_probe(dev, ret, "Cannot get PHY clock\n");
+			clk_set_rate(bsp_priv->clk_phy, 50000000);
+		}
 	}
 
 	return 0;
-- 
2.49.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
