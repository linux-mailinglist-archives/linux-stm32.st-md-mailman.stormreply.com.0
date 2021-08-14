Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 169703EC372
	for <lists+linux-stm32@lfdr.de>; Sat, 14 Aug 2021 17:02:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B78FEC5A4CF;
	Sat, 14 Aug 2021 15:02:35 +0000 (UTC)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
 [209.85.210.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 24827C57B51
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 14 Aug 2021 15:02:29 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id
 h63-20020a9d14450000b02904ce97efee36so15643038oth.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 14 Aug 2021 08:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=unEHXrg/gyVGx45zTcbq/Ok+pB3H3OtyAMxgD943pU4=;
 b=GL3Kk6SPiYBxtG8EpjPRhswBL4ECIz+kGv2lIbFx3F3F2VL+xbhj+Xj92PGwhURFoP
 S9E2VBpFrJHfpcGSEXyKvWN8XeR37wgzkb/t5J5ytVKoz+jl5uOIMc4dX0l+GekdMbZr
 0BInhrwgQ7p3Es6nsOfyqIYvs4qgDdmu0/wVtl95Cyw5M8nqqCGMsznFlGgaKgviKERX
 NX16ABZLa9LB2Uz9oYhsUXMoC51H+zUTzLWNcmaGWZPUJjB+A0s1CC4VvB4Pd+D1QMYY
 nk6tMjhyh/4cpnuoCx3aWYThc10dl7BzOU6a+xzO/t6izvueuvWMHmM3FbZsP6/6tCL9
 juLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=unEHXrg/gyVGx45zTcbq/Ok+pB3H3OtyAMxgD943pU4=;
 b=CHLMByHTvDAtbYQf74Ze4TMFPTG8iXBrdk84o3ofQWXDhhiB5DS5R3BArzw5OiHQ3K
 0S49xRN0PyPwgencGaJGt94ic8cbeH/dZj6H51wGgfarkS+nSAjzUFcORaae7eKiqgmf
 i2Ch+UD08LIEHxIz0NLX+Fhbdp4Ld5IusQXpii8VNp5SYoRDUdXwSB49gftkulelBxoc
 SWCYafb0dpxZP0OoGvSgyaaxzXjdmdGi/lnmlX1HwbxsTQ6sAmHHZWpIlBcdYVQfoVPZ
 IyZpLQ4wiJROu3IJCqMxWqwGBoiC1rdiHbF2jkA/7QTBELVefSK3YrCvBNgEKPbo/sS5
 EqHA==
X-Gm-Message-State: AOAM532wWP0cV49EYBLtwpCHSew64/yyLZ05OivitF7qUCm+lMnPiVkg
 05awbb+yk1NXZx63az7pB/Y=
X-Google-Smtp-Source: ABdhPJwSJcQUxXRA5sql7TG+AjoqRsYkWuBuWhM3o47G5qr1WQb0HGcf4Jiu0wLEPdHBveS9QTodzA==
X-Received: by 2002:a05:6830:1108:: with SMTP id
 w8mr6228079otq.88.1628953348644; 
 Sat, 14 Aug 2021 08:02:28 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 a6sm1037132oto.13.2021.08.14.08.02.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 Aug 2021 08:02:27 -0700 (PDT)
To: Tang Bin <tangbin@cmss.chinamobile.com>, wim@linux-watchdog.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com
References: <20210814142741.7396-1-tangbin@cmss.chinamobile.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <500cc974-bc39-74d5-1e1c-f763e25caa8b@roeck-us.net>
Date: Sat, 14 Aug 2021 08:02:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210814142741.7396-1-tangbin@cmss.chinamobile.com>
Content-Language: en-US
Cc: linux-kernel@vger.kernel.org,
 Zhang Shengju <zhangshengju@cmss.chinamobile.com>,
 linux-watchdog@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] watchdog: stm32_iwdg: drop superfluous
	error message
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

On 8/14/21 7:27 AM, Tang Bin wrote:
> In the function stm32_iwdg_probe(), devm_platform_ioremap_resource
> has already contained error message, so drop the redundant one.
> 
> Co-developed-by: Zhang Shengju <zhangshengju@cmss.chinamobile.com>
> Signed-off-by: Zhang Shengju <zhangshengju@cmss.chinamobile.com>
> Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/watchdog/stm32_iwdg.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/watchdog/stm32_iwdg.c b/drivers/watchdog/stm32_iwdg.c
> index a3436c296..570a71509 100644
> --- a/drivers/watchdog/stm32_iwdg.c
> +++ b/drivers/watchdog/stm32_iwdg.c
> @@ -237,10 +237,8 @@ static int stm32_iwdg_probe(struct platform_device *pdev)
>   
>   	/* This is the timer base. */
>   	wdt->regs = devm_platform_ioremap_resource(pdev, 0);
> -	if (IS_ERR(wdt->regs)) {
> -		dev_err(dev, "Could not get resource\n");
> +	if (IS_ERR(wdt->regs))
>   		return PTR_ERR(wdt->regs);
> -	}
>   
>   	ret = stm32_iwdg_clk_init(pdev, wdt);
>   	if (ret)
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
