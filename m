Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 32CBC30879D
	for <lists+linux-stm32@lfdr.de>; Fri, 29 Jan 2021 10:59:30 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D6C87C57183;
	Fri, 29 Jan 2021 09:59:29 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 50ACFC57181
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 29 Jan 2021 09:59:28 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10T9k0NQ006380; Fri, 29 Jan 2021 10:59:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=2Gm0B6qF+mtk88H++dPYaOYNLk6Hxko8NVMszRBn2tg=;
 b=dOavq2Lz/zPQFfiA44rGdCExbpqc4nYncoiVLgRr/l31XezqPN9H2NVlFF39oHvFlUWa
 jcJ84FnhcQkoozv0oddL6HdM/HoQ368cXlIIHL+g3O2YUkML4x5QlC1o8vktnrjFDCIq
 C2L0Y7WyQQcIQiGhjHGNt2dqBDcfMqfNIaeTBgbtvtgX9wymtJuHDIqzCrx2HXjq+7Y8
 IUj9RVOKExYQnE9z+S+e0kFEJ+jJlAnepeyD5Ju+8Uns9bOZ3ypl95VkgF2sCBpZQlhC
 482z61OjS/BqhXT/jicx1nkBHRt3gi184VyugOyvKILV+SaLp76nvNsAjSsDH1byCzEE nw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 368c16c5c7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Jan 2021 10:59:18 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7DD6A100191;
 Fri, 29 Jan 2021 10:59:17 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 654DF22F9C6;
 Fri, 29 Jan 2021 10:59:17 +0100 (CET)
Received: from [10.211.2.220] (10.75.127.46) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 29 Jan
 2021 10:59:16 +0100
To: William Breathitt Gray <vilhelm.gray@gmail.com>
References: <1611327803-882-1-git-send-email-fabrice.gasnier@foss.st.com>
 <YBPIzBhxkcsqKmMM@shinobu>
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <b1f42c99-40eb-420f-f965-f8c254a5b42f@foss.st.com>
Date: Fri, 29 Jan 2021 10:59:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YBPIzBhxkcsqKmMM@shinobu>
Content-Language: en-US
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-01-29_04:2021-01-28,
 2021-01-29 signatures=0
Cc: alexandre.torgue@st.com, linux-doc@vger.kernel.org,
 mchehab+huawei@kernel.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, jic23@kernel.org, lukas.bulwahn@gmail.com,
 fabrice.gasnier@st.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] counter: stm32-lptimer-cnt: remove iio
	counter abi
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

On 1/29/21 9:35 AM, William Breathitt Gray wrote:
> On Fri, Jan 22, 2021 at 04:03:23PM +0100, Fabrice Gasnier wrote:
>> Currently, the STM32 LP Timer counter driver registers into both IIO and
>> counter subsystems, which is redundant.
>>
>> Remove the IIO counter ABI and IIO registration from the STM32 LP Timer
>> counter driver since it's been superseded by the Counter subsystem
>> as discussed in [1].
>>
>> Keep only the counter subsystem related part.
>> Move a part of the ABI documentation into a driver comment.
>>
>> This also removes a duplicate ABI warning
>> $ scripts/get_abi.pl validate
>> ...
>> /sys/bus/iio/devices/iio:deviceX/in_count0_preset is defined 2 times:
>>   ./Documentation/ABI/testing/sysfs-bus-iio-timer-stm32:100
>>   ./Documentation/ABI/testing/sysfs-bus-iio-lptimer-stm32:0
>>
>> [1] https://lkml.org/lkml/2021/1/19/347
>>
>> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
>> ---
>>  .../ABI/testing/sysfs-bus-iio-lptimer-stm32        |  62 -----
>>  drivers/counter/stm32-lptimer-cnt.c                | 297 +++------------------
>>  2 files changed, 36 insertions(+), 323 deletions(-)
>>  delete mode 100644 Documentation/ABI/testing/sysfs-bus-iio-lptimer-stm32
> 
> Hi Fabrice,
> 
> I noticed this is missing a Kconfig change to remove the IIO dependency
> from the STM32_LPTIMER_CNT config option. I assume that dependency is no
> longer necessary with the IIO code is removed.

Hi William,

Thanks for spotting this.
I'll send a v2 with that fixed.
I assume I can add your ack'ed by for v2 (as commented earlier) ?

Best Regards,
Fabrice

> 
> William Breathitt Gray
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
