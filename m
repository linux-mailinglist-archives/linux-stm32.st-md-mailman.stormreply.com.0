Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 92491784745
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Aug 2023 18:25:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 537F0C6DD8F;
	Tue, 22 Aug 2023 16:25:22 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A5162C6B461
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Aug 2023 10:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=P5M5Z06zfN4qTYiE3IHnPFu/3qnQFk9Eq4f88wCaOJY=; b=0uTNtezhZEBnSrGa8TleMZPN8Y
 iJRvYwA/qtKt4gtC9togK7nqLiyvIq4RIDtcI6PnGds61P5I2adxo6bia8fIjsps2QzDi3FIw2w1E
 CrcA/qRO5NWrkE91ce9el6Md//MvM+sCFDVDR1qdorXvPB9FK5Z2gsYIYMnqomKZfGb7mQVxZ2OA9
 ZU+MoxuN2jCESw+Sc5Hi3vnR1I+DQBsJV2ljj3xBwuztHa6EIC1IZOvfjV/yaOSWnNZnfC/t3RT8N
 z2wCZgotHMGrqLkoHJQJCl7NqACQhykmt91MHDVSKoZye7muVWazbbpqhSxQyZBmiYr9SCWQli6oo
 5YyTHMug==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:48774)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1qWZuO-0003zG-0u;
 Thu, 17 Aug 2023 11:07:16 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1qWZuI-0000VX-Ok; Thu, 17 Aug 2023 11:07:10 +0100
Date: Thu, 17 Aug 2023 11:07:10 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Ruan Jinjie <ruanjinjie@huawei.com>
Message-ID: <ZN3xTiaIGPzfmEjY@shell.armlinux.org.uk>
References: <20230817071941.346590-1-ruanjinjie@huawei.com>
 <20230817071941.346590-3-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230817071941.346590-3-ruanjinjie@huawei.com>
X-Mailman-Approved-At: Tue, 22 Aug 2023 16:24:59 +0000
Cc: daniel.machon@microchip.com, simon.horman@corigine.com,
 Steen.Hegelund@microchip.com, linux-stm32@st-md-mailman.stormreply.com,
 horatiu.vultur@microchip.com, edumazet@google.com, joabreu@synopsys.com,
 linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, kuba@kernel.org, pabeni@redhat.com,
 davem@davemloft.net, lars.povlsen@microchip.com
Subject: Re: [Linux-stm32] [PATCH net-next 2/2] net: stmmac: Use helper
 function IS_ERR_OR_NULL()
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

On Thu, Aug 17, 2023 at 03:19:41PM +0800, Ruan Jinjie wrote:
> Use IS_ERR_OR_NULL() instead of open-coding it
> to simplify the code.
> 
> Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 733b5e900817..fe2452a70d23 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -1165,7 +1165,7 @@ static int stmmac_init_phy(struct net_device *dev)
>  	/* Some DT bindings do not set-up the PHY handle. Let's try to
>  	 * manually parse it
>  	 */
> -	if (!phy_fwnode || IS_ERR(phy_fwnode)) {
> +	if (IS_ERR_OR_NULL(phy_fwnode)) {
>  		int addr = priv->plat->phy_addr;
>  		struct phy_device *phydev;

Up to the stmmac maintainers, but I have never been a fan of
"IS_ERR_OR_NULL" because it leads to programming errors such as
those I pointed out in your changes to I2C drivers. I would
much rather see IS_ERR_OR_NULL removed from the kernel entirely.
That is my personal opinion.

In this case, it doesn't matter because we're not returning the
phy_fwnode error, we're detecting it and taking some alternative
action - but given my inherent dislike of IS_ERR_OR_NULL, I
prefer the original.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
