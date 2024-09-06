Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D79970DE2
	for <lists+linux-stm32@lfdr.de>; Mon,  9 Sep 2024 08:30:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5058DC78021;
	Mon,  9 Sep 2024 06:30:42 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0B9EDC6DD9A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Sep 2024 09:49:56 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-5333b2fbedaso3108242e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 06 Sep 2024 02:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725616195; x=1726220995;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:content-language:in-reply-to:mime-version
 :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sgMl6X+aCYow9KmkMAtlwqiug4zLRNRZBDBHxZLDaOo=;
 b=OUtSK2FIbimY/w876tqWQzm0+n98iSOq4y98S9ly/YwfgvmqMSuDKoMexitAgOXIYW
 jPMo97riipEtCkbp+8VZG3ZcJyuRDA1knKHV7lQbaHqWbE9g8Dropie1iUXDziYmk7rY
 Ptgp3Hh1Tn0oDeIGy04FAz7dPVK7WtMdO1q2UWrXMJSLapTqaMXU5hKu9A+Z6QQToFIN
 EQLrYCmOfEXv4DunwUzNAkop0XvQvzfvHecskv+x/09KrNH8qqpbEYMoc05Sz7EnYZZo
 EhbC7yDKK8iknRxF/v4+bxy3P0p0NLaP/DKOaflzxWh9a9tdyzAfbAjisYPJrDdwV5gY
 vrMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725616195; x=1726220995;
 h=content-transfer-encoding:content-language:in-reply-to:mime-version
 :user-agent:date:message-id:from:references:cc:to:subject
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sgMl6X+aCYow9KmkMAtlwqiug4zLRNRZBDBHxZLDaOo=;
 b=rcmrr4a76TR7WzUmdwWVedKEdG4kcYld1UMfdymqevUROYWSLW8V0Cqitlh9x9kCe9
 MCS5BVzzimya7nLNd2ALBycdSU2bRfO6hb+/Bb6IODcY3za64GaT42qNM9Ga0c8Qku7P
 YEPcIj0t33aMnkZ+Y/xdJ+xyB0Q62glk6qJck0BlzrE142e43cJkovRNqwm94ryAAYd9
 oWvcAm8vvhmoPMLavjXTD800B0gyAOsgz/1cXCoP0g1OU6Lj8f691pVj3ZJBb2+EAULq
 kgevY4mprF6TyqISnZMQt3iuTTnAloJUP0CSh24pS90qe9+fyyUxXYor0jjAF0RTzbUt
 WTRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVlZd9L975u6i3r2tp7+TyDCFhVrSuf8u9r+7DCwYXu+nodIyz+JPda7UmwlrBzKiEs0wSks8fYxFyf1A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxAuDZkTA74MW7ZH53Zjes/06vDHmneTzX6sZNgQBKaPurJxpYv
 pZ/06TMjOWBv06sW/U1grKKNUhooR4RuMi+pVKxS3uxY7MtdrORK
X-Google-Smtp-Source: AGHT+IFwUu3jBR7TONcrgd2dayhBiQjxS1uLs60iMAAm26ahWb/uKb2/mM5Y7+OHP7adG+c24a89BA==
X-Received: by 2002:a05:6512:282a:b0:52c:df51:20bc with SMTP id
 2adb3069b0e04-536587abf24mr1170940e87.16.1725616194662; 
 Fri, 06 Sep 2024 02:49:54 -0700 (PDT)
Received: from [192.168.1.105] ([31.173.86.146])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-535408518f5sm2837072e87.288.2024.09.06.02.49.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Sep 2024 02:49:54 -0700 (PDT)
To: Ma Ke <make24@iscas.ac.cn>, linus.walleij@linaro.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 bartosz.golaszewski@linaro.org, antonio.borneo@foss.st.com,
 valentin.caron@foss.st.com, peng.fan@nxp.com, akpm@linux-foundation.org
References: <20240906020323.556593-1-make24@iscas.ac.cn>
From: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <22a622cd-5f10-58cf-92e8-be3da31e127c@gmail.com>
Date: Fri, 6 Sep 2024 12:49:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20240906020323.556593-1-make24@iscas.ac.cn>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 09 Sep 2024 06:30:42 +0000
Cc: linux-gpio@vger.kernel.org, stable@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2] pinctrl: stm32: check devm_kasprintf()
	returned value
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

On 9/6/24 5:03 AM, Ma Ke wrote:

> devm_kasprintf() can return a NULL pointer on failure but this returned
> value is not checked. Fix this lack and check the returned value.
> 
> Found by code review.
> 
> Cc: stable@vger.kernel.org
> Fixes: 32c170ff15b0 ("pinctrl: stm32: set default gpio line names using pin names")
> Signed-off-by: Ma Ke <make24@iscas.ac.cn>
[...]

> diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
> index a8673739871d..f23b081f31b3 100644
> --- a/drivers/pinctrl/stm32/pinctrl-stm32.c
> +++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
> @@ -1374,10 +1374,16 @@ static int stm32_gpiolib_register_bank(struct stm32_pinctrl *pctl, struct fwnode
>  
>  	for (i = 0; i < npins; i++) {
>  		stm32_pin = stm32_pctrl_get_desc_pin_from_gpio(pctl, bank, i);
> -		if (stm32_pin && stm32_pin->pin.name)
> +		if (stm32_pin && stm32_pin->pin.name) {
>  			names[i] = devm_kasprintf(dev, GFP_KERNEL, "%s", stm32_pin->pin.name);
> -		else
> +			if (!names[i]) {
> +				err = -ENOMEM;
> +				goto err_clk;
> +			}
> +		}
> +
> +		else {

   No, that should be:

		} else {

   See Documentation/process/coding-style.rst, section 3.

>  			names[i] = NULL;
> +		}
>  	}
[...]

MBR, Sergey
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
