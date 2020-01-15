Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B9613C86E
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Jan 2020 16:54:02 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0FA17C36B0F;
	Wed, 15 Jan 2020 15:54:02 +0000 (UTC)
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D3FB5C36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jan 2020 15:53:57 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id s64so8387709pgb.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jan 2020 07:53:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=c/GWPQtRfN7j/bEfY+uIGMfC4b83t2OdSqf9AvElNRM=;
 b=EwuEbm4VZGa5Yrj1M1k5z/SPIhI/TyArbfnbVrC91uJvgqCXjVIYHF5u+M5/X1rdJT
 70gnHeB+JCcWu5W4tgZ1AO7gppBRrmPJhPzaC6T7a/sQlFkxe/ild7vt8rZ9zah7jWtE
 Z4I7BJFOJ5+XZh33RgFyQjHfnKNYYhB++PdcLYi7aYsJK1WIJ14lZtuiYXMErVz4EPyx
 FBnF+th9KbYbdtNpiaWd7qI+ImCzrn0S2An3ip7vWxySJWmnkbLp+PgK4KcjGJTzLKfP
 GnRrnYuLBNwEaidccyXlPF952M7ocLNt8U1ydpR/UJMCeb1xs020494ha66/l6yU+5jS
 K+Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=c/GWPQtRfN7j/bEfY+uIGMfC4b83t2OdSqf9AvElNRM=;
 b=ad9C7/q/aD928dlknOYWOeu1ogwbsJNld6nIpvEbl+dmxnniZWUKiQIA1y1LMaDLeT
 vFyK5FAtcyaXPfWC3i9LrlD8APwWYvv5EgaNRSlvXv011ZvO6GvN7GK4MSrapsxnbgAi
 k1i06XCSd+Jbj9/frzzZAr5gXVgFyuR/RncUYHksfu7c8+lw9qNjDmXX3hxDtMNzpUjy
 eJDwzU3jQkNcCnE229iTVyWFjEFrucDAVLM9lQyqA/+ftjoV/N/UchEVVFR5zPsVWlCP
 Vz7UQ//Hqq+R9d1nWzg2mFk0cCOWke6GkslUzuXqM5N9JqvD2PgbvlzUQCQ9kHwija+M
 p5Hw==
X-Gm-Message-State: APjAAAXNoWWJiAmFkrFumvuj6+01N/DwA6XXOA6/GVFDZgx5/a/Wsdhy
 W+0N15yzdbKlvzx9dYEPWw8=
X-Google-Smtp-Source: APXvYqyKceOTx9ZjZoes/c2uX1iezUq1hng9gL92ptSPdkUO9WPHZB3PUuC6MsV6ZBJ7g6f6sPoZEQ==
X-Received: by 2002:aa7:8088:: with SMTP id v8mr32789472pff.142.1579103636329; 
 Wed, 15 Jan 2020 07:53:56 -0800 (PST)
Received: from localhost (64.64.229.47.16clouds.com. [64.64.229.47])
 by smtp.gmail.com with ESMTPSA id i66sm22664925pfg.85.2020.01.15.07.53.55
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 15 Jan 2020 07:53:55 -0800 (PST)
From: Dejin Zheng <zhengdejin5@gmail.com>
To: peppe.cavallaro@st.com, alexandre.torgue@st.com, joabreu@synopsys.com,
 davem@davemloft.net, mcoquelin.stm32@gmail.com
Date: Wed, 15 Jan 2020 23:53:23 +0800
Message-Id: <20200115155323.15543-1-zhengdejin5@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: netdev@vger.kernel.org, Dejin Zheng <zhengdejin5@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH] net: stmmac: modified pcs mode support for
	RGMII
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

snps databook noted that physical coding sublayer (PCS) interface
that can be used when the MAC is configured for the TBI, RTBI, or
SGMII PHY interface. we have RGMII and SGMII in a SoC and it also
has the PCS block. it needs stmmac_init_phy and stmmac_mdio_register
function for initializing phy when it used RGMII interface.

Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c   | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 6f51a265459d..9778e7e0c005 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -387,9 +387,8 @@ bool stmmac_eee_init(struct stmmac_priv *priv)
 	/* Using PCS we cannot dial with the phy registers at this stage
 	 * so we do not support extra feature like EEE.
 	 */
-	if ((priv->hw->pcs == STMMAC_PCS_RGMII) ||
-	    (priv->hw->pcs == STMMAC_PCS_TBI) ||
-	    (priv->hw->pcs == STMMAC_PCS_RTBI))
+	if (priv->hw->pcs == STMMAC_PCS_TBI ||
+	    priv->hw->pcs == STMMAC_PCS_RTBI)
 		return false;
 
 	/* Check if MAC core supports the EEE feature. */
@@ -2652,8 +2651,7 @@ static int stmmac_open(struct net_device *dev)
 	u32 chan;
 	int ret;
 
-	if (priv->hw->pcs != STMMAC_PCS_RGMII &&
-	    priv->hw->pcs != STMMAC_PCS_TBI &&
+	if (priv->hw->pcs != STMMAC_PCS_TBI &&
 	    priv->hw->pcs != STMMAC_PCS_RTBI) {
 		ret = stmmac_init_phy(dev);
 		if (ret) {
@@ -4725,8 +4723,7 @@ int stmmac_dvr_probe(struct device *device,
 
 	stmmac_check_pcs_mode(priv);
 
-	if (priv->hw->pcs != STMMAC_PCS_RGMII  &&
-	    priv->hw->pcs != STMMAC_PCS_TBI &&
+	if (priv->hw->pcs != STMMAC_PCS_TBI &&
 	    priv->hw->pcs != STMMAC_PCS_RTBI) {
 		/* MDIO bus Registration */
 		ret = stmmac_mdio_register(ndev);
@@ -4760,8 +4757,7 @@ int stmmac_dvr_probe(struct device *device,
 error_netdev_register:
 	phylink_destroy(priv->phylink);
 error_phy_setup:
-	if (priv->hw->pcs != STMMAC_PCS_RGMII &&
-	    priv->hw->pcs != STMMAC_PCS_TBI &&
+	if (priv->hw->pcs != STMMAC_PCS_TBI &&
 	    priv->hw->pcs != STMMAC_PCS_RTBI)
 		stmmac_mdio_unregister(ndev);
 error_mdio_register:
@@ -4806,8 +4802,7 @@ int stmmac_dvr_remove(struct device *dev)
 		reset_control_assert(priv->plat->stmmac_rst);
 	clk_disable_unprepare(priv->plat->pclk);
 	clk_disable_unprepare(priv->plat->stmmac_clk);
-	if (priv->hw->pcs != STMMAC_PCS_RGMII &&
-	    priv->hw->pcs != STMMAC_PCS_TBI &&
+	if (priv->hw->pcs != STMMAC_PCS_TBI &&
 	    priv->hw->pcs != STMMAC_PCS_RTBI)
 		stmmac_mdio_unregister(ndev);
 	destroy_workqueue(priv->wq);
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
