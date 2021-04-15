Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 86198360EDA
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Apr 2021 17:24:25 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 463AAC57B79;
	Thu, 15 Apr 2021 15:24:25 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E0248C36B25
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Apr 2021 15:24:23 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id z16so17128820pga.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Apr 2021 08:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=+yjcLMNSeihBpdDgybeJnPDXGIGtnDR/XCz5LGkpphc=;
 b=bdM9avy/00t4NxDJYUsK69khtt+hD/COJZhA//yLD7Q9wbeeu+kLoc/apoCGHx7tM4
 PMEIf+x+ey1BRxuMeUK7n5ihvYmblHAzxMZxBldIlN8reIcggH+Ug7fqlHdsHjdEz1F1
 wey06hogxTgwjcjtry/pEsQF8sK/AE6pmCFfPQ/VOP9SmWYng2NIZmfaLdURVW1wOybd
 Wu6vlvmSo/A+DQm6XgM+mhQrqeE3e6blE9OA6yL/A2oMOp6xuwptJvTF56+kGev4mAB6
 dKuRwY45CPYzNXSm5bNwzLQMQHxYhQru/GDf+rcyB+zTBrsg8t/0aibaFDVljNhY65h8
 FiLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=+yjcLMNSeihBpdDgybeJnPDXGIGtnDR/XCz5LGkpphc=;
 b=dLw5V6Pvk7SzmQqR/la1ybXYwXxtsD+FgnUmUs5kcVHD+d1K9a1XaKYiw1vRaDNe/o
 grUllw6YIcm7nDFRJ+hWjHTHwf8dIHHUdf9rNDYmpplhb2Vo5mq/8+CfPo4Du8Auicx4
 InJiyO+7lHUTnufQeFYdqsandRaKCUnQDXMOZICVs0UavBlrZlvlQi9gbxO+4M0JzF71
 7LVD+lPfobfHVrcUQn8U3VqWQwGBorzNiw+ieGIxi0qCq3xd73k6Dp9VGZ0SYK/76yfx
 j3T55yB/7P14BFGrvJyWxVbbqJXfyDugJ4E++OHWOmWdFXIvA/y82SvtLnpttyxfvfbP
 4H3w==
X-Gm-Message-State: AOAM530x6s3ChjERTTcvU/s6ZJyi9UiKGFZ00yjH3IntvnZGuRy+bgCH
 J9t1bluLbo2QGaTVGZbbyUc=
X-Google-Smtp-Source: ABdhPJx0ausL7fwi/LuInS/wuT82AeZII8ieayrIztDl8s+DXu3lYkfLAoAslu+LLV05ugn1W5YBVA==
X-Received: by 2002:a63:4ca:: with SMTP id 193mr4112519pge.86.1618500262399;
 Thu, 15 Apr 2021 08:24:22 -0700 (PDT)
Received: from syed ([2401:4900:2eec:4193:f802:b600:e94c:55c4])
 by smtp.gmail.com with ESMTPSA id g17sm2833221pji.40.2021.04.15.08.24.13
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 15 Apr 2021 08:24:21 -0700 (PDT)
Date: Thu, 15 Apr 2021 20:54:09 +0530
From: Syed Nayyar Waris <syednwaris@gmail.com>
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Message-ID: <20210415152409.GK8933@syed>
References: <cover.1616150619.git.vilhelm.gray@gmail.com>
 <52016584522ed9b733cd52057f6974c274e34003.1616150619.git.vilhelm.gray@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <52016584522ed9b733cd52057f6974c274e34003.1616150619.git.vilhelm.gray@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, o.rempel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
 fabrice.gasnier@st.com, linux-stm32@st-md-mailman.stormreply.com,
 jic23@kernel.org, alexandre.torgue@st.com
Subject: Re: [Linux-stm32] [PATCH v10 32/33] counter: 104-quad-8: Replace
 mutex with spinlock
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

On Fri, Mar 19, 2021 at 08:00:51PM +0900, William Breathitt Gray wrote:
> This patch replaces the mutex I/O lock with a spinlock. This is in
> preparation for a subsequent patch adding IRQ support for 104-QUAD-8
> devices; we can't sleep in an interrupt context, so we'll need to use a
> spinlock instead.
> 
> Cc: Syed Nayyar Waris <syednwaris@gmail.com>
> Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
> ---
>  drivers/counter/104-quad-8.c | 90 +++++++++++++++++++++---------------
>  1 file changed, 53 insertions(+), 37 deletions(-)

Acked-by: Syed Nayyar Waris <syednwaris@gmail.com>

> 
> diff --git a/drivers/counter/104-quad-8.c b/drivers/counter/104-quad-8.c
> index eb7d63769f4c..d46b8101f207 100644
> --- a/drivers/counter/104-quad-8.c
> +++ b/drivers/counter/104-quad-8.c
> @@ -16,6 +16,7 @@
>  #include <linux/module.h>
>  #include <linux/moduleparam.h>
>  #include <linux/types.h>
> +#include <linux/spinlock.h>
>  
>  #define QUAD8_EXTENT 32
>  
> @@ -28,6 +29,7 @@ MODULE_PARM_DESC(base, "ACCES 104-QUAD-8 base addresses");
>  
>  /**
>   * struct quad8 - device private data structure
> + * @lock:		lock to prevent clobbering device states during R/W ops
>   * @counter:		instance of the counter_device
>   * @fck_prescaler:	array of filter clock prescaler configurations
>   * @preset:		array of preset values
> @@ -42,7 +44,7 @@ MODULE_PARM_DESC(base, "ACCES 104-QUAD-8 base addresses");
>   * @base:		base port address of the device
>   */
>  struct quad8 {
> -	struct mutex lock;
> +	spinlock_t lock;
>  	struct counter_device counter;
>  	unsigned int fck_prescaler[QUAD8_NUM_COUNTERS];
>  	unsigned int preset[QUAD8_NUM_COUNTERS];
> @@ -123,6 +125,7 @@ static int quad8_count_read(struct counter_device *counter,
>  	unsigned int flags;
>  	unsigned int borrow;
>  	unsigned int carry;
> +	unsigned long irqflags;
>  	int i;
>  
>  	flags = inb(base_offset + 1);
> @@ -132,7 +135,7 @@ static int quad8_count_read(struct counter_device *counter,
>  	/* Borrow XOR Carry effectively doubles count range */
>  	*val = (unsigned long)(borrow ^ carry) << 24;
>  
> -	mutex_lock(&priv->lock);
> +	spin_lock_irqsave(&priv->lock, irqflags);
>  
>  	/* Reset Byte Pointer; transfer Counter to Output Latch */
>  	outb(QUAD8_CTR_RLD | QUAD8_RLD_RESET_BP | QUAD8_RLD_CNTR_OUT,
> @@ -141,7 +144,7 @@ static int quad8_count_read(struct counter_device *counter,
>  	for (i = 0; i < 3; i++)
>  		*val |= (unsigned long)inb(base_offset) << (8 * i);
>  
> -	mutex_unlock(&priv->lock);
> +	spin_unlock_irqrestore(&priv->lock, irqflags);
>  
>  	return 0;
>  }
> @@ -151,13 +154,14 @@ static int quad8_count_write(struct counter_device *counter,
>  {
>  	struct quad8 *const priv = counter->priv;
>  	const int base_offset = priv->base + 2 * count->id;
> +	unsigned long irqflags;
>  	int i;
>  
>  	/* Only 24-bit values are supported */
>  	if (val > 0xFFFFFF)
>  		return -ERANGE;
>  
> -	mutex_lock(&priv->lock);
> +	spin_lock_irqsave(&priv->lock, irqflags);
>  
>  	/* Reset Byte Pointer */
>  	outb(QUAD8_CTR_RLD | QUAD8_RLD_RESET_BP, base_offset + 1);
> @@ -182,7 +186,7 @@ static int quad8_count_write(struct counter_device *counter,
>  	/* Reset Error flag */
>  	outb(QUAD8_CTR_RLD | QUAD8_RLD_RESET_E, base_offset + 1);
>  
> -	mutex_unlock(&priv->lock);
> +	spin_unlock_irqrestore(&priv->lock, irqflags);
>  
>  	return 0;
>  }
> @@ -200,8 +204,9 @@ static int quad8_function_read(struct counter_device *counter,
>  {
>  	struct quad8 *const priv = counter->priv;
>  	const int id = count->id;
> +	unsigned long irqflags;
>  
> -	mutex_lock(&priv->lock);
> +	spin_lock_irqsave(&priv->lock, irqflags);
>  
>  	if (priv->quadrature_mode[id])
>  		switch (priv->quadrature_scale[id]) {
> @@ -218,7 +223,7 @@ static int quad8_function_read(struct counter_device *counter,
>  	else
>  		*function = COUNTER_FUNCTION_PULSE_DIRECTION;
>  
> -	mutex_unlock(&priv->lock);
> +	spin_unlock_irqrestore(&priv->lock, irqflags);
>  
>  	return 0;
>  }
> @@ -233,10 +238,11 @@ static int quad8_function_write(struct counter_device *counter,
>  	unsigned int *const scale = priv->quadrature_scale + id;
>  	unsigned int *const synchronous_mode = priv->synchronous_mode + id;
>  	const int base_offset = priv->base + 2 * id + 1;
> +	unsigned long irqflags;
>  	unsigned int mode_cfg;
>  	unsigned int idr_cfg;
>  
> -	mutex_lock(&priv->lock);
> +	spin_lock_irqsave(&priv->lock, irqflags);
>  
>  	mode_cfg = priv->count_mode[id] << 1;
>  	idr_cfg = priv->index_polarity[id] << 1;
> @@ -271,7 +277,7 @@ static int quad8_function_write(struct counter_device *counter,
>  			break;
>  		default:
>  			/* should never reach this path */
> -			mutex_unlock(&priv->lock);
> +			spin_unlock_irqrestore(&priv->lock, irqflags);
>  			return -EINVAL;
>  		}
>  	}
> @@ -279,7 +285,7 @@ static int quad8_function_write(struct counter_device *counter,
>  	/* Load mode configuration to Counter Mode Register */
>  	outb(QUAD8_CTR_CMR | mode_cfg, base_offset);
>  
> -	mutex_unlock(&priv->lock);
> +	spin_unlock_irqrestore(&priv->lock, irqflags);
>  
>  	return 0;
>  }
> @@ -405,9 +411,10 @@ static int quad8_index_polarity_set(struct counter_device *counter,
>  	struct quad8 *const priv = counter->priv;
>  	const size_t channel_id = signal->id - 16;
>  	const int base_offset = priv->base + 2 * channel_id + 1;
> +	unsigned long irqflags;
>  	unsigned int idr_cfg = index_polarity << 1;
>  
> -	mutex_lock(&priv->lock);
> +	spin_lock_irqsave(&priv->lock, irqflags);
>  
>  	idr_cfg |= priv->synchronous_mode[channel_id];
>  
> @@ -416,7 +423,7 @@ static int quad8_index_polarity_set(struct counter_device *counter,
>  	/* Load Index Control configuration to Index Control Register */
>  	outb(QUAD8_CTR_IDR | idr_cfg, base_offset);
>  
> -	mutex_unlock(&priv->lock);
> +	spin_unlock_irqrestore(&priv->lock, irqflags);
>  
>  	return 0;
>  }
> @@ -445,15 +452,16 @@ static int quad8_synchronous_mode_set(struct counter_device *counter,
>  	struct quad8 *const priv = counter->priv;
>  	const size_t channel_id = signal->id - 16;
>  	const int base_offset = priv->base + 2 * channel_id + 1;
> +	unsigned long irqflags;
>  	unsigned int idr_cfg = synchronous_mode;
>  
> -	mutex_lock(&priv->lock);
> +	spin_lock_irqsave(&priv->lock, irqflags);
>  
>  	idr_cfg |= priv->index_polarity[channel_id] << 1;
>  
>  	/* Index function must be non-synchronous in non-quadrature mode */
>  	if (synchronous_mode && !priv->quadrature_mode[channel_id]) {
> -		mutex_unlock(&priv->lock);
> +		spin_unlock_irqrestore(&priv->lock, irqflags);
>  		return -EINVAL;
>  	}
>  
> @@ -462,7 +470,7 @@ static int quad8_synchronous_mode_set(struct counter_device *counter,
>  	/* Load Index Control configuration to Index Control Register */
>  	outb(QUAD8_CTR_IDR | idr_cfg, base_offset);
>  
> -	mutex_unlock(&priv->lock);
> +	spin_unlock_irqrestore(&priv->lock, irqflags);
>  
>  	return 0;
>  }
> @@ -509,6 +517,7 @@ static int quad8_count_mode_write(struct counter_device *counter,
>  	unsigned int count_mode;
>  	unsigned int mode_cfg;
>  	const int base_offset = priv->base + 2 * count->id + 1;
> +	unsigned long irqflags;
>  
>  	/* Map Generic Counter count mode to 104-QUAD-8 count mode */
>  	switch (cnt_mode) {
> @@ -529,7 +538,7 @@ static int quad8_count_mode_write(struct counter_device *counter,
>  		return -EINVAL;
>  	}
>  
> -	mutex_lock(&priv->lock);
> +	spin_lock_irqsave(&priv->lock, irqflags);
>  
>  	priv->count_mode[count->id] = count_mode;
>  
> @@ -543,7 +552,7 @@ static int quad8_count_mode_write(struct counter_device *counter,
>  	/* Load mode configuration to Counter Mode Register */
>  	outb(QUAD8_CTR_CMR | mode_cfg, base_offset);
>  
> -	mutex_unlock(&priv->lock);
> +	spin_unlock_irqrestore(&priv->lock, irqflags);
>  
>  	return 0;
>  }
> @@ -563,9 +572,10 @@ static int quad8_count_enable_write(struct counter_device *counter,
>  {
>  	struct quad8 *const priv = counter->priv;
>  	const int base_offset = priv->base + 2 * count->id;
> +	unsigned long irqflags;
>  	unsigned int ior_cfg;
>  
> -	mutex_lock(&priv->lock);
> +	spin_lock_irqsave(&priv->lock, irqflags);
>  
>  	priv->ab_enable[count->id] = enable;
>  
> @@ -574,7 +584,7 @@ static int quad8_count_enable_write(struct counter_device *counter,
>  	/* Load I/O control configuration */
>  	outb(QUAD8_CTR_IOR | ior_cfg, base_offset + 1);
>  
> -	mutex_unlock(&priv->lock);
> +	spin_unlock_irqrestore(&priv->lock, irqflags);
>  
>  	return 0;
>  }
> @@ -625,16 +635,17 @@ static int quad8_count_preset_write(struct counter_device *counter,
>  				    struct counter_count *count, u64 preset)
>  {
>  	struct quad8 *const priv = counter->priv;
> +	unsigned long irqflags;
>  
>  	/* Only 24-bit values are supported */
>  	if (preset > 0xFFFFFF)
>  		return -ERANGE;
>  
> -	mutex_lock(&priv->lock);
> +	spin_lock_irqsave(&priv->lock, irqflags);
>  
>  	quad8_preset_register_set(priv, count->id, preset);
>  
> -	mutex_unlock(&priv->lock);
> +	spin_unlock_irqrestore(&priv->lock, irqflags);
>  
>  	return 0;
>  }
> @@ -643,8 +654,9 @@ static int quad8_count_ceiling_read(struct counter_device *counter,
>  				    struct counter_count *count, u64 *ceiling)
>  {
>  	struct quad8 *const priv = counter->priv;
> +	unsigned long irqflags;
>  
> -	mutex_lock(&priv->lock);
> +	spin_lock_irqsave(&priv->lock, irqflags);
>  
>  	/* Range Limit and Modulo-N count modes use preset value as ceiling */
>  	switch (priv->count_mode[count->id]) {
> @@ -658,7 +670,7 @@ static int quad8_count_ceiling_read(struct counter_device *counter,
>  		break;
>  	}
>  
> -	mutex_unlock(&priv->lock);
> +	spin_unlock_irqrestore(&priv->lock, irqflags);
>  
>  	return 0;
>  }
> @@ -667,23 +679,24 @@ static int quad8_count_ceiling_write(struct counter_device *counter,
>  				     struct counter_count *count, u64 ceiling)
>  {
>  	struct quad8 *const priv = counter->priv;
> +	unsigned long irqflags;
>  
>  	/* Only 24-bit values are supported */
>  	if (ceiling > 0xFFFFFF)
>  		return -ERANGE;
>  
> -	mutex_lock(&priv->lock);
> +	spin_lock_irqsave(&priv->lock, irqflags);
>  
>  	/* Range Limit and Modulo-N count modes use preset value as ceiling */
>  	switch (priv->count_mode[count->id]) {
>  	case 1:
>  	case 3:
> -		mutex_unlock(&priv->lock);
> +		spin_unlock_irqrestore(&priv->lock, irqflags);
>  		quad8_preset_register_set(priv, count->id, ceiling);
>  		return 0;
>  	}
>  
> -	mutex_unlock(&priv->lock);
> +	spin_unlock_irqrestore(&priv->lock, irqflags);
>  
>  	return -EINVAL;
>  }
> @@ -705,12 +718,13 @@ static int quad8_count_preset_enable_write(struct counter_device *counter,
>  {
>  	struct quad8 *const priv = counter->priv;
>  	const int base_offset = priv->base + 2 * count->id + 1;
> +	unsigned long irqflags;
>  	unsigned int ior_cfg;
>  
>  	/* Preset enable is active low in Input/Output Control register */
>  	preset_enable = !preset_enable;
>  
> -	mutex_lock(&priv->lock);
> +	spin_lock_irqsave(&priv->lock, irqflags);
>  
>  	priv->preset_enable[count->id] = preset_enable;
>  
> @@ -719,7 +733,7 @@ static int quad8_count_preset_enable_write(struct counter_device *counter,
>  	/* Load I/O control configuration to Input / Output Control Register */
>  	outb(QUAD8_CTR_IOR | ior_cfg, base_offset);
>  
> -	mutex_unlock(&priv->lock);
> +	spin_unlock_irqrestore(&priv->lock, irqflags);
>  
>  	return 0;
>  }
> @@ -730,22 +744,23 @@ static int quad8_signal_cable_fault_read(struct counter_device *counter,
>  {
>  	struct quad8 *const priv = counter->priv;
>  	const size_t channel_id = signal->id / 2;
> +	unsigned long irqflags;
>  	bool disabled;
>  	unsigned int status;
>  
> -	mutex_lock(&priv->lock);
> +	spin_lock_irqsave(&priv->lock, irqflags);
>  
>  	disabled = !(priv->cable_fault_enable & BIT(channel_id));
>  
>  	if (disabled) {
> -		mutex_unlock(&priv->lock);
> +		spin_unlock_irqrestore(&priv->lock, irqflags);
>  		return -EINVAL;
>  	}
>  
>  	/* Logic 0 = cable fault */
>  	status = inb(priv->base + QUAD8_DIFF_ENCODER_CABLE_STATUS);
>  
> -	mutex_unlock(&priv->lock);
> +	spin_unlock_irqrestore(&priv->lock, irqflags);
>  
>  	/* Mask respective channel and invert logic */
>  	*cable_fault = !(status & BIT(channel_id));
> @@ -771,9 +786,10 @@ static int quad8_signal_cable_fault_enable_write(struct counter_device *counter,
>  {
>  	struct quad8 *const priv = counter->priv;
>  	const size_t channel_id = signal->id / 2;
> +	unsigned long irqflags;
>  	unsigned int cable_fault_enable;
>  
> -	mutex_lock(&priv->lock);
> +	spin_lock_irqsave(&priv->lock, irqflags);
>  
>  	if (enable)
>  		priv->cable_fault_enable |= BIT(channel_id);
> @@ -785,7 +801,7 @@ static int quad8_signal_cable_fault_enable_write(struct counter_device *counter,
>  
>  	outb(cable_fault_enable, priv->base + QUAD8_DIFF_ENCODER_CABLE_STATUS);
>  
> -	mutex_unlock(&priv->lock);
> +	spin_unlock_irqrestore(&priv->lock, irqflags);
>  
>  	return 0;
>  }
> @@ -808,8 +824,9 @@ static int quad8_signal_fck_prescaler_write(struct counter_device *counter,
>  	struct quad8 *const priv = counter->priv;
>  	const size_t channel_id = signal->id / 2;
>  	const int base_offset = priv->base + 2 * channel_id;
> +	unsigned long irqflags;
>  
> -	mutex_lock(&priv->lock);
> +	spin_lock_irqsave(&priv->lock, irqflags);
>  
>  	priv->fck_prescaler[channel_id] = prescaler;
>  
> @@ -821,7 +838,7 @@ static int quad8_signal_fck_prescaler_write(struct counter_device *counter,
>  	outb(QUAD8_CTR_RLD | QUAD8_RLD_RESET_BP | QUAD8_RLD_PRESET_PSC,
>  	     base_offset + 1);
>  
> -	mutex_unlock(&priv->lock);
> +	spin_unlock_irqrestore(&priv->lock, irqflags);
>  
>  	return 0;
>  }
> @@ -990,8 +1007,7 @@ static int quad8_probe(struct device *dev, unsigned int id)
>  	priv->counter.priv = priv;
>  	priv->base = base[id];
>  
> -	/* Initialize mutex */
> -	mutex_init(&priv->lock);
> +	spin_lock_init(&priv->lock);
>  
>  	/* Reset all counters and disable interrupt function */
>  	outb(QUAD8_CHAN_OP_RESET_COUNTERS, base[id] + QUAD8_REG_CHAN_OP);
> -- 
> 2.30.2
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
