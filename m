Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EE53051F55C
	for <lists+linux-stm32@lfdr.de>; Mon,  9 May 2022 09:40:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 96D9CC5F1D3;
	Mon,  9 May 2022 07:40:19 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 768C5C5A4FD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 May 2022 07:40:18 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 248LUshn011815;
 Mon, 9 May 2022 09:40:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=/j0WtA1ZdUqRFV99pN+qeJH/+Z3kUlv2gElgYxTejVo=;
 b=nheer9I1FTvVEUlIHIa+vmqDDa2ea18u3DYv8HLTTLLdlgA2AVZnYKk0/D27meek9lfW
 zeUL+xlMDvTrxf1HfDpdVnWYALfvq79gUfbWa3/U39fMYMH6GmvIJVeFlg6nyY29tIVe
 eHwih2uk5kGBu9qy1PQLjAGax9/gii97BiWqgvCiXIzmNiI7hE5FCXj2jRBClVMHydDP
 lox/zazXN9xcaKU0E3R6/7XQozmEnGK19mjogQamOpYn4n0oF5jbayYh9PWbmhxXVkpL
 tI3YDl5OQmpBtz9VU7A8IfCF361bD1Ja6+2K7zy58bCLzZc2vQC/X4PADkkI54DOZRN1 Nw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3fwfng9hsh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 May 2022 09:40:00 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 94AFF100034;
 Mon,  9 May 2022 09:39:58 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8C30F2122E7;
 Mon,  9 May 2022 09:39:58 +0200 (CEST)
Received: from [10.48.1.150] (10.75.127.47) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 9 May
 2022 09:39:57 +0200
Message-ID: <30a2c669-693f-45ec-df0e-610e1f94bffd@foss.st.com>
Date: Mon, 9 May 2022 09:39:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Linus Walleij
 <linus.walleij@linaro.org>, <linux-gpio@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20220507102257.26414-1-andriy.shevchenko@linux.intel.com>
From: Fabien DESSENNE <fabien.dessenne@foss.st.com>
In-Reply-To: <20220507102257.26414-1-andriy.shevchenko@linux.intel.com>
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-09_02,2022-05-06_01,2022-02-23_01
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 kernel test robot <lkp@intel.com>
Subject: Re: [Linux-stm32] [PATCH v1 1/1] pinctrl: stm32: Unshadow np
 variable in stm32_pctl_probe()
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

Hi Andy


Thank you for the patch.

Will this patch be applied in Linus pinctrl tree, or in the gpio-intel 
tree before being merged (linux-next) in the pinctrl tree?

BR

Fabien



On 07/05/2022 12:22, Andy Shevchenko wrote:
> The np variable is used globally for stm32_pctl_probe() and in one of
> its code branches. cppcheck is not happy with that:
> 
>    pinctrl-stm32.c:1530:23: warning: Local variable 'np' shadows outer variable [shadowVariable]
> 
> Instead of simply renaming one of the variables convert some code to
> use a device pointer directly.
> 
> Fixes: bb949ed9b16b ("pinctrl: stm32: Switch to use for_each_gpiochip_node() helper")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Fabien Dessenne <fabien.dessenne@foss.st.com>



> ---
>   drivers/pinctrl/stm32/pinctrl-stm32.c | 21 +++++++++------------
>   1 file changed, 9 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
> index e73f2d24611f..5d1d067b2247 100644
> --- a/drivers/pinctrl/stm32/pinctrl-stm32.c
> +++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
> @@ -1364,8 +1364,9 @@ static int stm32_gpiolib_register_bank(struct stm32_pinctrl *pctl, struct fwnode
>   	return err;
>   }
>   
> -static struct irq_domain *stm32_pctrl_get_irq_domain(struct device_node *np)
> +static struct irq_domain *stm32_pctrl_get_irq_domain(struct platform_device *pdev)
>   {
> +	struct device_node *np = pdev->dev.of_node;
>   	struct device_node *parent;
>   	struct irq_domain *domain;
>   
> @@ -1482,23 +1483,19 @@ static int stm32_pctrl_create_pins_tab(struct stm32_pinctrl *pctl,
>   
>   int stm32_pctl_probe(struct platform_device *pdev)
>   {
> -	struct device_node *np = pdev->dev.of_node;
> +	const struct stm32_pinctrl_match_data *match_data;
>   	struct fwnode_handle *child;
> -	const struct of_device_id *match;
>   	struct device *dev = &pdev->dev;
>   	struct stm32_pinctrl *pctl;
>   	struct pinctrl_pin_desc *pins;
>   	int i, ret, hwlock_id;
>   	unsigned int banks;
>   
> -	if (!np)
> -		return -EINVAL;
> -
> -	match = of_match_device(dev->driver->of_match_table, dev);
> -	if (!match || !match->data)
> +	match_data = device_get_match_data(dev);
> +	if (!match_data)
>   		return -EINVAL;
>   
> -	if (!of_find_property(np, "pins-are-numbered", NULL)) {
> +	if (!device_property_present(dev, "pins-are-numbered")) {
>   		dev_err(dev, "only support pins-are-numbered format\n");
>   		return -EINVAL;
>   	}
> @@ -1510,7 +1507,7 @@ int stm32_pctl_probe(struct platform_device *pdev)
>   	platform_set_drvdata(pdev, pctl);
>   
>   	/* check for IRQ controller (may require deferred probe) */
> -	pctl->domain = stm32_pctrl_get_irq_domain(np);
> +	pctl->domain = stm32_pctrl_get_irq_domain(pdev);
>   	if (IS_ERR(pctl->domain))
>   		return PTR_ERR(pctl->domain);
>   
> @@ -1526,10 +1523,10 @@ int stm32_pctl_probe(struct platform_device *pdev)
>   	spin_lock_init(&pctl->irqmux_lock);
>   
>   	pctl->dev = dev;
> -	pctl->match_data = match->data;
> +	pctl->match_data = match_data;
>   
>   	/*  get optional package information */
> -	if (!of_property_read_u32(np, "st,package", &pctl->pkg))
> +	if (!device_property_read_u32(dev, "st,package", &pctl->pkg))
>   		dev_dbg(pctl->dev, "package detected: %x\n", pctl->pkg);
>   
>   	pctl->pins = devm_kcalloc(pctl->dev, pctl->match_data->npins,
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
