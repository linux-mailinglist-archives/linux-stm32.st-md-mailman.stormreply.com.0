Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E660DCC3D27
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Dec 2025 16:08:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B3672C7A834;
	Tue, 16 Dec 2025 15:08:25 +0000 (UTC)
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D48D9C01FBF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Dec 2025 15:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:To:Subject:Date:Message-Id; bh=LFrFoKsKHi5MKf5
 l5656b7lBtyZwulDZhSgVO40faJg=; b=FQiBv0oU4iOMxeVwCtJMGf2KyQSORP2
 gHvglybFUQQoljHVroWHfpdTXJ3JvlhKMzwFvobSwi4xzFRiMrZ3AsRTLbyCpeu4
 zvdj9OV98YqVPqrjZNZwizTrK8KJU73ihYkavw2Stxadnzc88H2fxyiwiht0fs+5
 aJ49EBKvt00k=
Received: from localhost.localdomain (unknown [])
 by gzsmtp1 (Coremail) with SMTP id PCgvCgD3X_ukdUFptVRoHQ--.1199S2;
 Tue, 16 Dec 2025 23:07:31 +0800 (CST)
From: Lizhe <sensor1010@163.com>
To: heiko@sntech.de, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com
Date: Tue, 16 Dec 2025 07:07:15 -0800
Message-Id: <20251216150715.3672-1-sensor1010@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: PCgvCgD3X_ukdUFptVRoHQ--.1199S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZF47Ww4UKr43Zw1UCw48WFg_yoWfCFX_W3
 WjvFnaqa1UtFW0yrn8Aa13ZryS9Fs8WrZ3ArsFga93Cay7uw1DA34DurZxAr4DWw40vF9r
 Gr13tF4Iyw1xJjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRMOzVUUUUUU==
X-Originating-IP: [223.65.97.179]
X-CM-SenderInfo: 5vhq20jurqiii6rwjhhfrp/xtbC3RQ14GlBdbRwhAAA3B
Cc: Lizhe <sensor1010@163.com>, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 2/2] [PATCH net-next v2 2/2] net: stmmac:
	dwmac-rk:return actual error from phy_power_on
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

The function phy_power_on currently always returns 0, even when
regulator operations fail. This patch modifies it to return the
actual error code from regulator_enable/disable operations

Signed-off-by: Lizhe <sensor1010@163.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index 2f5a65c235aa..fa989cb96714 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -1514,7 +1514,7 @@ static int rk_phy_power_set(struct rk_priv_data *bsp_priv, bool enable)
 			dev_err(dev, "fail to disable phy-supply\n");
 	}
 
-	return 0;
+	return ret;
 }
 
 static struct rk_priv_data *rk_gmac_setup(struct platform_device *pdev,
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
