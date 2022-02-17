Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F16314B9EAE
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Feb 2022 12:33:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BA08FC5F1F9;
	Thu, 17 Feb 2022 11:33:56 +0000 (UTC)
Received: from bmailout1.hostsharing.net (bmailout1.hostsharing.net
 [83.223.95.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 709C8C57B6C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Feb 2022 11:33:55 +0000 (UTC)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "*.hostsharing.net",
 Issuer "RapidSSL TLS DV RSA Mixed SHA256 2020 CA-1" (verified OK))
 by bmailout1.hostsharing.net (Postfix) with ESMTPS id 57740300097DB;
 Thu, 17 Feb 2022 12:33:54 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
 id 48EB354C1D; Thu, 17 Feb 2022 12:33:54 +0100 (CET)
Date: Thu, 17 Feb 2022 12:33:54 +0100
From: Lukas Wunner <lukas@wunner.de>
To: Lino Sanfilippo <LinoSanfilippo@gmx.de>
Message-ID: <20220217113354.GA7826@wunner.de>
References: <20220216001803.637-1-LinoSanfilippo@gmx.de>
 <20220216001803.637-2-LinoSanfilippo@gmx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220216001803.637-2-LinoSanfilippo@gmx.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-arm-kernel@lists.infradead.org, alexandre.belloni@bootlin.com,
 festevam@gmail.com, mcoquelin.stm32@gmail.com, linux-serial@vger.kernel.org,
 richard.genoud@gmail.com, gregkh@linuxfoundation.org, s.hauer@pengutronix.de,
 nicolas.ferre@microchip.com, linux@armlinux.org.uk,
 alexandre.torgue@foss.st.com, ludovic.desroches@microchip.com,
 linux-imx@nxp.com, kernel@pengutronix.de, u.kleine-koenig@pengutronix.de,
 shawnguo@kernel.org, jirislaby@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org
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

The policy you're enforcing here is:  If settings are nonsensical,
always default to active-high polarity.

However some drivers currently enforce a completely different policy:
E.g. with 8250_lpc18xx.c, if SER_RS485_RTS_ON_SEND is set, use active-high
(and fix up SER_RS485_RTS_AFTER_SEND), else use active-low polarity.
This yields a different result compared to your policy in case both bits
are cleared.

Similarly, sc16is7xx.c defaults to active-low if SER_RS485_RTS_AFTER_SEND
is set, else active-high polarity.  This yields a different result compared
to your policy in case both bits are set.

You risk breaking existing user space applications with this change
if those applications specify nonsensical polarity settings.


I happen to have created a similar commit to this one a month ago
and I came to the conclusion that all one can do is offer a library
function uart_sanitize_rs485_mode() which drivers may elect to call
if that helper's policy is identical to what they're doing now:

https://github.com/l1k/linux/commit/637984111e42


> +
> +	rs485.delay_rts_before_send = min_t(unsigned int,
> +					    rs485.delay_rts_before_send,
> +					    SER_RS485_MAX_RTS_DELAY);
> +	rs485.delay_rts_after_send = min_t(unsigned int,
> +					   rs485.delay_rts_after_send,
> +					   SER_RS485_MAX_RTS_DELAY);

Nonsensical delays may not only be passed in from user space via ioctl(),
but through the device tree.  That's another reason to use a library
function:  It can be called both from the ioctl() as well as after (or in)
uart_get_rs485_mode().


> +	/* Return clean padding area to userspace */
> +	memset(rs485.padding, 0, sizeof(rs485.padding));

Unlike the polarity and delay handling, this one makes sense.

Thanks,

Lukas
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
