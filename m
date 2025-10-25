Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E61C09ED1
	for <lists+linux-stm32@lfdr.de>; Sat, 25 Oct 2025 20:55:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6632EC555B2;
	Sat, 25 Oct 2025 18:55:54 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 944AFC36B35
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 25 Oct 2025 18:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HTLUk2cykw6OFLMC01Dpv7tO1vfeV3GRVIgXsjbKndY=; b=Lhs6jECYFlVfRfYyszEQDhrJrq
 jg1Fd892lnyCUXfBbncAgp8wNRGa+K8ldAOvSc37+1mY8N7cBmgyoQQX1/dCIrOB/G38Nq1XANWdH
 9n89I6dSINhe4p3iswDnfIyqY+lEtoNcc4u7orw4+361uzqVvZBWfrYXcvTMOQZUU68TG5jHJ9RGa
 ec7DDl0fE3L2ZU5bhxI8HliaGmzWMQBwQA19HDc6jMR8Ek+0Y9BdAsPyBu77ck3xXPNcuwYtytH+5
 PGxQgJeijxXPQVw0Qw9UBYhXquKd1JgewO9wsRX2JQ5ThzwCKvFpUKkizcttlSrXEGbo1cPUI8dcn
 X4K7mrpA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:42836)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1vCjQU-000000000JQ-2u3H;
 Sat, 25 Oct 2025 19:55:42 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1vCjQS-000000003u4-2n3X; Sat, 25 Oct 2025 19:55:40 +0100
Date: Sat, 25 Oct 2025 19:55:40 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Message-ID: <aP0dLKF8rXk6gU8j@shell.armlinux.org.uk>
References: <20251024-v6-12-topic-socfpga-agilex5-v5-0-4c4a51159eeb@pengutronix.de>
 <20251024-v6-12-topic-socfpga-agilex5-v5-1-4c4a51159eeb@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251024-v6-12-topic-socfpga-agilex5-v5-1-4c4a51159eeb@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, kernel@pengutronix.de,
 Dinh Nguyen <dinguyen@kernel.org>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthew Gerlach <matthew.gerlach@altera.com>,
 "David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v5 01/10] net: stmmac: dwmac-socfpga:
	don't set has_gmac
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

On Fri, Oct 24, 2025 at 01:49:53PM +0200, Steffen Trumtrar wrote:
> Instead of setting the has_gmac or has_xgmac fields, let
> stmmac_probe_config_dt()) fill these fields according to the more
> generic compatibles.
> 
> Without setting the has_xgmac/has_gmac field correctly, even basic
> functions will fail, because the register offsets are different.

net-next no longer has these has_xgmac/has_gmac fields. This changed
on 22nd October. Please ensure you test your patches against the
latest tree to which you wish them to be applied.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
> index 354f01184e6cc..7ed125dcc73ea 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
> @@ -497,7 +497,6 @@ static int socfpga_dwmac_probe(struct platform_device *pdev)
>  	plat_dat->pcs_init = socfpga_dwmac_pcs_init;
>  	plat_dat->pcs_exit = socfpga_dwmac_pcs_exit;
>  	plat_dat->select_pcs = socfpga_dwmac_select_pcs;
> -	plat_dat->has_gmac = true;
>  
>  	plat_dat->riwt_off = 1;

In net-next, this code currently looks like:

        plat_dat->pcs_init = socfpga_dwmac_pcs_init;
        plat_dat->pcs_exit = socfpga_dwmac_pcs_exit;
        plat_dat->select_pcs = socfpga_dwmac_select_pcs;
        plat_dat->core_type = DWMAC_CORE_GMAC;

        plat_dat->riwt_off = 1;

Thus, this patch will not apply to net-next.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
