Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DCEAD4BABC9
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Feb 2022 22:36:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 76915C5F1F9;
	Thu, 17 Feb 2022 21:36:21 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7A8F8C5F1D7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Feb 2022 21:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1645133771;
 bh=sh1DPaASGW9V2zkfziMd7+l7s/QlEn4SX5JpX6nJ3v0=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=Sv9dWkeaeIzH6NL8B8qO33aTGzXF3HAl1zMMXwbQNLdhi71L+zlgBC6dtaKPZUpFx
 xzOZwnQuqLJNu1Wdknq3ofxY0lqbUeC/Sz8teI9J5qNLX3AcU6AUrjTK/8DGdejZps
 pMc152GcOaHIrSnBodvvbrxqxqmWpNBiK56mQ3KU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.178.78] ([149.172.237.68]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M6UZv-1nNGDq1hlJ-006vSG; Thu, 17
 Feb 2022 22:36:11 +0100
To: Lukas Wunner <lukas@wunner.de>
References: <20220216001803.637-1-LinoSanfilippo@gmx.de>
 <20220216001803.637-2-LinoSanfilippo@gmx.de>
 <20220217113354.GA7826@wunner.de>
From: Lino Sanfilippo <LinoSanfilippo@gmx.de>
Message-ID: <03604709-fcc5-f528-c5cf-5b8c2d0abfd0@gmx.de>
Date: Thu, 17 Feb 2022 22:36:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20220217113354.GA7826@wunner.de>
Content-Language: en-US
X-Provags-ID: V03:K1:PcdHdcVTNQnY7ZlbLSzK1FYNltMg8wlri9F+ts0o/nBFWnhsy/c
 Hlc15FyNnhioUoOXzxbM8tXwQoeXFbMUBz1tsYOT4YJoUK0jxiliABFzWMk9sHnGe7vPSB1
 OyL/7wbDzgYfoW1TZ1NlBmTePPoZTBDHT1dpysRDSix2U1GGAnFYItw5L+7q9SUsjEuzSNS
 YPgzJx7tkshMeWH06iKaw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:xXdSJIbiOW0=:L/EqqrP/p+Od95kAdJz4ji
 PkLd8shzbwi6IeBHYYnj1MpaKOEH7qWPcUeLnr0TWq6flKTKD8XLn9GGoJIhRJrSNXXVSH95c
 12s98dOcePln5dU0gyx9Q9xBDG8q4JWPEkz7DP2UgxIuuDQlaug4yvZZtDVctcvxznyRVS42n
 QsZPDSAtmdWHZURFupjPukhALS3V6wgpaKE80LMMFVrHQtqib6mgr3Jau5yC53RiHjxNfNY/w
 Pa5rYvJe9DJZJHo7kL5tWE6J7N9m7lCY/RKIqp6LooTJ2dLlY+sDA71Nm/tsqVoScG4XqY9VE
 E7TfCN/ySf7sySMWgYE7q0fRZ40V+F5u+LG69UCiYTrQQk5330n9WmE8u18qoyvkbNrTyr6DR
 KbIQBYYMeueM3iENiL93ITWMV3sQtCdnOXTxepFwLspvdfy2aTxKriuptJe4eEv9jwhJDMKwk
 l1IEW1UWsOAr6g3Z+mSGl7URXYU/lIenXz6/D0YsBRi3z04bkMYupb1h1XfaBMd8KZuMnLWsK
 Lloj6OGuzpsSlC4fMe/Eua2+aTDfVN1Nbre7ytJI66S6DeB8Fs4xYkMjX6cK2Vl42rb3ip5Jy
 yaV0m0g3CohOJqHAiHaj7Uo0/hlhDa3svNBrohCs3wi10iSzwF5ISuZKmkkIM8vegnqDpsOXD
 WMhpDWmJUHbhvxehZq3vVQsqG6/mIclu4ZkKCbeeuQ+NDgxp2iI7YGxBalUcwZPnpHnTAt2m7
 HlAFYgdKT/v37sQzewNVPb9JaByjNFW7n3/Dls4G/QKwzt8l4FBveKuFkmSuvaoYWQIyrLuIi
 giW9tw65el1SK9hvIHR5lC5178r1nZvxQuG/4MGiFdt+0PGCTvETeHJ29Ag/bQJIx88ZfzgpR
 mM2DkCdmhNOflrjfl7q9A2HnfLGbcR1Z5KLdv2YOojDJnk2/gzwDc/SS6kSmPQVCcK1J9utq9
 HfxbOdlA7FK4ffiIjW5/BdC+JOplPo7udayLSrdLc24EBoatBHeuFC2c4jtm4qXeHLR73yg7a
 5oW4SXhSpUxDU5Xwv+nVeXxTequntWXJqZE+Htr5k5y2CYnOG3mzoUamUmcXp1+Cyga4die2g
 ZCASi7QtpGgsNU=
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


Hi,

On 17.02.22 at 12:33, Lukas Wunner wrote:
> On Wed, Feb 16, 2022 at 01:17:55AM +0100, Lino Sanfilippo wrote:
>> --- a/drivers/tty/serial/serial_core.c
>> +++ b/drivers/tty/serial/serial_core.c
>> @@ -1282,8 +1282,26 @@ static int uart_set_rs485_config(struct uart_port *port,
>>  	if (copy_from_user(&rs485, rs485_user, sizeof(*rs485_user)))
>>  		return -EFAULT;
>>
>> +	/* pick sane settings if the user hasn't */
>> +	if (!(rs485.flags & SER_RS485_RTS_ON_SEND) ==
>> +	    !(rs485.flags & SER_RS485_RTS_AFTER_SEND)) {
>> +		rs485.flags |= SER_RS485_RTS_ON_SEND;
>> +		rs485.flags &= ~SER_RS485_RTS_AFTER_SEND;
>> +	}
>
> The policy you're enforcing here is:  If settings are nonsensical,
> always default to active-high polarity.
>
> However some drivers currently enforce a completely different policy:
> E.g. with 8250_lpc18xx.c, if SER_RS485_RTS_ON_SEND is set, use active-high
> (and fix up SER_RS485_RTS_AFTER_SEND), else use active-low polarity.
> This yields a different result compared to your policy in case both bits
> are cleared.
>> Similarly, sc16is7xx.c defaults to active-low if SER_RS485_RTS_AFTER_SEND
> is set, else active-high polarity.  This yields a different result compared
> to your policy in case both bits are set.
>
> You risk breaking existing user space applications with this change
> if those applications specify nonsensical polarity settings.
>

Ok, but IMHO this is a very small risk. I cannot imagine that there
are many (or any at all) userspace applications that do not
specify any RTS setting and then rely on a driver specific fallback
implementation. I would not like to remove the RTS check from
uart_set_rs485_config() only because of that.

>
> I happen to have created a similar commit to this one a month ago
> and I came to the conclusion that all one can do is offer a library
> function uart_sanitize_rs485_mode() which drivers may elect to call
> if that helper's policy is identical to what they're doing now:
>
> https://github.com/l1k/linux/commit/637984111e42
>>
>> +
>> +	rs485.delay_rts_before_send = min_t(unsigned int,
>> +					    rs485.delay_rts_before_send,
>> +					    SER_RS485_MAX_RTS_DELAY);
>> +	rs485.delay_rts_after_send = min_t(unsigned int,
>> +					   rs485.delay_rts_after_send,
>> +					   SER_RS485_MAX_RTS_DELAY);
>
> Nonsensical delays may not only be passed in from user space via ioctl(),
> but through the device tree.  That's another reason to use a library
> function:  It can be called both from the ioctl() as well as after (or in)
> uart_get_rs485_mode().
>

The idea of my patch set is actually to provide a common behavior for the
RS485 configuration by userspace similar to what uart_get_rs485_mode()
provides for the configuration by device tree.

However with the solution you propose sanity checks for userspace
configuration are still up to each single driver and thus can vary
from driver to driver or not be implemented at all. I dont think that
this is the better approach in the long term.


>
>> +	/* Return clean padding area to userspace */
>> +	memset(rs485.padding, 0, sizeof(rs485.padding));
>
> Unlike the polarity and delay handling, this one makes sense.
>
> Thanks,
>
> Lukas
>

Regards,
Lino
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
