Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0018C360EB3
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Apr 2021 17:20:45 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BC083C57B79;
	Thu, 15 Apr 2021 15:20:45 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EC7B1C36B25
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Apr 2021 15:20:43 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id i190so16262685pfc.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Apr 2021 08:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=umBbGUAcWrcnGAbWhTZRypZWZRPTnQBY0Pg5VVxN0NU=;
 b=j8JtVZdEfZvjgzlCRUWZnsT1XYSTKwNnzx1AlxBNWsV8wqVQ5yI1ITZpnTTZ7/M1Kf
 eLz5FWg9Khr1aCNThpw+mY1bpbzOtZkBSV9AxA5SONuE3rypEyv/PIU0dDQFJ04gGx3Y
 E974ZCEwm8UO31jg4AcdmN5qqRUvLnmVKpFWoWt73SEd1tFwu0tnXo5SUJ8ci7kdI4mE
 E53O53QfxrAr2liXsQyMVaiE5dgdazQBl68VtFH6Hmb4AeZaqKrbLzldrTPb7x5Of9cQ
 WHZIRusdNipMmKT0+yuyShdZ2bCs7uXepluojpVfHWspQSHydk5SgG6xerqcibc8H4YO
 bu3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=umBbGUAcWrcnGAbWhTZRypZWZRPTnQBY0Pg5VVxN0NU=;
 b=YrdDR5astwBkmKNDlJ9SBSTkda/Y7yg6hh80OTYSKCvTfkSqDmcYdUwA5wGIndBFR4
 S/mN7zc3bgcADwdHWhatpYhBAnlo1TcQYRFtSwfXFVEN4PwuHHrR1oBMKRs9TXb9f13+
 d2oLuqUv8cxAv1P2UrGKI9wdaFrXecmfBIGdw4o8CVt1owwkEgajN2vFSabpKYVEelw1
 aWoG5nMbYSSSFEmbTdh+9fBePzNYKsxfCNG3xNNO3atdDVgGJcHeQUwlVzolQ/ZISRPO
 sgidlV6Z3QGTDhFa9uJODDv1DHIs7RkUd153/36BJiB9jXr1+01S/AOPFz+AhwiUTqd8
 LsaA==
X-Gm-Message-State: AOAM533LPlwOhCxnXFzbBqK1NuKk+KGR7DN4lHkUEFfcMtacr/pSlQfT
 oO7vA8HqnRl+JBxVV25OWvo=
X-Google-Smtp-Source: ABdhPJwisj47l96nQA7bO6SGjtpW+hDMip4ZpK4dUx7XiRiSdphPBbq+tom71ZA18rPGQtyWtvtp+Q==
X-Received: by 2002:a63:9dc5:: with SMTP id i188mr3962509pgd.191.1618500042545; 
 Thu, 15 Apr 2021 08:20:42 -0700 (PDT)
Received: from syed ([2401:4900:2eec:4193:f802:b600:e94c:55c4])
 by smtp.gmail.com with ESMTPSA id r1sm2905036pjo.26.2021.04.15.08.20.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 15 Apr 2021 08:20:42 -0700 (PDT)
Date: Thu, 15 Apr 2021 20:50:31 +0530
From: Syed Nayyar Waris <syednwaris@gmail.com>
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Message-ID: <20210415152031.GH8933@syed>
References: <cover.1616150619.git.vilhelm.gray@gmail.com>
 <f09068dd8b89aa81c4310ea39cbdb0d631dddf98.1616150619.git.vilhelm.gray@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f09068dd8b89aa81c4310ea39cbdb0d631dddf98.1616150619.git.vilhelm.gray@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, o.rempel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
 fabrice.gasnier@st.com, linux-stm32@st-md-mailman.stormreply.com,
 jic23@kernel.org, alexandre.torgue@st.com
Subject: Re: [Linux-stm32] [PATCH v10 19/33] counter: Standardize to ERANGE
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

On Fri, Mar 19, 2021 at 08:00:38PM +0900, William Breathitt Gray wrote:
> ERANGE is a semantically better error code to return when an argument
> value falls outside the supported limit range of a device.
> 
> Cc: Syed Nayyar Waris <syednwaris@gmail.com>
> Cc: Oleksij Rempel <o.rempel@pengutronix.de>
> Cc: Fabrice Gasnier <fabrice.gasnier@st.com>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> Reviewed-by: David Lechner <david@lechnology.com>
> Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
> ---
>  drivers/counter/104-quad-8.c        | 6 +++---

For the 104-quad-8 driver:
Acked-by: Syed Nayyar Waris <syednwaris@gmail.com>

>  drivers/counter/interrupt-cnt.c     | 3 +++
>  drivers/counter/stm32-lptimer-cnt.c | 2 +-
>  3 files changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/counter/104-quad-8.c b/drivers/counter/104-quad-8.c
> index b7d6c1c43655..0409b1771fd9 100644
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
> diff --git a/drivers/counter/interrupt-cnt.c b/drivers/counter/interrupt-cnt.c
> index 0e07607f2cd3..f27dea317965 100644
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
> -- 
> 2.30.2
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
