Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 58653BDCAC3
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Oct 2025 08:17:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 76A98C56618;
	Wed, 15 Oct 2025 06:17:46 +0000 (UTC)
Received: from mail-m19731114.qiye.163.com (mail-m19731114.qiye.163.com
 [220.197.31.114])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 48FBDC56614
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Oct 2025 06:17:43 +0000 (UTC)
Received: from [172.16.12.149] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 25f6e32a2;
 Wed, 15 Oct 2025 14:17:39 +0800 (GMT+08:00)
Message-ID: <4c9ec1ab-8833-4e07-a39c-ba502117866f@rock-chips.com>
Date: Wed, 15 Oct 2025 14:17:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Lizhe <sensor1010@163.com>, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 rmk+kernel@armlinux.org.uk, jonas@kwiboo.se, david.wu@rock-chips.com
References: <20251015040847.6421-1-sensor1010@163.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <20251015040847.6421-1-sensor1010@163.com>
X-HM-Tid: 0a99e684616903abkunm8d7d969e2bd29d
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGkkaQlYdGk1LHkkaQ0IZQx1WFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
 hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
 b=X+6mwWPDH1PC0JAJsCEXtIDwEPnM6bx7ESrZL/FdgaTzkrXtRUD2nl2I9dKoOxJwyNrorco6P6jLawdEl7PWM7IgvOxAJ6SOVRfxslkY9V3GXAquDUmE5j76Qe1utfOMfRd5ku8G7P6h7+B0MRHl3lqjPuOb0KhZvyVlCVUJlFs=;
 s=default; c=relaxed/relaxed; d=rock-chips.com; v=1; 
 bh=q8XaJ9YCp4W+b7drspa/wsyUFTPtmL0PalpV0e9ymoU=;
 h=date:mime-version:subject:message-id:from;
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 10/15/2025 12:08 PM, Lizhe wrote:

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
>   drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 17 ++++-------------
>   1 file changed, 4 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> index 51ea0caf16c1..9d296bfab013 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> @@ -1461,23 +1461,18 @@ static int gmac_clk_enable(struct rk_priv_data *bsp_priv, bool enable)
>   	return 0;
>   }
>   
> -static int phy_power_on(struct rk_priv_data *bsp_priv, bool enable)
> +static void rk_phy_power_on(struct rk_priv_data *bsp_priv, bool enable)
>   {
>   	struct regulator *ldo = bsp_priv->regulator;
>   	struct device *dev = bsp_priv->dev;
> -	int ret;
>   
>   	if (enable) {
> -		ret = regulator_enable(ldo);
> -		if (ret)
> +		if (regulator_enable(ldo))
>   			dev_err(dev, "fail to enable phy-supply\n");
>   	} else {
> -		ret = regulator_disable(ldo);
> -		if (ret)
> +		if (regulator_disable(ldo))
>   			dev_err(dev, "fail to disable phy-supply\n");
>   	}
> -
> -	return 0;
>   }
>   
>   static struct rk_priv_data *rk_gmac_setup(struct platform_device *pdev,
> @@ -1655,11 +1650,7 @@ static int rk_gmac_powerup(struct rk_priv_data *bsp_priv)
>   		dev_err(dev, "NO interface defined!\n");
>   	}
>   
> -	ret = phy_power_on(bsp_priv, true);
> -	if (ret) {
> -		gmac_clk_enable(bsp_priv, false);

Is gmac_clk_enable() also redundant?


> -		return ret;
> -	}
> +	rk_phy_power_on(bsp_priv, true);
>   
>   	pm_runtime_get_sync(dev);
>   

-- 
Best,
Chaoyi

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
