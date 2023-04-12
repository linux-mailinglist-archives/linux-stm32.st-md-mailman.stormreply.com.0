Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 528106E07C9
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Apr 2023 09:33:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E626DC6A606;
	Thu, 13 Apr 2023 07:33:38 +0000 (UTC)
Received: from mail115-69.sinamail.sina.com.cn
 (mail115-69.sinamail.sina.com.cn [218.30.115.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 92A68C03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Apr 2023 09:50:56 +0000 (UTC)
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([116.233.90.202])
 by sina.com (10.75.12.45) with ESMTP
 id 64367EFC000006B7; Wed, 12 Apr 2023 17:50:54 +0800 (CST)
X-Sender: rocklouts@sina.com
X-Auth-ID: rocklouts@sina.com
Authentication-Results: sina.com; spf=none smtp.mailfrom=rocklouts@sina.com;
 dkim=none header.i=none;
 dmarc=none action=none header.from=rocklouts@sina.com
X-SMAIL-MID: 9473331457772
From: Yan Wang <rocklouts@sina.com>
To: kuba@kernel.org, edumazet@google.com, davem@davemloft.net,
 pabeni@redhat.com, mcoquelin.stm32@gmail.com
Date: Wed, 12 Apr 2023 17:50:30 +0800
Message-Id: <20230412095031.21316-1-rocklouts@sina.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Thu, 13 Apr 2023 07:33:37 +0000
Cc: Yan Wang <rocklouts@sina.com>,
 "open list:STMMAC ETHERNET DRIVER" <netdev@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Jose Abreu <joabreu@synopsys.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: [Linux-stm32] [PATCH v1] net: stmmac:fix system hang when setting
	up standalone tag_8021q VLAN for DSA ports
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

The system hang because of dsa_tag_8021q_port_setup() callbcak
stmmac_vlan_rx_add_vid().I found in stmmac_drv_probe() that
cailing pm_runtime_put() disabled the clock when check the stmmac
dirver.

First, when the kernel is compiled with CONFIG_PM=y,The stmmac's
resume/suspend is active.

Secondly,stmmac as DSA master,the dsa_tag_8021q_port_setup() function
will callback stmmac_vlan_rx_add_vid when DSA dirver starts. However,
The system is hanged for the stmmac_vlan_rx_add_vid() accesses its
registers after stmmac's clock is closed.

I would suggest adding the pm_runtime_resume_and_get() to the
stmmac_vlan_rx_add_vid().This guarantees that resuming clock output
while in use.

Signed-off-by: Yan Wang <rocklouts@sina.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index d1a7cf4567bc..1bfbd05497b8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -6191,6 +6191,10 @@ static int stmmac_vlan_rx_add_vid(struct net_device *ndev, __be16 proto, u16 vid
 	bool is_double = false;
 	int ret;
 
+	ret = pm_runtime_resume_and_get(priv->device);
+	if (ret < 0)
+		return ret;
+
 	if (be16_to_cpu(proto) == ETH_P_8021AD)
 		is_double = true;
 
@@ -6198,16 +6202,18 @@ static int stmmac_vlan_rx_add_vid(struct net_device *ndev, __be16 proto, u16 vid
 	ret = stmmac_vlan_update(priv, is_double);
 	if (ret) {
 		clear_bit(vid, priv->active_vlans);
-		return ret;
+		goto err_pm_put;
 	}
 
 	if (priv->hw->num_vlan) {
 		ret = stmmac_add_hw_vlan_rx_fltr(priv, ndev, priv->hw, proto, vid);
 		if (ret)
-			return ret;
+			goto err_pm_put;
 	}
+err_pm_put:
+	pm_runtime_put(priv->device);
 
-	return 0;
+	return ret;
 }
 
 static int stmmac_vlan_rx_kill_vid(struct net_device *ndev, __be16 proto, u16 vid)
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
