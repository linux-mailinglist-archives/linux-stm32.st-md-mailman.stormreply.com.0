Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7522F901F85
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Jun 2024 12:44:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 18CEFC78016;
	Mon, 10 Jun 2024 10:44:13 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 39300C78010
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jun 2024 10:44:07 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id D39AB883F2;
 Mon, 10 Jun 2024 12:44:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1718016247;
 bh=DYg6tL7HTuHnmwDK8wj/mmR4QXzEn5dAlWnruAHXPi8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=HdUxmK4v1UYivallEA9IKBrXygjcQS3ygkoyqmVx291CNwAXywRP9eCnB7J+T8BQk
 4uE+ZV65FzEgxmpg8HE34onFYJEfnNa5Nms6TLUrzt8sS1xqroVSwVdJqk6zQK1gEb
 P7NVyj4n7EWt1V8HFSYxsYusJuSiVBRvpGTN3++sAn764fl9sp+Yf5Gp3RIXGqFkXp
 V2uj1ZdqGYIC4WWZGB7YDAO8niXjJVInmPEiixUXzvfUxJtPcymddHZauqDvXjuqxB
 1qD94BLQR/PPaDU8rdWkn0Ah9FTU7pUjCwuFbhe8WMbzX4E65TbxQJG9xeE/M6p7Z4
 w09oYPDyzc1qg==
Message-ID: <20139233-4e95-4fe5-84ca-734ee866afca@denx.de>
Date: Mon, 10 Jun 2024 12:39:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Christophe Roullier <christophe.roullier@foss.st.com>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Richard Cochran <richardcochran@gmail.com>, Jose Abreu
 <joabreu@synopsys.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
References: <20240610071459.287500-1-christophe.roullier@foss.st.com>
 <20240610071459.287500-8-christophe.roullier@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20240610071459.287500-8-christophe.roullier@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] [net-next,
 PATCH v6 7/8] net: stmmac: dwmac-stm32: Mask support for PMCR
 configuration
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

On 6/10/24 9:14 AM, Christophe Roullier wrote:

[...]

>   static int stm32mp1_set_mode(struct plat_stmmacenet_data *plat_dat)
> @@ -303,7 +307,7 @@ static int stm32mcu_set_mode(struct plat_stmmacenet_data *plat_dat)
>   	dev_dbg(dwmac->dev, "Mode %s", phy_modes(plat_dat->mac_interface));
>   
>   	return regmap_update_bits(dwmac->regmap, reg,
> -				 dwmac->ops->syscfg_eth_mask, val << 23);
> +				 SYSCFG_MCU_ETH_MASK, val << 23);
>   }
>   
>   static void stm32_dwmac_clk_disable(struct stm32_dwmac *dwmac, bool suspend)
> @@ -348,8 +352,15 @@ static int stm32_dwmac_parse_data(struct stm32_dwmac *dwmac,
>   		return PTR_ERR(dwmac->regmap);
>   
>   	err = of_property_read_u32_index(np, "st,syscon", 1, &dwmac->mode_reg);
> -	if (err)
> +	if (err) {
>   		dev_err(dev, "Can't get sysconfig mode offset (%d)\n", err);
> +		return err;
> +	}
> +
> +	dwmac->mode_mask = SYSCFG_MP1_ETH_MASK;
> +	err = of_property_read_u32_index(np, "st,syscon", 2, &dwmac->mode_mask);
> +	if (err)
> +		dev_dbg(dev, "Warning sysconfig register mask not set\n");

Isn't this an error , so dev_err() ?

Include the err variable in the error message, see the dev_err() above 
for an example. That way the log already contains useful information 
(the error code) that can be used to narrow down the problem.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
