Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BD57B31B16F
	for <lists+linux-stm32@lfdr.de>; Sun, 14 Feb 2021 18:10:30 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 812CCC5719A;
	Sun, 14 Feb 2021 17:10:30 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A67FBC3FADC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 14 Feb 2021 17:10:29 +0000 (UTC)
Received: from archlinux (cpc108967-cmbg20-2-0-cust86.5-4.cable.virginm.net
 [81.101.6.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2838064DBA;
 Sun, 14 Feb 2021 17:10:24 +0000 (UTC)
Date: Sun, 14 Feb 2021 17:10:21 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Message-ID: <20210214171021.41b3e4e3@archlinux>
In-Reply-To: <7fa80c10fcd10d1d47d1bddced2b2cca3ff59ba9.1613131238.git.vilhelm.gray@gmail.com>
References: <cover.1613131238.git.vilhelm.gray@gmail.com>
 <7fa80c10fcd10d1d47d1bddced2b2cca3ff59ba9.1613131238.git.vilhelm.gray@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, o.rempel@pengutronix.de, kernel@pengutronix.de,
 fabrice.gasnier@st.com, syednwaris@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 alexandre.torgue@st.com
Subject: Re: [Linux-stm32] [PATCH v8 10/22] counter: Standardize to ERANGE
 for limit exceeded errors
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

On Fri, 12 Feb 2021 21:13:34 +0900
William Breathitt Gray <vilhelm.gray@gmail.com> wrote:

> ERANGE is a semantically better error code to return when an argument
> value falls outside the supported limit range of a device.

#define	ERANGE		34	/* Math result not representable */

Not generally applicable to a parameter being out of range
despite the name.
#define	EINVAL		22	/* Invalid argument */
Is probably closer to what we want to describe here.

Jonathan


> 
> Cc: Syed Nayyar Waris <syednwaris@gmail.com>
> Cc: Fabrice Gasnier <fabrice.gasnier@st.com>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
> ---
>  drivers/counter/104-quad-8.c        | 6 +++---
>  drivers/counter/stm32-lptimer-cnt.c | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/counter/104-quad-8.c b/drivers/counter/104-quad-8.c
> index 674263b4d2c4..a2cabb028db0 100644
> --- a/drivers/counter/104-quad-8.c
> +++ b/drivers/counter/104-quad-8.c
> @@ -154,7 +154,7 @@ static int quad8_count_write(struct counter_device *counter,
>  
>  	/* Only 24-bit values are supported */
>  	if (val > 0xFFFFFF)
> -		return -EINVAL;
> +		return -ERANGE;
>  
>  	mutex_lock(&priv->lock);
>  
> @@ -671,7 +671,7 @@ static ssize_t quad8_count_preset_write(struct counter_device *counter,
>  
>  	/* Only 24-bit values are supported */
>  	if (preset > 0xFFFFFF)
> -		return -EINVAL;
> +		return -ERANGE;
>  
>  	mutex_lock(&priv->lock);
>  
> @@ -716,7 +716,7 @@ static ssize_t quad8_count_ceiling_write(struct counter_device *counter,
>  
>  	/* Only 24-bit values are supported */
>  	if (ceiling > 0xFFFFFF)
> -		return -EINVAL;
> +		return -ERANGE;
>  
>  	mutex_lock(&priv->lock);
>  
> diff --git a/drivers/counter/stm32-lptimer-cnt.c b/drivers/counter/stm32-lptimer-cnt.c
> index daf988e7b208..d5f9d580d06d 100644
> --- a/drivers/counter/stm32-lptimer-cnt.c
> +++ b/drivers/counter/stm32-lptimer-cnt.c
> @@ -283,7 +283,7 @@ static ssize_t stm32_lptim_cnt_ceiling_write(struct counter_device *counter,
>  		return ret;
>  
>  	if (ceiling > STM32_LPTIM_MAX_ARR)
> -		return -EINVAL;
> +		return -ERANGE;
>  
>  	priv->ceiling = ceiling;
>  

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
