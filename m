Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD564BEA47
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Feb 2022 19:40:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C714DC60463;
	Mon, 21 Feb 2022 18:40:02 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 73757C5C842
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Feb 2022 18:40:01 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1BC94614F8;
 Mon, 21 Feb 2022 18:40:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C894DC340E9;
 Mon, 21 Feb 2022 18:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1645468799;
 bh=TIouyKTrY9MePsjLZLYLg6ZFF8gkEtGp45zObJ6uN5o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pYW+0/BuOS+GOb9Lnz6lRJxJbKBzTzErbZuoZTtdX60lLN5pXWz2LyTqoNiYFJbFi
 prkXb8WGTQftUX43eBZGEvDvSXLrRWCOGZ/HWyQVhAoYAC9rM2T+D19S5UAUFeWVds
 KgVRbxksEU8RkGyNbgxBbmK1COFq6zRa+WnmaKFQ=
Date: Mon, 21 Feb 2022 19:39:56 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Lino Sanfilippo <LinoSanfilippo@gmx.de>
Message-ID: <YhPcfMtE7xhykgcI@kroah.com>
References: <20220216001803.637-1-LinoSanfilippo@gmx.de>
 <20220216001803.637-2-LinoSanfilippo@gmx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220216001803.637-2-LinoSanfilippo@gmx.de>
Cc: linux-arm-kernel@lists.infradead.org, alexandre.belloni@bootlin.com,
 festevam@gmail.com, mcoquelin.stm32@gmail.com, linux-serial@vger.kernel.org,
 richard.genoud@gmail.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
 nicolas.ferre@microchip.com, linux@armlinux.org.uk,
 alexandre.torgue@foss.st.com, ludovic.desroches@microchip.com, lukas@wunner.de,
 linux-imx@nxp.com, kernel@pengutronix.de, u.kleine-koenig@pengutronix.de,
 jirislaby@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 2 1/9] serial: core: move RS485
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Wed, Feb 16, 2022 at 01:17:55AM +0100, Lino Sanfilippo wrote:
> Several drivers that support setting the RS485 configuration via userspace
> implement one or more of the following tasks:
> 
> - in case of an invalid RTS configuration (both RTS after send and RTS on
>   send set or both unset) fall back to enable RTS on send and disable RTS
>   after send
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
>  drivers/tty/serial/serial_core.c | 18 ++++++++++++++++++
>  include/uapi/linux/serial.h      |  3 +++
>  2 files changed, 21 insertions(+)
> 
> diff --git a/drivers/tty/serial/serial_core.c b/drivers/tty/serial/serial_core.c
> index 846192a7b4bf..a4f7e847d414 100644
> --- a/drivers/tty/serial/serial_core.c
> +++ b/drivers/tty/serial/serial_core.c
> @@ -1282,8 +1282,26 @@ static int uart_set_rs485_config(struct uart_port *port,
>  	if (copy_from_user(&rs485, rs485_user, sizeof(*rs485_user)))
>  		return -EFAULT;
>  
> +	/* pick sane settings if the user hasn't */
> +	if (!(rs485.flags & SER_RS485_RTS_ON_SEND) ==
> +	    !(rs485.flags & SER_RS485_RTS_AFTER_SEND)) {
> +		rs485.flags |= SER_RS485_RTS_ON_SEND;
> +		rs485.flags &= ~SER_RS485_RTS_AFTER_SEND;
> +	}
> +
> +	rs485.delay_rts_before_send = min_t(unsigned int,
> +					    rs485.delay_rts_before_send,
> +					    SER_RS485_MAX_RTS_DELAY);
> +	rs485.delay_rts_after_send = min_t(unsigned int,
> +					   rs485.delay_rts_after_send,
> +					   SER_RS485_MAX_RTS_DELAY);
> +	/* Return clean padding area to userspace */
> +	memset(rs485.padding, 0, sizeof(rs485.padding));
> +
>  	spin_lock_irqsave(&port->lock, flags);
>  	ret = port->rs485_config(port, &rs485);
> +	if (!ret)
> +		port->rs485 = rs485;
>  	spin_unlock_irqrestore(&port->lock, flags);
>  	if (ret)
>  		return ret;
> diff --git a/include/uapi/linux/serial.h b/include/uapi/linux/serial.h
> index fa6b16e5fdd8..859045a53231 100644
> --- a/include/uapi/linux/serial.h
> +++ b/include/uapi/linux/serial.h
> @@ -128,6 +128,9 @@ struct serial_rs485 {
>  							   (if supported) */
>  	__u32	delay_rts_before_send;	/* Delay before send (milliseconds) */
>  	__u32	delay_rts_after_send;	/* Delay after send (milliseconds) */
> +#define SER_RS485_MAX_RTS_DELAY		100		/* Max time with active
> +							   RTS before/after
> +							   data sent (msecs) */

Why is this a userspace value now?  What can userspace do with this
number?  Once we add this, it's fixed for forever.

thanks,

greg k-h
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
