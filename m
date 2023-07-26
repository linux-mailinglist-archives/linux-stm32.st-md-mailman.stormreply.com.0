Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 20886768DD1
	for <lists+linux-stm32@lfdr.de>; Mon, 31 Jul 2023 09:17:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D9B44C6DD89;
	Mon, 31 Jul 2023 07:17:29 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 56FA5C6B45A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jul 2023 21:21:38 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 32F9C61CC2;
 Wed, 26 Jul 2023 21:21:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12830C433C8;
 Wed, 26 Jul 2023 21:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690406496;
 bh=Jm4KifBbM6N3tIIsQSE7xXWvpsnj5QlwhDvw9jJ1fMM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rcZ7rkPOhtAdPW4TB/0T0DZzOIyKG8gqUNLEM/d3qSy8XUORBTq4sxKaSeAaiwbXg
 ESuDVgWjjAv86PrX1Znn4cxWj8l884u8J8F5Dqu44faLX1iwLe5j4jvZYeuIvUjPgj
 odjW9ASMIENAkJvy3KEHq9bvZ1UGAW1HgLqqZaN9vbbujL4SY60plU+jRMf1NJ//e3
 4x0AkK3e6gIMXPa37ZIDiLIzxd+L8mztyzQxUgK1WkslBMJvBoPB4iiUFwEyqcdQGZ
 w14OTaQYZEL9QYImEqJXYn9r8p/6dHKTyKe2bvHC11+nwGKGoXFH1B35mTGESi7p4y
 dtCtDX87qZqaA==
Date: Wed, 26 Jul 2023 23:21:32 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Sean Nyekjaer <sean@geanix.com>
Message-ID: <20230726212132.vylu6qulpyu5fndh@intel.intel>
References: <20230718105435.2641207-1-sean@geanix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230718105435.2641207-1-sean@geanix.com>
X-Mailman-Approved-At: Mon, 31 Jul 2023 07:16:18 +0000
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] i2c: stm32f7: Add atomic_xfer method
	to driver
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

Hi Sean,

[...]

> @@ -905,38 +906,43 @@ static void stm32f7_i2c_xfer_msg(struct stm32f7_i2c_dev *i2c_dev,
>  		cr2 |= STM32F7_I2C_CR2_NBYTES(f7_msg->count);
>  	}
>  
> -	/* Enable NACK, STOP, error and transfer complete interrupts */
> -	cr1 |= STM32F7_I2C_CR1_ERRIE | STM32F7_I2C_CR1_TCIE |
> -		STM32F7_I2C_CR1_STOPIE | STM32F7_I2C_CR1_NACKIE;
> -
> -	/* Clear DMA req and TX/RX interrupt */
> -	cr1 &= ~(STM32F7_I2C_CR1_RXIE | STM32F7_I2C_CR1_TXIE |
> -			STM32F7_I2C_CR1_RXDMAEN | STM32F7_I2C_CR1_TXDMAEN);
> -
> -	/* Configure DMA or enable RX/TX interrupt */
> -	i2c_dev->use_dma = false;
> -	if (i2c_dev->dma && f7_msg->count >= STM32F7_I2C_DMA_LEN_MIN) {
> -		ret = stm32_i2c_prep_dma_xfer(i2c_dev->dev, i2c_dev->dma,
> -					      msg->flags & I2C_M_RD,
> -					      f7_msg->count, f7_msg->buf,
> -					      stm32f7_i2c_dma_callback,
> -					      i2c_dev);
> -		if (!ret)
> -			i2c_dev->use_dma = true;
> -		else
> -			dev_warn(i2c_dev->dev, "can't use DMA\n");
> -	}
> +	if (!i2c_dev->atomic) {
> +		/* Enable NACK, STOP, error and transfer complete interrupts */
> +		cr1 |= STM32F7_I2C_CR1_ERRIE | STM32F7_I2C_CR1_TCIE |
> +			STM32F7_I2C_CR1_STOPIE | STM32F7_I2C_CR1_NACKIE;
> +
> +		/* Clear DMA req and TX/RX interrupt */
> +		cr1 &= ~(STM32F7_I2C_CR1_RXIE | STM32F7_I2C_CR1_TXIE |
> +				STM32F7_I2C_CR1_RXDMAEN | STM32F7_I2C_CR1_TXDMAEN);
> +
> +		/* Configure DMA or enable RX/TX interrupt */
> +		i2c_dev->use_dma = false;
> +		if (i2c_dev->dma && f7_msg->count >= STM32F7_I2C_DMA_LEN_MIN) {
> +			ret = stm32_i2c_prep_dma_xfer(i2c_dev->dev, i2c_dev->dma,
> +					msg->flags & I2C_M_RD,
> +					f7_msg->count, f7_msg->buf,
> +					stm32f7_i2c_dma_callback,
> +					i2c_dev);
> +			if (!ret)
> +				i2c_dev->use_dma = true;
> +			else
> +				dev_warn(i2c_dev->dev, "can't use DMA\n");
> +		}
>  
> -	if (!i2c_dev->use_dma) {
> -		if (msg->flags & I2C_M_RD)
> -			cr1 |= STM32F7_I2C_CR1_RXIE;
> -		else
> -			cr1 |= STM32F7_I2C_CR1_TXIE;
> +		if (!i2c_dev->use_dma) {
> +			if (msg->flags & I2C_M_RD)
> +				cr1 |= STM32F7_I2C_CR1_RXIE;
> +			else
> +				cr1 |= STM32F7_I2C_CR1_TXIE;
> +		} else {
> +			if (msg->flags & I2C_M_RD)
> +				cr1 |= STM32F7_I2C_CR1_RXDMAEN;
> +			else
> +				cr1 |= STM32F7_I2C_CR1_TXDMAEN;
> +		}
>  	} else {
> -		if (msg->flags & I2C_M_RD)
> -			cr1 |= STM32F7_I2C_CR1_RXDMAEN;
> -		else
> -			cr1 |= STM32F7_I2C_CR1_TXDMAEN;
> +		/* Disable all interrupts */
> +		cr1 &= ~STM32F7_I2C_ALL_IRQ_MASK;

if you do

	if (i2c_dev->atomic) {
		/* Disable all interrupts */
		cr1 &= ~STM32F7_I2C_ALL_IRQ_MASK;
		return;
	}

you save all the above from a leveel of indentation.

>  	}
>  
>  	/* Configure Start/Repeated Start */
> @@ -1670,7 +1676,22 @@ static irqreturn_t stm32f7_i2c_isr_error(int irq, void *data)
>  	return IRQ_HANDLED;
>  }
>  
> -static int stm32f7_i2c_xfer(struct i2c_adapter *i2c_adap,
> +static int stm32f7_i2c_wait_polling(struct stm32f7_i2c_dev *i2c_dev)
> +{
> +	ktime_t timeout = ktime_add_ms(ktime_get(), i2c_dev->adap.timeout);
> +
> +	while (ktime_compare(ktime_get(), timeout) < 0) {
> +		udelay(5);
> +		stm32f7_i2c_isr_event(0, i2c_dev);
> +
> +		if (try_wait_for_completion(&i2c_dev->complete))
> +			return 1;

I'm wondering if it makes really sense to have a complete() and
wait_for_completion() scheme here.

> +	}
> +
> +	return 0;
> +}
> +
> +static int stm32f7_i2c_xfer_core(struct i2c_adapter *i2c_adap,
>  			    struct i2c_msg msgs[], int num)
>  {
>  	struct stm32f7_i2c_dev *i2c_dev = i2c_get_adapdata(i2c_adap);
> @@ -1694,8 +1715,13 @@ static int stm32f7_i2c_xfer(struct i2c_adapter *i2c_adap,
>  
>  	stm32f7_i2c_xfer_msg(i2c_dev, msgs);
>  
> -	time_left = wait_for_completion_timeout(&i2c_dev->complete,
> -						i2c_dev->adap.timeout);
> +	if (!i2c_dev->atomic) {
> +		time_left = wait_for_completion_timeout(&i2c_dev->complete,
> +							i2c_dev->adap.timeout);
> +	} else {
> +		time_left = stm32f7_i2c_wait_polling(i2c_dev);
> +	}

please, drop the brackets here... and time_left here serves only
not to get the -ETIMEDOUT... looks a bit ugly to me, but can't
think of a better way.

> +
>  	ret = f7_msg->result;
>  	if (ret) {
>  		if (i2c_dev->use_dma)
> @@ -1727,6 +1753,24 @@ static int stm32f7_i2c_xfer(struct i2c_adapter *i2c_adap,
>  	return (ret < 0) ? ret : num;
>  }
>  
> +static int stm32f7_i2c_xfer(struct i2c_adapter *i2c_adap,
> +			    struct i2c_msg msgs[], int num)
> +{
> +	struct stm32f7_i2c_dev *i2c_dev = i2c_get_adapdata(i2c_adap);
> +
> +	i2c_dev->atomic = 0;

false

> +	return stm32f7_i2c_xfer_core(i2c_adap, msgs, num);
> +}
> +
> +static int stm32f7_i2c_xfer_atomic(struct i2c_adapter *i2c_adap,
> +			    struct i2c_msg msgs[], int num)
> +{
> +	struct stm32f7_i2c_dev *i2c_dev = i2c_get_adapdata(i2c_adap);
> +
> +	i2c_dev->atomic = 1;

true

Andi

> +	return stm32f7_i2c_xfer_core(i2c_adap, msgs, num);
> +}
> +
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
