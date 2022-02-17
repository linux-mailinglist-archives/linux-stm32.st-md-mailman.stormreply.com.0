Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC304B9F5B
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Feb 2022 12:47:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7D09CC5F1F9;
	Thu, 17 Feb 2022 11:47:34 +0000 (UTC)
Received: from bmailout3.hostsharing.net (bmailout3.hostsharing.net
 [176.9.242.62])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 197EFC57B6C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Feb 2022 11:47:33 +0000 (UTC)
Received: from h08.hostsharing.net (h08.hostsharing.net
 [IPv6:2a01:37:1000::53df:5f1c:0])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "*.hostsharing.net",
 Issuer "RapidSSL TLS DV RSA Mixed SHA256 2020 CA-1" (verified OK))
 by bmailout3.hostsharing.net (Postfix) with ESMTPS id 79C5F10045C15;
 Thu, 17 Feb 2022 12:47:32 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
 id 4D9AE2E9DD4; Thu, 17 Feb 2022 12:47:32 +0100 (CET)
Date: Thu, 17 Feb 2022 12:47:32 +0100
From: Lukas Wunner <lukas@wunner.de>
To: Lino Sanfilippo <LinoSanfilippo@gmx.de>
Message-ID: <20220217114732.GB7826@wunner.de>
References: <20220216001803.637-1-LinoSanfilippo@gmx.de>
 <20220216001803.637-5-LinoSanfilippo@gmx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220216001803.637-5-LinoSanfilippo@gmx.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-arm-kernel@lists.infradead.org, alexandre.belloni@bootlin.com,
 festevam@gmail.com, mcoquelin.stm32@gmail.com, linux-serial@vger.kernel.org,
 richard.genoud@gmail.com, gregkh@linuxfoundation.org, s.hauer@pengutronix.de,
 nicolas.ferre@microchip.com, linux@armlinux.org.uk,
 alexandre.torgue@foss.st.com, ludovic.desroches@microchip.com,
 linux-imx@nxp.com, kernel@pengutronix.de, u.kleine-koenig@pengutronix.de,
 shawnguo@kernel.org, jirislaby@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 2 4/9] serial: sc16is7xx: remove redundant
 check in rs485_config
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

On Wed, Feb 16, 2022 at 01:17:58AM +0100, Lino Sanfilippo wrote:
> --- a/drivers/tty/serial/sc16is7xx.c
> +++ b/drivers/tty/serial/sc16is7xx.c
> @@ -959,16 +959,6 @@ static int sc16is7xx_config_rs485(struct uart_port *port,
>  	struct sc16is7xx_one *one = to_sc16is7xx_one(port, port);
>  
>  	if (rs485->flags & SER_RS485_ENABLED) {
> -		bool rts_during_rx, rts_during_tx;
> -
> -		rts_during_rx = rs485->flags & SER_RS485_RTS_AFTER_SEND;
> -		rts_during_tx = rs485->flags & SER_RS485_RTS_ON_SEND;
> -
> -		if (rts_during_rx == rts_during_tx)
> -			dev_err(port->dev,
> -				"unsupported RTS signalling on_send:%d after_send:%d - exactly one of RS485 RTS flags should be set\n",
> -				rts_during_tx, rts_during_rx);
> -

Hm, patch 1 in this series doesn't emit such a message, so unlike now,
users will no longer be warned that they passed in nonsensical settings...
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
