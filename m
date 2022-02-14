Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E86424B4171
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Feb 2022 06:41:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 87287C5F1F9;
	Mon, 14 Feb 2022 05:41:17 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F05E2C5F1D7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Feb 2022 05:41:15 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id m17so455495edc.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 13 Feb 2022 21:41:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UODiaWTZTO5qlU00FWM6CcCRa/ILiX84iGscvUMk8+E=;
 b=vimkGAK0w9wo9w9Ww6nwcR7p78KBfjKaea0QpQAI6GUpVYzUL6CHFPjaWvg/ZUSbsJ
 uCE+M6AhCVtl7UBotUf25t4T0L97k6CIAQoqYXXAnQXmLZlHbA7ilhG6GU0QQpoELgSj
 SQPvwa5UlFIPpisoMgO7PsCJDnezwWev9UiS4euKbd8lDD4P4raxPcT80hgARIZQv2PW
 u8KWKy2wNjlV4e/oe3aARkuno3iKsoq6o6KcEjHh85envXShjgQeUuhdwaQXvzg1lua+
 fz85sPEMCQ0kuPzAEXXDVf0psBK0NLNll9qhsywgMnADWi29uFRQaU7T3k212w3JG+Vk
 EI7Q==
X-Gm-Message-State: AOAM530sUOgOyQLarSVuFzpqNGeFmFECiz25wsNiqvO07ioGtIEFWqEI
 hQafPTsV1HCh9a4lNEXYG58=
X-Google-Smtp-Source: ABdhPJyuQDIOMXfuuo91JtjsHZ+mln7dCRyvjT6jZY72fda4wnY2b4VSFc1jdoPxFKGHjsLgq4GZ0A==
X-Received: by 2002:a05:6402:190f:: with SMTP id
 e15mr13795490edz.195.1644817275463; 
 Sun, 13 Feb 2022 21:41:15 -0800 (PST)
Received: from ?IPV6:2a0b:e7c0:0:107::49? ([2a0b:e7c0:0:107::49])
 by smtp.gmail.com with ESMTPSA id jz17sm10240567ejb.195.2022.02.13.21.41.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Feb 2022 21:41:14 -0800 (PST)
Message-ID: <aa45fed9-7a40-7ac1-a000-18d2805d088f@kernel.org>
Date: Mon, 14 Feb 2022 06:41:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Content-Language: en-US
To: Lino Sanfilippo <LinoSanfilippo@gmx.de>, gregkh@linuxfoundation.org
References: <20220213222737.15709-1-LinoSanfilippo@gmx.de>
 <20220213222737.15709-2-LinoSanfilippo@gmx.de>
From: Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <20220213222737.15709-2-LinoSanfilippo@gmx.de>
Cc: linux-arm-kernel@lists.infradead.org, alexandre.belloni@bootlin.com,
 mcoquelin.stm32@gmail.com, richard.genoud@gmail.com, festevam@gmail.com,
 s.hauer@pengutronix.de, linux@armlinux.org.uk, nicolas.ferre@microchip.com,
 alexandre.torgue@foss.st.com, ludovic.desroches@microchip.com, lukas@wunner.de,
 linux-imx@nxp.com, kernel@pengutronix.de, linux-serial@vger.kernel.org,
 shawnguo@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 1/9] serial: core: move RS485
 configuration tasks from drivers into core
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 13. 02. 22, 23:27, Lino Sanfilippo wrote:
> Several drivers that support setting the RS485 configuration via userspace
> implement on or more of the following tasks:
> 
> - in case of an invalid RTS configuration (both RTS after send and RTS on
>    send set or both unset) fall back to enable RTS on send and disable RTS
>    after send
> 
> - nullify the padding field of the returned serial_rs485 struct
> 
> - copy the configuration into the uart port struct
> 
> - limit RTS delays to 100 ms
> 
> Move these tasks into the serial core to make them generic and to provide
> a consistent beheviour among all drivers.
> 
> Signed-off-by: Lino Sanfilippo <LinoSanfilippo@gmx.de>
> ---
>   drivers/tty/serial/serial_core.c | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/tty/serial/serial_core.c b/drivers/tty/serial/serial_core.c
> index 846192a7b4bf..3fab4070359c 100644
> --- a/drivers/tty/serial/serial_core.c
> +++ b/drivers/tty/serial/serial_core.c
> @@ -1282,8 +1282,21 @@ static int uart_set_rs485_config(struct uart_port *port,
>   	if (copy_from_user(&rs485, rs485_user, sizeof(*rs485_user)))
>   		return -EFAULT;
>   
> +	/* pick sane settings if the user hasn't */
> +	if (!(rs485.flags & SER_RS485_RTS_ON_SEND) ==
> +	    !(rs485.flags & SER_RS485_RTS_AFTER_SEND)) {
> +		rs485.flags |= SER_RS485_RTS_ON_SEND;
> +		rs485.flags &= ~SER_RS485_RTS_AFTER_SEND;
> +	}
> +	/* clamp the delays to [0, 100ms] */
> +	rs485.delay_rts_before_send = min(rs485.delay_rts_before_send, 100U);
> +	rs485.delay_rts_after_send = min(rs485.delay_rts_after_send, 100U);

Why is this magic 100? Can we have that number somehow documented? You 
should define a macro for that anyway.

> +	memset(rs485.padding, 0, sizeof(rs485.padding));

What is this memset good for?

>   	spin_lock_irqsave(&port->lock, flags);
>   	ret = port->rs485_config(port, &rs485);
> +	if (!ret)
> +		port->rs485 = rs485;
>   	spin_unlock_irqrestore(&port->lock, flags);
>   	if (ret)
>   		return ret;

thanks,
-- 
js
suse labs
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
