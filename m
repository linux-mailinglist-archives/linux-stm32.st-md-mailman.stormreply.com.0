Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F50A80DB36
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Dec 2023 21:03:58 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0FA82C6B458;
	Mon, 11 Dec 2023 20:03:58 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 30EB0C65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Dec 2023 20:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=TJwORx52Qnkp9MLDYdwDcOh/PbHd7EDCPvYh06fhd1k=; b=ByKWuzSigakilwX1PE20hWgvhQ
 CO2mP7ThIgarcek97GA2MQQ7wf0L6mERzQzB0aWPL45UeoH9PxRXOf6Q9vIWq5EjlRteTedAwqVaM
 gr0ihn4WWtoLU3MoIEy/FH8A3q19rfS8RpE1oSaLERE/3G+gvvDbYhTay/8RR3u6O+A0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1rCmV6-002eoH-Vb; Mon, 11 Dec 2023 21:03:36 +0100
Date: Mon, 11 Dec 2023 21:03:36 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Jianheng Zhang <Jianheng.Zhang@synopsys.com>
Message-ID: <d202770a-3a3a-4ee2-b0de-b86e2f3e83ce@lunn.ch>
References: <CY5PR12MB63726FED738099761A9B81E7BF8FA@CY5PR12MB6372.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CY5PR12MB63726FED738099761A9B81E7BF8FA@CY5PR12MB6372.namprd12.prod.outlook.com>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>,
 open list <linux-kernel@vger.kernel.org>, James Li <James.Li1@synopsys.com>,
 "open list:STMMAC ETHERNET DRIVER" <netdev@vger.kernel.org>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>, Eric Dumazet <edumazet@google.com>,
 Martin McKenny <Martin.McKenny@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 "moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: xgmac3+: add FPE
 handshaking support
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

On Mon, Dec 11, 2023 at 06:13:21AM +0000, Jianheng Zhang wrote:
> Adds the HW specific support for Frame Preemption handshaking on XGMAC3+
> cores.
> 
> Signed-off-by: Jianheng Zhang <Jianheng.Zhang@synopsys.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h     |  6 ++
>  .../net/ethernet/stmicro/stmmac/dwxgmac2_core.c    | 65 ++++++++++++++++++----
>  2 files changed, 60 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
> index 207ff17..306d15b 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
> @@ -194,6 +194,12 @@
>  #define XGMAC_MDIO_DATA			0x00000204
>  #define XGMAC_MDIO_C22P			0x00000220
>  #define XGMAC_FPE_CTRL_STS		0x00000280
> +#define XGMAC_TRSP			BIT(19)
> +#define XGMAC_TVER			BIT(18)
> +#define XGMAC_RRSP			BIT(17)
> +#define XGMAC_RVER			BIT(16)
> +#define XGMAC_SRSP			BIT(2)
> +#define XGMAC_SVER			BIT(1)
>  #define XGMAC_EFPE			BIT(0)
>  #define XGMAC_ADDRx_HIGH(x)		(0x00000300 + (x) * 0x8)
>  #define XGMAC_ADDR_MAX			32
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> index eb48211..091d932 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> @@ -1439,22 +1439,63 @@ static void dwxgmac3_fpe_configure(void __iomem *ioaddr, struct stmmac_fpe_cfg *
>  {
>  	u32 value;
>  
> -	if (!enable) {
> -		value = readl(ioaddr + XGMAC_FPE_CTRL_STS);
> +	if (enable) {
> +		cfg->fpe_csr = XGMAC_EFPE;
> +		value = readl(ioaddr + XGMAC_RXQ_CTRL1);
> +		value &= ~XGMAC_RQ;
> +		value |= (num_rxq - 1) << XGMAC_RQ_SHIFT;
> +		writel(value, ioaddr + XGMAC_RXQ_CTRL1);
> +	} else {
> +		cfg->fpe_csr = 0;
> +	}
> +	writel(cfg->fpe_csr, ioaddr + XGMAC_FPE_CTRL_STS);
> +}
>  
> -		value &= ~XGMAC_EFPE;
> +static int dwxgmac3_fpe_irq_status(void __iomem *ioaddr, struct net_device *dev)
> +{
> +	u32 value;
> +	int status;
>  
> -		writel(value, ioaddr + XGMAC_FPE_CTRL_STS);
> -		return;
> +	status = FPE_EVENT_UNKNOWN;
> +
> +	/* Reads from the XGMAC_FPE_CTRL_STS register should only be performed
> +	 * here, since the status flags of MAC_FPE_CTRL_STS are "clear on read"
> +	 */
> +	value = readl(ioaddr + XGMAC_FPE_CTRL_STS);
> +
> +	if (value & XGMAC_TRSP) {
> +		status |= FPE_EVENT_TRSP;
> +		netdev_info(dev, "FPE: Respond mPacket is transmitted\n");

netdev_info()?  Is this going to spam the logs? Should it be netdev_dbg()

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
