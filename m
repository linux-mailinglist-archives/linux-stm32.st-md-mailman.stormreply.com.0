Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 79589B14871
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Jul 2025 08:48:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2C6BBC32E92;
	Tue, 29 Jul 2025 06:48:55 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0179BC3089D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Jul 2025 05:35:53 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-74264d1832eso4969232b3a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 13 Jul 2025 22:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752471352; x=1753076152;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/L7P3oE1hGMJob/q7nnm2/8i/ZXnhCgY+G2gViu30n8=;
 b=l2DC9KnV2mhmIhpEZEbisI0E6G3RgQbCvbidqjR2gJHmmxW5AQ52Cnvfvb7Hp2X4Qu
 bL4GLI2/iNQoRaLaH5xl2NX9IpaL5AXEa0XArVT2+xl7qql6HidD7rWtPHf0KnnbbtkI
 v8cnScRV0vzGBbHl05JJgA/L8ALxyAoJ+JJHGDSKWGzF4iXzctYKXCsxF45qBBjt4NOI
 X2yHm51wtheehyhcmR6zgkwBOPDpY2lJyaxvWNW6RM7E6CevmLXx7/Gfql7BE8vrMh0U
 pMTc2eydvXRvDw9Xx45bnAEzqkOBqIOUHGGgwlnP88P//8NadeLdeFjsJnnZ8jwa/tnt
 xKqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752471352; x=1753076152;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/L7P3oE1hGMJob/q7nnm2/8i/ZXnhCgY+G2gViu30n8=;
 b=WXiguOVsCFxUcx4ovt53cVwMvOEqEbuSo6U5bLTx9v7udU7y0zndA7Ji92kgH0rfK/
 CCF7ONqJ778mYY13YaMl5Zwss9oq0LWOMmVbv14i3oPqKbBui6NjRFvoMdiDyIL6v61D
 e8p7csLZv54Jos+IApOKQLfKev4skHcXroHLkyVSufBebYCNrqhzS/kjdnJjH7lXefvh
 HwDwmQWqAp035IhegaAClM3AMHZN3wfh9RxNWr4U2kCrRKstoHpSLN4t9Oxa5NHogjY3
 bx3Sx/2TsvjF/ZYqlMNkMtEfv70gx8q3vzIYUCX9aFudHZ408aQrJX5BeLjdQCj/WTh6
 gz3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgSVOAT6Di0NTay+gHNnLuEqr7xDRRsKtZVn3elDlTxo7WBV2d0fsXPykl8RcYpSvibc+yrjQCr5ADYQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxQlVGnrgqwjlX6nrdXuTDg5vE6Drmg1vh0guH7jlwhml9hoAdH
 JZxl9WSzzI/P+tNjnUlcYMzbbTuOHPLzaIL3JqD+4iQHxlgc70doragc
X-Gm-Gg: ASbGnctCTXpp3zgHbl8Sk9b7injjbBrc6cV7bktQ3XrdVi33oHvxtrZcM1S3KpIifoE
 afFmRr8hvx0e7k/yKRxM1yoMzS7BfAtvHLvqXGIEjj061Wz5A8C6qtBwn5A50Tqn4t7MyxJER6a
 BDe7ZbWQ6z5Y1leen44osyenx3NyCWUh669qY7oSaC17ohVEAX+IOZ3jarVVxSQ6itZlVlC3BDo
 YqRYJu0wqwSe1cQY6yoaE2nXHxmtfrILPcbSFi74fgIfRi0E5tyI5ngu9vsCC9llN9lbr7dDNws
 wqP3IQtJKAz3UCyFJx7xo4Eycc/pj0PuHM8kUY70XdSCKkNqmZD4N/Xg67vg0nEZ9KzW/6zhuxU
 1XbKBDNC3Iyw46aC5Cp0/4XjhiwaYfdt4h0reLwsSHmGtFo+bkM1BOuNqMoRmxg==
X-Google-Smtp-Source: AGHT+IGYbAKtgDLV5NK0ycsP7CBdgSQY5Ow6NeAjujS3go2updOBJ+OdCtl0cFGcZJwkgawkH+4GqQ==
X-Received: by 2002:a05:6a00:a1f:b0:736:a8db:93b4 with SMTP id
 d2e1a72fcca58-74ee04a9b48mr14846762b3a.2.1752471352312; 
 Sun, 13 Jul 2025 22:35:52 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net.
 [60.250.196.139]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74eb9e14e9bsm9313078b3a.49.2025.07.13.22.35.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Jul 2025 22:35:51 -0700 (PDT)
From: Marvin Lin <milkfafa@gmail.com>
To: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com
Date: Mon, 14 Jul 2025 13:35:27 +0800
Message-Id: <20250714053527.767380-1-milkfafa@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 29 Jul 2025 06:48:52 +0000
Cc: KWLIU@nuvoton.com, Marvin Lin <milkfafa@gmail.com>, tmaimon77@gmail.com,
 netdev@vger.kernel.org, openbmc@lists.ozlabs.org, kflin@nuvoton.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] net: stmmac: Add NCSI support
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

The NCSI is defined as the interface between BMC and Network
Controller on Host side. The interface is responsible for providing
external network connectivity for BMC.

This patch adds support for NCSI that registers and starts NCSI
device, it also skips PHY-related operations if use-ncsi property is
defined in the DTS.

Signed-off-by: Marvin Lin <milkfafa@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |   2 +
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 166 +++++++++++++-----
 .../ethernet/stmicro/stmmac/stmmac_platform.c |  27 ++-
 include/linux/stmmac.h                        |   1 +
 4 files changed, 142 insertions(+), 54 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index cda09cf5dcca..9dc386e0bc6b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -365,6 +365,8 @@ struct stmmac_priv {
 	/* XDP BPF Program */
 	unsigned long *af_xdp_zc_qps;
 	struct bpf_prog *xdp_prog;
+
+	struct ncsi_dev *ncsidev;
 };
 
 enum stmmac_state {
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index b948df1bff9a..dfe3e588ffb2 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -51,6 +51,7 @@
 #include "dwmac1000.h"
 #include "dwxgmac2.h"
 #include "hwif.h"
+#include <net/ncsi.h>
 
 /* As long as the interface is active, we keep the timestamping counter enabled
  * with fine resolution and binary rollover. This avoid non-monotonic behavior
@@ -3131,10 +3132,12 @@ static int stmmac_init_dma_engine(struct stmmac_priv *priv)
 	if (priv->extend_desc && (priv->mode == STMMAC_RING_MODE))
 		priv->plat->dma_cfg->atds = 1;
 
-	ret = stmmac_reset(priv, priv->ioaddr);
-	if (ret) {
-		netdev_err(priv->dev, "Failed to reset the dma\n");
-		return ret;
+	if (!priv->plat->use_ncsi) {
+		ret = stmmac_reset(priv, priv->ioaddr);
+		if (ret) {
+			netdev_err(priv->dev, "Failed to reset the dma\n");
+			return ret;
+		}
 	}
 
 	/* DMA Configuration */
@@ -3643,6 +3646,14 @@ static void stmmac_hw_teardown(struct net_device *dev)
 	clk_disable_unprepare(priv->plat->clk_ptp_ref);
 }
 
+static void stmmac_ncsi_handler(struct ncsi_dev *nd)
+{
+	if (unlikely(nd->state != ncsi_dev_state_functional))
+		return;
+
+	netdev_info(nd->dev, "NCSI interface %s\n", nd->link_up ? "up" : "down");
+}
+
 static void stmmac_free_irq(struct net_device *dev,
 			    enum request_irq_err irq_err, int irq_idx)
 {
@@ -4046,14 +4057,16 @@ static int __stmmac_open(struct net_device *dev,
 	if (ret < 0)
 		return ret;
 
-	if ((!priv->hw->xpcs ||
-	     xpcs_get_an_mode(priv->hw->xpcs, mode) != DW_AN_C73)) {
-		ret = stmmac_init_phy(dev);
-		if (ret) {
-			netdev_err(priv->dev,
-				   "%s: Cannot attach to PHY (error: %d)\n",
-				   __func__, ret);
-			goto init_phy_error;
+	if (!priv->plat->use_ncsi) {
+		if ((!priv->hw->xpcs ||
+		     xpcs_get_an_mode(priv->hw->xpcs, mode) != DW_AN_C73)) {
+			ret = stmmac_init_phy(dev);
+			if (ret) {
+				netdev_err(priv->dev,
+					   "%s: Cannot attach to PHY (error: %d)\n",
+					   __func__, ret);
+				goto init_phy_error;
+			}
 		}
 	}
 
@@ -4082,9 +4095,23 @@ static int __stmmac_open(struct net_device *dev,
 
 	stmmac_init_coalesce(priv);
 
-	phylink_start(priv->phylink);
-	/* We may have called phylink_speed_down before */
-	phylink_speed_up(priv->phylink);
+	if (priv->plat->use_ncsi) {
+		u32 ctrl;
+
+		stmmac_mac_flow_ctrl(priv, DUPLEX_FULL, FLOW_AUTO);
+		ctrl = readl(priv->ioaddr + MAC_CTRL_REG);
+		ctrl &= ~priv->hw->link.speed_mask;
+		ctrl |= priv->hw->link.speed100;
+		ctrl |= priv->hw->link.duplex;
+		writel(ctrl, priv->ioaddr + MAC_CTRL_REG);
+
+		/* If using NC-SI subsystem, set our carrier on and start the stack */
+		netif_carrier_on(dev);
+	} else {
+		phylink_start(priv->phylink);
+		/* We may have called phylink_speed_down before */
+		phylink_speed_up(priv->phylink);
+	}
 
 	ret = stmmac_request_irq(dev);
 	if (ret)
@@ -4094,17 +4121,29 @@ static int __stmmac_open(struct net_device *dev,
 	netif_tx_start_all_queues(priv->dev);
 	stmmac_enable_all_dma_irq(priv);
 
-	return 0;
+	/* Start the NCSI device */
+	if (priv->plat->use_ncsi) {
+		ret = ncsi_start_dev(priv->ncsidev);
+		if (ret) {
+			netdev_err(priv->dev, "ERROR: start the ncsi device(%d)\n", ret);
+			goto ncsi_error;
+		}
+	}
 
+	return 0;
+ncsi_error:
+	stmmac_disable_all_queues(priv);
 irq_error:
-	phylink_stop(priv->phylink);
+	if (!priv->plat->use_ncsi)
+		phylink_stop(priv->phylink);
 
 	for (chan = 0; chan < priv->plat->tx_queues_to_use; chan++)
 		hrtimer_cancel(&priv->dma_conf.tx_queue[chan].txtimer);
 
 	stmmac_hw_teardown(dev);
 init_error:
-	phylink_disconnect_phy(priv->phylink);
+	if (!priv->plat->use_ncsi)
+		phylink_disconnect_phy(priv->phylink);
 init_phy_error:
 	pm_runtime_put(priv->device);
 	return ret;
@@ -4139,11 +4178,15 @@ static int stmmac_release(struct net_device *dev)
 	struct stmmac_priv *priv = netdev_priv(dev);
 	u32 chan;
 
-	if (device_may_wakeup(priv->device))
-		phylink_speed_down(priv->phylink, false);
-	/* Stop and disconnect the PHY */
-	phylink_stop(priv->phylink);
-	phylink_disconnect_phy(priv->phylink);
+	if (priv->plat->use_ncsi) {
+		ncsi_stop_dev(priv->ncsidev);
+	} else {
+		if (device_may_wakeup(priv->device))
+			phylink_speed_down(priv->phylink, false);
+		/* Stop and disconnect the PHY */
+		phylink_stop(priv->phylink);
+		phylink_disconnect_phy(priv->phylink);
+	}
 
 	stmmac_disable_all_queues(priv);
 
@@ -6230,7 +6273,8 @@ static int stmmac_ioctl(struct net_device *dev, struct ifreq *rq, int cmd)
 	case SIOCGMIIPHY:
 	case SIOCGMIIREG:
 	case SIOCSMIIREG:
-		ret = phylink_mii_ioctl(priv->phylink, rq, cmd);
+		if (!priv->plat->use_ncsi)
+			ret = phylink_mii_ioctl(priv->phylink, rq, cmd);
 		break;
 	default:
 		break;
@@ -6691,6 +6735,9 @@ static int stmmac_vlan_rx_add_vid(struct net_device *ndev, __be16 proto, u16 vid
 	bool is_double = false;
 	int ret;
 
+	if (priv->plat->use_ncsi)
+		return ncsi_vlan_rx_add_vid(ndev, proto, vid);
+
 	ret = pm_runtime_resume_and_get(priv->device);
 	if (ret < 0)
 		return ret;
@@ -6725,6 +6772,9 @@ static int stmmac_vlan_rx_kill_vid(struct net_device *ndev, __be16 proto, u16 vi
 	bool is_double = false;
 	int ret;
 
+	if (priv->plat->use_ncsi)
+		return ncsi_vlan_rx_kill_vid(ndev, proto, vid);
+
 	ret = pm_runtime_resume_and_get(priv->device);
 	if (ret < 0)
 		return ret;
@@ -7504,7 +7554,9 @@ int stmmac_dvr_probe(struct device *device,
 	if (!priv->xstats.pcpu_stats)
 		return -ENOMEM;
 
-	stmmac_set_ethtool_ops(ndev);
+	if (!plat_dat->use_ncsi)
+		stmmac_set_ethtool_ops(ndev);
+
 	priv->pause_time = pause;
 	priv->plat = plat_dat;
 	priv->ioaddr = res->addr;
@@ -7619,6 +7671,9 @@ int stmmac_dvr_probe(struct device *device,
 	 * host DMA width for allocation and the device DMA width for
 	 * register handling.
 	 */
+	if (priv->plat->use_ncsi)
+		ndev->hw_features |= NETIF_F_HW_VLAN_CTAG_FILTER;
+
 	if (priv->plat->host_dma_width)
 		priv->dma_cap.host_dma_width = priv->plat->host_dma_width;
 	else
@@ -7728,22 +7783,35 @@ int stmmac_dvr_probe(struct device *device,
 	if (!pm_runtime_enabled(device))
 		pm_runtime_enable(device);
 
-	ret = stmmac_mdio_register(ndev);
-	if (ret < 0) {
-		dev_err_probe(priv->device, ret,
-			      "MDIO bus (id: %d) registration failed\n",
-			      priv->plat->bus_id);
-		goto error_mdio_register;
-	}
+	if (!priv->plat->use_ncsi) {
+		ret = stmmac_mdio_register(ndev);
+		if (ret < 0) {
+			dev_err_probe(priv->device, ret,
+				      "MDIO bus (id: %d) registration failed\n",
+				      priv->plat->bus_id);
+			goto error_mdio_register;
+		}
 
-	ret = stmmac_pcs_setup(ndev);
-	if (ret)
-		goto error_pcs_setup;
+		ret = stmmac_pcs_setup(ndev);
+		if (ret)
+			goto error_pcs_setup;
 
-	ret = stmmac_phy_setup(priv);
-	if (ret) {
-		netdev_err(ndev, "failed to setup phy (%d)\n", ret);
-		goto error_phy_setup;
+		ret = stmmac_phy_setup(priv);
+		if (ret) {
+			netdev_err(ndev, "failed to setup phy (%d)\n", ret);
+			goto error_phy_setup;
+		}
+	} else {
+		if (!IS_ENABLED(CONFIG_NET_NCSI)) {
+			netdev_err(priv->dev, "CONFIG_NET_NCSI not enabled\n");
+			goto error_phy_setup;
+		}
+		dev_info(priv->device, "register NCSI dev\n");
+		priv->ncsidev = ncsi_register_dev(priv->dev, stmmac_ncsi_handler);
+		if (!priv->ncsidev)
+			goto error_phy_setup;
+
+		dev_info(priv->device, "Using NCSI interface\n");
 	}
 
 	ret = register_netdev(ndev);
@@ -7768,9 +7836,11 @@ int stmmac_dvr_probe(struct device *device,
 	return ret;
 
 error_netdev_register:
-	phylink_destroy(priv->phylink);
+	if (!priv->plat->use_ncsi)
+		phylink_destroy(priv->phylink);
 error_phy_setup:
-	stmmac_pcs_clean(ndev);
+	if (!priv->plat->use_ncsi)
+		stmmac_pcs_clean(ndev);
 error_pcs_setup:
 	stmmac_mdio_unregister(ndev);
 error_mdio_register:
@@ -7868,13 +7938,15 @@ int stmmac_suspend(struct device *dev)
 
 	mutex_unlock(&priv->lock);
 
-	rtnl_lock();
-	if (device_may_wakeup(priv->device) && !priv->plat->pmt)
-		phylink_speed_down(priv->phylink, false);
+	if (!priv->plat->use_ncsi) {
+		rtnl_lock();
+		if (device_may_wakeup(priv->device) && !priv->plat->pmt)
+			phylink_speed_down(priv->phylink, false);
 
-	phylink_suspend(priv->phylink,
-			device_may_wakeup(priv->device) && priv->plat->pmt);
-	rtnl_unlock();
+		phylink_suspend(priv->phylink,
+				device_may_wakeup(priv->device) && priv->plat->pmt);
+		rtnl_unlock();
+	}
 
 	if (stmmac_fpe_supported(priv))
 		ethtool_mmsv_stop(&priv->fpe_cfg.mmsv);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index b80c1efdb323..de500e59461f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -447,17 +447,30 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
 		eth_zero_addr(mac);
 	}
 
-	phy_mode = device_get_phy_mode(&pdev->dev);
-	if (phy_mode < 0)
-		return ERR_PTR(phy_mode);
+	if (of_get_property(pdev->dev.of_node, "use-ncsi", NULL)) {
+		plat->use_ncsi = true;
+		plat->has_xgmac = 0;
+		plat->has_gmac4 = 0;
+		plat->has_gmac = 0;
+	} else {
+		plat->use_ncsi = false;
+	}
 
-	plat->phy_interface = phy_mode;
+	if (!plat->use_ncsi) {
+		phy_mode = device_get_phy_mode(&pdev->dev);
+		if (phy_mode < 0)
+			return ERR_PTR(phy_mode);
+
+		plat->phy_interface = phy_mode;
+	}
 	rc = stmmac_of_get_mac_mode(np);
 	plat->mac_interface = rc < 0 ? plat->phy_interface : rc;
 
-	/* Some wrapper drivers still rely on phy_node. Let's save it while
-	 * they are not converted to phylink. */
-	plat->phy_node = of_parse_phandle(np, "phy-handle", 0);
+	if (!plat->use_ncsi) {
+		/* Some wrapper drivers still rely on phy_node. Let's save it while
+		 * they are not converted to phylink. */
+		plat->phy_node = of_parse_phandle(np, "phy-handle", 0);
+	}
 
 	/* PHYLINK automatically parses the phy-handle property */
 	plat->port_node = of_fwnode_handle(np);
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 26ddf95d23f9..668768043f7e 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -288,5 +288,6 @@ struct plat_stmmacenet_data {
 	int msi_tx_base_vec;
 	const struct dwmac4_addrs *dwmac4_addrs;
 	unsigned int flags;
+	int use_ncsi;
 };
 #endif
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
