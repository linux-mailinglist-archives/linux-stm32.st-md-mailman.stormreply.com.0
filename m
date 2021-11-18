Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 77198456170
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Nov 2021 18:26:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 26575C5E2CC;
	Thu, 18 Nov 2021 17:26:54 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 34889C5C82A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Nov 2021 17:26:53 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id o14so5846071plg.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Nov 2021 09:26:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ffg8RENMvUuNEkBhbj1rA+p5DmTOHVu6yl2demT0EE4=;
 b=fb17491S/0gCnhjw+z0N6OqW92Tpeno6JI0c/csN8eX8CnIeKqlHLLnbYOpgouQx5q
 /vtBplywQdcqf0PQ3Qwot2PPxBcx3YU6PQ2GCes4CuxMTHWYtAK1HKc0+3i8o7FAbRpY
 01mzWpo1DwrHuAepeXOHU6IF2mjHq+r09yhUe01Lh42slxYx0G0lRzkQWMNGjzL1ixPw
 Yxp4dRABOXdkmw/u3rWxmnxmfcPPSBUfUvSfP63GYg4Rz2jZ16TtwkMYE1Imud86YSZ+
 +iPhSMPj46izY9h6v8K7QFlyNbHHE3x4LMg3ekEun1ZTGngs9MDjCwXVWFVLZIWKo/FG
 wJNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ffg8RENMvUuNEkBhbj1rA+p5DmTOHVu6yl2demT0EE4=;
 b=hb/mUQzBUI0zEhVBeI5ETXErQg3lEHVLANvFup/YPw+TJnyZKL1jp8gTBAuRl6ihyg
 J8q1DFNwiyTAI0YCPDL0EyoCd8DWT2u2lhshK8uW1yaFr11UHV30rrWmN6DOh8onP3Fw
 infSziom/J5t0KLH2H3AyVLLUB6KegYUmh6SYvY5mriyRR6Pr3SlQZnvjOht11juZ6MS
 mtbTjUzoVhEJTzAbffjqKcCXSP0fBPMW7RxKWCk0ZPWxi6pYn1euqvOH4X5YKboVe79d
 UrSzAYFKl/iUM7dkY43EW01qu/E1gBVtRJNl7Vg37CPYQ9tt/0h/7LaXByqyMVD2m0JV
 syTw==
X-Gm-Message-State: AOAM531bUenjJdHCHENV2lKyKPA3Lwwu/8AbN2FVxBG5ORZiEk0kHx7v
 GE3ojgqlecL5D3ub3bA3Rt/1PA==
X-Google-Smtp-Source: ABdhPJwT015s86rLy9F8ng6d55iG1IPThLw+nvpC0UIAsjoQ/rL8E+JpvJUMBGsEjaoL3VO27U59zg==
X-Received: by 2002:a17:902:e548:b0:141:f4ae:d2bd with SMTP id
 n8-20020a170902e54800b00141f4aed2bdmr69754101plf.41.1637256411831; 
 Thu, 18 Nov 2021 09:26:51 -0800 (PST)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id z22sm233489pfe.93.2021.11.18.09.26.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Nov 2021 09:26:50 -0800 (PST)
Date: Thu, 18 Nov 2021 10:26:48 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <20211118172648.GC2530497@p14s>
References: <20211108135945.3364-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211108135945.3364-1-arnaud.pouliquen@foss.st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [Linux-stm32] [PATCH] rpmsg: char: Add pr_fmt() to prefix
	messages
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

On Mon, Nov 08, 2021 at 02:59:45PM +0100, Arnaud Pouliquen wrote:
> Make all messages to be prefixed in a unified way.
> Add pr_fmt() to achieve this.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/rpmsg/rpmsg_char.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> index b5907b80727c..d6214cb66026 100644
> --- a/drivers/rpmsg/rpmsg_char.c
> +++ b/drivers/rpmsg/rpmsg_char.c
> @@ -9,6 +9,9 @@
>   * Based on rpmsg performance statistics driver by Michal Simek, which in turn
>   * was based on TI & Google OMX rpmsg driver.
>   */
> +
> +#define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
> +
>  #include <linux/cdev.h>
>  #include <linux/device.h>
>  #include <linux/fs.h>
> @@ -550,7 +553,7 @@ static int rpmsg_chrdev_init(void)
>  
>  	ret = alloc_chrdev_region(&rpmsg_major, 0, RPMSG_DEV_MAX, "rpmsg");
>  	if (ret < 0) {
> -		pr_err("rpmsg: failed to allocate char dev region\n");
> +		pr_err("failed to allocate char dev region\n");
>  		return ret;
>  	}
>  
> @@ -563,7 +566,7 @@ static int rpmsg_chrdev_init(void)
>  
>  	ret = register_rpmsg_driver(&rpmsg_chrdev_driver);
>  	if (ret < 0) {
> -		pr_err("rpmsgchr: failed to register rpmsg driver\n");
> +		pr_err("failed to register rpmsg driver\n");

This probably the right thing to do - I will pick up this patch.

Thanks,
Mathieu

>  		class_destroy(rpmsg_class);
>  		unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
>  	}
> -- 
> 2.17.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
