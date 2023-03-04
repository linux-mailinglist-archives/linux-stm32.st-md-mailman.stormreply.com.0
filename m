Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9BC6AAB82
	for <lists+linux-stm32@lfdr.de>; Sat,  4 Mar 2023 18:14:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 73756C6904A;
	Sat,  4 Mar 2023 17:14:09 +0000 (UTC)
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com
 [209.85.166.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9A575C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  4 Mar 2023 17:14:07 +0000 (UTC)
Received: by mail-il1-f170.google.com with SMTP id b12so254718ilf.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 04 Mar 2023 09:14:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677950046;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:sender
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Bb/3uTjzeyzShpDLpb3avsAyQtSdcsQ/8OdgiW/5EpM=;
 b=h2bsbE9m54CRt7UWxrdj8gF/HeVCxt7VXtPdjMEPdCvGF+Skyei2dn1iC1DfIuj3Gh
 EP0REmfwpBWIpXt0Z4CEjvbxs7J0ZOL3eVoy45Pwt18Yk9o8xDsO8J04lHlG6dRrfBou
 gv3lEpUadbGHrUkWneFi1LZX2auGnfeszx6kbl07x4khE/F5FFIUdU+f/N8Zi5DkZLAk
 ltnfyr90uIJlO6yHQPI3Eo0xeKuz0N9TWAh0soCjjVAG6WV0bTKx+668FxTbyFlGrLze
 51FbPxpkguoPRbFo2jPNRialPL3mj4/8079G6r5AKcIUJvzvXJR5r2GjuWH2Ixeyb4u7
 5isg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677950046;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:sender
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Bb/3uTjzeyzShpDLpb3avsAyQtSdcsQ/8OdgiW/5EpM=;
 b=a0cN6c75Paet9OkjCVXKHh3L2yb//p1GXuFJP5qFevjU5TLKMql/ehNwW90lRwpo8V
 BWNkqOz4oBC1iqcCsYPjEfMOQz9P7GprQrPeZtAit4jzBlJWYu0KP27T6us+IaDv+Vds
 TXcf9wOnhKNjUxcDXYD66R8q9XQOCWPwPz+FMUxHXPJ/AS/arNXBxC4zmFmxnAahO8Fk
 +tUmZ/ZrA9F4tJZGDR/oOWrjihKkVW9lK+Im2cGbp+Q9iBR0Zm5hxXyeV9W2mlsxc1F3
 MCH8dSNcbSFq2UCoBxJPp9Utlki2hmuTjLmdVLHiRNxRIalnwk2WpBBb+HdpMD1/chIx
 0L5A==
X-Gm-Message-State: AO0yUKWnkRAsQmrFkS8rxDbrHy4fs7zA0Ax2RlUsvI2390c5BJRsSDtE
 ryhh1z1V7EczERCCjOg8HrI=
X-Google-Smtp-Source: AK7set+UgmHZPV4rfx3dOXf3QjEksFH/hDR6UHT2WsZdcBSM6QTWoZsfNVukGoqc9W204o11Ag2U5Q==
X-Received: by 2002:a05:6e02:1907:b0:315:4169:c5ac with SMTP id
 w7-20020a056e02190700b003154169c5acmr5179266ilu.30.1677950046489; 
 Sat, 04 Mar 2023 09:14:06 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 q7-20020a0566380ec700b003b49e7d990asm1674456jas.30.2023.03.04.09.14.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Mar 2023 09:14:06 -0800 (PST)
Date: Sat, 4 Mar 2023 09:14:05 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Message-ID: <337786d1-9d42-466c-8057-849e417a3392@roeck-us.net>
References: <20230303213716.2123717-1-u.kleine-koenig@pengutronix.de>
 <20230303213716.2123717-34-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230303213716.2123717-34-u.kleine-koenig@pengutronix.de>
Cc: kernel@pengutronix.de, linux-watchdog@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 33/34] watchdog: stmp3xxx_rtc: Convert to
 platform remove callback returning void
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Fri, Mar 03, 2023 at 10:37:15PM +0100, Uwe Kleine-K=F6nig wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
> =

> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> =

> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/stmp3xxx_rtc_wdt.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> =

> diff --git a/drivers/watchdog/stmp3xxx_rtc_wdt.c b/drivers/watchdog/stmp3=
xxx_rtc_wdt.c
> index 7caf3aa71c6a..4b2caa9807ac 100644
> --- a/drivers/watchdog/stmp3xxx_rtc_wdt.c
> +++ b/drivers/watchdog/stmp3xxx_rtc_wdt.c
> @@ -109,10 +109,9 @@ static int stmp3xxx_wdt_probe(struct platform_device=
 *pdev)
>  	return 0;
>  }
>  =

> -static int stmp3xxx_wdt_remove(struct platform_device *pdev)
> +static void stmp3xxx_wdt_remove(struct platform_device *pdev)
>  {
>  	unregister_reboot_notifier(&wdt_notifier);
> -	return 0;
>  }
>  =

>  static int __maybe_unused stmp3xxx_wdt_suspend(struct device *dev)
> @@ -144,7 +143,7 @@ static struct platform_driver stmp3xxx_wdt_driver =3D=
 {
>  		.pm =3D &stmp3xxx_wdt_pm_ops,
>  	},
>  	.probe =3D stmp3xxx_wdt_probe,
> -	.remove =3D stmp3xxx_wdt_remove,
> +	.remove_new =3D stmp3xxx_wdt_remove,
>  };
>  module_platform_driver(stmp3xxx_wdt_driver);
>  =

> -- =

> 2.39.1
> =

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
