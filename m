Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD4464DF04
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Dec 2022 17:53:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 14390C65E46;
	Thu, 15 Dec 2022 16:53:12 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9AFBEC64107
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Dec 2022 16:53:10 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BFG69VR001434; Thu, 15 Dec 2022 17:52:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=foOTUizzoOwUhkqSNmKNIsjRp5o7VWjfsP3BMaaG1Ps=;
 b=p0giefhsz1cwfIgBu8ehm5f4vLroq6ZE32VbFy889Cv6yVHCKLqevG3CHENwTZXwQr/i
 OLzIq640gmjejFUtEfovN5HMgK1AhAI/Pjm5wDdek6SNHtoSHeWb8XE9heH/GbraKcxX
 /nJdEheuhcPo5BaZwb2trQxY3pOSOVBLNWONnAkCgYhQKkFHvFuWTzEToAfBkucLEJKa
 XGxYeC+WlohpV5Zm0XY3ZnwJibVmFonzbZEWl41bkIQYmO15edpCECKrFXOOyhJvqQKg
 5R7Uc3hjysGkpPUm3ZkkmQm4hlx5mfUS8YC4Ha2lGBCAVoQkAb84S8w87N0YzOk6LLXy aQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3mf6uww1kb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Dec 2022 17:52:40 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AC23F100039;
 Thu, 15 Dec 2022 17:52:34 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 724E223152E;
 Thu, 15 Dec 2022 17:52:34 +0100 (CET)
Received: from [10.201.20.168] (10.201.20.168) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Thu, 15 Dec
 2022 17:52:33 +0100
Message-ID: <f2373a2b-8229-8af3-116c-7f3b8ccf8062@foss.st.com>
Date: Thu, 15 Dec 2022 17:52:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Marek Vasut <marex@denx.de>
References: <20221207195929.160267-1-marex@denx.de>
 <34ec91a2-2089-65ba-d5bb-fed03cda63b7@foss.st.com>
 <a984e2aa-1fbf-4b6b-9326-d926221740d8@denx.de>
From: Valentin CARON <valentin.caron@foss.st.com>
In-Reply-To: <a984e2aa-1fbf-4b6b-9326-d926221740d8@denx.de>
X-Originating-IP: [10.201.20.168]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-15_10,2022-12-15_02,2022-06-22_01
Cc: linux-serial@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Jiri Slaby <jirislaby@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] serial: stm32: Move hard IRQ handling to
 threaded interrupt context
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

Hi Marek,

I test your patch with a loop-back test between usart3 and uart7 on 
STM32MP157C-DK2. It
shows a speed transfer diminution (about -1,5%), some locks during 
transfer, RT throttling etc...
(I use lszrz tool).

But finally, I think your patch is the best solution that we have.
Other solutions always throws an RT exception on a spin_lock.

Thanks,
Valentin

On 12/8/22 14:19, Marek Vasut wrote:
> On 12/8/22 11:18, Valentin CARON wrote:
>> Hi Marek,
>
> Hi,
>
>> I've got a patch in the same spirit in downstream.
>> The test campaign reveals performance issues with this patch.
>>
>> In fact, hard IRQ have been introduced in stm32-usart driver to solve 
>> performance issues due to short FIFO size (16 bytes).
>>
>> We are currently testing another patch, similar as your RFC 
>> proposition, for RT context.
>> But results are not ready yet. We can wait them before merging this 
>> big change into driver ?
>
> Can you post your patch as an RFC so others can test as well ?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
