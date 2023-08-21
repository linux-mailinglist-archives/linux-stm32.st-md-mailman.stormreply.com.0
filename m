Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D0A7831BF
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Aug 2023 22:20:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 689EBC6B44B;
	Mon, 21 Aug 2023 20:20:39 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 71F99C65E56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Aug 2023 20:20:38 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-68a529e1974so927131b3a.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Aug 2023 13:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692649237; x=1693254037;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=PJzS96kMorSHcInyTnYW6Eub6rGk1Addu59Qv90D7BM=;
 b=UFKHdM3hyYjf0/QyShd749nOd5v65vukEEJzaNxswmyTx26BTeCZum7NuLOyDB9+fk
 lmVTnsgSqV4u0O/XKzVR3PLwCDfa79wQvoGvsSkQpjesXQHwoWi8JIzmFUDwmmQuajM+
 hvXbb0Dm09SEPLF3eErYTEXcP7D4nTrMb9V3caY2/N/s8JGjJUziR8bR3Q4e0pS3y9hC
 55k/zBAZPBSqA7218bpkXWTQv1yeej8MzRcCJ77APGz/omaadx2xuHQ8EV7OjpjBHVV9
 9giy3kgKeRDe5VsqNXtEQv7JOtn/Ke2J6Qbajei8XyKXGNja4pLsHK2ER7Opyg4avcpE
 SjfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692649237; x=1693254037;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PJzS96kMorSHcInyTnYW6Eub6rGk1Addu59Qv90D7BM=;
 b=Oyrtg8RnB1Odl6LJkFu8wUI/Pg/9oTBSI1KZy2D3z3FGFhIb45pB5VU/3KM5CS3MsY
 qFmZ3RLcXbxGv7TVkXXsamjM1KUzGWFqRIeZpkUx4TonRwWwA7SdmqHGt2WPDILUh+5V
 IZ9qKYrpSpLcMKc6nM2YrkVBoTWiQHp085MgQ2xSN2tkG7eKQGmcJl2Et6cNmrnFuTp+
 SfF2oaqiCw8kCwGf7AYjLnlMGTF/coD9qq/FhnTiJ1tRC8LYAlZdPaFBh8kFC8RN4XBk
 66BTbr5/5Tt2d0S+2y0r+bwv7e88k9YU7BArAs7hnrYpOZtG8NsRPfI0p78r8GHM4K4x
 R1Zg==
X-Gm-Message-State: AOJu0Yz5FOrQpfr1yk3xJ2coUlk4O0OReIV4QUNADAxhkd+q6/fyfHK8
 4FK/gDZhcpC/dPLbRxM9byn6hg==
X-Google-Smtp-Source: AGHT+IEuRV2LPIg5opv4ffRpSuXdwrxTeyThcglAzmosQIGFbR+27zcpzc0KAqZXKHd6c1spz2/hGg==
X-Received: by 2002:a05:6a20:7f8f:b0:135:38b5:7e58 with SMTP id
 d15-20020a056a207f8f00b0013538b57e58mr6622091pzj.37.1692649237041; 
 Mon, 21 Aug 2023 13:20:37 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:2289:93a7:5faa:cd11])
 by smtp.gmail.com with ESMTPSA id
 s15-20020aa7828f000000b006877a2e6285sm6472296pfm.128.2023.08.21.13.20.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Aug 2023 13:20:36 -0700 (PDT)
Date: Mon, 21 Aug 2023 14:20:33 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnd Bergmann <arnd@kernel.org>
Message-ID: <ZOPHEUQYzbYsFS7Y@p14s>
References: <20230724195704.2432382-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230724195704.2432382-1-arnd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>,
 kernel test robot <lkp@intel.com>, Arnd Bergmann <arnd@arndb.de>,
 Bjorn Andersson <andersson@kernel.org>, Randy Dunlap <rdunlap@infradead.org>,
 linux-remoteproc@vger.kernel.org, Fabien Dessenne <fabien.dessenne@st.com>,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com,
 Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [Linux-stm32] [PATCH] remoteproc: stm32: fix incorrect optional
	pointers
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

On Mon, Jul 24, 2023 at 09:56:49PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Compile-testing without CONFIG_OF shows that the of_match_ptr() macro
> was used incorrectly here:
> 
> drivers/remoteproc/stm32_rproc.c:662:34: warning: unused variable 'stm32_rproc_match' [-Wunused-const-variable]
> 
> As in almost every driver, the solution is simply to remove the
> use of this macro. The same thing happened with the deprecated
> SIMPLE_DEV_PM_OPS(), but the corresponding warning was already shut
> up with __maybe_unused annotations, so fix those as well by using the
> correct DEFINE_SIMPLE_DEV_PM_OPS() macros and removing the extraneous
> __maybe_unused modifiers. For completeness, also add a pm_ptr() to let
> the PM ops be eliminated completely when CONFIG_PM is turned off.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202307242300.ia82qBTp-lkp@intel.com
> Fixes: 03bd158e1535e ("remoteproc: stm32: use correct format strings on 64-bit")
> Fixes: 410119ee29b6c ("remoteproc: stm32: wakeup the system by wdg irq")
> Fixes: 13140de09cc2d ("remoteproc: stm32: add an ST stm32_rproc driver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/remoteproc/stm32_rproc.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 

Fixed 13-character SHAs and applied.

Thanks,
Mathieu


> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> index 98234b44f0389..9d9b13530f78a 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -921,7 +921,7 @@ static void stm32_rproc_remove(struct platform_device *pdev)
>  	rproc_free(rproc);
>  }
>  
> -static int __maybe_unused stm32_rproc_suspend(struct device *dev)
> +static int stm32_rproc_suspend(struct device *dev)
>  {
>  	struct rproc *rproc = dev_get_drvdata(dev);
>  	struct stm32_rproc *ddata = rproc->priv;
> @@ -932,7 +932,7 @@ static int __maybe_unused stm32_rproc_suspend(struct device *dev)
>  	return 0;
>  }
>  
> -static int __maybe_unused stm32_rproc_resume(struct device *dev)
> +static int stm32_rproc_resume(struct device *dev)
>  {
>  	struct rproc *rproc = dev_get_drvdata(dev);
>  	struct stm32_rproc *ddata = rproc->priv;
> @@ -943,16 +943,16 @@ static int __maybe_unused stm32_rproc_resume(struct device *dev)
>  	return 0;
>  }
>  
> -static SIMPLE_DEV_PM_OPS(stm32_rproc_pm_ops,
> -			 stm32_rproc_suspend, stm32_rproc_resume);
> +static DEFINE_SIMPLE_DEV_PM_OPS(stm32_rproc_pm_ops,
> +				stm32_rproc_suspend, stm32_rproc_resume);
>  
>  static struct platform_driver stm32_rproc_driver = {
>  	.probe = stm32_rproc_probe,
>  	.remove_new = stm32_rproc_remove,
>  	.driver = {
>  		.name = "stm32-rproc",
> -		.pm = &stm32_rproc_pm_ops,
> -		.of_match_table = of_match_ptr(stm32_rproc_match),
> +		.pm = pm_ptr(&stm32_rproc_pm_ops),
> +		.of_match_table = stm32_rproc_match,
>  	},
>  };
>  module_platform_driver(stm32_rproc_driver);
> -- 
> 2.39.2
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
