Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E3F4BAC5C
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Feb 2022 23:11:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7FC51C5F1F9;
	Thu, 17 Feb 2022 22:11:27 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B6BEFC5F1D7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Feb 2022 22:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1645135875;
 bh=0KjJ3nEZ8kESxVKEPQdyOatinf7wfIYti/GBayHCGqs=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=GmFoXBFZtF7bBbOltR52vLe24JIWWh3AyXmZtMGhOhlX40FC5TkqT2ERjA78Sn3U/
 gK6Z7FPAeGQy056X+i+asAfKhnHBEtREp0v5+KtPK5WFvexXl7wJvcaeS8HaqPQcQ6
 TqxHpHErb89NpccJ86eaxXQd4EbERvhEunLNHIpo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.178.78] ([149.172.237.68]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MhlKs-1nyIc72WsC-00dnCU; Thu, 17
 Feb 2022 23:11:15 +0100
To: Lukas Wunner <lukas@wunner.de>
References: <20220216001803.637-1-LinoSanfilippo@gmx.de>
 <20220216001803.637-5-LinoSanfilippo@gmx.de>
 <20220217114732.GB7826@wunner.de>
From: Lino Sanfilippo <LinoSanfilippo@gmx.de>
Message-ID: <c10505d2-f8ee-0566-af28-45da59ecd99b@gmx.de>
Date: Thu, 17 Feb 2022 23:11:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20220217114732.GB7826@wunner.de>
Content-Language: en-US
X-Provags-ID: V03:K1:LDlBc3jcPBZ7hh4E3miuvkAn8yQxJNZHrOgWRkl4+bOdByau3rY
 Xq28u5HUzXHh4aJCAZCXN+d7oF605/F76LP2lpGFZpcyQsejf/m57p88F91d9XXP1x/QtFz
 1WGpW8CArQel2FNazX6c2Klp2tf1UabxpPnQpfPR07Go5sfN457NFSRHux0qYbBT/zqLJut
 1+CQgj4eQSO38fJS2nrHQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZshnL656ssU=:k7WyTvNEtAyT+v2CPkGHo+
 Y+jrlwuuTPjrZICC94MIaWOuRkmHK/bE9pZj3HotzSqTTPOIW00N2ph03i1vC95xLvEzvsXjy
 m8D6h2c7/7usoldpHL0E7t4twQ005yho7Q4KaZzJG9t23vurgOIRpsvC+f8AdZdQkRSfMK6aF
 RrelfYXvNbg8LujGu93pilNjtLuypY2pKeS3zBI/sG91Cj4HrO5wL7mX2mp1GQHqFzPNYrjZe
 hQw3bv2sPUNFBMoTFPbXVN6nsTNwTDe1MUllUXO3v/c2ly3J5jbqRs1hMjNdXVcEvXgOvANIn
 iSuFU7n7cklDqVB9XHRYmujCXQF1EgpVj3Zp+vAu1aMwQsNiv+PBhzc0wf3ou0kZW2zxvPnnQ
 +ODjGmEa2xfu0k9E9w8wYL6BNl8indogvZIu0ihYYtfle+7S4RxNfQ/Paec0sTMPQZqd9wDv1
 viZToYaq4SAGM15DjALr0nvPp/zF27qaoGUXlJA+dO/Wxu0+8qlpd8WayRsmTR0uws+m4aHAc
 Y4UvZRgAQLPWB/MdIIGLLhufsbsaxudm4CtR/iZnW4GDFtZ69knjofpZXY8DgtpwTOPrPpmgi
 me8lqnxFZKoaxElxvr0PGFT+9kGV/atUxSx4g5zBs5W8ZJh4saiJQ6MH1k/m9Twl1cwiwBuqZ
 Kv0ebKHZffWd/YuzEOq4SDGANPCwP6xXPKhCqggaTX/m50BHGhXT1eUIFL8M1/MSB8+kQDZ3P
 X1CVXeA8WLF/t/WmtYU1w5BggTH15yomcabKrlLk2bPMC4xWCn8VV4QB2BG7AjpYfIvPjQFxC
 WcscmQv9yldtvjOTYfz1w2kHSoAeHkcLReDJEDIIYKmhBOSLAEqlwW6vNSYBmrnmBMCwWi28h
 dhjk2CdmK3D82nO0AlnZgtraHGQKZoUdZbXlEgtc9kwwagPNAyCYYnudLgVJG8opyO0Al/gLv
 lEB1JMUSpOEQ4UEJdQbZc78WqXmpe2iDSLqvzwgLtK6R+3LOD0fH3HahNSFmkMDr3nxUpJw2h
 A5J5WrbCSrm2YjevI0WtdLoyGPLsaSEQhmUj11unv+uEuauZv/45jJ/jDetY31GF/2FJ1SXTe
 kADmNWyVlFwq34=
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

Hi,

On 17.02.22 at 12:47, Lukas Wunner wrote:
> On Wed, Feb 16, 2022 at 01:17:58AM +0100, Lino Sanfilippo wrote:
>> --- a/drivers/tty/serial/sc16is7xx.c
>> +++ b/drivers/tty/serial/sc16is7xx.c
>> @@ -959,16 +959,6 @@ static int sc16is7xx_config_rs485(struct uart_port *port,
>>  	struct sc16is7xx_one *one = to_sc16is7xx_one(port, port);
>>
>>  	if (rs485->flags & SER_RS485_ENABLED) {
>> -		bool rts_during_rx, rts_during_tx;
>> -
>> -		rts_during_rx = rs485->flags & SER_RS485_RTS_AFTER_SEND;
>> -		rts_during_tx = rs485->flags & SER_RS485_RTS_ON_SEND;
>> -
>> -		if (rts_during_rx == rts_during_tx)
>> -			dev_err(port->dev,
>> -				"unsupported RTS signalling on_send:%d after_send:%d - exactly one of RS485 RTS flags should be set\n",
>> -				rts_during_tx, rts_during_rx);
>> -
>
> Hm, patch 1 in this series doesn't emit such a message, so unlike now,
> users will no longer be warned that they passed in nonsensical settings...
>

what about logging a warning for both RTS polarity and delay correction?

Regards,
Lino
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
