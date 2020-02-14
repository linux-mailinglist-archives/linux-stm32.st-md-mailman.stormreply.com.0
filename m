Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B86715D79F
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Feb 2020 13:47:19 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 46AA2C36B0B;
	Fri, 14 Feb 2020 12:47:19 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 512C9C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Feb 2020 12:47:16 +0000 (UTC)
Received: from archlinux (cpc149474-cmbg20-2-0-cust94.5-4.cable.virginm.net
 [82.4.196.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5D3AC20675;
 Fri, 14 Feb 2020 12:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581684435;
 bh=nGHcZeLEc8JzgZrdyhDdZUKrqvwbSxdLiogLT4ZcRP8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=C5JK862a2NePQDap8pa4EdH/89REDZ7QdhkQsOoqOl+W38SRAq7VkXGt/eEPYB4Iz
 2X0DEzI1Q4uS0NS1hgoXYezRDsMN8ytJqxxLOdFxOTChPiad4S36cM3TDG+T+jeCYo
 Io1TXgtJEKNSFm1v9mtqxiNPJUehpxzBTiAETaMc=
Date: Fri, 14 Feb 2020 12:47:10 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@st.com>
Message-ID: <20200214124710.758215e3@archlinux>
In-Reply-To: <1581418566-31954-1-git-send-email-fabrice.gasnier@st.com>
References: <1581418566-31954-1-git-send-email-fabrice.gasnier@st.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: linux-iio@vger.kernel.org, vilhelm.gray@gmail.com,
 linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] counter: stm32-timer-cnt: remove iio
	headers
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

On Tue, 11 Feb 2020 11:56:06 +0100
Fabrice Gasnier <fabrice.gasnier@st.com> wrote:

> The stm32-timer-cnt driver doesn't use the iio interface. The iio headers
> aren't relevant and can be removed as reported by William in [1].
> With this change, mod_devicetable.h needs to be added to define the
> 'of_device_id' struct.
> 
> [1] https://lkml.org/lkml/2020/2/10/1516
> 
> Reported-by: William Breathitt Gray <vilhelm.gray@gmail.com>
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
Applied.

thanks,

Jonathan

> ---
> Note this applies on top of:
> - "counter: stm32-timer-cnt: add power management support"
> ---
>  drivers/counter/stm32-timer-cnt.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/counter/stm32-timer-cnt.c b/drivers/counter/stm32-timer-cnt.c
> index 50496f4..ef2a974 100644
> --- a/drivers/counter/stm32-timer-cnt.c
> +++ b/drivers/counter/stm32-timer-cnt.c
> @@ -8,9 +8,8 @@
>   *
>   */
>  #include <linux/counter.h>
> -#include <linux/iio/iio.h>
> -#include <linux/iio/types.h>
>  #include <linux/mfd/stm32-timers.h>
> +#include <linux/mod_devicetable.h>
>  #include <linux/module.h>
>  #include <linux/pinctrl/consumer.h>
>  #include <linux/platform_device.h>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
