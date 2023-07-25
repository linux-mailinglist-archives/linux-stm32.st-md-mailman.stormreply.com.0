Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AE32776241A
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Jul 2023 23:04:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 55BCCC6A61A;
	Tue, 25 Jul 2023 21:04:56 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 42829C6905A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Jul 2023 21:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gjPsbkJgGKQCEAaIw+4CvOGfIWuqL8tQPEgzB7IKUFw=; b=jOCoIzIOQW+7dDTWROzc94ArUv
 ZHvd1xaiiFNCH6SfYuM5RlpgQLocgjGfbaCgw8/Sg49lcAo4AfQl5vmyoMvsEvE4gTncp1DQVS8RI
 sLjp6qTDeNNKr0u6JjmUFqiY61GPZThQI2GzifaacuOBY8ggIFghr8bWtKfOqVk8d89bK+suLfyF5
 RjEEsZa/XmX8ydXzOUrrlB8o4I9eBk0+AzeFGjSPUtwBZAwSm4zHm9gpw2wIXbT3gwyoQ/x7ULoJe
 V5AjG2SKBJLDqQ97flH283laIj1Tvf0THaHw+RiUL65J6WCS8qcWp5tXz05vnVKcArPS+NMroNP99
 FgmNeJyw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:49862)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1qOPCz-0002fG-3B;
 Tue, 25 Jul 2023 22:04:42 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1qOPCv-0002AG-HH; Tue, 25 Jul 2023 22:04:37 +0100
Date: Tue, 25 Jul 2023 22:04:37 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Shenwei Wang <shenwei.wang@nxp.com>
Message-ID: <ZMA45XUMM94GTjHx@shell.armlinux.org.uk>
References: <20230725194931.1989102-1-shenwei.wang@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230725194931.1989102-1-shenwei.wang@nxp.com>
Cc: imx@lists.linux.dev, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Frank Li <frank.li@nxp.com>, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: dwmac-imx: pause the TXC
	clock in fixed-link
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

On Tue, Jul 25, 2023 at 02:49:31PM -0500, Shenwei Wang wrote:
> +static bool imx_dwmac_is_fixed_link(struct imx_priv_data *dwmac)
> +{
> +	struct plat_stmmacenet_data *plat_dat;
> +	struct device_node *dn;
> +
> +	if (!dwmac || !dwmac->plat_dat)
> +		return false;
> +
> +	plat_dat = dwmac->plat_dat;
> +	dn = of_get_child_by_name(dwmac->dev->of_node, "fixed-link");
> +	if (!dn)
> +		return false;
> +
> +	if (plat_dat->phy_node == dn || plat_dat->phylink_node == dn)
> +		return true;

Why would the phy_node or the phylink_node ever be pointing at the
fixed-link node?

For one, phylink expects the fwnode being passed to it to be pointing
at the _parent_ node of the fixed-link node, since it looks up from
the parent for "fixed-link" node.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
