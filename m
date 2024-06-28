Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2138491C1CB
	for <lists+linux-stm32@lfdr.de>; Fri, 28 Jun 2024 16:54:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C67C2C71282;
	Fri, 28 Jun 2024 14:54:38 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 78749C6DD9F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Jun 2024 14:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=81FpBswvqTN/+g4RZ2JQLI94RMcUtnvBgT5CRymvy00=; b=MGYf7KdnGuXY1WWsPiwRchgkQh
 ckcHUlfg+yk3eL6vt4Rsvd5uI2k0bL8Gqkt4+p+vMHVp00sZytVvFCe/KhlzOuFFz+S3gA8u4PI0V
 Eis+uEXgk0ESe02/721q9JveAWDX8ObVdhiaYOybrkobYbcLZ5wOdPYMILvu86VguhJexRV9y7cgE
 JcraytzqsYeMIg3qNTsJrXZh/myRdCnjN7oomiwToTd7E9OvA89qlR18GbJJFKEn5S7S67riVx8h/
 Im3BJ63YZhjxDDDNe6niBS5eMb5L4LPud3nqarCn6r18jtYaZ4eKaM4pZ5vk0zNF9xewkVqaxwo11
 uESa2Vuw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:35642)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1sNCzM-0006mN-02;
 Fri, 28 Jun 2024 15:54:12 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1sNCzN-0006ah-A6; Fri, 28 Jun 2024 15:54:13 +0100
Date: Fri, 28 Jun 2024 15:54:13 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Serge Semin <fancer.lancer@gmail.com>
Message-ID: <Zn7OlQ4aoO2vZTrj@shell.armlinux.org.uk>
References: <Zlmzu7/ANyZxOOQL@shell.armlinux.org.uk>
 <20240624132802.14238-2-fancer.lancer@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240624132802.14238-2-fancer.lancer@gmail.com>
Cc: Daniel Borkmann <daniel@iogearbox.net>, linux-kernel@vger.kernel.org,
 Jesper Dangaard Brouer <hawk@kernel.org>, Eric Dumazet <edumazet@google.com>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-msm@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, bpf@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Andrew Halaney <ahalaney@redhat.com>
Subject: Re: [Linux-stm32] [PATCH RFC net-next v2 10/17] net: stmmac:
 Introduce internal PCS offset-based CSR access
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

On Mon, Jun 24, 2024 at 04:26:27PM +0300, Serge Semin wrote:
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index 80eb72bc6311..d0bcebe87ee8 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -633,7 +633,7 @@ static int ethqos_configure_sgmii(struct qcom_ethqos *ethqos)
>  			      RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
>  			      RGMII_IO_MACRO_CONFIG2);
>  		ethqos_set_serdes_speed(ethqos, SPEED_2500);
> -		stmmac_pcs_ctrl_ane(priv, priv->ioaddr, 0, 0, 0);
> +		stmmac_pcs_ctrl_ane(priv, priv->pcsaddr, 0, 0, 0);
>  		break;
>  	case SPEED_1000:
>  		val &= ~ETHQOS_MAC_CTRL_PORT_SEL;
> @@ -641,12 +641,12 @@ static int ethqos_configure_sgmii(struct qcom_ethqos *ethqos)
>  			      RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
>  			      RGMII_IO_MACRO_CONFIG2);
>  		ethqos_set_serdes_speed(ethqos, SPEED_1000);
> -		stmmac_pcs_ctrl_ane(priv, priv->ioaddr, 1, 0, 0);
> +		stmmac_pcs_ctrl_ane(priv, priv->pcsaddr, 1, 0, 0);
>  		break;
>  	case SPEED_100:
>  		val |= ETHQOS_MAC_CTRL_PORT_SEL | ETHQOS_MAC_CTRL_SPEED_MODE;
>  		ethqos_set_serdes_speed(ethqos, SPEED_1000);
> -		stmmac_pcs_ctrl_ane(priv, priv->ioaddr, 1, 0, 0);
> +		stmmac_pcs_ctrl_ane(priv, priv->pcsaddr, 1, 0, 0);
>  		break;
>  	case SPEED_10:
>  		val |= ETHQOS_MAC_CTRL_PORT_SEL;
> @@ -656,7 +656,7 @@ static int ethqos_configure_sgmii(struct qcom_ethqos *ethqos)
>  					 SGMII_10M_RX_CLK_DVDR),
>  			      RGMII_IO_MACRO_CONFIG);
>  		ethqos_set_serdes_speed(ethqos, SPEED_1000);
> -		stmmac_pcs_ctrl_ane(priv, priv->ioaddr, 1, 0, 0);
> +		stmmac_pcs_ctrl_ane(priv, priv->pcsaddr, 1, 0, 0);
>  		break;
>  	}
>  

I think a better preparatory patch (given what you do in future patches)
would be to change all of these to:

	ethqos_pcs_set_inband(priv, {false | true});

which would be:

static void ethqos_pcs_set_inband(struct stmmac_priv *priv, bool enable)
{
	stmmac_pcs_ctrl_ane(priv, priv->ioaddr, enable, 0, 0);
}

which then means this patch becomes a single line, and your subsequent
patch just has to replace stmmac_pcs_ctrl_ane() with its open-coded
equivalent.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.c b/drivers/net/ethernet/stmicro/stmmac/hwif.c
> index 84fd57b76fad..3666893acb69 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/hwif.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/hwif.c
> @@ -6,6 +6,7 @@
>  
>  #include "common.h"
>  #include "stmmac.h"
> +#include "stmmac_pcs.h"
>  #include "stmmac_ptp.h"
>  #include "stmmac_est.h"
>  
> @@ -116,6 +117,7 @@ static const struct stmmac_hwif_entry {
>  	const void *tc;
>  	const void *mmc;
>  	const void *est;
> +	const void *pcs;

I'm not a fan of void pointers. common.h includes linux/phylink.h, which
will define struct phylink_pcs_ops, so there is no reason not to declare
this as:

	const struct phylink_pcs_ops *pcs;

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
