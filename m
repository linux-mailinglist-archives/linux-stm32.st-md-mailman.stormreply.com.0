Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE262D8F4
	for <lists+linux-stm32@lfdr.de>; Wed, 29 May 2019 11:21:00 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E7D8EC35E09
	for <lists+linux-stm32@lfdr.de>; Wed, 29 May 2019 09:20:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BF1CCC35E08
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 May 2019 09:20:57 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4T9HJmV011994; Wed, 29 May 2019 11:20:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=OqzTfdhqia5TW2akazmwmN49UNTjwbfJGUFpC1QJyQ8=;
 b=tD/8cwXryQRpID8VESzInftZqx7l0uVgJd4LEML5K4zgD/y6L5XdDdIjvve50czGN4rF
 KZnV8l4i1lGf4gjH4Uz1cAxqal0oW4PGraXIy++Ux0wjL5NuD6/ox37iWSR/a7IdtAIr
 lXW+GYKSs3vSeCUurICVquKOMb+Dl7uvsMLMvwOjYtFY5lRkINATZZ8aaFovaryuBNSN
 Nb0jWQBmuccXkGI0FF+utl82sPZUs/n64/dqohbx7I81f/e/IPNb3Nj5ObNW0uKEzmUN
 81d/rU6Wbb/03MBMOQJ+12abw3m0FmS+HI8zYEhEWv/5icVLDyKFQcIe6pgf0icUka2K 5A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2spvkh6hn7-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Wed, 29 May 2019 11:20:48 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A1C7C34;
 Wed, 29 May 2019 09:20:43 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7AE9D2653;
 Wed, 29 May 2019 09:20:43 +0000 (GMT)
Received: from [10.48.0.237] (10.75.127.46) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 29 May
 2019 11:20:42 +0200
To: Ulf Hansson <ulf.hansson@linaro.org>
References: <1556264798-18540-1-git-send-email-ludovic.Barre@st.com>
 <1556264798-18540-4-git-send-email-ludovic.Barre@st.com>
 <CAPDyKFrxp3Y3AudNvkkSRaph2Fe-A-F6Cs0jfy9RUja76GYeiA@mail.gmail.com>
From: Ludovic BARRE <ludovic.barre@st.com>
Message-ID: <a6a74431-50a6-6298-b77d-9d27a77fd6cc@st.com>
Date: Wed, 29 May 2019 11:20:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAPDyKFrxp3Y3AudNvkkSRaph2Fe-A-F6Cs0jfy9RUja76GYeiA@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG4NODE2.st.com (10.75.127.11) To SFHDAG6NODE1.st.com
 (10.75.127.16)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-29_05:, , signatures=0
Cc: DTML <devicetree@vger.kernel.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH V2 3/5] mmc: mmci: fix clear of busy
	detect status
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

hi Ulf

On 5/27/19 8:17 PM, Ulf Hansson wrote:
> On Fri, 26 Apr 2019 at 09:46, Ludovic Barre <ludovic.Barre@st.com> wrote:
>>
>> From: Ludovic Barre <ludovic.barre@st.com>
>>
>> The "busy_detect_flag" is used to read/clear busy value of
>> mmci status. The "busy_detect_mask" is used to manage busy irq of
>> mmci mask.
>> For sdmmc variant, the 2 properties have not the same offset.
>> To clear the busyd0 status bit, we must add busy detect flag,
>> the mmci mask is not enough.
>>
>> Signed-off-by: Ludovic Barre <ludovic.barre@st.com>
> 
> Ludovic, again, apologies for the delay.
> 
>> ---
>>   drivers/mmc/host/mmci.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
>> index a040f54..3cd52e8 100644
>> --- a/drivers/mmc/host/mmci.c
>> +++ b/drivers/mmc/host/mmci.c
>> @@ -1517,7 +1517,8 @@ static irqreturn_t mmci_irq(int irq, void *dev_id)
>>                   * to make sure that both start and end interrupts are always
>>                   * cleared one after the other.
>>                   */
>> -               status &= readl(host->base + MMCIMASK0);
>> +               status &= readl(host->base + MMCIMASK0) |
>> +                       host->variant->busy_detect_flag;
> 
> I think this is not entirely correct, because it would mean we check
> for busy even if we haven't unmasked the busy IRQ via the
> variant->busy_detect_mask.

if the variant is busy_detect false:
  => no problem because the busy_detect_flag or busy_detect_mask is not
     defined.

if variant is busy_detect true:
the busy handle is split in 3 steps (see mmci_cmd_irq):
step 1: detection of busy line => unmasked the busy irq end
step 2: in busy wait => ignore cmd irq while current busy flag is
enabled.
step 3: end of busy => clear and mask busy irq

To detect the first step (see mmci_cmd_irq: which unmasks the busy irq)
we need to know the current busy state. Actually, the status register is
re-read in mmci_cmd_irq, why not used the status read in mmci_irq and in
parameter ?

Regards,
Ludo

> 
> I suggest to store a new bool in the host (call it
> "busy_detect_unmasked" or whatever makes sense to you), to track
> whether we have unmasked the busy IRQ or not. Then take this flag into
> account, before ORing the value of host->variant->busy_detect_flag,
> according to above.
> 
>>                  if (host->variant->busy_detect)
>>                          writel(status & ~host->variant->busy_detect_mask,
>>                                 host->base + MMCICLEAR);
>> --
>> 2.7.4
>>
> 
> Kind regards
> Uffe
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
