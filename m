Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4F51231B
	for <lists+linux-stm32@lfdr.de>; Thu,  2 May 2019 22:21:29 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 06689C6DD9C
	for <lists+linux-stm32@lfdr.de>; Thu,  2 May 2019 20:21:29 +0000 (UTC)
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CE673C6DD9B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 May 2019 20:21:27 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id v80so1686025pfa.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 02 May 2019 13:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=RSVFzqBrNoAzGByRQNnOze9LicthP1Zxl3KzGO68CDM=;
 b=HWx4202fdM6hgHbbQQbOCTOFjQO3TLGOtDwId2KDBlfH30aSG/7brUcfjmpDaWYqT3
 eFlgZC4UaIEyH1W/TgpcMokl72eG7heORhYTf5hLq3ddjpfaKH3a4bA9cXPngFWefwbD
 URW+U2ak3/2ADVYe9ubwMHSaEQxkDOhNvKCaE8Cxb6qSVI8iibrMAU+Rp1Rxloc+12o8
 NCvWGlpklHsKLBmvGLQQkz5AVpU2fi/9Fj/ZClx+PCIIcS8eB5/aP4bherxMBuYxUvx5
 gZkTz7eOCUMwO5KoGiKkFOpSITwMrVFd3nfoIvWTp2NSBdRFqruHZu4vLWgGoccWkG14
 g3xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=RSVFzqBrNoAzGByRQNnOze9LicthP1Zxl3KzGO68CDM=;
 b=MxgRFi0209dbd8km2Lo6hFlwEEUN+dhhFhqpMLKOzPk2yg8H0ToKtI/LTqvcsIS1fb
 kpD1wh41gWaZg1/I6zE8h42CFS+MMUaizHIcSLx1tnmkV3aiGemFx4xUjgGDD3iF2NOI
 9XHwFHHSJQxA8720xQ13K4mw7mYnrDe5dIBuA22x+2+TRTsFZRhgGig6Umbm1yeXx6ze
 Cy35ZpEDr+fblxAkWmTTJyiL3JCKXs+z/QkeVd0HL2Vj1KCz6PPV221sittR27F0eY7g
 DVqkPGhFzKuF3TMXWhk++eCxrauOuwo8ojzw9nfaKzNCsNKA7Y9sBUSBXIwEOYjBdNMt
 mWug==
X-Gm-Message-State: APjAAAVJMB6ATwKUCet+xpsij9AWv0SqzsOV5IuphXW3mJZHXyEyCgcy
 03rIaxftD2Ro0PKeiB6sqbY=
X-Google-Smtp-Source: APXvYqyqxBdfissQiYlYy8sXzM14Kk6vmbI9ypGeaWGJkrP5xZhgv3S/pXhmaX20NrsLpXPiyu8UeQ==
X-Received: by 2002:a63:d908:: with SMTP id r8mr6061828pgg.268.1556828485710; 
 Thu, 02 May 2019 13:21:25 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id 15sm20555pfy.88.2019.05.02.13.21.23
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 02 May 2019 13:21:24 -0700 (PDT)
Date: Thu, 2 May 2019 13:21:22 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Ludovic Barre <ludovic.Barre@st.com>
Message-ID: <20190502202122.GA27894@roeck-us.net>
References: <1556806126-15890-1-git-send-email-ludovic.Barre@st.com>
 <1556806126-15890-2-git-send-email-ludovic.Barre@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1556806126-15890-2-git-send-email-ludovic.Barre@st.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH V2 1/3] watchdog: stm32: update to
 devm_watchdog_register_device
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

On Thu, May 02, 2019 at 04:08:44PM +0200, Ludovic Barre wrote:
> From: Ludovic Barre <ludovic.barre@st.com>
> 
> This patch updates to devm_watchdog_register_device interface
> 
Not that easy. See below.

A more complete solution is at
https://patchwork.kernel.org/patch/10894355

I have a total of three patches for this driver pending for
the next kernel release. Maybe it would make sense to (re-)
start this series from there after the next commit window
closes.

Guenter

> Signed-off-by: Ludovic Barre <ludovic.barre@st.com>
> ---
>  drivers/watchdog/stm32_iwdg.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/watchdog/stm32_iwdg.c b/drivers/watchdog/stm32_iwdg.c
> index e00e3b3..e191bd8 100644
> --- a/drivers/watchdog/stm32_iwdg.c
> +++ b/drivers/watchdog/stm32_iwdg.c
> @@ -243,7 +243,7 @@ static int stm32_iwdg_probe(struct platform_device *pdev)
>  		dev_warn(&pdev->dev,
>  			 "unable to set timeout value, using default\n");
>  
> -	ret = watchdog_register_device(wdd);
> +	ret = devm_watchdog_register_device(&pdev->dev, wdd);
>  	if (ret) {
>  		dev_err(&pdev->dev, "failed to register watchdog device\n");
>  		goto err;
> @@ -263,7 +263,6 @@ static int stm32_iwdg_remove(struct platform_device *pdev)
>  {
>  	struct stm32_iwdg *wdt = platform_get_drvdata(pdev);
>  
> -	watchdog_unregister_device(&wdt->wdd);
>  	clk_disable_unprepare(wdt->clk_lsi);
>  	clk_disable_unprepare(wdt->clk_pclk);

This disables the clock while the watchdog is still registered
and running. That is not a good idea.

>  
> -- 
> 2.7.4
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
