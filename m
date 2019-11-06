Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 861EBF1D3D
	for <lists+linux-stm32@lfdr.de>; Wed,  6 Nov 2019 19:12:52 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3C334C36B0B;
	Wed,  6 Nov 2019 18:12:52 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4368AC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Nov 2019 18:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ql6gwXAOAwvh2zRxBMnKt0ol68zRLOWR3hAo8drYM2U=; b=O+pJTJfsDgHm+psr+qtQYtRB1J
 lBjczeTu2OQRHA2uLuGUZJi4piArK6u4sgkP+osKQd8DpRBdEasXO699aC/ROcs2nWGP/y4i/8a+l
 SQvZMKqDdlPZ4j8xyfBCaOH0xoxX0amPjPpgaru/AzX+d/fb28lOPTVPbF2Ws0j6oYsI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.92.2)
 (envelope-from <andrew@lunn.ch>)
 id 1iSPnM-0000oB-My; Wed, 06 Nov 2019 19:12:40 +0100
Date: Wed, 6 Nov 2019 19:12:40 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Christophe Roullier <christophe.roullier@st.com>
Message-ID: <20191106181240.GG30762@lunn.ch>
References: <20191106101220.12693-1-christophe.roullier@st.com>
 <20191106101220.12693-2-christophe.roullier@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191106101220.12693-2-christophe.roullier@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, robh@kernel.org, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, peppe.cavallaro@st.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH V3 net-next 1/4] net: ethernet: stmmac:
 Add support for syscfg clock
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

On Wed, Nov 06, 2019 at 11:12:17AM +0100, Christophe Roullier wrote:
> Add optional support for syscfg clock in dwmac-stm32.c
> Now Syscfg clock is activated automatically when syscfg
> registers are used
> 
> Signed-off-by: Christophe Roullier <christophe.roullier@st.com>
> ---
>  .../net/ethernet/stmicro/stmmac/dwmac-stm32.c | 28 +++++++++++--------
>  1 file changed, 16 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
> index 4ef041bdf6a1..be7d58d83cfa 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
> @@ -152,19 +152,24 @@ static int stm32mp1_clk_prepare(struct stm32_dwmac *dwmac, bool prepare)
>  	int ret = 0;
>  
>  	if (prepare) {
> -		ret = clk_prepare_enable(dwmac->syscfg_clk);
> -		if (ret)
> -			return ret;
> -
> +		if (dwmac->syscfg_clk) {
> +			ret = clk_prepare_enable(dwmac->syscfg_clk);
> +			if (ret)
> +				return ret;
> +		}

Hi Christophe

I think you did not understand what i said.  clk_prepare_enable() is
happy to take a NULL pointer. So you don't need this new guard. You
don't need this change at all.

>  		if (dwmac->clk_eth_ck) {
>  			ret = clk_prepare_enable(dwmac->clk_eth_ck);
>  			if (ret) {
> -				clk_disable_unprepare(dwmac->syscfg_clk);
> +				if (dwmac->syscfg_clk)
> +					clk_disable_unprepare
> +						(dwmac->syscfg_clk);

clk_disable_unprepare() is happy to take a NULL pointer...

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
