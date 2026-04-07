Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iLg+OhFp1GnptgcAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 07 Apr 2026 04:16:49 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 881703A8F26
	for <lists+linux-stm32@lfdr.de>; Tue, 07 Apr 2026 04:16:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 54F94C8F282;
	Tue,  7 Apr 2026 02:10:07 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D4F29C36B3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Apr 2026 02:10:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9F4A66133A;
 Tue,  7 Apr 2026 02:10:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDFAFC2BCB2;
 Tue,  7 Apr 2026 02:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1775527804;
 bh=ZIIp/+ZUoCnQFU4UxASiRQxcQE6IhtOQ6CK/qGpyTpk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YheRBWI9F1HtwM5G2yFcl/FwnK3egO39Fh7LQR9y1FIfLXGbOI8XXGmqxsOnBUXW9
 YL8KsmM170BEIkKX0kBJX057CRwyWOO2CLV30RDNLLcbmsLc0+6XObTTmwtJXCWCn7
 wGBEBWJEWCIpoOSwbFABvEe3w/u6CjzpfUAQi/SizmkqlqNO3c5t6RCEqF7UW4Ukx7
 9Sh/53wIf/nsDJPF8f9Xo6f+L4cI6QD4727REsxx16GfTCKmPj/Svcskl37NTaAnuh
 jDtSzPfNSvHofGxD4YIskqMnAHHVSsoR5cbgmL8sh7bVMxVHMbY+eiXv9NrPkHfTQO
 Wt9CKCQgD7mzQ==
From: Jakub Kicinski <kuba@kernel.org>
To: jitendra.vegiraju@broadcom.com
Date: Mon,  6 Apr 2026 19:10:01 -0700
Message-ID: <20260407021001.3674617-1-kuba@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260402213629.1996133-4-jitendra.vegiraju@broadcom.com>
References: <20260402213629.1996133-4-jitendra.vegiraju@broadcom.com>
MIME-Version: 1.0
Cc: quic_abchauha@quicinc.com, me@ziyao.cc, chenchuangyu@xiaomi.com,
 edumazet@google.com, lizhi2@eswincomputing.com, yangtiezhu@loongson.cn,
 linux-stm32@st-md-mailman.stormreply.com, weishangjuan@eswincomputing.com,
 daniel@iogearbox.net, chenhuacai@kernel.org, john.fastabend@gmail.com,
 siyanteng@cqsoftware.com.cn, sdf@fomichev.me,
 bcm-kernel-feedback-list@broadcom.com, vladimir.oltean@nxp.com,
 Jakub Kicinski <kuba@kernel.org>, pabeni@redhat.com, hawk@kernel.org,
 richardcochran@gmail.com, rohan.g.thomas@altera.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, ast@kernel.org,
 rmk+kernel@armlinux.org.uk, wens@kernel.org,
 linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
 florian.fainelli@broadcom.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch, boon.khai.ng@altera.com,
 horms@kernel.org, bpf@vger.kernel.org, davem@davemloft.net,
 ovidiu.panait.rb@renesas.com
Subject: Re: [Linux-stm32] [PATCH net-next v9 3/4] net: stmmac: Add PCI glue
	driver for BCM8958x
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
X-Spamd-Result: default: False [5.79 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[36];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[kuba@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[quicinc.com,ziyao.cc,xiaomi.com,google.com,eswincomputing.com,loongson.cn,st-md-mailman.stormreply.com,iogearbox.net,kernel.org,gmail.com,cqsoftware.com.cn,fomichev.me,broadcom.com,nxp.com,redhat.com,altera.com,bp.renesas.com,armlinux.org.uk,lists.infradead.org,vger.kernel.org,lunn.ch,davemloft.net,renesas.com];
	FORGED_RECIPIENTS(0.00)[m:jitendra.vegiraju@broadcom.com,m:quic_abchauha@quicinc.com,m:me@ziyao.cc,m:chenchuangyu@xiaomi.com,m:edumazet@google.com,m:lizhi2@eswincomputing.com,m:yangtiezhu@loongson.cn,m:linux-stm32@st-md-mailman.stormreply.com,m:weishangjuan@eswincomputing.com,m:daniel@iogearbox.net,m:chenhuacai@kernel.org,m:john.fastabend@gmail.com,m:siyanteng@cqsoftware.com.cn,m:sdf@fomichev.me,m:bcm-kernel-feedback-list@broadcom.com,m:vladimir.oltean@nxp.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:hawk@kernel.org,m:richardcochran@gmail.com,m:rohan.g.thomas@altera.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:ast@kernel.org,m:rmk+kernel@armlinux.org.uk,m:wens@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:mcoquelin.stm32@gmail.com,m:florian.fainelli@broadcom.com,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:boon.khai.ng@altera.com,m:horms@kernel.org,m:bpf@vger.kernel.org,m:davem@davemloft.net,m:ovidiu.panait.rb@renesas.com,m:johnfastabend@
 gmail.com,m:rmk@armlinux.org.uk,m:mcoquelinstm32@gmail.com,m:andrew@lunn.ch,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,kernel,netdev];
	NEURAL_SPAM(0.00)[0.766];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 881703A8F26
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
---
Date:   Thu Apr 2 21:36:28 2026 +0000

    net: stmmac: Add PCI glue driver for BCM8958x

    Add pci ethernet driver support for Broadcom BCM8958x soc devices used
    in automotive applications. This device features a pcie ethernet mac
    directly attached to an integrated ethernet switch using an xgmii interface.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-brcm.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-brcm.c
> new file mode 100644
> index 0000000000000..e8c6b4b618acb
> --- /dev/null
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-brcm.c
[ ... ]
> +static const struct software_node *brcm_swnodes[] = {
> +	&parent_swnode,
> +	&fixed_link_swnode,
> +	NULL
> +};

Will this statically allocated global software node array cause issues if
multiple devices are present?

If a second device is probed, software_node_register_node_group might fail
with an error. Additionally, if one device is unbound, unregistering the
group could destroy the global nodes, causing a use-after-free for any other
active instances.

Could these software nodes be dynamically allocated per-device?

[ ... ]
> +static int brcm_drv_init(struct device *dev, void *bsp_priv)
> +{
> +	struct brcm_priv_data *brcm_priv = (struct brcm_priv_data *)bsp_priv;
> +	struct pci_dev *pdev = to_pci_dev(dev);
> +	int vector;
> +	int ret;
> +
> +	/* This device is directly attached to the switch chip internal to the
> +	 * SoC using XGMII interface. Since no MDIO is present, register
> +	 * fixed-link software_node to create phylink.
> +	 */
> +	ret = software_node_register_node_group(brcm_swnodes);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "failed to register software_node\n");
> +	device_set_node(dev, software_node_fwnode(&parent_swnode));

Does device_set_node overwrite the device's primary firmware node here?

Using device_set_node can destroy existing acpi or device tree companion
nodes. Would it be safer to use device_add_software_node instead to attach
the node without overwriting the primary firmware node?

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

[ ... ]

> +static void brcm_drv_exit_cleanup(struct device *dev, void *bsp_priv)
> +{
> +	struct pci_dev *pdev = to_pci_dev(dev);
> +
> +	device_set_node(&pdev->dev, NULL);
> +	software_node_unregister_node_group(brcm_swnodes);
> +}

If device_set_node is called with NULL, will it leave the device permanently
mangled without its original firmware node upon unbind?

[ ... ]
> +static int brcm_pci_resume(struct device *dev, void *bsp_priv)
> +{
> +	/* Enable Switch Link */
> +	misc_iowrite(bsp_priv, XGMAC_PCIE_MISC_MII_CTRL_OFFSET,
> +		     XGMAC_PCIE_MISC_MII_CTRL_PAUSE_RX |
> +		     XGMAC_PCIE_MISC_MII_CTRL_PAUSE_TX |
> +		     XGMAC_PCIE_MISC_MII_CTRL_LINK_UP);
> +
> +	return stmmac_pci_plat_resume(dev, bsp_priv);
> +}

Will the hardware state configured in brcm_drv_init be fully restored after
a suspend and resume cycle?

When a pci device resumes from suspend, its internal state is typically reset
to defaults. Since the pci core's pci_save_state does not save arbitrary mmio
registers or custom extended configuration registers, it appears the msi-x
routing and address match configurations programmed during probe might be
lost.

Could this cause the msi-x interrupts to stop working after resume?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
