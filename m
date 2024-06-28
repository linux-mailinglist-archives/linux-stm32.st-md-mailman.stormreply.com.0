Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6018291C155
	for <lists+linux-stm32@lfdr.de>; Fri, 28 Jun 2024 16:43:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 104FEC71282;
	Fri, 28 Jun 2024 14:43:06 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3F684C6DD9F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Jun 2024 14:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1i0qVfn2CH6qX3ZUJgQpekfAmjqv9PBkrjgn7uqTOKk=; b=clXunHBcYa9YTyHafTQarFujMc
 lzhL7CNhuRniN/1QOI0XxCVEADk5A5U63dhB7rhDKyfUY7RXNDRewcaAb3nHi/QMvHKuBztJ8dOiK
 RFwCxxNZgubc1Djq8JPLWgnIqVUbQuzSwrt/IVF9AcpPnwSJLSDkNDX7LEOBhbKCo2Qzqqp8R9hpt
 NJSIVYDCwLbKU93aZynrN/2oSidE8CsWRke9vKwAkjUGqh6U0m/qpTEEjkrchXz1dQ2QrwgETId4d
 w0FcH4FKdzwplCmj+fddpP2dojT0Du0mamuEP6+PSi059RkrSrfrNPUrWeznXfnGwl4pYVMscN9x1
 LIL/XyoA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:49280)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1sNCoC-0006lH-2O;
 Fri, 28 Jun 2024 15:42:40 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1sNCoD-0006aZ-4r; Fri, 28 Jun 2024 15:42:41 +0100
Date: Fri, 28 Jun 2024 15:42:41 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Serge Semin <fancer.lancer@gmail.com>
Message-ID: <Zn7L4cP62MsNN61J@shell.armlinux.org.uk>
References: <Zlmzu7/ANyZxOOQL@shell.armlinux.org.uk>
 <20240624132802.14238-9-fancer.lancer@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240624132802.14238-9-fancer.lancer@gmail.com>
Cc: linux-kernel@vger.kernel.org, Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 bpf@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Andrew Halaney <ahalaney@redhat.com>
Subject: Re: [Linux-stm32] [PATCH RFC net-next v2 17/17] net: stmmac: pcs:
 Drop the _SHIFT macros
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

On Mon, Jun 24, 2024 at 04:26:34PM +0300, Serge Semin wrote:
> The PCS_ANE_PSE_SHIFT and PCS_ANE_RFE_SHIFT are unused anyway. Moreover
> PCS_ANE_PSE and PCS_ANE_RFE are the respective field masks. So the
> FIELD_GET()/FIELD_SET() macro-functions can be used to get/set the fields
> content. Drop the _SHIFT macros for good then.
> 
> Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
> index a17e5b37c411..0f15c9898788 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
> @@ -43,9 +43,7 @@
>  #define PCS_ANE_FD		BIT(5)		/* AN Full-duplex flag */
>  #define PCS_ANE_HD		BIT(6)		/* AN Half-duplex flag */
>  #define PCS_ANE_PSE		GENMASK(8, 7)	/* AN Pause Encoding */
> -#define PCS_ANE_PSE_SHIFT	7
>  #define PCS_ANE_RFE		GENMASK(13, 12)	/* AN Remote Fault Encoding */
> -#define PCS_ANE_RFE_SHIFT	12
>  #define PCS_ANE_ACK		BIT(14)		/* AN Base-page acknowledge */

I would actually like to see all these go away.

PCS_ANE_FD == LPA_1000XFULL
PCS_ANE_HD == LPA_1000XHALF
PCS_ANE_PSE == LPA_1000XPAUSE and LPA_1000XPAUSE_ASYM
PCS_ANE_RFE == LPA_RESV and LPA_RFAULT
PCS_ANE_ACK == LPA_LPACK

Isn't it rather weird that the field layout matches 802.3z aka
1000base-X and not SGMII? This layout would not make sense for Cisco
SGMII as it loses the speed information conveyed by the Cisco SGMII
control word.

This isn't a case of the manufacturer using "SGMII" to mean a serial
gigabit media independent interface that supports 1000base-X
(PHY_INTERFACE_MODE_1000BASEX) rather than Cisco SGMII
(PHY_INTERFACE_MODE_SGMII) ?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
