Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D2A5BE4D5
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Sep 2022 13:43:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E283BC640FB;
	Tue, 20 Sep 2022 11:43:33 +0000 (UTC)
Received: from bmailout1.hostsharing.net (bmailout1.hostsharing.net
 [83.223.95.100])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E4465C640F0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Sep 2022 11:43:32 +0000 (UTC)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "*.hostsharing.net",
 Issuer "RapidSSL TLS DV RSA Mixed SHA256 2020 CA-1" (verified OK))
 by bmailout1.hostsharing.net (Postfix) with ESMTPS id B93893000244E;
 Tue, 20 Sep 2022 13:43:31 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
 id ADB6D2D939; Tue, 20 Sep 2022 13:43:31 +0200 (CEST)
Date: Tue, 20 Sep 2022 13:43:31 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Lino Sanfilippo <LinoSanfilippo@gmx.de>
Message-ID: <20220920114331.GA26352@wunner.de>
References: <20220410104642.32195-1-LinoSanfilippo@gmx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220410104642.32195-1-LinoSanfilippo@gmx.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-arm-kernel@lists.infradead.org, alexandre.belloni@bootlin.com,
 festevam@gmail.com, mcoquelin.stm32@gmail.com, linux-serial@vger.kernel.org,
 richard.genoud@gmail.com, gregkh@linuxfoundation.org, s.hauer@pengutronix.de,
 nicolas.ferre@microchip.com, linux@armlinux.org.uk,
 ludovic.desroches@microchip.com, linux-imx@nxp.com, kernel@pengutronix.de,
 u.kleine-koenig@pengutronix.de, shawnguo@kernel.org, jirislaby@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 p.rosenberger@kunbus.com
Subject: Re: [Linux-stm32] Move RS485 implementation from drivers to serial
	core (v4 RESEND)
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

On Sun, Apr 10, 2022 at 12:46:33PM +0200, Lino Sanfilippo wrote:
> This patch series is an attempt to simplify rs485 implementation in drivers
> by moving the following tasks out of the drivers into the serial core:
> 
> - ensure sane RTS settings: in case of an invalid configuration (both RTS
>   after send and RTS on send set or both unset) enable RTS on send and
>   disable RTS after send
[...]
> Redundant code has been removed from the following drivers for now:
> 
> - atmel
> - fsl_lpuart
> - amba
> - imx
> - max310x
> - omap-serial
> - sc16is7xx
> - stm32-usart

It looks like there's more of this cruft left at least in
serial8250_em485_config()...

Thanks,

Lukas
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
