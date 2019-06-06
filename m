Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E06E36D86
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Jun 2019 09:42:41 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C495ACC10BC
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Jun 2019 07:42:40 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 22509CC10BB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Jun 2019 07:42:39 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x567abQh026873; Thu, 6 Jun 2019 09:42:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=2pnG067CQBsFQ0nrqkBYXv+JxQO9bStpus+oiXJpQJw=;
 b=npiXQKxLn1F0OQYGfqEjGS3tkWZ32IYOxnz7/JlRGJV+32nW+Duoh2f28aw3XPvV3VGA
 /hXCI+ald6VWZ9GdEaO9tV8NIthSvQ1Yx22Fx7TUZwdoZ+yACuU4PfPiK0rvv2jzIkyR
 fHqcnDS2Dq+p4YmZh/gzPbJyYqVXlZCtpFH6GQMpcv4EssZXnzAqWB9tG1KXhxN4DB/R
 IznH7iJ88saRSQzbqefnIZ+WBF1rS564RZK/Iyf/FLVY5Xmpslu8tV1jpoZ5YMz4JC+2
 5F9OyB/kPx31QBHFBdrKHS99RsI9iw/hYMjUpAQ0BfHmeK/ipbeYIZQyL4/NjxS8+wcl gg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2sxqycst26-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Thu, 06 Jun 2019 09:42:33 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 68DC334;
 Thu,  6 Jun 2019 07:42:32 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3A8F714EB;
 Thu,  6 Jun 2019 07:42:32 +0000 (GMT)
Received: from SFHDAG3NODE1.st.com (10.75.127.7) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 6 Jun
 2019 09:42:31 +0200
Received: from SFHDAG3NODE1.st.com ([fe80::1166:1abb:aad4:5f86]) by
 SFHDAG3NODE1.st.com ([fe80::1166:1abb:aad4:5f86%20]) with mapi id
 15.00.1347.000; Thu, 6 Jun 2019 09:42:31 +0200
From: Erwan LE RAY <erwan.leray@st.com>
To: Borut Seljak <borut.seljak@t-2.net>
Thread-Topic: Fwd: [PATCH] serial: stm32: fix a recursive locking in
 stm32_config_rs485
Thread-Index: AQHVGr0egfGBr+I5bUuvhxEmcTN9eaaLX30AgAAD5wCAArxlgA==
Date: Thu, 6 Jun 2019 07:42:31 +0000
Message-ID: <78dfdaaf-d855-8913-b8c5-e4ab6774868a@st.com>
References: <20190604095452.6360-1-borut.seljak@t-2.net>
 <f2a264ac-e334-63b7-18c9-e45cde7bdf95@st.com>
 <41dddd5f-5c1c-3346-890a-8018f26ebd49@st.com>
 <33271a7e-644b-70e3-f84c-d019b394ce77@st.com>
In-Reply-To: <33271a7e-644b-70e3-f84c-d019b394ce77@st.com>
Accept-Language: en-US, fr-FR
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
Content-ID: <C476C30ECEF8184B9CEC2887624968A7@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-06_06:, , signatures=0
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
 Jiri Slaby <jslaby@suse.com>, "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] Fwd: [PATCH] serial: stm32: fix a recursive
 locking in stm32_config_rs485
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

Hi Borut,

Please remove unused "flags" variable declaration.

Erwan.


On 6/4/19 3:55 PM, Erwan LE RAY wrote:
>
>> Hi Borut,
>>
>> Please add the following line in the commit message (before your =

>> sign-off) in a V2 of your patch:
>>
>> Fixes: 1bcda09d291081 ("serial: stm32: add support for RS485 hardware =

>> control mode")
>>
>> I'm OK with the patch itself.
>>
>> Erwan.
>>
>>
>> Subject: [PATCH] serial: stm32: fix a recursive locking in
>>> stm32_config_rs485
>>> Date: Tue,=A0 4 Jun 2019 11:54:51 +0200
>>> From: Borut Seljak <borut.seljak@t-2.net>
>>> CC: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
>>> <alexandre.torgue@st.com>, Greg Kroah-Hartman
>>> <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
>>> borut.seljak@t-2.net, linux-serial@vger.kernel.org, Jiri Slaby
>>> <jslaby@suse.com>, linux-stm32@st-md-mailman.stormreply.com,
>>> linux-arm-kernel@lists.infradead.org
>>>
>>> Remove spin_lock_irqsave in stm32_config_rs485, it cause recursive =

>>> locking.
>>> Already locked in uart_set_rs485_config.
>>>
>>> Signed-off-by: Borut Seljak <borut.seljak@t-2.net>
>>> ---
>>> =A0 drivers/tty/serial/stm32-usart.c | 2 --
>>> =A0 1 file changed, 2 deletions(-)
>>>
>>> diff --git a/drivers/tty/serial/stm32-usart.c
>>> b/drivers/tty/serial/stm32-usart.c
>>> index e8d7a7bb4339..da373a465f51 100644
>>> --- a/drivers/tty/serial/stm32-usart.c
>>> +++ b/drivers/tty/serial/stm32-usart.c
>>> @@ -107,7 +107,6 @@ static int stm32_config_rs485(struct uart_port =

>>> *port,
>>> =A0=A0=A0=A0=A0 bool over8;
>>> =A0=A0=A0=A0=A0 unsigned long flags;
- unsigned long flags;
>>> =A0 - spin_lock_irqsave(&port->lock, flags);
>>> =A0=A0=A0=A0=A0 stm32_clr_bits(port, ofs->cr1, BIT(cfg->uart_enable_bit=
));
>>> =A0=A0=A0=A0=A0=A0 port->rs485 =3D *rs485conf;
>>> @@ -147,7 +146,6 @@ static int stm32_config_rs485(struct uart_port =

>>> *port,
>>> =A0=A0=A0=A0=A0 }
>>> =A0=A0=A0=A0=A0=A0 stm32_set_bits(port, ofs->cr1, BIT(cfg->uart_enable_=
bit));
>>> -=A0=A0=A0 spin_unlock_irqrestore(&port->lock, flags);
>>> =A0=A0=A0=A0=A0=A0 return 0;
>>> =A0 }
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
