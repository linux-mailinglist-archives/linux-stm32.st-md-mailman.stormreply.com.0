Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 290444EAD21
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Mar 2022 14:29:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D98C8C5EC6B;
	Tue, 29 Mar 2022 12:29:24 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8CA16C5EC47
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Mar 2022 12:29:23 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id w4so24529106wrg.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Mar 2022 05:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=JWAxhkpD2i8UZ8j248lkUJk4oN/7cNs/WUDnK2ILLuA=;
 b=GXvbOt7cHYG+zEcO53/N0pAGW4E6Xl+/x6z8j5FHdbaoRxQOml+aT8B7lfjtZDLDui
 A/AoLBLJRQq07raSX00sgQ2CsnEcSVC84nB88L8RHknLhGnBmoSHcYDjTY3WRgStgsgG
 7J3Q5gETTjx0A6/QY1WSynU7lnhuDecPZcXuP5MXNu0h847ctq1I0oqN1+tua6wWIw71
 0trbdunuN57IRr4bDy7d6h5MqwDacimQr8DiODsFuAN1AtPJet0vWJbzHqCb7k7SdcmJ
 DvUvwp03o2m/oD1pGx+YU65rt+A7TpHp0yiKvac1jsO9r9b9mb5Xf1tf4VZFMfVlrDd6
 df2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=JWAxhkpD2i8UZ8j248lkUJk4oN/7cNs/WUDnK2ILLuA=;
 b=jjzrFTelpzLA6N2btBgWdH748rS1qw38otbwbtJz5YclUieMY4bSpIwGJThNLWTD76
 PRXFhZ5J8q9XThnlTk5+5Fkq1tHea95Yi55EwdzR5rVJBhw2iZTvSgf3uhyJevpTXNn9
 IbCLlGFkMn2leYlTwIROs9DpjhxWEFR7CzXuDwPA+vlGNZvOTNM9/JgHX8AZcuMO7bmK
 2MGn99efDDCsvaJgnIFKoyDf61iwn5eZ3AxqnVv69qEDO6RgDHQSa0ASreha/3+w780E
 IOLg3pFM/Qbe9cNGcypC9v8C9BKr7Z3Hr+dFlb02K82/Nle7Bq2w1Zb2bd3n8eYRUx2e
 f4Ug==
X-Gm-Message-State: AOAM532X4s6M6lxitBh2cf8PkhbYQ1fiypGLk9AA/5FYX7EgrHJDompO
 vQfbPLYcghIkdlw5zllt7Rjq1A==
X-Google-Smtp-Source: ABdhPJxkcUlDSsFDn76pfiNwEFTu8HNkSQvKzGIgeEr33H8pn3eGua5djb1jxK+d7MFlXjOAHbcZlw==
X-Received: by 2002:a05:6000:508:b0:1e4:a027:d147 with SMTP id
 a8-20020a056000050800b001e4a027d147mr30848053wrf.315.1648556962971; 
 Tue, 29 Mar 2022 05:29:22 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:a663:978b:3ffb:7dc3?
 ([2001:861:44c0:66c0:a663:978b:3ffb:7dc3])
 by smtp.gmail.com with ESMTPSA id
 k40-20020a05600c1ca800b0038c6c8b7fa8sm2195017wms.25.2022.03.29.05.29.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Mar 2022 05:29:22 -0700 (PDT)
Message-ID: <3697fe0f-7b6b-764f-8cdb-d925c0944fb0@baylibre.com>
Date: Tue, 29 Mar 2022 14:29:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20220325200338.54270-1-andriy.shevchenko@linux.intel.com>
 <20220325200338.54270-4-andriy.shevchenko@linux.intel.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220325200338.54270-4-andriy.shevchenko@linux.intel.com>
Cc: Andrew Lunn <andrew@lunn.ch>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v1 4/5] pinctrl: meson: Replace custom
 code by gpiochip_count() call
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

On 25/03/2022 21:03, Andy Shevchenko wrote:
> Since we have generic function to count GPIO controller nodes
> under given device, there is no need to open code it. Replace
> custom code by gpiochip_count() call.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>   drivers/pinctrl/meson/pinctrl-meson.c | 28 ++++++++++++---------------
>   1 file changed, 12 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
> index 49851444a6e3..7db70d4e214a 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson.c
> +++ b/drivers/pinctrl/meson/pinctrl-meson.c
> @@ -49,6 +49,7 @@
>   #include <linux/pinctrl/pinctrl.h>
>   #include <linux/pinctrl/pinmux.h>
>   #include <linux/platform_device.h>
> +#include <linux/property.h>
>   #include <linux/regmap.h>
>   #include <linux/seq_file.h>
>   
> @@ -662,27 +663,22 @@ static struct regmap *meson_map_resource(struct meson_pinctrl *pc,
>   	return devm_regmap_init_mmio(pc->dev, base, &meson_regmap_config);
>   }
>   
> -static int meson_pinctrl_parse_dt(struct meson_pinctrl *pc,
> -				  struct device_node *node)
> +static int meson_pinctrl_parse_dt(struct meson_pinctrl *pc)
>   {
> -	struct device_node *np, *gpio_np = NULL;
> +	struct device_node *gpio_np;
> +	unsigned int chips;
>   
> -	for_each_child_of_node(node, np) {
> -		if (!of_find_property(np, "gpio-controller", NULL))
> -			continue;
> -		if (gpio_np) {
> -			dev_err(pc->dev, "multiple gpio nodes\n");
> -			of_node_put(np);
> -			return -EINVAL;
> -		}
> -		gpio_np = np;
> -	}
> -
> -	if (!gpio_np) {
> +	chips = gpiochip_count(pc->dev);
> +	if (!chips) {
>   		dev_err(pc->dev, "no gpio node found\n");
>   		return -EINVAL;
>   	}
> +	if (chips > 1) {
> +		dev_err(pc->dev, "multiple gpio nodes\n");
> +		return -EINVAL;
> +	}
>   
> +	gpio_np = to_of_node(device_get_named_child_node(pc->dev, "gpio-controller"));
>   	pc->of_node = gpio_np;
>   
>   	pc->reg_mux = meson_map_resource(pc, gpio_np, "mux");
> @@ -751,7 +747,7 @@ int meson_pinctrl_probe(struct platform_device *pdev)
>   	pc->dev = dev;
>   	pc->data = (struct meson_pinctrl_data *) of_device_get_match_data(dev);
>   
> -	ret = meson_pinctrl_parse_dt(pc, dev->of_node);
> +	ret = meson_pinctrl_parse_dt(pc);
>   	if (ret)
>   		return ret;
>   

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
