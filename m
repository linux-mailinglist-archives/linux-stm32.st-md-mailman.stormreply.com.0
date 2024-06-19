Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6105690F9A7
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Jun 2024 01:13:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0A85FC6A613;
	Wed, 19 Jun 2024 23:13:55 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 92629C5E2D0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jun 2024 23:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=Qj6mjjBSg8sx2QqOSj72ZERLwLtr27wz6L+Qn/QniuI=; b=HpiA7VKVLxR+26EUaKUgi4g6xT
 99NdHmfT2ejkpZthNu15wMhmWhaOei7+08Ph0J/jbz9ZQ9j6eQRoEZt73Md0HhMmdRjqaMpS+JLd+
 1SIH67tmEQ2uQnDygYet6csedm9moex3fXp/Q912vfhnj4obzvQCRZHmd3DCu33KjgnI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1sK4Uf-000W73-R3; Thu, 20 Jun 2024 01:13:33 +0200
Date: Thu, 20 Jun 2024 01:13:33 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
Message-ID: <159700cc-f46c-4f70-82aa-972ba6e904ca@lunn.ch>
References: <20240619-icc_bw_voting_from_ethqos-v1-0-6112948b825e@quicinc.com>
 <20240619-icc_bw_voting_from_ethqos-v1-1-6112948b825e@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240619-icc_bw_voting_from_ethqos-v1-1-6112948b825e@quicinc.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 kernel@quicinc.com, linux-kernel@vger.kernel.org,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, Eric Dumazet <edumazet@google.com>,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Russell King <linux@armlinux.org.uk>,
 Vinod Koul <vkoul@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Andrew Halaney <ahalaney@redhat.com>
Subject: Re: [Linux-stm32] [PATCH 1/3] net: stmmac: Add interconnect support
 in qcom-ethqos driver
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

On Wed, Jun 19, 2024 at 03:41:29PM -0700, Sagar Cheluvegowda wrote:
> Add interconnect support in qcom-ethqos driver to vote for bus
> bandwidth based on the current speed of the driver.
> This change adds support for two different paths - one from ethernet
> to DDR and the other from Apps to ethernet.

What do you mean by Apps?

> Vote from each interconnect client is aggregated and the on-chip
> interconnect hardware is configured to the most appropriate
> bandwidth profile.
> 
> Signed-off-by: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
> ---
>  .../net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c   | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index e254b21fdb59..682e68f37dbd 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -7,6 +7,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/phy.h>
>  #include <linux/phy/phy.h>
> +#include <linux/interconnect.h>

If you look at these includes, you should notice they are
alphabetical.

> +static void ethqos_set_icc_bw(struct qcom_ethqos *ethqos, unsigned int speed)
> +{
> +	icc_set_bw(ethqos->axi_icc_path, Mbps_to_icc(speed), Mbps_to_icc(speed));
> +	icc_set_bw(ethqos->ahb_icc_path, Mbps_to_icc(speed), Mbps_to_icc(speed));
> +}
> +
>  static void ethqos_fix_mac_speed(void *priv, unsigned int speed, unsigned int mode)
>  {
>  	struct qcom_ethqos *ethqos = priv;
>  
>  	ethqos->speed = speed;
>  	ethqos_update_link_clk(ethqos, speed);
> +	ethqos_set_icc_bw(ethqos, speed);
>  	ethqos_configure(ethqos);
>  }
>  
> @@ -813,6 +824,14 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
>  		return dev_err_probe(dev, PTR_ERR(ethqos->link_clk),
>  				     "Failed to get link_clk\n");
>  
> +	ethqos->axi_icc_path = devm_of_icc_get(dev, "axi_icc_path");
> +	if (IS_ERR(ethqos->axi_icc_path))
> +		return PTR_ERR(ethqos->axi_icc_path);
> +
> +	ethqos->ahb_icc_path = devm_of_icc_get(dev, "ahb_icc_path");
> +	if (IS_ERR(ethqos->axi_icc_path))
> +		return PTR_ERR(ethqos->axi_icc_path);
> +

This all looks pretty generic. Any reason why this is just in the
Qualcomm device, and not at a higher level so it could be used for all
stmmac devices if the needed properties are found in DT?

       Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
