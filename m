Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0807CAC3A14
	for <lists+linux-stm32@lfdr.de>; Mon, 26 May 2025 08:43:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B1025C78F60;
	Mon, 26 May 2025 06:43:32 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4DAF3C57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 May 2025 06:43:31 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54Q6SNec021065;
 Mon, 26 May 2025 08:43:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 OS8PvSfwRlhjZGN6jsgBRmNG5LhO25xsjz5q3ncqIDU=; b=NkJRz0lf3bhigiZE
 eaVdiOwH0if/ejdiiR5pcQ7fSr7JwOushQIUk00jA3tcubbaQGZDwj8Tq4epNT1d
 3YrhJ2BQLBBNSymYHLhaZB/T/sg7D8KoY0lhcwWDujtb8W/+74wyotC7eflbuqkD
 3cVO1Ra83+u//xwjbLRAZGCxjeBsH2sA2zZGt60FOO2qyvCa91I2oqWrU+E82Z/D
 T8dxWsF4qJC7AgZLSXxV/wbuOkIBNzdjYD+mXbJY3ODl+YBrwPlqOBs6Xr1LJDxD
 N022icQCA/bO9rgSkVE/6OD25sP3b9zESQt41nfytHGvKaJ+fvVide+buAXh2GWs
 x8GhFw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46uqp4bbub-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 May 2025 08:43:11 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C73B440044;
 Mon, 26 May 2025 08:42:19 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E1FEEB1D8AA;
 Mon, 26 May 2025 08:41:55 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 26 May
 2025 08:41:55 +0200
Message-ID: <8f948025-a40e-417c-bbc1-a43356118ce4@foss.st.com>
Date: Mon, 26 May 2025 08:41:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Krzysztof Kozlowski
 <krzk@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, <linux-kernel@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>
References: <20250525191300.50873-2-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20250525191300.50873-2-krzysztof.kozlowski@linaro.org>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-26_03,2025-05-22_01,2025-03-28_01
Subject: Re: [Linux-stm32] [PATCH] memory: stm32_omm: Use
 syscon_regmap_lookup_by_phandle_args
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



On 5/25/25 21:13, Krzysztof Kozlowski wrote:
> Use syscon_regmap_lookup_by_phandle_args() which is a wrapper over
> syscon_regmap_lookup_by_phandle() combined with getting the syscon
> argument.  Except simpler code this annotates within one line that given
> phandle has arguments, so grepping for code would be easier.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Not tested on hardware.
> ---
>  drivers/memory/stm32_omm.c | 21 ++++++---------------
>  1 file changed, 6 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/memory/stm32_omm.c b/drivers/memory/stm32_omm.c
> index 79ceb1635698..bee2ecc8c2b9 100644
> --- a/drivers/memory/stm32_omm.c
> +++ b/drivers/memory/stm32_omm.c
> @@ -46,7 +46,7 @@ static int stm32_omm_set_amcr(struct device *dev, bool set)
>  	struct regmap *syscfg_regmap;
>  	struct device_node *node;
>  	struct resource res, res1;
> -	u32 amcr_base, amcr_mask;
> +	unsigned int syscon_args[2];
>  	int ret, idx;
>  	unsigned int i, amcr, read_amcr;
>  
> @@ -98,29 +98,20 @@ static int stm32_omm_set_amcr(struct device *dev, bool set)
>  		of_node_put(node);
>  	}
>  
> -	syscfg_regmap = syscon_regmap_lookup_by_phandle(dev->of_node, "st,syscfg-amcr");
> +	syscfg_regmap = syscon_regmap_lookup_by_phandle_args(dev->of_node, "st,syscfg-amcr",
> +							     2, syscon_args);
>  	if (IS_ERR(syscfg_regmap))
>  		return dev_err_probe(dev, PTR_ERR(syscfg_regmap),
>  				     "Failed to get st,syscfg-amcr property\n");
>  
> -	ret = of_property_read_u32_index(dev->of_node, "st,syscfg-amcr", 1,
> -					 &amcr_base);
> -	if (ret)
> -		return ret;
> -
> -	ret = of_property_read_u32_index(dev->of_node, "st,syscfg-amcr", 2,
> -					 &amcr_mask);
> -	if (ret)
> -		return ret;
> -
>  	amcr = mm_ospi2_size / SZ_64M;
>  
>  	if (set)
> -		regmap_update_bits(syscfg_regmap, amcr_base, amcr_mask, amcr);
> +		regmap_update_bits(syscfg_regmap, syscon_args[0], syscon_args[1], amcr);
>  
>  	/* read AMCR and check coherency with memory-map areas defined in DT */
> -	regmap_read(syscfg_regmap, amcr_base, &read_amcr);
> -	read_amcr = read_amcr >> (ffs(amcr_mask) - 1);
> +	regmap_read(syscfg_regmap, syscon_args[0], &read_amcr);
> +	read_amcr = read_amcr >> (ffs(syscon_args[1]) - 1);
>  
>  	if (amcr != read_amcr) {
>  		dev_err(dev, "AMCR value not coherent with DT memory-map areas\n");

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
