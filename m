Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A4AA5E32E
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Mar 2025 18:57:02 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 713CDC78011;
	Wed, 12 Mar 2025 17:57:02 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 99179C7128F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Mar 2025 17:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ELtPug0i9sYUL+KNurYXq5o8o8QrKvtedx3uFu2ZYk4=; b=q8FeuJsN7tk0jIYeKrRIbI3M4L
 qdS+KCCiGpBGH6aXAxkRQ0VbZl3VYoBD40R3DRTmbZgmSlol7/PO3rJHy8+lyGQHlmTb+Ty9psR4V
 XlvtlC3f5rPcm8rtkOuSdgZFs7G3VZHgOvgCQbN95hhP2f3NNk31G0o/xvVPc+AcfSX9ax0hpWEZA
 vVa8FZBWONTVb7WoNPki6EaeWQI3EyJRU6ogVKIMhY2m+dRgjOAxkIEDO2W3dwJMoVhFavh/4gLf/
 Hw1PerJFMIqxaxlcwkYjQFMFyLgOXUbpPmutNNpVM4pCkR5kpcE1Q00uBd371DejM7cndyLZiWE6z
 8x8SIfPw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56474)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1tsQJz-0005yq-08;
 Wed, 12 Mar 2025 17:56:47 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1tsQJt-0004kK-3A;
 Wed, 12 Mar 2025 17:56:42 +0000
Date: Wed, 12 Mar 2025 17:56:41 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Swathi K S <swathi.ks@samsung.com>
Message-ID: <Z9HK2de5Ba_Vbeo7@shell.armlinux.org.uk>
References: <20250305091246.106626-1-swathi.ks@samsung.com>
 <CGME20250305091856epcas5p4228c09989c7acfe45a99541eef01fbcd@epcas5p4.samsung.com>
 <20250305091246.106626-3-swathi.ks@samsung.com>
 <Z8hjKI1ZqU19nrTP@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="KgFmUEDr5J23NjRy"
Content-Disposition: inline
In-Reply-To: <Z8hjKI1ZqU19nrTP@shell.armlinux.org.uk>
Cc: robh@kernel.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org,
 ravi.patel@samsung.com, devicetree@vger.kernel.org, netdev@vger.kernel.org,
 richardcochran@gmail.com, gost.dev@samsung.com,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, mcoquelin.stm32@gmail.com, pankaj.dubey@samsung.com,
 kuba@kernel.org, krzk+dt@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v8 2/2] net: stmmac: dwc-qos: Add FSD EQoS
	support
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
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--KgFmUEDr5J23NjRy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 05, 2025 at 02:43:52PM +0000, Russell King (Oracle) wrote:
> On Wed, Mar 05, 2025 at 02:42:46PM +0530, Swathi K S wrote:
> > The FSD SoC contains two instance of the Synopsys DWC ethernet QOS IP core.
> > The binding that it uses is slightly different from existing ones because
> > of the integration (clocks, resets).
> > 
> > Signed-off-by: Swathi K S <swathi.ks@samsung.com>
> 
> This looks much better!
> 
> Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> 
> Thanks!

Hi Swathi,

Please can you test with my TX clock gating series applied
( https://lore.kernel.org/r/Z9FVHEf3uUqtKzyt@shell.armlinux.org.uk )
with STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP set as per the attached diff.
Please let me know whether this passes your testing, so I know whether
this platform supports it - please check that this results in a
message in the kernel log indicating "tx_clk_stop = 1". Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

--KgFmUEDr5J23NjRy
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment;
	filename="stmmac-dwc-qos-eth-tx-clk-stop.diff"

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
index a94088b32c11..64867a65e875 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
@@ -363,6 +363,7 @@ static int dwc_eth_dwmac_probe(struct platform_device *pdev)
 
 	plat_dat->stmmac_clk = dwc_eth_find_clk(plat_dat,
 						data->stmmac_clk_name);
+	plat_dat->flags |= STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP;
 
 	if (data->probe)
 		ret = data->probe(pdev, plat_dat, &stmmac_res);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 6f29804148b6..b015240e4121 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1109,6 +1109,8 @@ static int stmmac_mac_enable_tx_lpi(struct phylink_config *config, u32 timer,
 	if (priv->plat->flags & STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP)
 		priv->tx_lpi_clk_stop = tx_clk_stop;
 
+	netdev_info(priv->dev, "tx_clk_stop = %u\n", priv->tx_lpi_clk_stop);
+
 	stmmac_set_eee_timer(priv, priv->hw, STMMAC_DEFAULT_LIT_LS,
 			     STMMAC_DEFAULT_TWT_LS);
 

--KgFmUEDr5J23NjRy
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--KgFmUEDr5J23NjRy--
