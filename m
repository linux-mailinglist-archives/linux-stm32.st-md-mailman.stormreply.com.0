Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 84FF7742E45
	for <lists+linux-stm32@lfdr.de>; Thu, 29 Jun 2023 22:28:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 28725C6B455;
	Thu, 29 Jun 2023 20:28:48 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C2971C6B442
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Jun 2023 20:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=JJTXlY6wtDO/dgQsOAsZ3Cbbd06wnHj1OxnXQLvZ2zI=; b=haFASrG5nuBS3YS6DPaEq5i3eU
 iG8shjOJk5clS1phTvX2/t7l5yi8/7S7fEGgWWP4cXtyjngzHPC58j6Wme6xu5g8PybcnmI0MinKg
 WgLr1Q62+MO60OcPMn6wOWP37Yo6Lo5Q1HFuUHsERfvn68mc6VHjMW+yrccNUntQAKJw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1qEyFu-000FjX-2B; Thu, 29 Jun 2023 22:28:42 +0200
Date: Thu, 29 Jun 2023 22:28:42 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Andrew Halaney <ahalaney@redhat.com>
Message-ID: <5b46e92f-0f32-46f2-85ef-94f7c6a7ca9f@lunn.ch>
References: <20230629191725.1434142-1-ahalaney@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230629191725.1434142-1-ahalaney@redhat.com>
Cc: vkoul@kernel.org, bhupesh.sharma@linaro.org, bartosz.golaszewski@linaro.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, davem@davemloft.net,
 edumazet@google.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 peppe.cavallaro@st.com, kuba@kernel.org, pabeni@redhat.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/3] net: stmmac: dwmac-qcom-ethqos:
 Return device_get_phy_mode() errors properly
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

On Thu, Jun 29, 2023 at 02:14:16PM -0500, Andrew Halaney wrote:
> Other than -ENODEV, other errors resulted in -EINVAL being returned
> instead of the actual error.
> 
> Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index e62940414e54..3bf025e8e2bd 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -721,6 +721,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  
>  	ethqos->phy_mode = device_get_phy_mode(dev);
> +	if (ethqos->phy_mode < 0)
> +		return dev_err_probe(dev, ethqos->phy_mode,
> +				     "Failed to get phy mode\n");

If this every used on anything other than device tree?

of_get_phy_mode() has a better API, there is a clear separation of the
return value indicating success/fail, and the interface mode found in
DT. You can then change phy_mode in struct qcom_ethqos to be
phy_interface_t.

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
