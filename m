Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D916BDD91C
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Oct 2025 10:59:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AB822C06B82;
	Wed, 15 Oct 2025 08:59:25 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 87E1EC36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Oct 2025 08:59:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8F71362525;
 Wed, 15 Oct 2025 08:59:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D39BC4CEF8;
 Wed, 15 Oct 2025 08:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760518763;
 bh=EUYhWksXVGZIMju1edC1CGm/fB7mrhfKVvKphQHqdsE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rH+F/PFSbSD5IInXuBF4/jDYiiMZTN23+ow/kLEFM6BYicaDp13195B7+KbDTI4tx
 qhl2be3E56oVhlCNoJrZACe3iLiwODwZXbjnhIJVlLPZgQyR6PwHbuWuTT0EQ5qmN0
 68o3n3a8sn21DrcdRfN6su9UF0QA8wFe/ESAf4DfVKcN+aET1TFCDWEB43P8BmhHD0
 y3zHF6P4eoKJoqI5f3xmaBlmo4z9ivcLLyzynb5Vn8dgMdajJQzJqC662g6RBMyFz2
 mRef9MD4sI4guKNrC8BZ8truUf0o5P5kllFhvS5pASuefg47i3npqJx0h2dzZQRDc5
 gX11R2L66LkQA==
Date: Wed, 15 Oct 2025 09:59:18 +0100
From: Simon Horman <horms@kernel.org>
To: Lizhe <sensor1010@163.com>
Message-ID: <aO9iZiMBs3pUnb77@horms.kernel.org>
References: <20251015040847.6421-1-sensor1010@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251015040847.6421-1-sensor1010@163.com>
Cc: linux-kernel@vger.kernel.org, jonas@kwiboo.se, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, chaoyi.chen@rock-chips.com,
 andrew+netdev@lunn.ch, edumazet@google.com, mcoquelin.stm32@gmail.com,
 david.wu@rock-chips.com, kuba@kernel.org, pabeni@redhat.com,
 rmk+kernel@armlinux.org.uk, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next] net: dwmac-rk: No need to check
 the return value of the phy_power_on()
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

On Tue, Oct 14, 2025 at 09:08:47PM -0700, Lizhe wrote:
> 'phy_power_on' is a local scope one within the driver, since the return
> value of the phy_power_on() function is always 0, checking its return
> value is redundant.
> 
> the function name 'phy_power_on()' conflicts with the existing
> phy_power_on() function in the PHY subsystem. a suitable alternative
> name would be rk_phy_power_set(), particularly since when the second
> argument is false, this function actually powers off the PHY
> 
> Signed-off-by: Lizhe <sensor1010@163.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 17 ++++-------------
>  1 file changed, 4 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> index 51ea0caf16c1..9d296bfab013 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> @@ -1461,23 +1461,18 @@ static int gmac_clk_enable(struct rk_priv_data *bsp_priv, bool enable)
>  	return 0;
>  }
>  
> -static int phy_power_on(struct rk_priv_data *bsp_priv, bool enable)
> +static void rk_phy_power_on(struct rk_priv_data *bsp_priv, bool enable)

Hi Lizhe,

This introduces a compilation error because phy_power_on()
is still used on line 1670.

Perhaps the hunk to update that line got lost somewhere.

-- 
pw-bot: changes-requested

...
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
