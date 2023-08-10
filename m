Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 382D3777B7A
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Aug 2023 17:00:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EA076C6B469;
	Thu, 10 Aug 2023 15:00:42 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AD541C6907A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Aug 2023 15:00:40 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 37AClMae009212; Thu, 10 Aug 2023 17:00:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=GQgfxqFc/KsVSkK1DjWFr9HlyK6ZRhaXW7uJy3wWGoM=; b=Vs
 hS5ujlDlKys7kWQYBg+YwF/nNc1Cd7OqmDaBiOygz9e97staIKZIzMntgeJ8zOym
 dQk3SgBzOXD/MxOxdCPlB1LimuwVChzKjqDzWkl/7a08YWwApZsLFmjoqWZfuDgD
 IDI1CqtjSa25QDFxb542dlLM11BLBhyMIS5DjF5zOxuymjP211zPp5wMKsu9h4Bl
 MqB0bSNIkFq/7FNMH83Yca4qrAZHRpkIAyU6fXq7NAxHI9GaqdTX2W6F82ANv3Qe
 /wRafxGnMK/42ns7FlFxd2r3WREoO+7jsY66SGDSmRfDMhPubuQH66c7Eaw87uDh
 KqNfyj5MGl64Z3ARXFMA==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3sd0730pxw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Aug 2023 17:00:21 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B4267100053;
 Thu, 10 Aug 2023 17:00:20 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 85A572248C8;
 Thu, 10 Aug 2023 17:00:20 +0200 (CEST)
Received: from [10.201.21.122] (10.201.21.122) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Thu, 10 Aug
 2023 17:00:19 +0200
Message-ID: <b3f5c37b-0bc5-f2b7-4132-509b4da7509e@foss.st.com>
Date: Thu, 10 Aug 2023 17:00:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Bartosz Golaszewski <brgl@bgdev.pl>, Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alex Elder <elder@linaro.org>, Srini
 Kandagatla <srinivas.kandagatla@linaro.org>, Andrew Halaney
 <ahalaney@redhat.com>
References: <20230808120254.11653-1-brgl@bgdev.pl>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20230808120254.11653-1-brgl@bgdev.pl>
X-Originating-IP: [10.201.21.122]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To EQNDAG1NODE4.st.com
 (10.75.129.133)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-10_12,2023-08-10_01,2023-05-22_02
Cc: netdev@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: don't create the
 MDIO bus if there's no mdio node on DT
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

On 8/8/23 14:02, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> The stmmac_dt_phy() function that parses the device-tree node of the MAC
> and allocates the MDIO and PHY resources misses one use-case: when the
> MAC doesn't have a fixed link but also doesn't define its own mdio bus
> on the device tree and instead shares the MDIO lines with a different
> MAC with its PHY phandle reaching over into a different node.
> 
> As this function could also use some more readability, rework it to
> handle this use-case and simplify the code.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>   .../ethernet/stmicro/stmmac/stmmac_platform.c | 26 +++++++++----------
>   1 file changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> index be8e79c7aa34..91844673df43 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> @@ -320,12 +320,14 @@ static int stmmac_mtl_setup(struct platform_device *pdev,
>   static int stmmac_dt_phy(struct plat_stmmacenet_data *plat,
>   			 struct device_node *np, struct device *dev)
>   {
> -	bool mdio = !of_phy_is_fixed_link(np);
>   	static const struct of_device_id need_mdio_ids[] = {
>   		{ .compatible = "snps,dwc-qos-ethernet-4.10" },
>   		{},
>   	};
>   
> +	if (of_phy_is_fixed_link(np))
> +		return 0;
> +
>   	if (of_match_node(need_mdio_ids, np)) {
>   		plat->mdio_node = of_get_child_by_name(np, "mdio");
>   	} else {
> @@ -340,20 +342,18 @@ static int stmmac_dt_phy(struct plat_stmmacenet_data *plat,
>   		}
>   	}
>   
> -	if (plat->mdio_node) {
> -		dev_dbg(dev, "Found MDIO subnode\n");
> -		mdio = true;
> -	}
> +	if (!plat->mdio_node)
> +		return 0;
>   
> -	if (mdio) {
> -		plat->mdio_bus_data =
> -			devm_kzalloc(dev, sizeof(struct stmmac_mdio_bus_data),
> -				     GFP_KERNEL);
> -		if (!plat->mdio_bus_data)
> -			return -ENOMEM;
> +	dev_dbg(dev, "Found MDIO subnode\n");
>   
> -		plat->mdio_bus_data->needs_reset = true;
> -	}
> +	plat->mdio_bus_data = devm_kzalloc(dev,
> +					   sizeof(struct stmmac_mdio_bus_data),
> +					   GFP_KERNEL);
> +	if (!plat->mdio_bus_data)
> +		return -ENOMEM;
> +
> +	plat->mdio_bus_data->needs_reset = true;
>   
>   	return 0;
>   }

Acked-by: Alexandre TORGUE <alexandre.torgue@foss.st.com>

Regards
Alex

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
