Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9486E2F2C1B
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Jan 2021 11:02:58 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 47775C424C0;
	Tue, 12 Jan 2021 10:02:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C307AC32EA8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Jan 2021 10:02:57 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10C9wVex011901; Tue, 12 Jan 2021 11:02:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=E546pFVq1ta2uBxokyZK/xre7E5ZXuq5jUCSw1MfC58=;
 b=Y6hRWkg+NBgd9p/YBnc5aYcGBj8SOazNom2XLz6UjT5dZsCRpML6xGkCKcR7uxyikqCt
 0gEczWtKdLTpnUTV7Rc/gY+YnCQ1IY0bCGoedHt+CeoQlr6kh4x5Uj057yPjhO+lOcyz
 txdAEejI3mMUo6fdP4eLMxYMimOcksWU+O5PIHQv2TxzXtlLCHqjQ6+9UqCa9eE9K5ko
 V7cxz7MkPp4dUcOVgYrLZgtfudRn69OVx7bElHz4VCuUm56zYjXSHg2Q7mNW7FmEiOHK
 N38FqA5hTo4NK45u7FSz2a/mU6S8eoJjmk7+oywUeeTSl5+qCwXxmb+Pu8LjwTpQx7W4 Ow== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 35y5kyfpxq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Jan 2021 11:02:47 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 607BF100034;
 Tue, 12 Jan 2021 11:02:45 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4E0F323770C;
 Tue, 12 Jan 2021 11:02:45 +0100 (CET)
Received: from lmecxl0566.lme.st.com (10.75.127.44) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 12 Jan
 2021 11:02:44 +0100
To: Jiri Slaby <jirislaby@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>
References: <20210106162203.28854-1-erwan.leray@foss.st.com>
 <20210106162203.28854-3-erwan.leray@foss.st.com>
 <72c81157-4bd1-6a3e-2415-92a2fb29ab6d@kernel.org>
From: Erwan LE RAY <erwan.leray@foss.st.com>
Message-ID: <667eb6bd-b612-fd78-0b09-d61eff72d139@foss.st.com>
Date: Tue, 12 Jan 2021 11:02:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <72c81157-4bd1-6a3e-2415-92a2fb29ab6d@kernel.org>
Content-Language: en-US
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG3NODE3.st.com (10.75.127.9) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-12_06:2021-01-11,
 2021-01-12 signatures=0
Cc: devicetree@vger.kernel.org, Valentin Caron <valentin.caron@foss.st.com>,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 2/8] serial: stm32: fix code cleaning
 warnings and checks
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-2"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hello Greg,

As the V2 is already in your tty-next branch, how do want me to proceed =

to deliver the fix for Jiri remark ?
Do you expect a V3 or a new fix ?

Best Regards, Erwan.


On 1/11/21 10:58 AM, Jiri Slaby wrote:
> On 06. 01. 21, 17:21, Erwan Le Ray wrote:
>> --- a/drivers/tty/serial/stm32-usart.c
>> +++ b/drivers/tty/serial/stm32-usart.c
> ...
>> @@ -973,18 +971,17 @@ static int stm32_init_port(struct stm32_port =

>> *stm32port,
>> =A0=A0=A0=A0=A0 struct resource *res;
>> =A0=A0=A0=A0=A0 int ret;
>> +=A0=A0=A0 ret =3D platform_get_irq(pdev, 0);
>> +=A0=A0=A0 if (ret <=3D 0)
>> +=A0=A0=A0=A0=A0=A0=A0 return ret ? : -ENODEV;
>> +
>> =A0=A0=A0=A0=A0 port->iotype=A0=A0=A0 =3D UPIO_MEM;
>> =A0=A0=A0=A0=A0 port->flags=A0=A0=A0 =3D UPF_BOOT_AUTOCONF;
>> =A0=A0=A0=A0=A0 port->ops=A0=A0=A0 =3D &stm32_uart_ops;
>> =A0=A0=A0=A0=A0 port->dev=A0=A0=A0 =3D &pdev->dev;
>> =A0=A0=A0=A0=A0 port->fifosize=A0=A0=A0 =3D stm32port->info->cfg.fifosiz=
e;
>> =A0=A0=A0=A0=A0 port->has_sysrq =3D IS_ENABLED(CONFIG_SERIAL_STM32_CONSO=
LE);
>> -
>> -=A0=A0=A0 ret =3D platform_get_irq(pdev, 0);
>> -=A0=A0=A0 if (ret <=3D 0)
>> -=A0=A0=A0=A0=A0=A0=A0 return ret ? : -ENODEV;
>> =A0=A0=A0=A0=A0 port->irq =3D ret;
> =

> I would move this set from ret above too. Or introduce a new variable, =

> e.g. "irq".
> =

> thanks,
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
