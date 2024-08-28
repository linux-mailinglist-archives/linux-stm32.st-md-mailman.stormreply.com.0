Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A07F2962A04
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Aug 2024 16:17:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 50EDEC6C855;
	Wed, 28 Aug 2024 14:17:40 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 296DDC69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Aug 2024 14:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=Vfekbi0HchxBjQQ/RvzxtQJeD9GLl2y8IkOsbfDf82s=; b=2B6goa/cDio3lnpvelC5GvCUuA
 nWt5Lxn9qeayYM7qd7LBItOIe/RcB4Ge/jGfvdwztUetwRv73BK9KNuCLVXUieCPkHTsS34SA7eNu
 WFJzmlNvBnd9nmhShD+entZRaCx+G6bY0yPSwIyGGMTy/3Z8H/oqA3jeur4iksY9fIxI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1sjJTr-005wST-EH; Wed, 28 Aug 2024 16:17:03 +0200
Date: Wed, 28 Aug 2024 16:17:03 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Message-ID: <52435305-d134-4cee-8660-f7bf60206ddf@lunn.ch>
References: <20240828032343.1218749-1-ruanjinjie@huawei.com>
 <20240828032343.1218749-2-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240828032343.1218749-2-ruanjinjie@huawei.com>
Cc: linus.walleij@linaro.org, justin.chen@broadcom.com, edumazet@google.com,
 krzk@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 f.fainelli@gmail.com, samuel@sholland.org, linux@armlinux.org.uk,
 jernej.skrabec@gmail.com, wens@csie.org, joabreu@synopsys.com,
 bcm-kernel-feedback-list@broadcom.com, kuba@kernel.org, pabeni@redhat.com,
 ansuelsmth@gmail.com, sebastian.hesselbarth@gmail.com,
 woojung.huh@microchip.com, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 UNGLinuxDriver@microchip.com, mcoquelin.stm32@gmail.com, alsi@bang-olufsen.dk,
 olteanv@gmail.com, linux-sunxi@lists.linux.dev, davem@davemloft.net,
 jic23@kernel.org, hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next v2 01/13] net: stmmac:
 dwmac-sun8i: Use for_each_child_of_node_scoped()
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

On Wed, Aug 28, 2024 at 11:23:31AM +0800, Jinjie Ruan wrote:
> Avoid need to manually handle of_node_put() by using
> for_each_child_of_node_scoped(), which can simplfy code.
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> index cc93f73a380e..8c5b4e0c0976 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> @@ -774,7 +774,7 @@ static int sun8i_dwmac_reset(struct stmmac_priv *priv)
>  static int get_ephy_nodes(struct stmmac_priv *priv)
>  {
>  	struct sunxi_priv_data *gmac = priv->plat->bsp_priv;
> -	struct device_node *mdio_mux, *iphynode;
> +	struct device_node *mdio_mux;
>  	struct device_node *mdio_internal;
>  	int ret;

Networking uses reverse Christmas tree. Variables are sorted, longest
first, shortest last. So you need to move mdio_mux after
mdio_internal.

The rest looks O.K.


    Andrew

---
pw-bot: cr
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
