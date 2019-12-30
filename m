Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 912C612CB87
	for <lists+linux-stm32@lfdr.de>; Mon, 30 Dec 2019 02:05:10 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5AE8DC36B0B;
	Mon, 30 Dec 2019 01:05:08 +0000 (UTC)
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DD84DC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Dec 2019 01:05:06 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id d7so39875122otf.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 29 Dec 2019 17:05:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=1uou/b60cIOsMB3DzOtWATQEv5uMUtNiIAyfu0e/7RU=;
 b=aiKcmfv+dEWo2le/tjhTAw8tcKlQ0CqkPBBHpVEJh7FgnksKRQ3+hLp0toLsq9RsYK
 CztWSrHHddNxP+qLAFQQEwsU2JX7my6RqveTx38RdovRZGe7CM1LBq5T/j4W8IdUmfSJ
 SdF2Bq+gg7r/0zAA0tHGRrmtabNkGkuCDOwU1H/rQ0LSZFVE+7qcNXHq1qyj1FjOJsES
 8HJTTK0LDo7QfVpfOSk5MnnY3Kcezzg6Q0a4tTfkQUQ/8geqnKdwgL4382LucumngyXB
 wfRe/fTehXCvD8htrQa36Fh5ZsMFYQ3P6ul9f9caoovpRKGiukaiVC3R67RiYPuTkr+f
 7Iag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=1uou/b60cIOsMB3DzOtWATQEv5uMUtNiIAyfu0e/7RU=;
 b=WaURqjH7X2lPEylP8BRXXjcj5ebXRbjNPliu58fXXwR7M8w4Qi+MSWvXQTk/6kOQze
 k7NMJ3iJvBY5RImbN8vsGgZ9mswidREEGCuEkGXEEqcADyZtnrw+R/maG8PDrvqI/MLw
 l2BZpj3Ef9UHgXsxGgjMFySKWzobeWD7M02YJKvFl4o22sfrnNB8EKfVpGY1lv2YoMNK
 CX9nsF6MQ5bGBV+VvfoTEKsqu1+0qsgyIvtPY7Lw/yaz1859MAHIaMrv4fs+YWUwJ/Fd
 5u8pBKu4oo0k1fQKQdSEs13IkIWgdvrQPdspuwgi5bhtKJP0AipL2huVwRw7VwtpeN49
 hKwQ==
X-Gm-Message-State: APjAAAVT+DPDipIOpmXLxPKT4QLrNnkEcJLBMPfdxvVWB51K6pvQnrb8
 0brPv2e7tM9f/8gOuVzAR6dyPQ==
X-Google-Smtp-Source: APXvYqxjgsyQVJ4CLBiKYs6InxnmHCMDH1KJmdUI1mQYT+Cx0caVrZ1wXctdMcb1AJLR38bGRw+0+A==
X-Received: by 2002:a05:6830:304c:: with SMTP id
 p12mr41031309otr.214.1577667905418; 
 Sun, 29 Dec 2019 17:05:05 -0800 (PST)
Received: from leoy-ThinkPad-X240s (li1058-79.members.linode.com.
 [45.33.121.79])
 by smtp.gmail.com with ESMTPSA id j10sm10043384otr.64.2019.12.29.17.04.58
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 29 Dec 2019 17:05:04 -0800 (PST)
Date: Mon, 30 Dec 2019 09:04:55 +0800
From: Leo Yan <leo.yan@linaro.org>
To: Yangtao Li <tiny.windzz@gmail.com>
Message-ID: <20191230010455.GC4552@leoy-ThinkPad-X240s>
References: <20191228183538.26189-1-tiny.windzz@gmail.com>
 <20191228183538.26189-6-tiny.windzz@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191228183538.26189-6-tiny.windzz@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: bjorn.andersson@linaro.org, matthias.bgg@gmail.com,
 thierry.reding@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 f.fainelli@gmail.com, jassisinghbrar@gmail.com, jonathanh@nvidia.com,
 agross@kernel.org, bcm-kernel-feedback-list@broadcom.com,
 linux-arm-msm@vger.kernel.org, rjui@broadcom.com,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 lftan@altera.com, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, sbranden@broadcom.com,
 linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com,
 nios2-dev@lists.rocketboards.org, nsaenzjulienne@suse.de
Subject: Re: [Linux-stm32] [PATCH 06/13] mailbox: hi3660: convert to
 devm_platform_ioremap_resource
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

On Sat, Dec 28, 2019 at 06:35:31PM +0000, Yangtao Li wrote:
> Use devm_platform_ioremap_resource() to simplify code.
> 
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>

Reviewed-by: Leo Yan <leo.yan@linaro.org>

> ---
>  drivers/mailbox/hi3660-mailbox.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/mailbox/hi3660-mailbox.c b/drivers/mailbox/hi3660-mailbox.c
> index 53f4bc2488c5..97e2c4ed807d 100644
> --- a/drivers/mailbox/hi3660-mailbox.c
> +++ b/drivers/mailbox/hi3660-mailbox.c
> @@ -240,7 +240,6 @@ static int hi3660_mbox_probe(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  	struct hi3660_mbox *mbox;
>  	struct mbox_chan *chan;
> -	struct resource *res;
>  	unsigned long ch;
>  	int err;
>  
> @@ -248,8 +247,7 @@ static int hi3660_mbox_probe(struct platform_device *pdev)
>  	if (!mbox)
>  		return -ENOMEM;
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	mbox->base = devm_ioremap_resource(dev, res);
> +	mbox->base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(mbox->base))
>  		return PTR_ERR(mbox->base);
>  
> -- 
> 2.17.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
