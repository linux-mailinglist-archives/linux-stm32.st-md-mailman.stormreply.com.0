Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC9A4FA897
	for <lists+linux-stm32@lfdr.de>; Sat,  9 Apr 2022 15:33:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 74C69C5F1D6;
	Sat,  9 Apr 2022 13:33:53 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 032B7C06F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  9 Apr 2022 13:33:51 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id i27so22324086ejd.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 09 Apr 2022 06:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=LO7mTJuUjnyguTxwzU4yCMRsr4W3KT8BOY3t4LlaHc0=;
 b=NSPuRoYHtyOw+PcsMZMVtuInfF33reqEX80RTlsMYF96wzkfEaIKPTkf0zDLCojnUm
 7GdAM9ck8RvQnAE0+woC+0Cz0hKM9k7ConH5cc8CM3A80Q22AF30cnY5tVI5IrRhfRiq
 fUs2YJsfoDOLl23ee7Kfwr0FQg7iHJDavcGzo6omSFqqR7QkLBp6xvW024IMq4mk8XcH
 aI+dI62HLCe60/HRWGhTBdhYz6pdh05BA5qgDsK/MG0ybk9Vjkb5p0YHoofix6xORs7e
 TQjQGp1ld64FVyUXf1RkiYaMnO4jpnKDkq/gesw7lqgg3jkxwTzzbP8gH8cCxOWqkIK3
 2lCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=LO7mTJuUjnyguTxwzU4yCMRsr4W3KT8BOY3t4LlaHc0=;
 b=2meL3yeHyJwE35SnmHXV8uK8myg3Ul2xp1Pq4C/w6CdnbqTLLvGKwj86fqzExbEL/j
 roeIWLBl0SG/WTgeUBBZVWn/wjIa/fCJLqiwiSwCXouTqzVVGMc6zS9FZPDLzrr1tyMU
 KmqRcQ4j9xYzfhOvZLpdPVHTATMs1pJ4XGexBPwBQJo+uR5Jp3h54ljhvQfc0gwxREe6
 l6JpHG2bb+QmHS9vp5fQgNa7aLF6Dlh2n4yH81/9/e3AGsnBcty4Uf1gz/4mYyRjZkdm
 vC45xHB+opy2/bkTgLNMO/JXbsbCfSacvTWXNP4FLVqK1PcDuyn4Uc+RgCZqmuxBSLhe
 oNWA==
X-Gm-Message-State: AOAM5301KAIkIHDoP961fQHnhvNFsesZXuwJtExbbAhO/guyNwOluZHz
 vbtLb/dqtdh+QdIRppZeB3d9QA==
X-Google-Smtp-Source: ABdhPJw7Y7cYYHPAiiiP0NIjLn5Hmp6+EKk8JZn75hkyokX3E/0ElhCjWMr9REwrEdqcx3UfkRN70w==
X-Received: by 2002:a17:906:d204:b0:6d6:df17:835e with SMTP id
 w4-20020a170906d20400b006d6df17835emr22437048ejz.20.1649511231518; 
 Sat, 09 Apr 2022 06:33:51 -0700 (PDT)
Received: from [192.168.0.188] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.gmail.com with ESMTPSA id
 q22-20020a170906771600b006cf8a37ebf5sm9774514ejm.103.2022.04.09.06.33.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Apr 2022 06:33:51 -0700 (PDT)
Message-ID: <3b527700-444e-1f6e-fee1-5cd6ed2ef7f9@linaro.org>
Date: Sat, 9 Apr 2022 15:33:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20220401103604.8705-1-andriy.shevchenko@linux.intel.com>
 <20220401103604.8705-6-andriy.shevchenko@linux.intel.com>
 <d1f873c6-150f-5f4d-7aa8-7bb15823d991@linaro.org>
 <YlBXSVyj88CqjGj4@smile.fi.intel.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <YlBXSVyj88CqjGj4@smile.fi.intel.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Tomer Maimon <tmaimon77@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 linux-samsung-soc@vger.kernel.org, Benjamin Fair <benjaminfair@google.com>,
 Marc Zyngier <maz@kernel.org>, Gregory Clement <gregory.clement@bootlin.com>,
 Nancy Yuen <yuenn@google.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Qianggui Song <qianggui.song@amlogic.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, openbmc@lists.ozlabs.org
Subject: Re: [Linux-stm32] [PATCH v4 05/13] pinctrl: samsung: Switch to use
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 08/04/2022 17:39, Andy Shevchenko wrote:
> On Fri, Apr 08, 2022 at 05:22:21PM +0200, Krzysztof Kozlowski wrote:
>> On 01/04/2022 12:35, Andy Shevchenko wrote:
>>> Switch the code to use for_each_gpiochip_node() helper.
> 
> (...)
> 
>>>  /*
>>>   * Iterate over all driver pin banks to find one matching the name of node,
>>>   * skipping optional "-gpio" node suffix. When found, assign node to the bank.
>>>   */
>>> -static void samsung_banks_of_node_get(struct device *dev,
>>> -				      struct samsung_pinctrl_drv_data *d,
>>> -				      struct device_node *node)
>>> +static void samsung_banks_node_get(struct device *dev, struct samsung_pinctrl_drv_data *d)
>>
>> This is worth simplification anyway, so please split it to separate patch.
> 
> Not sure what to do and why it worth an additional churn.

Makes this change smaller so it's easier to review.

> 
>>>  {
>>>  	const char *suffix = "-gpio-bank";
>>>  	struct samsung_pin_bank *bank;
>>> -	struct device_node *child;
>>> +	struct fwnode_handle *child;
>>>  	/* Pin bank names are up to 4 characters */
>>>  	char node_name[20];
>>>  	unsigned int i;
>>> @@ -1038,17 +1037,17 @@ static void samsung_banks_of_node_get(struct device *dev,
>>>  			continue;
>>>  		}
>>>  
>>> -		for_each_child_of_node(node, child) {
>>> -			if (!of_find_property(child, "gpio-controller", NULL))
>>> -				continue;
>>
>> This does not look equivalent. There are nodes without this property.
> 
> Not sure I understand why not. The macro checks for the property and
> iterates over nodes that have this property.
> 
> Can you elaborate, please?

Eh, my bad, it is equivalent.

> 
>>> -			if (of_node_name_eq(child, node_name))
>>> +		for_each_gpiochip_node(dev, child) {
>>> +			struct device_node *np = to_of_node(child);
>>> +
>>> +			if (of_node_name_eq(np, node_name))
>>>  				break;
>>> -			else if (of_node_name_eq(child, bank->name))
>>> +			if (of_node_name_eq(np, bank->name))
>>>  				break;
>>>  		}
>>
>> This patch has to wait till someone provides you a tested-by. I might do
>> it around next week.
> 
> Fine with me, I will drop it from my repo for now.


Best regards,
Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
