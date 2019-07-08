Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ECAD36200B
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Jul 2019 16:07:28 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A3730C5D471
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Jul 2019 14:07:28 +0000 (UTC)
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6F6B7C5D46F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Jul 2019 14:07:27 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id s27so7764248pgl.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 08 Jul 2019 07:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Mts5yXroYfI0Wyr9A7s3Gq+YGagV18S7ZKDUSCh+Ia4=;
 b=Ar7KcqqvFoS0ThSHwovLDA9qQWM2EJH3qjIpyKl3b4YnedviunpO7IQp89bVPTPzBk
 P+x6YNfU5ljERwWpQQyXdbBjojZsOcJiP3H04LVHviza9gaRb642lZkAp/urelJg+I72
 Hx8P7Whuj18+wBXeysBAjp/aSXUklw0T295qs2lyX+tqmgRxNcShJOe0Dx4urKsesPdc
 61cW3j13D4Lmbj6YO9aiIZrXQw0GEKmnxz/eEDhRGtVrr7XRiyYVcPpwnGNUt34WLs6V
 MSP2AM0ftxnTtHXp2Vks02n7FExxBXfQdIGKUXeILgz/8okYpn3KCgdHZ/IF+HthdlvD
 fBUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Mts5yXroYfI0Wyr9A7s3Gq+YGagV18S7ZKDUSCh+Ia4=;
 b=QoF6IMJa6foxR0imenWsRaPjfYFCRpApxWKQf8JIy/1CzbJmsdFCiqwj57kX3gu3vi
 JCGF3dhC2zBC5GCMr/WEsjyQKJKIPLDIBM6yUqiHtwsqBSU2+Lfwv/hkIyvYlJy836QM
 /3ZlP058Jh6X6D8//SbKAzRWeTDloUPvHR21bu1cJafRkSOUo5Tgo1mYnw+IQ5V9HADe
 yyWZVZ/wKoAee/BoPjrGP7A9c6IZArjOrepheZBAGl8wjQB6AWm0ogFdqmgKbyu0eEnB
 TIiIx13NXE5k9Oi7G6FQVF4RCGGzrP+nVlrCWcfLDOWjKQqXPRltcmVSJ90CJpF8aEOD
 H0xQ==
X-Gm-Message-State: APjAAAWX9OzTMeXByDuoRLlv0u5F67BK1paYwEUkfechf6thJcSSaydk
 XLI1wBOiSJWwAtxYWiU8Rwxqlg==
X-Google-Smtp-Source: APXvYqyOo/VR8k+Lrm9hsqwa/a1o/yTnfvlKDKvFiVcDf1Ab1otQGc7c6JYEVh/QTss3ainGobUAHw==
X-Received: by 2002:a63:5920:: with SMTP id n32mr9668843pgb.352.1562594845697; 
 Mon, 08 Jul 2019 07:07:25 -0700 (PDT)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net.
 [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id y133sm17699205pfb.28.2019.07.08.07.07.24
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 08 Jul 2019 07:07:24 -0700 (PDT)
Date: Mon, 8 Jul 2019 07:07:22 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <20190708140722.GI1263@builder>
References: <20190708124311.3448056-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190708124311.3448056-1-arnd@arndb.de>
User-Agent: Mutt/1.10.0 (2018-05-17)
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Fabien Dessenne <fabien.dessenne@st.com>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] remoteproc: stm32: fix building without
	ARM SMCC
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

On Mon 08 Jul 05:42 PDT 2019, Arnd Bergmann wrote:

> When compile testing this driver without SMCC support enabled,
> we get a link error:
> 
> drivers/remoteproc/stm32_rproc.o: In function `stm32_rproc_start':
> stm32_rproc.c:(.text+0x776): undefined reference to `__arm_smccc_smc'
> drivers/remoteproc/stm32_rproc.o: In function `stm32_rproc_stop':
> stm32_rproc.c:(.text+0x92c): undefined reference to `__arm_smccc_smc'
> 
> Make the actual call to arm_smccc_smc conditional on the Kconfig
> symbol controlling its implementation.
> 
> Fixes: 13140de09cc2 ("remoteproc: stm32: add an ST stm32_rproc driver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thanks Arnd, applied

Regards,
Bjorn

> ---
>  drivers/remoteproc/stm32_rproc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> index e83077b9ebf5..e2da7198b65f 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -344,7 +344,7 @@ static int stm32_rproc_set_hold_boot(struct rproc *rproc, bool hold)
>  
>  	val = hold ? HOLD_BOOT : RELEASE_BOOT;
>  
> -	if (ddata->secured_soc) {
> +	if (IS_ENABLED(CONFIG_HAVE_ARM_SMCCC) && ddata->secured_soc) {
>  		arm_smccc_smc(STM32_SMC_RCC, STM32_SMC_REG_WRITE,
>  			      hold_boot.reg, val, 0, 0, 0, 0, &smc_res);
>  		err = smc_res.a0;
> -- 
> 2.20.0
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
