Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1DFBE36BE
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Oct 2025 14:36:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 05607C57A49;
	Thu, 16 Oct 2025 12:36:58 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 29774C57A43
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Oct 2025 12:36:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A348943394;
 Thu, 16 Oct 2025 12:36:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D7D2C113D0;
 Thu, 16 Oct 2025 12:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760618214;
 bh=rWo5L43Wc3sm+4xT2/uBYLFVmx0bMIQ/PWAvIzOWufU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZwiTDTK0gLGZXQE1l0ADMryUJjR9GTZMa2eNNVrsEHwO61+qcOveY91BrUHlsy3jD
 bs+Os5OmP32KJuLwI3/cCeT3bu4jorr2kobS7TZnEeRdfqM6hyb5cBk4k0lq+OlpX+
 2vFK9Ss54Cs765ahcx19wfI7VfnAIKuuqZaZOE71YajqeI6PgkU1TdKDrj5ghfT/Vb
 PnBn4wvJAFlyVQP1MYmsY9zv+uFM73Y+OyQJ50fxehDvxSqRega70Utmw+S3sCYTkr
 WDZzLC+KSXxVsxxeLkEXIHi6VlHruA397fKOorRpSTFoEm3hLJJas9gj123k/GKor+
 5dvPxGnSOqlyA==
Date: Thu, 16 Oct 2025 13:36:48 +0100
From: Simon Horman <horms@kernel.org>
To: Lizhe <sensor1010@163.com>
Message-ID: <aPDm4OMiM7Ug9rDf@horms.kernel.org>
References: <20251015051446.2677-1-sensor1010@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251015051446.2677-1-sensor1010@163.com>
Cc: linux-kernel@vger.kernel.org, jonas@kwiboo.se, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, chaoyi.chen@rock-chips.com,
 andrew+netdev@lunn.ch, edumazet@google.com, mcoquelin.stm32@gmail.com,
 david.wu@rock-chips.com, kuba@kernel.org, pabeni@redhat.com,
 rmk+kernel@armlinux.org.uk, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next] net: dwmac-rk: No need to check
 the return value of phy_power_on()
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

On Tue, Oct 14, 2025 at 10:14:46PM -0700, Lizhe wrote:
> 'phy_power_on' is a local scope one within the driver, since the
> return value of the phy_power_on() function is always 0, checking
> its return value is redundant.
> 
> the function name 'phy_power_on()' conflicts with the existing
> phy_power_on() function in the PHY subsystem. a suitable alternative
> name would be rk_phy_power_set(), particularly since when the
> second argument is false, this function actually powers off the PHY

This is two changes. I would lean towards splitting it into
two patches (in a single patch-set).

> 
> Signed-off-by: Lizhe <sensor1010@163.com>

Also, in future, please wait 24h between posting revisions of a patchset.
And note revisions in the subject, like this:

  Subject: [PATCH net-next v2] ...

https://docs.kernel.org/process/maintainer-netdev.html

> ---
>  .../net/ethernet/stmicro/stmmac/dwmac-rk.c    | 19 +++++--------------
>  1 file changed, 5 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> index 51ea0caf16c1..ac3324430b2d 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> @@ -1461,23 +1461,18 @@ static int gmac_clk_enable(struct rk_priv_data *bsp_priv, bool enable)
>  	return 0;
>  }
>  
> -static int phy_power_on(struct rk_priv_data *bsp_priv, bool enable)
> +static void rk_phy_power_set(struct rk_priv_data *bsp_priv, bool enable)
>  {
>  	struct regulator *ldo = bsp_priv->regulator;
>  	struct device *dev = bsp_priv->dev;
> -	int ret;
>  
>  	if (enable) {
> -		ret = regulator_enable(ldo);
> -		if (ret)
> +		if (regulator_enable(ldo))
>  			dev_err(dev, "fail to enable phy-supply\n");
>  	} else {
> -		ret = regulator_disable(ldo);
> -		if (ret)
> +		if (regulator_disable(ldo))
>  			dev_err(dev, "fail to disable phy-supply\n");

The 'ret' changes above don't relate to the patch description.
I'd leave this be. But if you really want to go this way
I think it would be a separate patch.

>  	}
> -
> -	return 0;
>  }
>  
>  static struct rk_priv_data *rk_gmac_setup(struct platform_device *pdev,

-- 
pw-bot: changes-requested
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
