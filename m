Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E06F44BF23C
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Feb 2022 07:51:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9428FC60463;
	Tue, 22 Feb 2022 06:51:43 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6B62FC60461
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Feb 2022 06:51:42 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id q17so34672418edd.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Feb 2022 22:51:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bR8Q0QY9SX7TEWCLjuX9Gl0qDTq1gqx2gu8NIUCvNZY=;
 b=llF0gnMrTp95a56rguXPA8F0ruGFAq/24dZeFY5QpIAnQh3SSM17LUN1PcgIQRqHVC
 eLuYjzpYr7V7oFM+spTIl73xwPj9kd/imV0ATYmryZbjUJL4ywGKlhPjk+TQ45cOOJxf
 7+LYvFkTyN4K0uq+QAawYXGqQEY/FqYAfb3ulhmltBRjL92dS9VAl8cOla2nw2s6LBvr
 xbFp3WP1lIsp1m5dmq9rj5j+xpTZzv7CQLMT0B6Gt4G2TPxAIk8FR8xvtUMNWZf5M7TU
 o/bYh31kvxP1D/c7E/Wskc5Xt0AQpSPAm6sLjAdTeGBjNRfEts0YXx1rbZWVpqEFSBIr
 siXg==
X-Gm-Message-State: AOAM533hsGTb+ME2C+Tof5fSdQNBdjzv3w/LvnNrggw0mdkCcRoNb8WZ
 9KVITIBf0XmaGdnbN7E6QL8=
X-Google-Smtp-Source: ABdhPJybXoH/4IC5sxgRdrpiS40oI8K5YpOtI4ArFM9KXKTCbppArM6MONHlNQCHPNBdKQfXpU+8Ng==
X-Received: by 2002:a05:6402:1e8b:b0:3da:58e6:9a09 with SMTP id
 f11-20020a0564021e8b00b003da58e69a09mr25358130edf.155.1645512701870; 
 Mon, 21 Feb 2022 22:51:41 -0800 (PST)
Received: from ?IPV6:2a0b:e7c0:0:107::70f? ([2a0b:e7c0:0:107::70f])
 by smtp.gmail.com with ESMTPSA id x6sm9348611edv.109.2022.02.21.22.51.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Feb 2022 22:51:41 -0800 (PST)
Message-ID: <e883ccb5-68ea-f802-e4fd-864672d8ad7b@kernel.org>
Date: Tue, 22 Feb 2022 07:51:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Content-Language: en-US
To: Lino Sanfilippo <LinoSanfilippo@gmx.de>, gregkh@linuxfoundation.org,
 u.kleine-koenig@pengutronix.de
References: <20220222011433.8761-1-LinoSanfilippo@gmx.de>
 <20220222011433.8761-2-LinoSanfilippo@gmx.de>
From: Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <20220222011433.8761-2-LinoSanfilippo@gmx.de>
Cc: linux-arm-kernel@lists.infradead.org, alexandre.belloni@bootlin.com,
 mcoquelin.stm32@gmail.com, richard.genoud@gmail.com, festevam@gmail.com,
 s.hauer@pengutronix.de, linux@armlinux.org.uk, nicolas.ferre@microchip.com,
 alexandre.torgue@foss.st.com, ludovic.desroches@microchip.com, lukas@wunner.de,
 linux-imx@nxp.com, kernel@pengutronix.de, linux-serial@vger.kernel.org,
 shawnguo@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, p.rosenberger@kunbus.com
Subject: Re: [Linux-stm32] [PATCH v3 1/9] serial: core: move RS485
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

On 22. 02. 22, 2:14, Lino Sanfilippo wrote:
> Several drivers that support setting the RS485 configuration via userspace
> implement one or more of the following tasks:
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
> a consistent behaviour among all drivers.
> 
> Signed-off-by: Lino Sanfilippo <LinoSanfilippo@gmx.de>
> ---
>   drivers/tty/serial/serial_core.c | 29 +++++++++++++++++++++++++++++
>   1 file changed, 29 insertions(+)
> 
> diff --git a/drivers/tty/serial/serial_core.c b/drivers/tty/serial/serial_core.c
> index 846192a7b4bf..2b3afe038c1c 100644
> --- a/drivers/tty/serial/serial_core.c
> +++ b/drivers/tty/serial/serial_core.c
> @@ -42,6 +42,11 @@ static struct lock_class_key port_lock_key;
>   
>   #define HIGH_BITS_OFFSET	((sizeof(long)-sizeof(int))*8)
>   
> +/*
> + * Max time with active RTS before/after data is sent.
> + */
> +#define RS485_MAX_RTS_DELAY	100 /* msecs */
> +
>   static void uart_change_speed(struct tty_struct *tty, struct uart_state *state,
>   					struct ktermios *old_termios);
>   static void uart_wait_until_sent(struct tty_struct *tty, int timeout);
> @@ -1282,8 +1287,32 @@ static int uart_set_rs485_config(struct uart_port *port,
>   	if (copy_from_user(&rs485, rs485_user, sizeof(*rs485_user)))
>   		return -EFAULT;
>   
> +	/* pick sane settings if the user hasn't */
> +	if (!(rs485.flags & SER_RS485_RTS_ON_SEND) ==
> +	    !(rs485.flags & SER_RS485_RTS_AFTER_SEND)) {
> +		pr_warn("invalid RTS setting, using RTS_ON_SEND instead\n");

Can't we have a device prefix here, so that everyone knows what device 
is affected? Without that, it's not that useful. At least port->name & 
port->line could be printed. The uart core uses dev_* prints, but prints 
also line as uport->dev can be NULL sometimes.

Hm, we could introduce uart_print family (to print something like what 
is in uart_report_port).

thanks,
-- 
js
suse labs
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
