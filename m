Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E0357330904
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Mar 2021 08:55:57 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 82669C57B7B;
	Mon,  8 Mar 2021 07:55:57 +0000 (UTC)
Received: from ms9.eaxlabs.cz (ms9.eaxlabs.cz [147.135.177.209])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BBAB2C3FADC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  1 Mar 2021 22:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=eaxlabs.cz;
 s=mail; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=kFsI78mY/ZRsnqmIBcnHXfh7nTVcK0J3fpNvfJ5QymU=; 
 b=FB6mU5YXCt5R4qgHXWiXGdw2IAjfsEkKwNHCKp8N+JrrsZKpQT34V8BhtNqd/cbpVZ/TzXpYvmACGINyRgpUokHqf6loTYJsHN4FMO0RZzcxxyNAB1x2EGaeoOQHlFQmoUUXoVBxqHHPZW6Sh6gL/oPmGUEqSto3uCN9LaZWOng=;
Received: from [82.99.129.6] (helo=[10.76.6.112])
 by ms9.eaxlabs.cz with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.84_2) (envelope-from <devik@eaxlabs.cz>)
 id 1lGrDH-0006uv-Ol; Mon, 01 Mar 2021 23:40:29 +0100
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>, linux-kernel@vger.kernel.org
References: <CAL_JsqK8+M=Vg0PiDXP2f1LrEp4hSVea6piAASMGu1H=pxme6Q@mail.gmail.com>
 <20210227164157.30971-1-devik@eaxlabs.cz>
 <439a0d7a-cc0e-764b-7ed8-668b5a85f4a7@foss.st.com>
From: Martin DEVERA <devik@eaxlabs.cz>
Message-ID: <fbdce86c-a17f-7626-51e4-9e48ea25001e@eaxlabs.cz>
Date: Mon, 1 Mar 2021 23:40:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <439a0d7a-cc0e-764b-7ed8-668b5a85f4a7@foss.st.com>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 08 Mar 2021 07:55:55 +0000
Cc: devicetree@vger.kernel.org, Alexandre Torgue <alexandre.torgue@st.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>, Le Ray <erwan.leray@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-serial@vger.kernel.org,
 Jiri Slaby <jirislaby@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/2] tty/serial: Add rx-tx-swap OF
 option to stm32-usart
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

On 3/1/21 11:28 AM, Fabrice Gasnier wrote:
> On 2/27/21 5:41 PM, Martin Devera wrote:
>> STM32 F7/H7 usarts supports RX & TX pin swapping.
>> Add option to turn it on.
>> Tested on STM32MP157.
>>
>> Signed-off-by: Martin Devera <devik@eaxlabs.cz>
>> ---
>>   drivers/tty/serial/stm32-usart.c | 3 ++-
>>   drivers/tty/serial/stm32-usart.h | 1 +
>>   2 files changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/tty/serial/stm32-usart.c b/drivers/tty/serial/stm32-usart.c
>> index b3675cf25a69..3650c8798061 100644
>> --- a/drivers/tty/serial/stm32-usart.c
>> +++ b/drivers/tty/serial/stm32-usart.c
>> @@ -758,7 +758,7 @@ static void stm32_usart_set_termios(struct uart_port *port,
>>   	cr1 = USART_CR1_TE | USART_CR1_RE;
>>   	if (stm32_port->fifoen)
>>   		cr1 |= USART_CR1_FIFOEN;
>> -	cr2 = 0;
>> +	cr2 = stm32_port->swap ? USART_CR2_SWAP : 0;
> Hi Martin,
>
> Same could be done in the startup routine, that enables the port for
> reception (as described in Documentation/driver-api/serial/driver.rst)
Hello Fabrice,

I already incorporated all your comments but I'm struggling with the one 
above.
The code must be in stm32_usart_set_termios too, because CR2 is modified.
What is the reason to have it in startup() ?
Is it because USART can be started without calling set_termios at all ? Like
to reuse bootloader's last settings ?

Thanks, Martin

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
