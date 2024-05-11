Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7CF8C3385
	for <lists+linux-stm32@lfdr.de>; Sat, 11 May 2024 21:34:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0A629C6907A;
	Sat, 11 May 2024 19:34:47 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 747B4C03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 11 May 2024 19:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=w0vU8RMKEb5MAwtOYOzKjXM4x8mAAk3i9b0LbBNQJ0c=; b=DhPwpPvYtTPMPM5y2NYb+kLshS
 FsmAdMpbWJOJQCl8LDe713iU8PEoyMf61+gp3VRpsxUTzKCPJ5gSOFPZ1zdFn1qr2r7K9GJvP0Z0c
 1/c7gpeKs2tpmCwn/bGuPr8rqN6imEtd6SLS6wiPGDexUq4BXuKxKlbdFrrjtbyUOoYBkUIDpfsIe
 sKCt42Y/G1yMRmI5kx2H4RnZUgR7eUDj/bWYFLRdUhZgCIwxRiClnrY07cPgEeHRSX8TvGdO5/WOg
 vMPQZ8itsE/BUtHV5MrTCj6/jheHx8Z3dauR8+rgbWUCXrFXc+DG+9XX/VyiOkhilKdbik/2p7eIl
 bYXTYKug==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:57162)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1s5sUD-0000B6-0D;
 Sat, 11 May 2024 20:34:25 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1s5sUA-0004VK-W4; Sat, 11 May 2024 20:34:23 +0100
Date: Sat, 11 May 2024 20:34:22 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
Message-ID: <Zj/IPpub11OL3jBo@shell.armlinux.org.uk>
References: <20240510000331.154486-3-jitendra.vegiraju@broadcom.com>
 <20240511015924.41457-1-jitendra.vegiraju@broadcom.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240511015924.41457-1-jitendra.vegiraju@broadcom.com>
Cc: netdev@vger.kernel.org, richardcochran@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 edumazet@google.com, joabreu@synopsys.com,
 bcm-kernel-feedback-list@broadcom.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2, net-next,
 2/2] net: stmmac: PCI driver for BCM8958X SoC
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

Hi,

Thanks for the patch,. but there are things that need some improvement.

On Fri, May 10, 2024 at 06:59:24PM -0700, Jitendra Vegiraju wrote:
> +static void dwxgmac_brcm_dma_init_tx_chan(struct stmmac_priv *priv,
> +					  void __iomem *ioaddr,
> +					  struct stmmac_dma_cfg *dma_cfg,
> +					  dma_addr_t phy, u32 chan)
> +{
> +	u32 value;
> +
> +	value = readl(ioaddr + XGMAC_DMA_CH_TX_CONTROL(chan));
> +	value &= ~XGMAC_TxPBL;
> +	value &= ~GENMASK(6, 4);
> +	writel(value, ioaddr + XGMAC_DMA_CH_TX_CONTROL(chan));
> +
> +	writel(upper_32_bits(phy), ioaddr + XGMAC_DMA_CH_TxDESC_HADDR(chan));
> +	writel(lower_32_bits(phy), ioaddr + XGMAC_DMA_CH_TxDESC_LADDR(chan));

Please use "dma_addr" not "phy" here. "phy" could mean ethernet phy.
I personally dislike "physical address" for DMA stuff because if
there's an IOMMU or other translation layer present, what you have
here is *not* a physical address.

> +static void dwxgmac_brcm_dma_init_rx_chan(struct stmmac_priv *priv,
> +					  void __iomem *ioaddr,
> +					  struct stmmac_dma_cfg *dma_cfg,
> +					  dma_addr_t phy, u32 chan)
> +{
> +	u32 value;
> +
> +	value = readl(ioaddr + XGMAC_DMA_CH_RX_CONTROL(chan));
> +	value &= ~XGMAC_RxPBL;
> +	writel(value, ioaddr + XGMAC_DMA_CH_RX_CONTROL(chan));
> +
> +	writel(upper_32_bits(phy), ioaddr + XGMAC_DMA_CH_RxDESC_HADDR(chan));
> +	writel(lower_32_bits(phy), ioaddr + XGMAC_DMA_CH_RxDESC_LADDR(chan));

Ditto.

...

> +static void dwxgmac_brcm_fix_speed(void *priv, unsigned int speed,
> +				   unsigned int mode)
> +{
> +}

If this is empty, do you really need it? The method is optional.

...

> +static int dwxgmac_brcm_pci_probe(struct pci_dev *pdev,
> +				  const struct pci_device_id *id)
> +{
...
> +	/* This device interface is directly attached to the switch chip on
> +	 *  the SoC. Since no MDIO is present, register fixed_phy.
> +	 */
> +	brcm_priv->phy_dev =
> +		 fixed_phy_register(PHY_POLL,
> +				    &dwxgmac_brcm_fixed_phy_status, NULL);
> +	if (IS_ERR(brcm_priv->phy_dev)) {
> +		dev_err(&pdev->dev, "%s\tNo PHY/fixed_PHY found\n", __func__);
> +		return -ENODEV;
> +	}
> +	phy_attached_info(brcm_priv->phy_dev);

As pointed out in the other sub-thread, you don't need this. If you need
a fixed-link and you don't have a firmware description of it, you can
provide a swnode based description through plat->port_node that will be
passed to phylink. Through that, you can tell phylink to create a
fixed link.

> +	ret = stmmac_dvr_probe(&pdev->dev, plat, &res);
> +	if (ret)
> +		goto err_disable_msi;
> +
> +	/* The stmmac core driver doesn't have the infrastructure to
> +	 * support fixed-phy mdio bus for non-platform bus drivers.
> +	 * Until a better solution is implemented, initialize the
> +	 * following entries after priv structure is populated.
> +	 */
> +	ndev = dev_get_drvdata(&pdev->dev);
> +	priv = netdev_priv(ndev);
> +	priv->mii = mdio_find_bus("fixed-0");
> +
> +	ndev->hw_features &= ~NETIF_F_HW_VLAN_CTAG_RX;
> +	priv->hw->hw_vlan_en = false;

Basically... no. Do not do any setup after stmmac_dvr_probe(), because
the network device has already been registered and published to
userspace, and userspace may have already opened the network device.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
