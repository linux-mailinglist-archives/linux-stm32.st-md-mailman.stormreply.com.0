Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D0B3610CA
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Apr 2021 19:09:46 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 07BA1C57B79;
	Thu, 15 Apr 2021 17:09:46 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 70188C57192
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Apr 2021 17:09:45 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13FH3SQj006343; Thu, 15 Apr 2021 19:09:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=7NI+mNA8ea+Ydi0rbf2dSjfAozC9MiaZfSB0WmqIqJg=;
 b=RHLBOLsB8ERBJ7IzOUMN/IV1/FyIH27APkH/+HET2xP6zGBfOtLUXs7dfWL4jgs91aML
 uqJlazhse1O3x8yqXvtEm1ydHmwvSa4JdGEtoscI8Zn5YkzgKQ6rlqBBbJTVnrtamQa0
 ovhtBUGvIbGFVifxeHF1Rdwfu2jGXfCcub7UZ/gya5OAqAt4tCm834P/1+uXXmLauWJ3
 22bEX+dKQDdHt3e8fTs5Cf+t5ka3Yl8G1oYduuxdzWbHuVEisfD3TRJxqYSuI18DVU0j
 GPIiFvtLDirSQGqac+JMYUG5wJuy/rginYrRIN8To+PSzUpn+moQVa9g16EY5yLUEK2z rQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 37wx401hb7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Apr 2021 19:09:20 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AE49410002A;
 Thu, 15 Apr 2021 19:09:15 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 94E512C38DE;
 Thu, 15 Apr 2021 19:09:15 +0200 (CEST)
Received: from lmecxl0566.lme.st.com (10.75.127.46) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 15 Apr
 2021 19:09:14 +0200
To: dillon min <dillon.minfei@gmail.com>, Johan Hovold <johan@kernel.org>
References: <1618219898-4600-1-git-send-email-dillon.minfei@gmail.com>
 <YHRGPpQ03XgBMkiy@hovoldconsulting.com>
 <CAL9mu0JF-9hy3Z_ytpEO+hzKh0D+f-0gYaUBEA0v28EOHpC80w@mail.gmail.com>
 <CAL9mu0Ke97FUZ03jvdH8Lz2qRnVY82B7tAEtjbhW97sPOVkAxQ@mail.gmail.com>
From: Erwan LE RAY <erwan.leray@foss.st.com>
Message-ID: <e17fddfb-f9b8-238f-da74-a4746f33134f@foss.st.com>
Date: Thu, 15 Apr 2021 19:09:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAL9mu0Ke97FUZ03jvdH8Lz2qRnVY82B7tAEtjbhW97sPOVkAxQ@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-15_09:2021-04-15,
 2021-04-15 signatures=0
Cc: Gerald Baeza <gerald.baeza@foss.st.com>, kbuild-all@lists.01.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Greg KH <gregkh@linuxfoundation.org>,
 Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 clang-built-linux@googlegroups.com, linux-serial@vger.kernel.org,
 jirislaby@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 kernel test robot <lkp@intel.com>
Subject: Re: [Linux-stm32] [PATCH v2] serial: stm32: optimize spin lock usage
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

Hi Dillon,

STM32MP151 is mono-core, but both STM32MP153 and STM32MP157 are 
dual-core (see 
https://www.st.com/content/st_com/en/products/microcontrollers-microprocessors/stm32-arm-cortex-mpus.html).
So your point is fully relevant, thanks.

ST already fixed the same issue in st-asc.c driver in the past (see 
ef49ffd8), because a systematic deadlock was detected with RT kernel.

You proposed a first implementation in your patch, and a second one in 
the discussion. It seems that your initial proposal (ie your V2 patch) 
is the most standard one (implemented in 6 drivers). The second 
implementation is implemented by only 1 company.

It looks that the solution is to avoid locking in the sysrq case and 
trylock in the oops_in_progress case (see detailed analysis in 
677fe555cbfb1).

So your initial patch looks to the right proposal, but it would be safer 
if Greg could confirm it.

BR, Erwan.


On 4/13/21 1:44 AM, dillon min wrote:
> Hi Johan, Erwan
> 
> It seems still a bit of a problem in the current version, not deadlock
> but access register at the same time.
> 
> For driver , we should consider it running under smp, let's think
> about it for this case:
> 
> static void stm32_usart_console_write(struct console *co, const char *s,
>                                        unsigned int cnt)
> {
>           .....
>           local_irq_save(flags);
>           if (port->sysrq)
>                      locked = 0;
>           .....
>           access register cr1, tdr, isr
>           .....
> 
>           local_irq_restore(flags);
> }
> 
> if port->sysrq is 1, stm32_usart_console_write() just disable local
> irq response by local_irq_save(), at the time of access register cr1,
> tdr, isr. an TXE interrupt raised, for other cores(I know stm32
> mpu/mcu do not have multi cores, just assume it has), it still has a
> chance to handle interrupt.  Then there is no lock to protect the uart
> register.
> 
> changes to below, should be more safe:
> 
> .....
> if (port->sysrq || oops_in_progress)
>        locked = spin_trylock_irqsave(&port->lock, flags);
> else
>        spin_lock_irqsave(&port->lock, flags);
> 
> ....
> 
> if (locked)
>       spin_unlock_irqrestore(&port->lock, flags);
> 
> For current stm32 soc, it shouldn't happen. just a reminder for future.
> 
> Thanks.
> 
> Dillon
> 
> On Mon, Apr 12, 2021 at 10:04 PM dillon min <dillon.minfei@gmail.com> wrote:
>>
>> Hi Johan,
>>
>> Yes, there is no deadlock. my fault.
>> I forget the local_irq_save() plus spin_lock() is spin_lock_irqsave().
>>
>> Thanks for your review. please ignore this patch.
>>
>> Best regards
>>
>> Dillon
>>
>> On Mon, Apr 12, 2021 at 9:08 PM Johan Hovold <johan@kernel.org> wrote:
>>>
>>> On Mon, Apr 12, 2021 at 05:31:38PM +0800, dillon.minfei@gmail.com wrote:
>>>> From: dillon min <dillon.minfei@gmail.com>
>>>>
>>>> To avoid potential deadlock in spin_lock usage, use spin_lock_irqsave,
>>>> spin_trylock_irqsave(), spin_unlock_irqrestore() in process context.
>>>
>>> This doesn't make much sense as console_write can be called in any
>>> context. And where's the deadlock you claim to be fixing here?
>>>
>>>> remove unused local_irq_save/restore call.
>>>>
>>>> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
>>>> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
>>>> Cc: Gerald Baeza <gerald.baeza@foss.st.com>
>>>> Cc: Erwan Le Ray <erwan.leray@foss.st.com>
>>>> Reported-by: kernel test robot <lkp@intel.com>
>>>> Signed-off-by: dillon min <dillon.minfei@gmail.com>
>>>> ---
>>>> v2: remove unused code from stm32_usart_threaded_interrupt() according from
>>>>      Greg's review.
>>>>
>>>>   drivers/tty/serial/stm32-usart.c | 8 +++-----
>>>>   1 file changed, 3 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/drivers/tty/serial/stm32-usart.c b/drivers/tty/serial/stm32-usart.c
>>>> index b3675cf25a69..b1ba5e36e36e 100644
>>>> --- a/drivers/tty/serial/stm32-usart.c
>>>> +++ b/drivers/tty/serial/stm32-usart.c
>>>> @@ -1354,13 +1354,12 @@ static void stm32_usart_console_write(struct console *co, const char *s,
>>>>        u32 old_cr1, new_cr1;
>>>>        int locked = 1;
>>>>
>>>> -     local_irq_save(flags);
>>>>        if (port->sysrq)
>>>>                locked = 0;
>>>>        else if (oops_in_progress)
>>>> -             locked = spin_trylock(&port->lock);
>>>> +             locked = spin_trylock_irqsave(&port->lock, flags);
>>>>        else
>>>> -             spin_lock(&port->lock);
>>>> +             spin_lock_irqsave(&port->lock, flags);
>>>>
>>>>        /* Save and disable interrupts, enable the transmitter */
>>>>        old_cr1 = readl_relaxed(port->membase + ofs->cr1);
>>>> @@ -1374,8 +1373,7 @@ static void stm32_usart_console_write(struct console *co, const char *s,
>>>>        writel_relaxed(old_cr1, port->membase + ofs->cr1);
>>>>
>>>>        if (locked)
>>>> -             spin_unlock(&port->lock);
>>>> -     local_irq_restore(flags);
>>>> +             spin_unlock_irqrestore(&port->lock, flags);
>>>>   }
>>>>
>>>>   static int stm32_usart_console_setup(struct console *co, char *options)
>>>
>>> Johan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
