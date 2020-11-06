Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A54752A96AF
	for <lists+linux-stm32@lfdr.de>; Fri,  6 Nov 2020 14:06:49 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 63933C3FAD4;
	Fri,  6 Nov 2020 13:06:49 +0000 (UTC)
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0C607C36B36
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Nov 2020 13:06:48 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id i18so1174933ots.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 06 Nov 2020 05:06:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=fRK20G4/BGOrBRLDBmiiL7+5bvGQEl0XDwSOBPWbBI8=;
 b=JotNPZjcRcLLMkuJh6BLaDMSDw0g7P04Xc5AxvNd8vw3seVk1bWBFK5HRpSVUYTO6n
 oOVRugi+2iuG0C6UdIMZjoi/IByn0JrN3JEzxY7fSYsz8ESmjt/RCRwwOqbEYnDBBpIy
 41R+7lhPGbrQTBqfYfZ9oQuw4l6XJhIiowlsXRb8iAHInVIlyFk8RviH1mSHXniuRGX3
 yiYwEdEyYCYv8B0a1m8nctmtQldvR+L5yZczLKgmns6QXJOfDpnjYK9feNC8fURO1UJc
 HfrPDHlI41/nLcozi0PMKg3XF1J2oeW2TOXAvlPgpMFCSPzToEUMp/rHeSCxIlNEEUFo
 QAaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=fRK20G4/BGOrBRLDBmiiL7+5bvGQEl0XDwSOBPWbBI8=;
 b=hcesSpPgFuYnmmp5RCy0rPxLGAa8nmrZhBRDp0Pl1zLgbmRGWeDCiXLKv+nPdwsM16
 ANGHb+EGEk63YIQ7Kmg/4VX+qIo54dXXRfDECdZtnDOBAdlu0L47LWaHti8AE25F2aKB
 RHCXUIu0WRbn9Wvgth2s8Bi6LHANM6yzabFh+GL06FqHfJcvhQoN6LTAZMXmYAn2Zx5e
 uZoQQ2GOVjyUW0aEzzKbhiwwT4nw0ABL8Idc8bhCubIXyDvwDblndRd8W9JJ1I0ytaqX
 u/4QXflIOWYJTqS2cr2IGCyk0vuKF6yR7r5R1A/YG/E/FtFffQYc4MY+jCDzvHSOZg1C
 vIjA==
X-Gm-Message-State: AOAM530a1IIErS4zeYHOeyMaTnCcglyS5tZUmaA6ruo32erS1p2TkuZ7
 jZYpcxfilZkQ/5BzeAfreBY=
X-Google-Smtp-Source: ABdhPJzRc9hhnOoI4fdYnfJ7tHtsKnHiE1V8K23BxTe2pXu/JQNI10YNh9dPjDG0eyzVTDtu3k11Xw==
X-Received: by 2002:a9d:6c4b:: with SMTP id g11mr1010166otq.265.1604668006787; 
 Fri, 06 Nov 2020 05:06:46 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id m10sm294602oon.27.2020.11.06.05.06.45
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 06 Nov 2020 05:06:46 -0800 (PST)
Date: Fri, 6 Nov 2020 05:06:44 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Christophe Roullier <christophe.roullier@st.com>
Message-ID: <20201106130644.GA14837@roeck-us.net>
References: <20201106094627.21132-1-christophe.roullier@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201106094627.21132-1-christophe.roullier@st.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Etienne Carriere <etienne.carriere@st.com>, linux-kernel@vger.kernel.org,
 mcoquelin.stm32@gmail.com, wim@linux-watchdog.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-watchdog@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 1/1] watchdog: stm32_iwdg: don't print an
 error on probe deferral
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

On Fri, Nov 06, 2020 at 10:46:27AM +0100, Christophe Roullier wrote:
> From: Etienne Carriere <etienne.carriere@st.com>
> 
> Do not print an error trace when deferring probe for clock resources.
> 
> Signed-off-by: Etienne Carriere <etienne.carriere@st.com>
> Signed-off-by: Christophe Roullier <christophe.roullier@st.com>
> ---
>  drivers/watchdog/stm32_iwdg.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/watchdog/stm32_iwdg.c b/drivers/watchdog/stm32_iwdg.c
> index 25188d6bbe15..1b71c205cee0 100644
> --- a/drivers/watchdog/stm32_iwdg.c
> +++ b/drivers/watchdog/stm32_iwdg.c
> @@ -163,7 +163,8 @@ static int stm32_iwdg_clk_init(struct platform_device *pdev,
>  
>  	wdt->clk_lsi = devm_clk_get(dev, "lsi");
>  	if (IS_ERR(wdt->clk_lsi)) {
> -		dev_err(dev, "Unable to get lsi clock\n");
> +		if (PTR_ERR(wdt->clk_lsi) != -EPROBE_DEFER)
> +			dev_err(dev, "Unable to get lsi clock\n");
>  		return PTR_ERR(wdt->clk_lsi);

I would suggest to use
		return dev_err_probe(dev, PTR_ERR(wdt->clk_lsi), "Unable to get lsi clock\n");

Guenter

>  	}
>  
> @@ -171,7 +172,8 @@ static int stm32_iwdg_clk_init(struct platform_device *pdev,
>  	if (wdt->data->has_pclk) {
>  		wdt->clk_pclk = devm_clk_get(dev, "pclk");
>  		if (IS_ERR(wdt->clk_pclk)) {
> -			dev_err(dev, "Unable to get pclk clock\n");
> +			if (PTR_ERR(wdt->clk_pclk) != -EPROBE_DEFER)
> +				dev_err(dev, "Unable to get pclk clock\n");
>  			return PTR_ERR(wdt->clk_pclk);
>  		}
>  
> -- 
> 2.17.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
