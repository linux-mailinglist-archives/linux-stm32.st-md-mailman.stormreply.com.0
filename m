Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3BC96F177
	for <lists+linux-stm32@lfdr.de>; Fri,  6 Sep 2024 12:28:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 489D8C78013;
	Fri,  6 Sep 2024 10:28:52 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8883DC6DD9A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Sep 2024 10:28:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 3EB75A44DEA;
 Fri,  6 Sep 2024 10:28:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6BC3C4CEC5;
 Fri,  6 Sep 2024 10:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725618524;
 bh=5BaC5tCLM4cokqPfWLvVsqm1VrOzWOAlQptFMFimM6E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VRY4rgFwAaGeU+O2i3eNekIjwHhEv82vc0hJpdLKTbZEKw2Py8dNtjYbd8m+i8rGt
 q+EcxuziyrxlyvXET2tCtFrn5aBY26Y6pS3oOHWk2xuPkVawRg/mnkuyaExxTvaJRB
 DHDBf93Jlqccz124foEm630PTwPncEAQZPvWpSYVoQgtSy6FRqdwfWy84seckqNQkd
 7c+eh3AftQqeVHOiCRH0iVGdH4CXSjz8X/QBBQihIO2hk19rCNgJE4YsNkXZkcWq+O
 w5Ewa8tROis3p6jmCCCfKP6uXBO9WJ15SjhL1O73iDiwXFi9Qyd9xFY969cSmjy+Z4
 UyPDAFTF5pg8Q==
Date: Fri, 6 Sep 2024 11:28:39 +0100
From: Simon Horman <horms@kernel.org>
To: Abhishek Chauhan <quic_abchauha@quicinc.com>
Message-ID: <20240906102839.GE2097826@kernel.org>
References: <20240904235456.2663335-1-quic_abchauha@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240904235456.2663335-1-quic_abchauha@quicinc.com>
Cc: kernel@quicinc.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Andrew Halaney <ahalaney@redhat.com>
Subject: Re: [Linux-stm32] [PATCH net-next v1] net: stmmac: Programming
 sequence for VLAN packets with split header
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

On Wed, Sep 04, 2024 at 04:54:56PM -0700, Abhishek Chauhan wrote:
> Currently reset state configuration of split header works fine for
> non-tagged packets and we see no corruption in payload of any size
> 
> We need additional programming sequence with reset configuration to
> handle VLAN tagged packets to avoid corruption in payload for packets
> of size greater than 256 bytes.
> 
> Without this change ping application complains about corruption
> in payload when the size of the VLAN packet exceeds 256 bytes.
> 
> With this change tagged and non-tagged packets of any size works fine
> and there is no corruption seen.
> 
> Signed-off-by: Abhishek Chauhan <quic_abchauha@quicinc.com>

...

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c
> index e0165358c4ac..dbd1be4e4a92 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c
> @@ -526,6 +526,17 @@ static void dwmac4_enable_sph(struct stmmac_priv *priv, void __iomem *ioaddr,
>  	value |= GMAC_CONFIG_HDSMS_256; /* Segment max 256 bytes */
>  	writel(value, ioaddr + GMAC_EXT_CONFIG);
>  
> +	/* Additional configuration to handle VLAN tagged packets */
> +	value = readl(ioaddr + GMAC_EXT_CFG1);
> +	value &= ~GMAC_CONFIG1_SPLM;
> +	/* Enable Split mode for header and payload at L2  */
> +	value |= GMAC_CONFIG1_SPLM_L2OFST_EN << GMAC_CONFIG1_SPLM_SHIFT;
> +	value &= ~GMAC_CONFIG1_SAVO;
> +	/* Enables the MAC to distinguish between tagged vs untagged pkts */
> +	value |= 4 << GMAC_CONFIG1_SAVO_SHIFT;
> +	value |= GMAC_CONFIG1_SAVE_EN;
> +	writel(value, ioaddr + GMAC_EXT_CFG1);

Hi Abhishek,

Perhaps it is inconsistent with the code elsewhere in this file,
in which case I would suggest a follow-up clean-up, but I
expect that using FIELD_PREP would both lead to cleaner code here
and remove the need for *_SHIFT.

> +
>  	value = readl(ioaddr + DMA_CHAN_CONTROL(dwmac4_addrs, chan));
>  	if (en)
>  		value |= DMA_CONTROL_SPH;
> -- 
> 2.25.1
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
