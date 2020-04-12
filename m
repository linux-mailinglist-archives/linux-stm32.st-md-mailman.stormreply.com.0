Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DECC31A5FC4
	for <lists+linux-stm32@lfdr.de>; Sun, 12 Apr 2020 20:28:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7F794C36B0B;
	Sun, 12 Apr 2020 18:28:06 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 68542C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 12 Apr 2020 18:28:05 +0000 (UTC)
Received: from kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com
 (c-67-180-217-166.hsd1.ca.comcast.net [67.180.217.166])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7D26B206C3;
 Sun, 12 Apr 2020 18:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586716083;
 bh=VF/nhuZkTZ8b9/mmFS8H59iIm0vUnbplPKcaVA78jYk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=uqvVcVx0nCzUrTkSmtbmJNs6AcH/x6NxpLIYwCeajkEnc1Zg47ZYTf+XfHIAh6isS
 cebWIL8AVtXk4dlUBHDL6nUkgzxHzsqTGH1cjO99Y/HlidtmYxMHuRCNFlpyeVizXx
 ep69wvlNg/MB1ZPWhG/IhaPm0VXgQtkQKtnIowMo=
Date: Sun, 12 Apr 2020 11:27:56 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <20200412112756.687ff227@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20200412034931.9558-1-f.fainelli@gmail.com>
References: <20200412034931.9558-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, open
 list <linux-kernel@vger.kernel.org>, mripard@kernel.org,
 "moderated list:ARM/STM32       
 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, olteanv@gmail.com, "David S.
 Miller" <davem@davemloft.net>, "moderated
 list:ARM/STM32        ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: Guard against txfifosz=0
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

On Sat, 11 Apr 2020 20:49:31 -0700 Florian Fainelli wrote:
> After commit bfcb813203e619a8960a819bf533ad2a108d8105 ("net: dsa:
> configure the MTU for switch ports") my Lamobo R1 platform which uses
> an allwinner,sun7i-a20-gmac compatible Ethernet MAC started to fail
> by rejecting a MTU of 1536. The reason for that is that the DMA
> capabilities are not readable on this version of the IP, and there is
> also no 'tx-fifo-depth' property being provided in Device Tree. The
> property is documented as optional, and is not provided.
> 
> The minimum MTU that the network device accepts is ETH_ZLEN - ETH_HLEN,
> so rejecting the new MTU based on the txfifosz value unchecked seems a
> bit too heavy handed here.

OTOH is it safe to assume MTUs up to 16k are valid if device tree lacks
the optional property? Is this change purely to preserve backward
(bug-ward?) compatibility, even if it's not entirely correct to allow
high MTU values? (I think that'd be worth stating in the commit message
more explicitly.) Is there no "reasonable default" we could select for
txfifosz if property is missing?

> Fixes: eaf4fac47807 ("net: stmmac: Do not accept invalid MTU values")
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index e6898fd5223f..9c63ba6f86a9 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -3993,7 +3993,7 @@ static int stmmac_change_mtu(struct net_device *dev, int new_mtu)
>  	new_mtu = STMMAC_ALIGN(new_mtu);
>  
>  	/* If condition true, FIFO is too small or MTU too large */
> -	if ((txfifosz < new_mtu) || (new_mtu > BUF_SIZE_16KiB))
> +	if ((txfifosz < new_mtu && txfifosz) || (new_mtu > BUF_SIZE_16KiB))
>  		return -EINVAL;
>  
>  	dev->mtu = new_mtu;

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
