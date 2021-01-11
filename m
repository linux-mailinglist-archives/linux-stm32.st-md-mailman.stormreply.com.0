Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E82A2F0FAA
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Jan 2021 11:06:41 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F3256C5660F;
	Mon, 11 Jan 2021 10:06:40 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 96F31C32EA7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Jan 2021 09:58:14 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id lt17so23877481ejb.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Jan 2021 01:58:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=udVCXM7Wn35aQirz5a19QL8QpKzWmV0LS9M/curg0D0=;
 b=S9Poy5ddotA52KHZZoKPns1PZcG5p/ewp5YBrXCIkf9xy40EWwe+rykhrNfdk6kfMP
 bwcjn8COxV+ii1Xx81NhXN9Z/YsuPtS9dqsjASJyTmzaD2AokOBpv8nA4bUNyfts/8kf
 Ky6nP+Lue6W1WgU43dZbCqWXzP/YSCkTW6G39DTtwJgbgXieys65aCfys8y4c5J55geA
 Tcuy+dcYcoCQ0PB/Gkl5PyaRr2uVX2++cGb6/EWEVEiqcnsB66nBa9yzL+T2kw4SOqZI
 lyGhd2OMZclynyArasrxLTsg59N2YGh9db1N0pWunSM5tV+S92QO9HgrxbNfo+b7X1rY
 b0Iw==
X-Gm-Message-State: AOAM532jZLn+ou8c1Fql6SMWpb1OpwgGJg6oXdcVw00+TLI5AukzuO0S
 1qu51NO1zt228Ua3Cyreh+Q=
X-Google-Smtp-Source: ABdhPJyVCsq5rTpUoTohT6CO72JxfdIzcL6xyKG3YEeMy01WtRt4r8yKJY30OCuOioOtV5QLCMAfsA==
X-Received: by 2002:a17:906:edb2:: with SMTP id
 sa18mr9801943ejb.264.1610359094509; 
 Mon, 11 Jan 2021 01:58:14 -0800 (PST)
Received: from ?IPv6:2a0b:e7c0:0:107::70f? ([2a0b:e7c0:0:107::70f])
 by smtp.gmail.com with ESMTPSA id r21sm7390769eds.91.2021.01.11.01.58.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jan 2021 01:58:13 -0800 (PST)
To: Erwan Le Ray <erwan.leray@foss.st.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20210106162203.28854-1-erwan.leray@foss.st.com>
 <20210106162203.28854-3-erwan.leray@foss.st.com>
From: Jiri Slaby <jirislaby@kernel.org>
Message-ID: <72c81157-4bd1-6a3e-2415-92a2fb29ab6d@kernel.org>
Date: Mon, 11 Jan 2021 10:58:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210106162203.28854-3-erwan.leray@foss.st.com>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 11 Jan 2021 10:06:37 +0000
Cc: devicetree@vger.kernel.org, Valentin Caron <valentin.caron@foss.st.com>,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 2/8] serial: stm32: fix code cleaning
 warnings and checks
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

On 06. 01. 21, 17:21, Erwan Le Ray wrote:
> --- a/drivers/tty/serial/stm32-usart.c
> +++ b/drivers/tty/serial/stm32-usart.c
...
> @@ -973,18 +971,17 @@ static int stm32_init_port(struct stm32_port *stm32port,
>   	struct resource *res;
>   	int ret;
>   
> +	ret = platform_get_irq(pdev, 0);
> +	if (ret <= 0)
> +		return ret ? : -ENODEV;
> +
>   	port->iotype	= UPIO_MEM;
>   	port->flags	= UPF_BOOT_AUTOCONF;
>   	port->ops	= &stm32_uart_ops;
>   	port->dev	= &pdev->dev;
>   	port->fifosize	= stm32port->info->cfg.fifosize;
>   	port->has_sysrq = IS_ENABLED(CONFIG_SERIAL_STM32_CONSOLE);
> -
> -	ret = platform_get_irq(pdev, 0);
> -	if (ret <= 0)
> -		return ret ? : -ENODEV;
>   	port->irq = ret;

I would move this set from ret above too. Or introduce a new variable, 
e.g. "irq".

thanks,
-- 
js
suse labs
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
