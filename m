Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B8260869374
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Feb 2024 14:45:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 67BB5C6C841;
	Tue, 27 Feb 2024 13:45:20 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A2E2EC64102
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Feb 2024 13:45:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id A4843CE1BA4;
 Tue, 27 Feb 2024 13:45:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 921A5C433C7;
 Tue, 27 Feb 2024 13:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1709041514;
 bh=68HHk01czVH7Q2kVBI9fiOPP5ZlUlZljCnFVbhPNnkk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=F+1tz0v1w2bF5Fo1sqnCbupRWrHw/afDEDc9jjNJeYWqJeF6kJUZQZp0+oTs2+fkE
 mK+d/sp2jTSKxDy/z12dXA/ssOg+MlzjiWlqihDK2E+qpsxBo2a4FOsc/5cljikdVE
 210ZWsujMMgrjqDLG2am/gFdUtAcX5tFQvPekGck=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Date: Tue, 27 Feb 2024 14:25:51 +0100
Message-ID: <20240227131548.667291630@linuxfoundation.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240227131548.514622258@linuxfoundation.org>
References: <20240227131548.514622258@linuxfoundation.org>
User-Agent: quilt/0.67
X-stable: review
X-Patchwork-Hint: ignore
MIME-Version: 1.0
Cc: Alexandre Torgue <alexandre.torgue@st.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, patches@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Jacob Keller <jacob.e.keller@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Hugo SIMELIERE <hsimeliere.opensource@witekio.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: [Linux-stm32] [PATCH 4.19 04/52] stmmac: no need to check return
	value of debugfs_create functions
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

4.19-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

commit 8d72ab119f42f25abb393093472ae0ca275088b6 upstream.

When calling debugfs functions, there is no need to ever check the
return value.  The function can work or not, but the code logic should
never do something different based on this.

Because we don't care about the individual files, we can remove the
stored dentry for the files, as they are not needed to be kept track of
at all.

Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Jose Abreu <joabreu@synopsys.com>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Signed-off-by: David S. Miller <davem@davemloft.net>
Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
Stable-dep-of: 474a31e13a4e ("net: stmmac: fix notifier registration")
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h      |    2 
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |   52 +++-------------------
 2 files changed, 8 insertions(+), 46 deletions(-)

--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -188,8 +188,6 @@ struct stmmac_priv {
 
 #ifdef CONFIG_DEBUG_FS
 	struct dentry *dbgfs_dir;
-	struct dentry *dbgfs_rings_status;
-	struct dentry *dbgfs_dma_cap;
 #endif
 
 	unsigned long state;
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -115,7 +115,7 @@ static irqreturn_t stmmac_interrupt(int
 
 #ifdef CONFIG_DEBUG_FS
 static const struct net_device_ops stmmac_netdev_ops;
-static int stmmac_init_fs(struct net_device *dev);
+static void stmmac_init_fs(struct net_device *dev);
 static void stmmac_exit_fs(struct net_device *dev);
 #endif
 
@@ -4063,47 +4063,22 @@ static struct notifier_block stmmac_noti
 	.notifier_call = stmmac_device_event,
 };
 
-static int stmmac_init_fs(struct net_device *dev)
+static void stmmac_init_fs(struct net_device *dev)
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
 
 	/* Create per netdev entries */
 	priv->dbgfs_dir = debugfs_create_dir(dev->name, stmmac_fs_dir);
 
-	if (!priv->dbgfs_dir || IS_ERR(priv->dbgfs_dir)) {
-		netdev_err(priv->dev, "ERROR failed to create debugfs directory\n");
-
-		return -ENOMEM;
-	}
-
 	/* Entry to report DMA RX/TX rings */
-	priv->dbgfs_rings_status =
-		debugfs_create_file("descriptors_status", 0444,
-				    priv->dbgfs_dir, dev,
-				    &stmmac_rings_status_fops);
-
-	if (!priv->dbgfs_rings_status || IS_ERR(priv->dbgfs_rings_status)) {
-		netdev_err(priv->dev, "ERROR creating stmmac ring debugfs file\n");
-		debugfs_remove_recursive(priv->dbgfs_dir);
-
-		return -ENOMEM;
-	}
+	debugfs_create_file("descriptors_status", 0444, priv->dbgfs_dir, dev,
+			    &stmmac_rings_status_fops);
 
 	/* Entry to report the DMA HW features */
-	priv->dbgfs_dma_cap = debugfs_create_file("dma_cap", 0444,
-						  priv->dbgfs_dir,
-						  dev, &stmmac_dma_cap_fops);
-
-	if (!priv->dbgfs_dma_cap || IS_ERR(priv->dbgfs_dma_cap)) {
-		netdev_err(priv->dev, "ERROR creating stmmac MMC debugfs file\n");
-		debugfs_remove_recursive(priv->dbgfs_dir);
-
-		return -ENOMEM;
-	}
+	debugfs_create_file("dma_cap", 0444, priv->dbgfs_dir, dev,
+			    &stmmac_dma_cap_fops);
 
 	register_netdevice_notifier(&stmmac_notifier);
-
-	return 0;
 }
 
 static void stmmac_exit_fs(struct net_device *dev)
@@ -4442,10 +4417,7 @@ int stmmac_dvr_probe(struct device *devi
 	}
 
 #ifdef CONFIG_DEBUG_FS
-	ret = stmmac_init_fs(ndev);
-	if (ret < 0)
-		netdev_warn(priv->dev, "%s: failed debugFS registration\n",
-			    __func__);
+	stmmac_init_fs(ndev);
 #endif
 
 	return ret;
@@ -4705,16 +4677,8 @@ static int __init stmmac_init(void)
 {
 #ifdef CONFIG_DEBUG_FS
 	/* Create debugfs main directory if it doesn't exist yet */
-	if (!stmmac_fs_dir) {
+	if (!stmmac_fs_dir)
 		stmmac_fs_dir = debugfs_create_dir(STMMAC_RESOURCE_NAME, NULL);
-
-		if (!stmmac_fs_dir || IS_ERR(stmmac_fs_dir)) {
-			pr_err("ERROR %s, debugfs create directory failed\n",
-			       STMMAC_RESOURCE_NAME);
-
-			return -ENOMEM;
-		}
-	}
 #endif
 
 	return 0;


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
