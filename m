Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB123E3BCE
	for <lists+linux-stm32@lfdr.de>; Sun,  8 Aug 2021 19:06:14 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 17BBBC5719E;
	Sun,  8 Aug 2021 17:06:14 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1BBB4C57182
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  8 Aug 2021 17:06:12 +0000 (UTC)
Received: from jic23-huawei (cpc108967-cmbg20-2-0-cust86.5-4.cable.virginm.net
 [81.101.6.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 76DF460E93;
 Sun,  8 Aug 2021 17:06:06 +0000 (UTC)
Date: Sun, 8 Aug 2021 18:08:55 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Message-ID: <20210808180855.1251f06c@jic23-huawei>
In-Reply-To: <ae8d3b20b8b02c96b1c9898ffa2f9fa5d99edc81.1627990337.git.vilhelm.gray@gmail.com>
References: <cover.1627990337.git.vilhelm.gray@gmail.com>
 <ae8d3b20b8b02c96b1c9898ffa2f9fa5d99edc81.1627990337.git.vilhelm.gray@gmail.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, o.rempel@pengutronix.de,
 jarkko.nikula@linux.intel.com, kernel@pengutronix.de, fabrice.gasnier@st.com,
 syednwaris@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, alexandre.torgue@st.com
Subject: Re: [Linux-stm32] [PATCH v14 03/17] counter: Standardize to ERANGE
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

On Tue,  3 Aug 2021 21:06:13 +0900
William Breathitt Gray <vilhelm.gray@gmail.com> wrote:

> ERANGE is a semantically better error code to return when an argument
> value falls outside the supported limit range of a device.
> 
> Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> Cc: Oleksij Rempel <o.rempel@pengutronix.de>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> Acked-by: Syed Nayyar Waris <syednwaris@gmail.com>
> Reviewed-by: David Lechner <david@lechnology.com>
> Reviewed-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>

Just for the record, I'll note this is an ABI change.  However, I'm
fairly sure it's the category of no one will notice and so we are fine
to change it.

Applied,

Thanks,

Jonathan

> ---
>  drivers/counter/104-quad-8.c        | 6 +++---
>  drivers/counter/intel-qep.c         | 2 +-
>  drivers/counter/interrupt-cnt.c     | 3 +++
>  drivers/counter/stm32-lptimer-cnt.c | 2 +-
>  4 files changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/counter/104-quad-8.c b/drivers/counter/104-quad-8.c
> index b358b2b2b883..d54efdb8d393 100644
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
> @@ -669,7 +669,7 @@ static ssize_t quad8_count_preset_write(struct counter_device *counter,
>  
>  	/* Only 24-bit values are supported */
>  	if (preset > 0xFFFFFF)
> -		return -EINVAL;
> +		return -ERANGE;
>  
>  	mutex_lock(&priv->lock);
>  
> @@ -714,7 +714,7 @@ static ssize_t quad8_count_ceiling_write(struct counter_device *counter,
>  
>  	/* Only 24-bit values are supported */
>  	if (ceiling > 0xFFFFFF)
> -		return -EINVAL;
> +		return -ERANGE;
>  
>  	mutex_lock(&priv->lock);
>  
> diff --git a/drivers/counter/intel-qep.c b/drivers/counter/intel-qep.c
> index 1a9512e28519..204f94577666 100644
> --- a/drivers/counter/intel-qep.c
> +++ b/drivers/counter/intel-qep.c
> @@ -319,7 +319,7 @@ static ssize_t spike_filter_ns_write(struct counter_device *counter,
>  	}
>  
>  	if (length > INTEL_QEPFLT_MAX_COUNT(length))
> -		return -EINVAL;
> +		return -ERANGE;
>  
>  	mutex_lock(&qep->lock);
>  	if (qep->enabled) {
> diff --git a/drivers/counter/interrupt-cnt.c b/drivers/counter/interrupt-cnt.c
> index 5df7cd13d4c7..66cac4900327 100644
> --- a/drivers/counter/interrupt-cnt.c
> +++ b/drivers/counter/interrupt-cnt.c
> @@ -107,6 +107,9 @@ static int interrupt_cnt_write(struct counter_device *counter,
>  {
>  	struct interrupt_cnt_priv *priv = counter->priv;
>  
> +	if (val != (typeof(priv->count.counter))val)
> +		return -ERANGE;
> +
>  	atomic_set(&priv->count, val);
>  
>  	return 0;
> diff --git a/drivers/counter/stm32-lptimer-cnt.c b/drivers/counter/stm32-lptimer-cnt.c
> index 78f383b77bd2..49aeb9e393f3 100644
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
