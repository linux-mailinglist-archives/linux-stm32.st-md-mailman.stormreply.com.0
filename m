Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 931A8F044D
	for <lists+linux-stm32@lfdr.de>; Tue,  5 Nov 2019 18:48:06 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 50D21C36B0B;
	Tue,  5 Nov 2019 17:48:06 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D3962C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Nov 2019 17:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LWDvwTMeC17EAC7hUSEvvrTqmpd3m3QI+NU/56B7HaM=; b=oFbCjFWjuvPbgQT31DANCYyJUP
 IHmNfRw4eM71RdtEXzyInpEzTnOnuilNhCQ1m3ky+aOhCXSNd1NeEVQlQOWTDpJ8JEEbhctNxHEcg
 OgxpSFeOfRE6AHFKaZf5ddUrhrAgRyUFOh6ArK0v7gAR+banjze4BWV7VkjNzNhTE/HQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.92.2)
 (envelope-from <andrew@lunn.ch>)
 id 1iS2vp-0003Ah-Q9; Tue, 05 Nov 2019 18:47:53 +0100
Date: Tue, 5 Nov 2019 18:47:53 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Christophe Roullier <christophe.roullier@st.com>
Message-ID: <20191105174753.GH17620@lunn.ch>
References: <20191105124505.4738-1-christophe.roullier@st.com>
 <20191105124505.4738-2-christophe.roullier@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191105124505.4738-2-christophe.roullier@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, robh@kernel.org, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, peppe.cavallaro@st.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH V2 net-next 1/4] net: ethernet: stmmac:
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

On Tue, Nov 05, 2019 at 01:45:02PM +0100, Christophe Roullier wrote:
> Add optional support for syscfg clock in dwmac-stm32.c
> Now Syscfg clock is activated automatically when syscfg
> registers are used
> 
> Signed-off-by: Christophe Roullier <christophe.roullier@st.com>
> ---
>  .../net/ethernet/stmicro/stmmac/dwmac-stm32.c | 32 ++++++++++++-------
>  1 file changed, 21 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
> index 4ef041bdf6a1..df7e9e913041 100644
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

All the clk_ API functions are happy to take a NULL point and then do
nothing. So you don't need these changes. 

> -	/*  Clock for sysconfig */
> +	/*  Optional Clock for sysconfig */
>  	dwmac->syscfg_clk = devm_clk_get(dev, "syscfg-clk");
>  	if (IS_ERR(dwmac->syscfg_clk)) {
> -		dev_err(dev, "No syscfg clock provided...\n");
> -		return PTR_ERR(dwmac->syscfg_clk);
> +		err = PTR_ERR(dwmac->syscfg_clk);
> +		if (err != -ENOENT)
> +			return err;
> +		dwmac->syscfg_clk = NULL;
>  	}
>  
> +	err = 0;
> +

That should be all you need. Just set dwmac->syscfg_clk to NULL and
the rest should work.

    Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
