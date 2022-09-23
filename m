Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C4B5E734E
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Sep 2022 07:14:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 48190C04003;
	Fri, 23 Sep 2022 05:14:32 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4B658C03FCD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Sep 2022 05:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663910070; x=1695446070;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7MI/G32FvzCeNd7C1i7UVCiz+iK4Nwe0q1wpd0BbKfE=;
 b=VeNDJ3+G7xTmXOTz0c9XgogqtBDnu2NRvgAWOkcCAZ7mUBwjFY8I37NL
 RyrG3lP+WAJ9Q6283N9d8F512IX6d36oCJqDrnDHE8BclOcJPR7BCZL9/
 KPvObwC82svoASxug+vkWwpcNdzeyV57RX6qefn/414wiw3Vwm93c0ZsE
 Rj30gTCOw9jc9SqIS2yNpVDLdonsrLn5P7gQRjVwJnMY1ZZXb+Sln3FCK
 nVy5JyQvr4NOVzOQblyQeU/TSn/bd8vxLaaMXTyrnxYQHR+fI5tBT3mgq
 xK7QkOL0g3+P6iUFdAm02n1qBvLVQ1aTMJN0tXXO17/mI0gXTUMlZhy6n A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="364526126"
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; d="scan'208";a="364526126"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2022 22:14:28 -0700
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; d="scan'208";a="682529461"
Received: from junxiaochang.bj.intel.com ([10.238.135.52])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2022 22:14:24 -0700
From: Junxiao Chang <junxiao.chang@intel.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 Voon Weifeng <weifeng.voon@intel.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Fri, 23 Sep 2022 13:04:48 +0800
Message-Id: <20220923050448.1220250-1-junxiao.chang@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: junxiao.chang@intel.com, hong.aun.looi@intel.com,
 jimmyjs.chen@adlinktech.com
Subject: [Linux-stm32] [net,
	v3] net: stmmac: power up/down serdes in stmmac_open/release
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

This commit fixes DMA engine reset timeout issue in suspend/resume
with ADLink I-Pi SMARC Plus board which dmesg shows:
...
[   54.678271] PM: suspend exit
[   54.754066] intel-eth-pci 0000:00:1d.2 enp0s29f2: PHY [stmmac-3:01] driver [Maxlinear Ethernet GPY215B] (irq=POLL)
[   54.755808] intel-eth-pci 0000:00:1d.2 enp0s29f2: Register MEM_TYPE_PAGE_POOL RxQ-0
...
[   54.780482] intel-eth-pci 0000:00:1d.2 enp0s29f2: Register MEM_TYPE_PAGE_POOL RxQ-7
[   55.784098] intel-eth-pci 0000:00:1d.2: Failed to reset the dma
[   55.784111] intel-eth-pci 0000:00:1d.2 enp0s29f2: stmmac_hw_setup: DMA engine initialization failed
[   55.784115] intel-eth-pci 0000:00:1d.2 enp0s29f2: stmmac_open: Hw setup failed
...

The issue is related with serdes which impacts clock.  There is
serdes in ADLink I-Pi SMARC board ethernet controller. Please refer to
commit b9663b7ca6ff78 ("net: stmmac: Enable SERDES power up/down sequence")
for detial. When issue is reproduced, DMA engine clock is not ready
because serdes is not powered up.

To reproduce DMA engine reset timeout issue with hardware which has
serdes in GBE controller, install Ubuntu. In Ubuntu GUI, click
"Power Off/Log Out" -> "Suspend" menu, it disables network interface,
then goes to sleep mode. When it wakes up, it enables network
interface again. Stmmac driver is called in this way:

1. stmmac_release: Stop network interface. In this function, it
   disables DMA engine and network interface;
2. stmmac_suspend: It is called in kernel suspend flow. But because
   network interface has been disabled(netif_running(ndev) is
   false), it does nothing and returns directly;
3. System goes into S3 or S0ix state. Some time later, system is
   waken up by keyboard or mouse;
4. stmmac_resume: It does nothing because network interface has
   been disabled;
5. stmmac_open: It is called to enable network interace again. DMA
   engine is initialized in this API, but serdes is not power on so
   there will be DMA engine reset timeout issue.

Similarly, serdes powerdown should be added in stmmac_release.
Network interface might be disabled by cmd "ifconfig eth0 down",
DMA engine, phy and mac have been disabled in ndo_stop callback,
serdes should be powered down as well. It doesn't make sense that
serdes is on while other components have been turned off.

If ethernet interface is in enabled state(netif_running(ndev) is true)
before suspend/resume, the issue couldn't be reproduced  because serdes
could be powered up in stmmac_resume.

Because serdes_powerup is added in stmmac_open, it doesn't need to be
called in probe function.

Fixes: b9663b7ca6ff78 ("net: stmmac: Enable SERDES power up/down sequence")
Signed-off-by: Junxiao Chang <junxiao.chang@intel.com>
Reviewed-by: Voon Weifeng <weifeng.voon@intel.com>
Tested-by: Jimmy JS Chen <jimmyjs.chen@adlinktech.com>
Tested-by: Looi, Hong Aun <hong.aun.looi@intel.com>
---
v2: fixed 32 bits build issue and warning
v3: fixed checkpatch warning

 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 23 +++++++++++--------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 592d29abcb1c2..9083159b93f14 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3801,6 +3801,15 @@ static int __stmmac_open(struct net_device *dev,
 
 	stmmac_reset_queues_param(priv);
 
+	if (priv->plat->serdes_powerup) {
+		ret = priv->plat->serdes_powerup(dev, priv->plat->bsp_priv);
+		if (ret < 0) {
+			netdev_err(priv->dev, "%s: Serdes powerup failed\n",
+				   __func__);
+			goto init_error;
+		}
+	}
+
 	ret = stmmac_hw_setup(dev, true);
 	if (ret < 0) {
 		netdev_err(priv->dev, "%s: Hw setup failed\n", __func__);
@@ -3904,6 +3913,10 @@ static int stmmac_release(struct net_device *dev)
 	/* Disable the MAC Rx/Tx */
 	stmmac_mac_set(priv, priv->ioaddr, false);
 
+	/* Powerdown Serdes if there is */
+	if (priv->plat->serdes_powerdown)
+		priv->plat->serdes_powerdown(dev, priv->plat->bsp_priv);
+
 	netif_carrier_off(dev);
 
 	stmmac_release_ptp(priv);
@@ -7293,14 +7306,6 @@ int stmmac_dvr_probe(struct device *device,
 		goto error_netdev_register;
 	}
 
-	if (priv->plat->serdes_powerup) {
-		ret = priv->plat->serdes_powerup(ndev,
-						 priv->plat->bsp_priv);
-
-		if (ret < 0)
-			goto error_serdes_powerup;
-	}
-
 #ifdef CONFIG_DEBUG_FS
 	stmmac_init_fs(ndev);
 #endif
@@ -7315,8 +7320,6 @@ int stmmac_dvr_probe(struct device *device,
 
 	return ret;
 
-error_serdes_powerup:
-	unregister_netdev(ndev);
 error_netdev_register:
 	phylink_destroy(priv->phylink);
 error_xpcs_setup:
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
