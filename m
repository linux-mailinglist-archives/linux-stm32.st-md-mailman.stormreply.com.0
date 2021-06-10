Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B85273A277D
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Jun 2021 10:54:37 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 725E5C58D5B;
	Thu, 10 Jun 2021 08:54:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BF2FCC3FAD6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Jun 2021 08:54:33 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15A8praJ018129; Thu, 10 Jun 2021 10:54:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=US13dRyJ4ae/LubuDFGUyWZmKyQMuMTjP+dI9w7XKGg=;
 b=Ixm+qHel0qawwtKyV2HGqzY68LEnPZtupg9TiPFFR4YGeyQK6ZF4QvMm53ctI7qvOYfV
 Uyinf0wlYgrlPcbfd1RmnijdVXG1eapGxbQbmpk420cW3ZzU+4PmNxIo0zES8hEJuPIW
 EJWbgHKxwdlZGKDXr5mcyNzlGJJucNkVXzwk9p8iif5nh4aUgQwLpT2uU0gzhBksJT4R
 3tO1Zr+HfZ596OQSvzswlE+/QYWJxVNSpgkZ9UQPVz1/HfAMX4KIKfWxhtSvK/uVgUhi
 Y7bFXxrRkvnjowt6smzAMtSX7z3m6iTsV+Dtc3E3EeTTe1QtRwocbdAB78Z45i/gKyU2 kg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39350hb8u5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Jun 2021 10:54:23 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AEA8A10002A;
 Thu, 10 Jun 2021 10:54:21 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 91302219DA9;
 Thu, 10 Jun 2021 10:54:21 +0200 (CEST)
Received: from lmecxl0566.lme.st.com (10.75.127.44) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 10 Jun
 2021 10:54:20 +0200
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20210527091537.8997-1-erwan.leray@foss.st.com>
 <20210527091537.8997-2-erwan.leray@foss.st.com> <YK9rDVeg0W9WE+9a@kroah.com>
From: Erwan LE RAY <erwan.leray@foss.st.com>
Message-ID: <fc153364-b78a-3199-129f-5c6fb7353d49@foss.st.com>
Date: Thu, 10 Jun 2021 10:54:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YK9rDVeg0W9WE+9a@kroah.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-10_03:2021-06-10,
 2021-06-10 signatures=0
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, Jiri Slaby <jslaby@suse.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/2] serial: stm32: reset dma buffers
	during probe
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

Hi Greg,

Thanks for your question. This old patch is finally not necessary any more.
You can cancel this series, I will resend the second patch.

Best regards, Erwan.


On 5/27/21 11:49 AM, Greg Kroah-Hartman wrote:
> On Thu, May 27, 2021 at 11:15:36AM +0200, Erwan Le Ray wrote:
>> Reset Rx and Tx dma buffers during probe to avoid freeing
>> invalid buffer in no dma mode.
>>
>> Signed-off-by: Erwan Le Ray <erwan.leray@foss.st.com>
>>
>> diff --git a/drivers/tty/serial/stm32-usart.c b/drivers/tty/serial/stm32-usart.c
>> index c2ae7b392b86..2ac3b30477a7 100644
>> --- a/drivers/tty/serial/stm32-usart.c
>> +++ b/drivers/tty/serial/stm32-usart.c
>> @@ -1168,6 +1168,8 @@ static struct stm32_port *stm32_usart_of_get_port(struct platform_device *pdev)
>>   	stm32_ports[id].cr1_irq = USART_CR1_RXNEIE;
>>   	stm32_ports[id].cr3_irq = 0;
>>   	stm32_ports[id].last_res = RX_BUF_L;
>> +	stm32_ports[id].rx_dma_buf = 0;
>> +	stm32_ports[id].tx_dma_buf = 0;
>>   	return &stm32_ports[id];
>>   }
>>   
>> -- 
>> 2.17.1
>>
> 
> Is this a bugfix?  if so, what commit does this fix and does it need to
> be backported anywhere?
> 
> thanks,
> 
> greg k-h
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
