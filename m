Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C272A9B01
	for <lists+linux-stm32@lfdr.de>; Fri,  6 Nov 2020 18:41:15 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6CDB5C3FAD4;
	Fri,  6 Nov 2020 17:41:15 +0000 (UTC)
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D580BC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Nov 2020 17:41:12 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id 79so1951711otc.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 06 Nov 2020 09:41:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=uLhEdPzLKPN9y0Y1FvDCW1msQK/rmAeoz0yPSS7CP/s=;
 b=jqRks1dh3gjGCUabb2ufNQxlNGI8bjL4On2wkLX9Ph8+OqEoK6yCVqP3PSAQrxYePZ
 OvlbZdByOacc3+0thZjFFoJm5sywILYb9ecoghyIdSRyo4SksjTqKEKwrv0eMEvFrDOH
 8OeowFAovGAqDBPuc4PLswmyAHnzXKiTZzXvGce0fwYP1UM5Yl3dBudxTkPFCVe1S/7J
 HAOzPav18RCtb6VZLoE0ko9LqVCeZKOK/Wi1L+TMXcb9bf/CF+M8dfnVO41tpnENV2ly
 MAYEG4gwCPHWmHxXyrhyEG6xUqX8bAIUtALTw5Z+uyC7qKHjxcabmD2CZVoimVwI0eQf
 yZCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=uLhEdPzLKPN9y0Y1FvDCW1msQK/rmAeoz0yPSS7CP/s=;
 b=UOQjIHEB7boSY7h0QCVoq7xzm89IeGXfcPIy8JPoMmG5W1xSplSbPYV6kExvKRUygi
 y9F3dJ2+hz6LOV1gENquLVGhJVZv37TMJzC6oH70wgAgg5R5+EP2TpWgKO23IDVtDvQL
 cVmx5eCaP0Uw+D/zbzasfSY+4oqlEuzxFS11bWWzVSxC+O+VfiDyyBS2xb+lKHaEWZTq
 a6duskO0qapjY7r3TEzYz4db277ycyTFyIY8mXbuvS9bMHkUfZb/PNsffBQfn6ovwcm+
 YUXilvgf6w0mxNzB1StF4Y1W3Y8qaooVon5wME+A9aD6KYX2AqlCFGi3xUZ0X/iGbpmL
 dT9w==
X-Gm-Message-State: AOAM531X2r8nCADz5EN/B6E9Y0g2Uljjqc8CH77DucTGPjwu0hyJvoLW
 /GgeLDTwzNfB5mKVkT/3biI=
X-Google-Smtp-Source: ABdhPJxSjaZ0nuVUyMqzhEbLb4XE4zzKDOr9zqrn8ee4fvTdWOQ00WwQQvU2vC4TLwd24DGXXkbhCQ==
X-Received: by 2002:a9d:720e:: with SMTP id u14mr1893659otj.65.1604684471589; 
 Fri, 06 Nov 2020 09:41:11 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id e3sm464230ooq.0.2020.11.06.09.41.10
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 06 Nov 2020 09:41:10 -0800 (PST)
Date: Fri, 6 Nov 2020 09:41:09 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Christophe Roullier <christophe.roullier@st.com>
Message-ID: <20201106174109.GF14837@roeck-us.net>
References: <20201106142327.3129-1-christophe.roullier@st.com>
 <20201106142327.3129-2-christophe.roullier@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201106142327.3129-2-christophe.roullier@st.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Etienne Carriere <etienne.carriere@st.com>, linux-kernel@vger.kernel.org,
 mcoquelin.stm32@gmail.com, wim@linux-watchdog.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-watchdog@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH V2 1/1] watchdog: stm32_iwdg: don't print
 an error on probe deferral
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

On Fri, Nov 06, 2020 at 03:23:27PM +0100, Christophe Roullier wrote:
> From: Etienne Carriere <etienne.carriere@st.com>
> 
> Do not print an error trace when deferring probe for clock resources.
> 
> Signed-off-by: Etienne Carriere <etienne.carriere@st.com>
> Signed-off-by: Christophe Roullier <christophe.roullier@st.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/stm32_iwdg.c | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/watchdog/stm32_iwdg.c b/drivers/watchdog/stm32_iwdg.c
> index 25188d6bbe15..a3436c296c97 100644
> --- a/drivers/watchdog/stm32_iwdg.c
> +++ b/drivers/watchdog/stm32_iwdg.c
> @@ -162,18 +162,15 @@ static int stm32_iwdg_clk_init(struct platform_device *pdev,
>  	u32 ret;
>  
>  	wdt->clk_lsi = devm_clk_get(dev, "lsi");
> -	if (IS_ERR(wdt->clk_lsi)) {
> -		dev_err(dev, "Unable to get lsi clock\n");
> -		return PTR_ERR(wdt->clk_lsi);
> -	}
> +	if (IS_ERR(wdt->clk_lsi))
> +		return dev_err_probe(dev, PTR_ERR(wdt->clk_lsi), "Unable to get lsi clock\n");
>  
>  	/* optional peripheral clock */
>  	if (wdt->data->has_pclk) {
>  		wdt->clk_pclk = devm_clk_get(dev, "pclk");
> -		if (IS_ERR(wdt->clk_pclk)) {
> -			dev_err(dev, "Unable to get pclk clock\n");
> -			return PTR_ERR(wdt->clk_pclk);
> -		}
> +		if (IS_ERR(wdt->clk_pclk))
> +			return dev_err_probe(dev, PTR_ERR(wdt->clk_pclk),
> +					     "Unable to get pclk clock\n");
>  
>  		ret = clk_prepare_enable(wdt->clk_pclk);
>  		if (ret) {
> -- 
> 2.17.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
