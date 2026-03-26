Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Iw7BjJlxWkn+AQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 26 Mar 2026 17:56:18 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F60338CAD
	for <lists+linux-stm32@lfdr.de>; Thu, 26 Mar 2026 17:56:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0A98BC8F26C;
	Thu, 26 Mar 2026 16:56:17 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4B5AEC87EC6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Mar 2026 16:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tNUmiKN4fF40nM9pWiE85RUF4sgRs4iO5/OLdhEvvt4=; b=kXY46qQT5qzcTwqCfrKvP11HGq
 t7K+Nj3BlywQwKVJHBo32nOQW961sBOhNM6FQDhIUViBvKHq2iNyA0rr8m9TTygVEJKRLscoxMdrN
 7eaXMTw69WouHlGL6LfWeaByyS3LZp7/hcu20kvS8I9S1VBSzNho0lCpzd5ZO93U/40k0INfLkEub
 FlGjH1w8/zMZDQDGK9O1d17QLcyATzlzoDcmXHrdWVgegDsWEoSeznIXxz3pNCKXKGh2pH/C+NvTL
 W++2TONR/xO0GHxc8BV6hHNBpIHnuZjZQhN51+sU9938mKQCKmCAUXWxlYhPgCXKwBD53W+PvXvl/
 vEnpYZbg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:35442)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1w5nzr-0000000052T-3jxv;
 Thu, 26 Mar 2026 16:55:51 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1w5nzg-000000007C9-0FDQ; Thu, 26 Mar 2026 16:55:40 +0000
Date: Thu, 26 Mar 2026 16:55:39 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
Message-ID: <acVlC3v0Hyt94XDN@shell.armlinux.org.uk>
References: <20260320211921.1202058-1-jitendra.vegiraju@broadcom.com>
 <20260320211921.1202058-5-jitendra.vegiraju@broadcom.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260320211921.1202058-5-jitendra.vegiraju@broadcom.com>
Cc: quic_abchauha@quicinc.com, me@ziyao.cc, chenchuangyu@xiaomi.com,
 edumazet@google.com, lizhi2@eswincomputing.com, yangtiezhu@loongson.cn,
 linux-stm32@st-md-mailman.stormreply.com, weishangjuan@eswincomputing.com,
 daniel@iogearbox.net, chenhuacai@kernel.org, john.fastabend@gmail.com,
 siyanteng@cqsoftware.com.cn, sdf@fomichev.me,
 bcm-kernel-feedback-list@broadcom.com, vladimir.oltean@nxp.com,
 kuba@kernel.org, pabeni@redhat.com, hawk@kernel.org, richardcochran@gmail.com,
 rohan.g.thomas@altera.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 ast@kernel.org, wens@kernel.org, linux-arm-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, florian.fainelli@broadcom.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch,
 boon.khai.ng@altera.com, horms@kernel.org, bpf@vger.kernel.org,
 davem@davemloft.net, ovidiu.panait.rb@renesas.com
Subject: Re: [Linux-stm32] [PATCH net-next v8 4/6] Add PCI driver support
	for BCM8958x
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
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:jitendra.vegiraju@broadcom.com,m:quic_abchauha@quicinc.com,m:me@ziyao.cc,m:chenchuangyu@xiaomi.com,m:edumazet@google.com,m:lizhi2@eswincomputing.com,m:yangtiezhu@loongson.cn,m:linux-stm32@st-md-mailman.stormreply.com,m:weishangjuan@eswincomputing.com,m:daniel@iogearbox.net,m:chenhuacai@kernel.org,m:john.fastabend@gmail.com,m:siyanteng@cqsoftware.com.cn,m:sdf@fomichev.me,m:bcm-kernel-feedback-list@broadcom.com,m:vladimir.oltean@nxp.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:hawk@kernel.org,m:richardcochran@gmail.com,m:rohan.g.thomas@altera.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:ast@kernel.org,m:wens@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:mcoquelin.stm32@gmail.com,m:florian.fainelli@broadcom.com,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:boon.khai.ng@altera.com,m:horms@kernel.org,m:bpf@vger.kernel.org,m:davem@davemloft.net,m:ovidiu.panait.rb@renesas.com,m:johnfastabend@gmail.com,m:mcoquelinstm32@gm
 ail.com,m:andrew@lunn.ch,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[35];
	FREEMAIL_CC(0.00)[quicinc.com,ziyao.cc,xiaomi.com,google.com,eswincomputing.com,loongson.cn,st-md-mailman.stormreply.com,iogearbox.net,kernel.org,gmail.com,cqsoftware.com.cn,fomichev.me,broadcom.com,nxp.com,redhat.com,altera.com,bp.renesas.com,lists.infradead.org,vger.kernel.org,lunn.ch,davemloft.net,renesas.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.576];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[armlinux.org.uk:url,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 85F60338CAD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 20, 2026 at 02:19:19PM -0700, Jitendra Vegiraju wrote:
> +static const struct property_entry fixed_link_properties[] = {
> +	PROPERTY_ENTRY_U32("speed", 10000),
> +	PROPERTY_ENTRY_BOOL("full-duplex"),
> +	PROPERTY_ENTRY_BOOL("pause"),
> +	{ }
> +};
> +
> +static const struct software_node parent_swnode = {
> +	.name = "phy-device",
> +};
> +
> +static const struct software_node fixed_link_swnode = {
> +	.name = "fixed-link",           /* MUST be named "fixed-link" */
> +	.parent = &parent_swnode,
> +	.properties = fixed_link_properties,
> +};
> +
> +static const struct software_node *brcm_swnodes[] = {
> +	&parent_swnode,
> +	&fixed_link_swnode,
> +	NULL
> +};

Looking at this structure, I'm not sure it's correct. You seem to have:

pci_device
- "phy-device" swnode attached here (which describes the PCI device,
  which isn't any kind of PHY)
	- "fixed-link" attached as a child

The "fixed-link" is a property for the local network device which
signifies that there isn't a PHY attached or there's an inaccessible
PHY that only operates with one set of settings.

Maybe rename "phy-device" to "ethernet"?

> +
> +struct brcm_priv_data {
> +	void __iomem *mbox_regs;    /* MBOX  Registers*/
> +	void __iomem *misc_regs;    /* MISC  Registers*/
> +	void __iomem *xgmac_regs;   /* XGMAC Registers*/
> +};
> +
> +struct dwxgmac_brcm_pci_info {
> +	int (*setup)(struct pci_dev *pdev, struct plat_stmmacenet_data *plat);
> +};
> +
> +static void misc_iowrite(struct brcm_priv_data *brcm_priv,
> +			 u32 reg, u32 val)
> +{
> +	iowrite32(val, brcm_priv->misc_regs + reg);
> +}
> +
> +static void dwxgmac_brcm_common_default_data(struct plat_stmmacenet_data *plat)
> +{
> +	int i;
> +
> +	plat->force_sf_dma_mode = true;
> +	plat->mac_port_sel_speed = SPEED_10000;
> +	plat->clk_ptp_rate = 125000000;
> +	plat->clk_ref_rate = 250000000;
> +	plat->tx_coe = true;
> +	plat->rx_coe = STMMAC_RX_COE_TYPE1;
> +	plat->rss_en = 1;
> +	plat->max_speed = SPEED_10000;
> +
> +	/* Set default value for multicast hash bins */
> +	plat->multicast_filter_bins = HASH_TABLE_SIZE;

Already the default setup by stmmac_plat_dat_alloc().

> +
> +	/* Set default value for unicast filter entries */
> +	plat->unicast_filter_entries = 1;

Already the default setup by stmmac_plat_dat_alloc().

> +
> +	/* Set the maxmtu to device's default */
> +	plat->maxmtu = BRCM_MAX_MTU;
> +
> +	/* Set default number of RX and TX queues to use */
> +	plat->tx_queues_to_use = BRCM_TX_Q_COUNT;
> +	plat->rx_queues_to_use = BRCM_RX_Q_COUNT;
> +
> +	plat->tx_sched_algorithm = MTL_TX_ALGORITHM_SP;
> +	for (i = 0; i < plat->tx_queues_to_use; i++) {
> +		plat->tx_queues_cfg[i].use_prio = false;

Already false.

> +		plat->tx_queues_cfg[i].prio = 0;

Already zero.

> +		plat->tx_queues_cfg[i].mode_to_use = MTL_QUEUE_AVB;

Since MTL_QUEUE_AVB is zero, this is already the case.

> +	}

All three points taken together mean that this loop is not required
as all these members are being explicitly set to values of zero,
which they already hold.

> +
> +	plat->rx_sched_algorithm = MTL_RX_ALGORITHM_SP;
> +	for (i = 0; i < plat->rx_queues_to_use; i++) {
> +		plat->rx_queues_cfg[i].use_prio = false;

Already false.

> +		plat->rx_queues_cfg[i].mode_to_use = MTL_QUEUE_AVB;

Since MTL_QUEUE_AVB is zero, this is already the case.

> +		plat->rx_queues_cfg[i].pkt_route = 0x0;

Already zero.

> +		plat->rx_queues_cfg[i].chan = i;

stmmac_plat_dat_alloc() already initialises plat->rx_queues_cfg[].chan.

> +	}

Taking all these points together, it means that this loop also isn't
required, since you're not changing anything that hasn't already been
setup.

> +}
> +
> +static int dwxgmac_brcm_default_data(struct pci_dev *pdev,
> +				     struct plat_stmmacenet_data *plat)
> +{
> +	/* Set common default data first */
> +	dwxgmac_brcm_common_default_data(plat);
> +	plat->core_type = DWMAC_CORE_25GMAC;
> +	plat->bus_id = 0;

The underlying devm_kzalloc() which allocates "plat" will clear the
struct to zeros, so this assignment to bus_id shouldn't be necessary.

> +	plat->phy_addr = 0;

You said there's no MDIO bus, so I don't think you need to initialise
plat->phy_addr. stmmac_plat_dat_alloc() will set this to -1.

> +	plat->phy_interface = PHY_INTERFACE_MODE_XGMII;
> +
> +	plat->dma_cfg->pbl = DEFAULT_DMA_PBL;
> +	plat->dma_cfg->pblx8 = true;
> +	plat->dma_cfg->aal = false;
> +	plat->dma_cfg->eame = true;
> +
> +	plat->axi->axi_wr_osr_lmt = 31;
> +	plat->axi->axi_rd_osr_lmt = 31;
> +	plat->axi->axi_fb = false;

devm_kzalloc() which is used to allocate plat->axi in the probe function
will zero out this structure, so axi_fb will already be false.

> +	plat->axi->axi_blen_regval = DMA_AXI_BLEN64;
> +	return 0;
> +}
> +
> +static struct dwxgmac_brcm_pci_info dwxgmac_brcm_pci_info = {
> +	.setup = dwxgmac_brcm_default_data,
> +};

It looks to me like this is a copy of stmmac_pci.c / dwmac-intel.c etc.
Do you know for certain that you're going to need to do different
setups depending on the PCI device?

What's the reasoning for the split between
dwxgmac_brcm_common_default_data() and dwxgmac_brcm_default_data() ?

> +
> +static void brcm_config_misc_regs(struct pci_dev *pdev,
> +				  struct brcm_priv_data *brcm_priv)
> +{
> +	pci_write_config_dword(pdev, XGMAC_PCIE_CFG_MSIX_ADDR_MATCH_LOW,
> +			       XGMAC_PCIE_CFG_MSIX_ADDR_MATCH_LO_VALUE);
> +	pci_write_config_dword(pdev, XGMAC_PCIE_CFG_MSIX_ADDR_MATCH_HIGH,
> +			       XGMAC_PCIE_CFG_MSIX_ADDR_MATCH_HI_VALUE);
> +
> +	misc_iowrite(brcm_priv, XGMAC_PCIE_MISC_MSIX_ADDR_MATCH_LO_OFFSET,
> +		     XGMAC_PCIE_MISC_MSIX_ADDR_MATCH_LO_VALUE);
> +	misc_iowrite(brcm_priv, XGMAC_PCIE_MISC_MSIX_ADDR_MATCH_HI_OFFSET,
> +		     XGMAC_PCIE_MISC_MSIX_ADDR_MATCH_HI_VALUE);
> +
> +	/* Enable Switch Link */
> +	misc_iowrite(brcm_priv, XGMAC_PCIE_MISC_MII_CTRL_OFFSET,
> +		     XGMAC_PCIE_MISC_MII_CTRL_PAUSE_RX |
> +		     XGMAC_PCIE_MISC_MII_CTRL_PAUSE_TX |
> +		     XGMAC_PCIE_MISC_MII_CTRL_LINK_UP);
> +}
> +
> +static int brcm_config_multi_msi(struct pci_dev *pdev,
> +				 struct plat_stmmacenet_data *plat,
> +				 struct stmmac_resources *res)
> +{
> +	int ret;
> +	int i;
> +
> +	ret = pci_alloc_irq_vectors(pdev, BRCM_XGMAC_MSI_VECTOR_MAX,
> +				    BRCM_XGMAC_MSI_VECTOR_MAX,
> +				    PCI_IRQ_MSI | PCI_IRQ_MSIX);
> +	if (ret < 0) {
> +		dev_err(&pdev->dev, "%s: multi MSI enablement failed\n",
> +			__func__);
> +		return ret;
> +	}
> +
> +	/* For RX MSI */
> +	for (i = 0; i < plat->rx_queues_to_use; i++)
> +		res->rx_irq[i] =
> +			pci_irq_vector(pdev,
> +				       BRCM_XGMAC_MSI_RX_VECTOR_START + i * 2);
> +
> +	/* For TX MSI */
> +	for (i = 0; i < plat->tx_queues_to_use; i++)
> +		res->tx_irq[i] =
> +			pci_irq_vector(pdev,
> +				       BRCM_XGMAC_MSI_TX_VECTOR_START + i * 2);
> +
> +	res->irq = pci_irq_vector(pdev, BRCM_XGMAC_MSI_MAC_VECTOR);
> +
> +	plat->flags |= STMMAC_FLAG_MULTI_MSI_EN;
> +	plat->flags |= STMMAC_FLAG_TSO_EN;
> +	plat->flags |= STMMAC_FLAG_SPH_DISABLE;
> +	return 0;
> +}
> +
> +static int brcm_pci_resume(struct device *dev, void *bsp_priv)
> +{
> +	struct pci_dev *pdev = to_pci_dev(dev);
> +
> +	brcm_config_misc_regs(pdev, bsp_priv);

Is it worth declaring struct pdev for one place that it's used?

	brcm_config_misc_regs(to_pci_dev(dev), bsp_priv);

should work just as well.

> +
> +	return stmmac_pci_plat_resume(dev, bsp_priv);
> +}
> +
> +static int dwxgmac_brcm_pci_probe(struct pci_dev *pdev,
> +				  const struct pci_device_id *id)
> +{
> +	struct dwxgmac_brcm_pci_info *info =
> +		(struct dwxgmac_brcm_pci_info *)id->driver_data;
> +	struct plat_stmmacenet_data *plat;
> +	struct brcm_priv_data *brcm_priv;
> +	struct stmmac_resources res;
> +	struct device *dev;
> +	int rx_offset;
> +	int tx_offset;
> +	int vector;
> +	int ret;
> +
> +	dev = &pdev->dev;

As you go to the effort of declaring a struct device pointer, and
assign it, do you think it would be a good idea to either use it for
all &pdev->dev instances below, or just get rid of the two instances
that you actually use "dev" ?

I count six instances of "&pdev->dev" below vs two making use of "dev"
directly.

> +
> +	brcm_priv = devm_kzalloc(&pdev->dev, sizeof(*brcm_priv), GFP_KERNEL);
> +	if (!brcm_priv)
> +		return -ENOMEM;
> +
> +	plat = stmmac_plat_dat_alloc(dev);
> +	if (!plat)
> +		return -ENOMEM;
> +
> +	plat->axi = devm_kzalloc(&pdev->dev, sizeof(*plat->axi), GFP_KERNEL);
> +	if (!plat->axi)
> +		return -ENOMEM;
> +
> +	/* This device is directly attached to the switch chip internal to the
> +	 * SoC using XGMII interface. Since no MDIO is present, register
> +	 * fixed-link software_node to create phylink.
> +	 */
> +	software_node_register_node_group(brcm_swnodes);
> +	device_set_node(dev, software_node_fwnode(&parent_swnode));
> +
> +	/* Disable D3COLD as our device does not support it */
> +	pci_d3cold_disable(pdev);
> +
> +	/* Enable PCI device */
> +	ret = pcim_enable_device(pdev);
> +	if (ret) {
> +		dev_err(&pdev->dev, "%s: ERROR: failed to enable device\n",
> +			__func__);
> +		return ret;

What about cleaning up the swnodes ?

> +	}
> +
> +	pci_set_master(pdev);
> +
> +	memset(&res, 0, sizeof(res));
> +	res.addr = pcim_iomap_region(pdev, 0, pci_name(pdev));
> +	if (IS_ERR(res.addr))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(res.addr),
> +				     "failed to map IO region\n");

Convention is to have a blank line here.

> +	/* MISC Regs */
> +	brcm_priv->misc_regs = res.addr + BRCM_XGMAC_IOMEM_MISC_REG_OFFSET;
> +	/* MBOX Regs */
> +	brcm_priv->mbox_regs = res.addr + BRCM_XGMAC_IOMEM_MBOX_REG_OFFSET;
> +	/* XGMAC config Regs */
> +	res.addr += BRCM_XGMAC_IOMEM_CFG_REG_OFFSET;
> +	brcm_priv->xgmac_regs = res.addr;
> +
> +	plat->suspend		= stmmac_pci_plat_suspend;
> +	plat->resume		= brcm_pci_resume;
> +	plat->bsp_priv = brcm_priv;
> +
> +	ret = info->setup(pdev, plat);
> +	if (ret)
> +		return ret;

What about cleaning up the swnodes ?

> +
> +	pci_write_config_dword(pdev, XGMAC_PCIE_CFG_MSIX_ADDR_MATCH_LOW,
> +			       XGMAC_PCIE_CFG_MSIX_ADDR_MATCH_LO_VALUE);
> +	pci_write_config_dword(pdev, XGMAC_PCIE_CFG_MSIX_ADDR_MATCH_HIGH,
> +			       XGMAC_PCIE_CFG_MSIX_ADDR_MATCH_HI_VALUE);
> +
> +	misc_iowrite(brcm_priv, XGMAC_PCIE_MISC_MSIX_ADDR_MATCH_LO_OFFSET,
> +		     XGMAC_PCIE_MISC_MSIX_ADDR_MATCH_LO_VALUE);
> +	misc_iowrite(brcm_priv, XGMAC_PCIE_MISC_MSIX_ADDR_MATCH_HI_OFFSET,
> +		     XGMAC_PCIE_MISC_MSIX_ADDR_MATCH_HI_VALUE);
> +
> +	/* SBD Interrupt */
> +	misc_iowrite(brcm_priv, XGMAC_PCIE_MISC_MSIX_VECTOR_MAP_SBD_ALL_OFFSET,
> +		     XGMAC_PCIE_MISC_MSIX_VECTOR_MAP_SBD_ALL_VALUE);
> +	/* EP_DOORBELL Interrupt */
> +	misc_iowrite(brcm_priv,
> +		     XGMAC_PCIE_MISC_MSIX_VECTOR_MAP_EP2HOST_DBELL_OFFSET,
> +		     XGMAC_PCIE_MISC_MSIX_VECTOR_MAP_EP2HOST_DBELL_VALUE);
> +	/* EP_H0 Interrupt */
> +	misc_iowrite(brcm_priv,
> +		     XGMAC_PCIE_MISC_MSIX_VECTOR_MAP_EP2HOST0_OFFSET,
> +		     XGMAC_PCIE_MISC_MSIX_VECTOR_MAP_EP2HOST0_VALUE);
> +	/* EP_H1 Interrupt */
> +	misc_iowrite(brcm_priv,
> +		     XGMAC_PCIE_MISC_MSIX_VECTOR_MAP_EP2HOST1_OFFSET,
> +		     XGMAC_PCIE_MISC_MSIX_VECTOR_MAP_EP2HOST1_VALUE);
> +
> +	rx_offset = XGMAC_PCIE_MISC_MSIX_VECTOR_MAP_RX0_PF0_OFFSET;
> +	tx_offset = XGMAC_PCIE_MISC_MSIX_VECTOR_MAP_TX0_PF0_OFFSET;
> +	vector = BRCM_XGMAC_MSI_RX_VECTOR_START;
> +	for (int i = 0; i < BRCM_MAX_DMA_CHANNEL_PAIRS; i++) {
> +		/* RX Interrupt */
> +		misc_iowrite(brcm_priv, rx_offset, vector++);
> +		/* TX Interrupt */
> +		misc_iowrite(brcm_priv, tx_offset, vector++);
> +		rx_offset += 4;
> +		tx_offset += 4;
> +	}

It looks like this device can program the MSI vector numbers. Does
it make sense to interleave them, or would it be simpler to have
all the receive vectors and then all the transmit vectors?

This also hard-codes the fact that BRCM_XGMAC_MSI_TX_VECTOR_START
is one more than BRCM_XGMAC_MSI_RX_VECTOR_START, which isn't nice
given that you use these macros when claiming the MSI vectors.

> +
> +	/* Enable Switch Link */
> +	misc_iowrite(brcm_priv, XGMAC_PCIE_MISC_MII_CTRL_OFFSET,
> +		     XGMAC_PCIE_MISC_MII_CTRL_PAUSE_RX |
> +		     XGMAC_PCIE_MISC_MII_CTRL_PAUSE_TX |
> +		     XGMAC_PCIE_MISC_MII_CTRL_LINK_UP);
> +	/* Enable MSI-X */
> +	misc_iowrite(brcm_priv, XGMAC_PCIE_MISC_PCIESS_CTRL_OFFSET,
> +		     XGMAC_PCIE_MISC_PCIESS_CTRL_EN_MSI_MSIX);
> +
> +	ret = brcm_config_multi_msi(pdev, plat, &res);
> +	if (ret) {
> +		dev_err(&pdev->dev,
> +			"%s: ERROR: failed to enable IRQ\n", __func__);
> +		goto err_disable_msi;
> +	}
> +
> +	ret = stmmac_dvr_probe(&pdev->dev, plat, &res);
> +	if (ret)
> +		goto err_disable_msi;
> +
> +	return ret;
> +
> +err_disable_msi:
> +	pci_free_irq_vectors(pdev);

This is still buggy. What about cleaning up the swnodes?

> +
> +	return ret;
> +}
> +
> +static void dwxgmac_brcm_pci_remove(struct pci_dev *pdev)
> +{
> +	stmmac_dvr_remove(&pdev->dev);
> +	pci_free_irq_vectors(pdev);
> +	device_set_node(&pdev->dev, NULL);
> +	software_node_unregister_node_group(brcm_swnodes);

As the remove function does way more cleanup than the probe function,
this is a sign that the probe function is buggy. This is exactly why
I suggested using ->init and ->exit in the previous review. I seem
to have been ignored on that though... and the problem I already
pointed out remains.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
