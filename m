Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F668CF2C7
	for <lists+linux-stm32@lfdr.de>; Sun, 26 May 2024 10:07:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 92162C6DD72;
	Sun, 26 May 2024 08:07:00 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D80B3C6DD6E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 26 May 2024 08:06:53 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2e97488daedso3897291fa.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 26 May 2024 01:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716710813; x=1717315613;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=uzItbLCLDN25ECEr4bCtWzVC/fO0Y6ybJrMdSsi6pDw=;
 b=U6oteg45LbIFDE4MYQMnA7PJ1S/IQPqlAS6VAaFikxeqYWMfuBDdtb6F2mhvyJ0i/B
 joK4natJ6rYrvRnkkUYhwMrWfp0P/KKInOcrMUVIkjFTbhUABjyZzfLWmsu+3EV0/2uB
 WuVWZO2efyGlRt585Qg4VtMvb0dUtL9CtxrJekWJYE1YisaSQNeF99Lj4qg0C6J9Pw5z
 7cLUWhZPT88hZIEAt2roqQoPiq9dToRQ5fygNSbvhCtUOsZwYJ/Mc1acRM7dTR0CSw9P
 wAAogijdX85Z1yGYfKydi9d4XE9GGyDeJY4pyALAdLvhmrnubetM7sXsYIFMm1Toxqfn
 61wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716710813; x=1717315613;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uzItbLCLDN25ECEr4bCtWzVC/fO0Y6ybJrMdSsi6pDw=;
 b=WjZDupdYQu2MAudW8+jcdOjuAH93zWU40KdUFxXMaWZdQzUAziZ+34EqPmRkRXLmAz
 A0YvxYHZ8NMhZhssGW2eOVNMqchRbU4rNkUlbfuIBRiBxosmQ5N0zR4Ztu6TG1qrZPQt
 b4YzRRTrSTWo0KjvwZ8lnrI7nrG9Dr+cz6rblOhSXpP5u92Vd8xCWw6Lr1wyJe49Cahk
 C+Xhk4StXJE4fP+nkc8Hbmndo/Q5Lt6Lk6B77WHYAJWnfpVMqdRB+5u4+AWWXU/0kCOB
 C5tWlSXEnx8cskY29GFQJY7dzceAA49fkVnRhIsbImfrLdeyBVZRwKaNmc+JntMjy3n9
 w3Iw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYhyY1431CNTCsD9zw1fjLtyh1Ir6gxTkc8w0B9c5fZvRj2bErRvycD+qJTlYPLNg2TDbkPbr0MJvsd31sJ5DvKTH4sHv6mEE2jzswdkzC+5s/ZK5GW8K6
X-Gm-Message-State: AOJu0YwfEhfPda+k2qzEHDtp9G0Ss+DEyG9KgLmy6TPrXOOoty+caUX7
 b4w2d5+B6+TlH/mScBjFv4RQpBM5nhnLmMkIMfxGKSuqD4xT/0VKaQ2Jc4wJ6mA=
X-Google-Smtp-Source: AGHT+IHMGcclDBkRzx4ZJ7MIltcpvBEx4jlVdT6HK0RZcj6ZzUVywClgUtqnVppbRnqA2K+jiwTB9A==
X-Received: by 2002:a2e:938b:0:b0:2e5:2414:a205 with SMTP id
 38308e7fff4ca-2e95b0c162bmr47477161fa.27.1716710813031; 
 Sun, 26 May 2024 01:06:53 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2e95bcc45bcsm12679351fa.27.2024.05.26.01.06.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 May 2024 01:06:52 -0700 (PDT)
Date: Sun, 26 May 2024 11:06:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <d2nuqs64getpkfb6uavzan6tdxctd2qri2jgrof23doukwcke6@olwaf445vq74>
References: <20240521151109.3078775-1-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240521151109.3078775-1-fabrice.gasnier@foss.st.com>
Cc: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] usb: ucsi: stm32: fix command completion
	handling
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

On Tue, May 21, 2024 at 05:11:09PM +0200, Fabrice Gasnier wrote:
> Sometimes errors are seen, when doing DR swap, like:
> [   24.672481] ucsi-stm32g0-i2c 0-0035: UCSI_GET_PDOS failed (-5)
> [   24.720188] ucsi-stm32g0-i2c 0-0035: ucsi_handle_connector_change:
>  GET_CONNECTOR_STATUS failed (-5)
> 
> There may be some race, which lead to read CCI, before the command complete
> flag is set, hence returning -EIO. Similar fix has been done also in
> ucsi_acpi [1].
> 
> In case of a spurious or otherwise delayed notification it is
> possible that CCI still reports the previous completion. The
> UCSI spec is aware of this and provides two completion bits in
> CCI, one for normal commands and one for acks. As acks and commands
> alternate the notification handler can determine if the completion
> bit is from the current command.
> 
> To fix this add the ACK_PENDING bit for ucsi_stm32g0 and only complete
> commands if the completion bit matches.
> 
> [1] https://lore.kernel.org/lkml/20240121204123.275441-3-lk@c--e.de/
> 
> Fixes: 72849d4fcee7 ("usb: typec: ucsi: stm32g0: add support for stm32g0 controller")
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> ---
>  drivers/usb/typec/ucsi/ucsi_stm32g0.c | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi_stm32g0.c b/drivers/usb/typec/ucsi/ucsi_stm32g0.c
> index 93d7806681cf..7d6576778dad 100644
> --- a/drivers/usb/typec/ucsi/ucsi_stm32g0.c
> +++ b/drivers/usb/typec/ucsi/ucsi_stm32g0.c
> @@ -395,9 +395,13 @@ static int ucsi_stm32g0_sync_write(struct ucsi *ucsi, unsigned int offset, const
>  				   size_t len)
>  {
>  	struct ucsi_stm32g0 *g0 = ucsi_get_drvdata(ucsi);
> +	bool ack = UCSI_COMMAND(*(u64 *)val) == UCSI_ACK_CC_CI;
>  	int ret;
>  
> -	set_bit(COMMAND_PENDING, &g0->flags);
> +	if (ack)
> +		set_bit(ACK_PENDING, &g0->flags);

ACK_PENDING is not defined in the patch.

> +	else
> +		set_bit(COMMAND_PENDING, &g0->flags);
>  
>  	ret = ucsi_stm32g0_async_write(ucsi, offset, val, len);
>  	if (ret)
> @@ -405,9 +409,14 @@ static int ucsi_stm32g0_sync_write(struct ucsi *ucsi, unsigned int offset, const
>  
>  	if (!wait_for_completion_timeout(&g0->complete, msecs_to_jiffies(5000)))
>  		ret = -ETIMEDOUT;
> +	else
> +		return 0;
>  
>  out_clear_bit:
> -	clear_bit(COMMAND_PENDING, &g0->flags);
> +	if (ack)
> +		clear_bit(ACK_PENDING, &g0->flags);
> +	else
> +		clear_bit(COMMAND_PENDING, &g0->flags);
>  
>  	return ret;
>  }
> @@ -428,8 +437,9 @@ static irqreturn_t ucsi_stm32g0_irq_handler(int irq, void *data)
>  	if (UCSI_CCI_CONNECTOR(cci))
>  		ucsi_connector_change(g0->ucsi, UCSI_CCI_CONNECTOR(cci));
>  
> -	if (test_bit(COMMAND_PENDING, &g0->flags) &&
> -	    cci & (UCSI_CCI_ACK_COMPLETE | UCSI_CCI_COMMAND_COMPLETE))
> +	if (cci & UCSI_CCI_ACK_COMPLETE && test_and_clear_bit(ACK_PENDING, &g0->flags))
> +		complete(&g0->complete);
> +	if (cci & UCSI_CCI_COMMAND_COMPLETE && test_and_clear_bit(COMMAND_PENDING, &g0->flags))
>  		complete(&g0->complete);
>  
>  	return IRQ_HANDLED;
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
