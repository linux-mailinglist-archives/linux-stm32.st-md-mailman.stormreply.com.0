Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C772E4B6B31
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Feb 2022 12:34:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 88495C60488;
	Tue, 15 Feb 2022 11:34:14 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A65B9C5F1D7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Feb 2022 15:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1644851397;
 bh=6tqINRpeM+YJ1A3X13jMupv+LocJW9P6z95SnyKrwy8=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=i2Fu3JMoGrk/CCAOnd9je9muf3j0qultpZA/crrP8hPrtqIgLPCQmAxEkJqsAo+Sy
 Hju0ke7l69z/aqCy5H2aAi/YlPW5bkyfTRauh/Gvw8dHfLOUkdHTY8SXL1VP3pX3IK
 m8ZGnbEC6pIXwz9iCuL5CUe/GVMyl1Q1EJmkwxQA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.178.70] ([149.172.237.68]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mj8qd-1nyj2G1hC9-00fEfI; Mon, 14
 Feb 2022 16:09:57 +0100
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
References: <20220213222737.15709-1-LinoSanfilippo@gmx.de>
 <20220213222737.15709-2-LinoSanfilippo@gmx.de>
 <20220214070622.rz5cv6yy3aarvrjv@pengutronix.de>
From: Lino Sanfilippo <LinoSanfilippo@gmx.de>
Message-ID: <edbb9e1d-bed4-0850-08f4-029c4fcbfd5c@gmx.de>
Date: Mon, 14 Feb 2022 16:09:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20220214070622.rz5cv6yy3aarvrjv@pengutronix.de>
Content-Language: en-US
X-Provags-ID: V03:K1:YE84FWDfAxR4ISDgoFadVOaGWqpFJd7nWtcrk1l8fs6ST6IYUX/
 PQwvYW3X5x1wY0lwzUVDE7YWxVk8QjkYWk1AYXS0bq/XvtZkkdrC3I9dC+tK+qUk1iw4HPF
 pyF90h+45AsoiAnGgxc5/nm9kvGMpZ9pUAX5TMzX7ZA+UYVhHlsdsfEw/4G6bEZrNSi1jCQ
 ZOJVQEee8+GufKeuZ9k7g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ntLZ5QT6wu8=:21Awb8bNgZiU5P7WpuACkA
 iOT2oqIhdoxZhwWi+PtyRNYxWBbaHcpp84sVZZ8twaBbnNP1w57WtdIgpv28mD76wSW2Ff5wz
 DfePtFquqET6U24ki2e5PK9StEuD5eWxFDmkikw1QiAAFVMwKIRKuMn+IbrDiOH/maIm5w0I5
 jOFg7RZJSPu9IFNMNOokWosTS4tbnfEzJPPpOf6iv8n2Zd3I3OIXXYSDexbjcz6RZ7Op4REy2
 NWvTIvXVt8eu9V0mf/dAuIi2ghLZfRIcfA5Ijd7Q5QH7XvBB0neTL0B8mkk1yvn+al4EOHF2K
 rd1pmY01J+EoZwAv/19ympMlw55qMVSu4/CG/rLP6pfiQCXtDUiF+e6oxwiE76JE7V1MTaTCD
 E3Hm9yolUsIuzekduB9fYfZO6eyrI1GCxt4yQ+4hwTi62PwkGQLNXr63vJY4wmL+gCxT5CQuy
 HgLl4CUQS+ZYV9TRE3r9NXT238ayqpVRwYhrFq0zUJbUMgJ/Qehl7hvXk678TyhU+rRwXYFBh
 xgpRLvnGjNTLuSXy32yobeHL3hU0BBqlVa3fLy6gjozYsCirKIneuHQaRvP+JeU1hmRPXrDDw
 ZG9uWN1YqhyIgRd9CEmTt2asJyS59nXMxnqlu4+lhK5Bvpu0W0kvpY78TzrOIaQSsMWsTB5oU
 KBAgZIKxzft/JOyXvODqVe5RmT9Jcb3i1EGqYtb14KRq1gedSJytqGvNO/55yM8ufw7JDYOu1
 GqBRE5yGOmXucBM9S8xhUXWqKqgBUH8ghuAhkCXs0c1ZxuAF5ZtuO9NdQb6l+YweNGfSEhtAe
 toYBsppISetmVFoQEDLX+Wk94jaJRUyejkrqa/Ky0S4Nol3ks7iiZCkagwBv+iCbluTH5P0nQ
 k9aEAdoZcl0v1Lyta+KYFXMIc6UlzgyrBp8SDIABUGQtWlcb+dnj/GQMdaMzICIWj+gj5tNIl
 syEsa24/ECkSyMV+yNFSTc+r9sB0RX7GuhUCEx5BCzHGLVHgI3LIUBdkXrXJLvB1W841UTgzD
 biVTzLZ9e6n2tmV51Y3lJgTpBkhVp+IH4K9vZxORPNeuF4qVsBZ4tYIi9yvIFSPdpc8QJnP47
 aM4Va2mhMRBLis=
X-Mailman-Approved-At: Tue, 15 Feb 2022 11:34:11 +0000
Cc: alexandre.belloni@bootlin.com, festevam@gmail.com,
 linux-kernel@vger.kernel.org, kernel@pengutronix.de, richard.genoud@gmail.com,
 gregkh@linuxfoundation.org, s.hauer@pengutronix.de, linux@armlinux.org.uk,
 nicolas.ferre@microchip.com, alexandre.torgue@foss.st.com,
 ludovic.desroches@microchip.com, lukas@wunner.de, linux-imx@nxp.com,
 mcoquelin.stm32@gmail.com, linux-serial@vger.kernel.org, shawnguo@kernel.org,
 jirislaby@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
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
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hi,

On 14.02.22 at 08:06, Uwe Kleine-K=F6nig wrote:
> On Sun, Feb 13, 2022 at 11:27:29PM +0100, Lino Sanfilippo wrote:
>> Several drivers that support setting the RS485 configuration via userspa=
ce
>> implement on or more of the following tasks:
>
> s/on/one/

Ok

>
>>
>> - in case of an invalid RTS configuration (both RTS after send and RTS on
>>   send set or both unset) fall back to enable RTS on send and disable RTS
>>   after send
>>
>> - nullify the padding field of the returned serial_rs485 struct
>>
>> - copy the configuration into the uart port struct
>>
>> - limit RTS delays to 100 ms
>>
>> Move these tasks into the serial core to make them generic and to provide
>> a consistent beheviour among all drivers.
>
> s/beheviour/behaviour/
>

Ok

>> Signed-off-by: Lino Sanfilippo <LinoSanfilippo@gmx.de>
>> ---
>>  drivers/tty/serial/serial_core.c | 13 +++++++++++++
>>  1 file changed, 13 insertions(+)
>>
>> diff --git a/drivers/tty/serial/serial_core.c b/drivers/tty/serial/seria=
l_core.c
>> index 846192a7b4bf..3fab4070359c 100644
>> --- a/drivers/tty/serial/serial_core.c
>> +++ b/drivers/tty/serial/serial_core.c
>> @@ -1282,8 +1282,21 @@ static int uart_set_rs485_config(struct uart_port=
 *port,
>>  	if (copy_from_user(&rs485, rs485_user, sizeof(*rs485_user)))
>>  		return -EFAULT;
>>
>> +	/* pick sane settings if the user hasn't */
>> +	if (!(rs485.flags & SER_RS485_RTS_ON_SEND) =3D=3D
>> +	    !(rs485.flags & SER_RS485_RTS_AFTER_SEND)) {
>> +		rs485.flags |=3D SER_RS485_RTS_ON_SEND;
>> +		rs485.flags &=3D ~SER_RS485_RTS_AFTER_SEND;
>> +	}
>> +	/* clamp the delays to [0, 100ms] */
>> +	rs485.delay_rts_before_send =3D min(rs485.delay_rts_before_send, 100U);
>> +	rs485.delay_rts_after_send =3D min(rs485.delay_rts_after_send, 100U);
>> +	memset(rs485.padding, 0, sizeof(rs485.padding));
>> +
>>  	spin_lock_irqsave(&port->lock, flags);
>>  	ret =3D port->rs485_config(port, &rs485);
>> +	if (!ret)
>> +		port->rs485 =3D rs485;
>
> I was only Cc:d for the imx patch (patch #7) and tried to verify the
> claim there that "the serial core already assigns the passed
> configuration to the uart port". That failed when I looked at my kernel
> tree.
>
> So it would be great, if you sent dependencies (or at least a cover
> letter) to all recipients of a given patch to ease review. Also I want
> to suggest to mention uart_set_rs485_config() in the commit log of the
> imx patch (and probably the others) to simplify verifying the claim
> there.
>

Thanks for the review, I will correct the typos in the next version.
I will also cc you directly for the next version if you dont mind.
get_maintainers only spit out "Pengutronix Kernel Team" so I used that
address for the whole series (including the cover letter).


Regards,
Lino

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
