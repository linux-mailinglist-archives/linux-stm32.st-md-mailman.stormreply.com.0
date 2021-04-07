Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 022D33567EC
	for <lists+linux-stm32@lfdr.de>; Wed,  7 Apr 2021 11:25:18 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AF0D2C5719D;
	Wed,  7 Apr 2021 09:25:17 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A1A86C56639
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Apr 2021 09:25:16 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1379LZaf004981; Wed, 7 Apr 2021 11:25:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=haSkKflyhulunAGGrOOIAsB2FDvMs1StPWjwpR2BzWc=;
 b=nesC2jeMj4MRa05JVrSgXU31cTSvls/KnMBVAP6bRNBTarlPmwCNPip0e7XmZc+l2WAI
 Q2YubDIiSZPNHZyRRwcJTrrV8t7yzljzP6nEcqG1RjpgZQkE4vbEZRy1W5beNo455MDt
 NsBFNOToR08AafKt3tdMTiqjTnP1Dz19tI+xPOWQ3dX/IbdgqHnNekBDn+8J62dHUvIn
 3SqHfg/yigrq8vUMGTcnFNicpSAcSCgojkr9TSHsbH4KoktQyLqkBapXp7OqNvVRr52I
 RSjo0Oy0siEmgb97VaxORyPBlN8R3lMsi18ECSneCJb7qeBusPi4BgbO3ODhs10RbU+m PA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 37rv973we6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Apr 2021 11:25:06 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7EA3810002A;
 Wed,  7 Apr 2021 11:25:05 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 67D7921CA61;
 Wed,  7 Apr 2021 11:25:05 +0200 (CEST)
Received: from [10.211.6.162] (10.75.127.48) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 7 Apr
 2021 11:25:04 +0200
To: Marek Vasut <marex@denx.de>, <linux-arm-kernel@lists.infradead.org>
References: <20210406180035.279249-1-marex@denx.de>
From: Fabien Dessenne <fabien.dessenne@foss.st.com>
Message-ID: <1e7d6e0c-1f7a-e7ca-dda9-d659f3ff744a@foss.st.com>
Date: Wed, 7 Apr 2021 11:25:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210406180035.279249-1-marex@denx.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-04-07_07:2021-04-06,
 2021-04-07 signatures=0
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Fabien Dessenne <fabien.dessenne@st.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] pinctrl: stm32: Print invalid AF warning
 inside stm32_pctrl_is_function_valid()
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

Hi Marek,

Thank you for the patch!


On 06/04/2021 8:00 pm, Marek Vasut wrote:
> The "invalid function %d on pin %d .\n" message is triplicated in the
> driver in different variants, just pull it into the function and have
> it once in the driver. The bonus is that all variants of the message
> now print the pin number and AF consistently, so it is easier to debug
> such pinmux problems.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>

Acked-by: Fabien Dessenne <fabien.dessenne@foss.st.com>

> Cc: Fabien Dessenne <fabien.dessenne@st.com>
> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-stm32@st-md-mailman.stormreply.com
> To: linux-arm-kernel@lists.infradead.org
> ---
>   drivers/pinctrl/stm32/pinctrl-stm32.c | 13 ++++---------
>   1 file changed, 4 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
> index da72e3e5c08d..ad9eb5ed8e81 100644
> --- a/drivers/pinctrl/stm32/pinctrl-stm32.c
> +++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
> @@ -531,6 +531,8 @@ static bool stm32_pctrl_is_function_valid(struct stm32_pinctrl *pctl,
>   		break;
>   	}
>   
> +	dev_err(pctl->dev, "invalid function %d on pin %d .\n", fnum, pin_num);
> +
>   	return false;
>   }
>   
> @@ -545,11 +547,8 @@ static int stm32_pctrl_dt_node_to_map_func(struct stm32_pinctrl *pctl,
>   	(*map)[*num_maps].type = PIN_MAP_TYPE_MUX_GROUP;
>   	(*map)[*num_maps].data.mux.group = grp->name;
>   
> -	if (!stm32_pctrl_is_function_valid(pctl, pin, fnum)) {
> -		dev_err(pctl->dev, "invalid function %d on pin %d .\n",
> -				fnum, pin);
> +	if (!stm32_pctrl_is_function_valid(pctl, pin, fnum))
>   		return -EINVAL;
> -	}
>   
>   	(*map)[*num_maps].data.mux.function = stm32_gpio_functions[fnum];
>   	(*num_maps)++;
> @@ -620,7 +619,6 @@ static int stm32_pctrl_dt_subnode_to_map(struct pinctrl_dev *pctldev,
>   		func = STM32_GET_PIN_FUNC(pinfunc);
>   
>   		if (!stm32_pctrl_is_function_valid(pctl, pin, func)) {
> -			dev_err(pctl->dev, "invalid function.\n");
>   			err = -EINVAL;
>   			goto exit;
>   		}
> @@ -821,11 +819,8 @@ static int stm32_pmx_set_mux(struct pinctrl_dev *pctldev,
>   	int pin;
>   
>   	ret = stm32_pctrl_is_function_valid(pctl, g->pin, function);
> -	if (!ret) {
> -		dev_err(pctl->dev, "invalid function %d on group %d .\n",
> -				function, group);
> +	if (!ret)
>   		return -EINVAL;
> -	}
>   
>   	range = pinctrl_find_gpio_range_from_pin(pctldev, g->pin);
>   	if (!range) {
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
