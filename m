Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D363C4EC424
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Mar 2022 14:33:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8B8D6C60467;
	Wed, 30 Mar 2022 12:33:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 83655C01577
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Mar 2022 12:33:30 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22U8wGPF017422;
 Wed, 30 Mar 2022 14:32:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=DEbaSZyL8lbefk5CRO35jWnVS3Bv29rcUXbGK60WGmM=;
 b=57rSGjYYJp3c8dBzu91WPJMLV7bf4spkB5sQ0aOnYE3qMTtdiFXMGbn5Kig5CJH9qBhG
 8N6nwFQOCu1yGjABNWfNUqmBWLjgg+BL96eJDEQo++p9RS7BcMVJhicxv1sbliFQQZiH
 Fm00eO0pYQ9MeTR0lfwOrvGBPmLdn+MufBA2Aif7NByJJbQ51iw6k03JpcjIxK0SctNj
 Qz3rNk/ZAtMmxUENMM2mWMtt7IxXeifPge1+4necc1dDQl8YkX1EZNVkzvHshcgcdId0
 bZwF1cbB+q11aKWRHP06bQ+mc5k0/Q+gJeoJ5s9dhHo4n4zbxgHvE4Jmc7ERK2VAFwMG hQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3f1tkmhg8c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Mar 2022 14:32:43 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B283210002A;
 Wed, 30 Mar 2022 14:32:38 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 937A7221780;
 Wed, 30 Mar 2022 14:32:38 +0200 (CEST)
Received: from [10.211.7.4] (10.75.127.51) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Wed, 30 Mar
 2022 14:32:36 +0200
Message-ID: <ec5a56e6-9402-f80f-3c86-1820e39fec27@foss.st.com>
Date: Wed, 30 Mar 2022 14:32:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Qianggui Song
 <qianggui.song@amlogic.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, <linux-gpio@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <openbmc@lists.ozlabs.org>, <linux-renesas-soc@vger.kernel.org>,
 <linux-samsung-soc@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>
References: <20220329152926.50958-1-andriy.shevchenko@linux.intel.com>
 <20220329152926.50958-5-andriy.shevchenko@linux.intel.com>
From: Fabien DESSENNE <fabien.dessenne@foss.st.com>
In-Reply-To: <20220329152926.50958-5-andriy.shevchenko@linux.intel.com>
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-30_04,2022-03-30_01,2022-02-23_01
Cc: Andrew Lunn <andrew@lunn.ch>, Tomer Maimon <tmaimon77@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Benjamin Fair <benjaminfair@google.com>,
 Kevin Hilman <khilman@baylibre.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Nancy Yuen <yuenn@google.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Gregory Clement <gregory.clement@bootlin.com>
Subject: Re: [Linux-stm32] [PATCH v2 04/13] pinctrl: stm32: Switch to use
 for_each_gpiochip_node() helper
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

Fabien

On 29/03/2022 17:29, Andy Shevchenko wrote:
> Switch the code to use for_each_gpiochip_node() helper.
> 
> While at it, in order to avoid additional churn in the future,
> switch to fwnode APIs where it makes sense.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Fabien Dessenne <fabien.dessenne@foss.st.com>

> ---
>   drivers/pinctrl/stm32/pinctrl-stm32.c | 72 ++++++++++++---------------
>   1 file changed, 33 insertions(+), 39 deletions(-)
> 
> diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
> index 4043a44211f0..3e2f1e3a84be 100644
> --- a/drivers/pinctrl/stm32/pinctrl-stm32.c
> +++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
> @@ -24,6 +24,7 @@
>   #include <linux/pinctrl/pinctrl.h>
>   #include <linux/pinctrl/pinmux.h>
>   #include <linux/platform_device.h>
> +#include <linux/property.h>
>   #include <linux/regmap.h>
>   #include <linux/reset.h>
>   #include <linux/slab.h>
> @@ -1215,13 +1216,12 @@ static const struct pinconf_ops stm32_pconf_ops = {
>   	.pin_config_dbg_show	= stm32_pconf_dbg_show,
>   };
>   
> -static int stm32_gpiolib_register_bank(struct stm32_pinctrl *pctl,
> -	struct device_node *np)
> +static int stm32_gpiolib_register_bank(struct stm32_pinctrl *pctl, struct fwnode_handle *fwnode)
>   {
>   	struct stm32_gpio_bank *bank = &pctl->banks[pctl->nbanks];
>   	int bank_ioport_nr;
>   	struct pinctrl_gpio_range *range = &bank->range;
> -	struct of_phandle_args args;
> +	struct fwnode_reference_args args;
>   	struct device *dev = pctl->dev;
>   	struct resource res;
>   	int npins = STM32_GPIO_PINS_PER_BANK;
> @@ -1230,7 +1230,7 @@ static int stm32_gpiolib_register_bank(struct stm32_pinctrl *pctl,
>   	if (!IS_ERR(bank->rstc))
>   		reset_control_deassert(bank->rstc);
>   
> -	if (of_address_to_resource(np, 0, &res))
> +	if (of_address_to_resource(to_of_node(fwnode), 0, &res))
>   		return -ENODEV;
>   
>   	bank->base = devm_ioremap_resource(dev, &res);
> @@ -1245,15 +1245,15 @@ static int stm32_gpiolib_register_bank(struct stm32_pinctrl *pctl,
>   
>   	bank->gpio_chip = stm32_gpio_template;
>   
> -	of_property_read_string(np, "st,bank-name", &bank->gpio_chip.label);
> +	fwnode_property_read_string(fwnode, "st,bank-name", &bank->gpio_chip.label);
>   
> -	if (!of_parse_phandle_with_fixed_args(np, "gpio-ranges", 3, i, &args)) {
> +	if (!fwnode_property_get_reference_args(fwnode, "gpio-ranges", NULL, 3, i, &args)) {
>   		bank_nr = args.args[1] / STM32_GPIO_PINS_PER_BANK;
>   		bank->gpio_chip.base = args.args[1];
>   
>   		/* get the last defined gpio line (offset + nb of pins) */
>   		npins = args.args[0] + args.args[2];
> -		while (!of_parse_phandle_with_fixed_args(np, "gpio-ranges", 3, ++i, &args))
> +		while (!fwnode_property_get_reference_args(fwnode, "gpio-ranges", NULL, 3, ++i, &args))
>   			npins = max(npins, (int)(args.args[0] + args.args[2]));
>   	} else {
>   		bank_nr = pctl->nbanks;
> @@ -1268,20 +1268,20 @@ static int stm32_gpiolib_register_bank(struct stm32_pinctrl *pctl,
>   				       &pctl->banks[bank_nr].range);
>   	}
>   
> -	if (of_property_read_u32(np, "st,bank-ioport", &bank_ioport_nr))
> +	if (fwnode_property_read_u32(fwnode, "st,bank-ioport", &bank_ioport_nr))
>   		bank_ioport_nr = bank_nr;
>   
>   	bank->gpio_chip.base = bank_nr * STM32_GPIO_PINS_PER_BANK;
>   
>   	bank->gpio_chip.ngpio = npins;
> -	bank->gpio_chip.of_node = np;
> +	bank->gpio_chip.fwnode = fwnode;
>   	bank->gpio_chip.parent = dev;
>   	bank->bank_nr = bank_nr;
>   	bank->bank_ioport_nr = bank_ioport_nr;
>   	spin_lock_init(&bank->lock);
>   
>   	/* create irq hierarchical domain */
> -	bank->fwnode = of_node_to_fwnode(np);
> +	bank->fwnode = fwnode;
>   
>   	bank->domain = irq_domain_create_hierarchy(pctl->domain, 0,
>   					STM32_GPIO_IRQ_LINE, bank->fwnode,
> @@ -1418,7 +1418,7 @@ static int stm32_pctrl_create_pins_tab(struct stm32_pinctrl *pctl,
>   int stm32_pctl_probe(struct platform_device *pdev)
>   {
>   	struct device_node *np = pdev->dev.of_node;
> -	struct device_node *child;
> +	struct fwnode_handle *child;
>   	const struct of_device_id *match;
>   	struct device *dev = &pdev->dev;
>   	struct stm32_pinctrl *pctl;
> @@ -1525,40 +1525,34 @@ int stm32_pctl_probe(struct platform_device *pdev)
>   		return -ENOMEM;
>   
>   	i = 0;
> -	for_each_available_child_of_node(np, child) {
> +	for_each_gpiochip_node(dev, child) {
>   		struct stm32_gpio_bank *bank = &pctl->banks[i];
> +		struct device_node *np = to_of_node(child);
>   
> -		if (of_property_read_bool(child, "gpio-controller")) {
> -			bank->rstc = of_reset_control_get_exclusive(child,
> -								    NULL);
> -			if (PTR_ERR(bank->rstc) == -EPROBE_DEFER) {
> -				of_node_put(child);
> -				return -EPROBE_DEFER;
> -			}
> -
> -			bank->clk = of_clk_get_by_name(child, NULL);
> -			if (IS_ERR(bank->clk)) {
> -				if (PTR_ERR(bank->clk) != -EPROBE_DEFER)
> -					dev_err(dev,
> -						"failed to get clk (%ld)\n",
> -						PTR_ERR(bank->clk));
> -				of_node_put(child);
> -				return PTR_ERR(bank->clk);
> -			}
> -			i++;
> +		bank->rstc = of_reset_control_get_exclusive(np, NULL);
> +		if (PTR_ERR(bank->rstc) == -EPROBE_DEFER) {
> +			fwnode_handle_put(child);
> +			return -EPROBE_DEFER;
>   		}
> -	}
>   
> -	for_each_available_child_of_node(np, child) {
> -		if (of_property_read_bool(child, "gpio-controller")) {
> -			ret = stm32_gpiolib_register_bank(pctl, child);
> -			if (ret) {
> -				of_node_put(child);
> -				return ret;
> -			}
> +		bank->clk = of_clk_get_by_name(np, NULL);
> +		if (IS_ERR(bank->clk)) {
> +			if (PTR_ERR(bank->clk) != -EPROBE_DEFER)
> +				dev_err(dev, "failed to get clk (%ld)\n", PTR_ERR(bank->clk));
> +			fwnode_handle_put(child);
> +			return PTR_ERR(bank->clk);
> +		}
> +		i++;
> +	}
>   
> -			pctl->nbanks++;
> +	for_each_gpiochip_node(dev, child) {
> +		ret = stm32_gpiolib_register_bank(pctl, child);
> +		if (ret) {
> +			fwnode_handle_put(child);
> +			return ret;
>   		}
> +
> +		pctl->nbanks++;
>   	}
>   
>   	dev_info(dev, "Pinctrl STM32 initialized\n");
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
