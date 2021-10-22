Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF75437460
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Oct 2021 11:10:37 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A0B70C5C857;
	Fri, 22 Oct 2021 09:10:36 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4389BC597AF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Oct 2021 09:10:32 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19M8DNR0028197; 
 Fri, 22 Oct 2021 11:10:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=WLxFl8E+ifmKfctJH7ZiFoNgZodLlqE6Mj4z0a45bFc=;
 b=YOWtH8OcXMUk7bwAwi97wsotwqnZMHd5RPkulxPM/hSkIcqHitf8Kbh2TdPlGIvnLLAD
 Y48IzSHhzyfDOWbQtnaAxuTh4042eic2xI0k38pwtMMST+oit/mDpCBG4mnic0geRf8P
 zSm8OS5P7RjN/qST9AoCRbABdvUKwSw5EgIUpaf6yjubL8NjVkm+GIiDWLqr2ybo6tUF
 kEgTignIGIrJ0D+7KpFuwfIY9cEqSQRmRXbB2VhyRONZ55FMXdna8U+OLA6ZNzWySy/Q
 0O3ZJ1ztGz9Hms7OnexVnCNur4ZFKTJqPgJol16Gfo0ahNYYJFcjVxrlYaJSP6MsOp0z +Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3bujdt2s8e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Oct 2021 11:10:19 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EB62110002A;
 Fri, 22 Oct 2021 11:10:17 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D1DE7216EDA;
 Fri, 22 Oct 2021 11:10:17 +0200 (CEST)
Received: from lmecxl0572.lme.st.com (10.75.127.48) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 22 Oct
 2021 11:10:14 +0200
To: Dillon Min <dillon.minfei@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, <mchehab+huawei@kernel.org>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, <ezequiel@collabora.com>, <gnurou@gmail.com>,
 Pi-Hsun Shih <pihsun@chromium.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 <gabriel.fernandez@st.com>
References: <1634633003-18132-1-git-send-email-dillon.minfei@gmail.com>
 <1634633003-18132-10-git-send-email-dillon.minfei@gmail.com>
 <CAL9mu0Jw99aeSmwy7gnY3XQK3V1V-C1-R8ET5jvSMz7niH=g4g@mail.gmail.com>
From: "gabriel.fernandez@foss.st.com" <gabriel.fernandez@foss.st.com>
Message-ID: <b43699a6-dc53-3fcd-6cc9-6b05025cad96@foss.st.com>
Date: Fri, 22 Oct 2021 11:10:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAL9mu0Jw99aeSmwy7gnY3XQK3V1V-C1-R8ET5jvSMz7niH=g4g@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-22_02,2021-10-21_02,2020-04-07_01
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE
 TREE BINDINGS" <devicetree@vger.kernel.org>, hugues.fruchet@foss.st.com,
 linux-clk <linux-clk@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-media <linux-media@vger.kernel.org>
Subject: Re: [Linux-stm32] [PATCH v6 09/10] clk: stm32: Fix ltdc's clock
 turn off by clk_disable_unused() after system enter shell
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

You can add my Acked-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>

Best Regards
Gabriel

On 10/22/21 9:25 AM, Dillon Min wrote:
> Hi Gabriel
> 
> I guess you are the maintainer of stm32 clk subsystem from [1], Could
> you help to review this patch, just give a brief of the history:
> 
> - this patch was acked by Stephen Boyd at [2].
> - reviewed by Patrice Chotard at [3].
> 
> Without this patch , the kernel will turn off ltdc's clk after the
> system reach shell.
> 
> [1] https://lore.kernel.org/lkml/AM8PR10MB4785545DC980090C1E7D66B281009@AM8PR10MB4785.EURPRD10.PROD.OUTLOOK.COM/
> 
> [2] https://lore.kernel.org/linux-arm-kernel/159056850835.88029.9264848839121822798@swboyd.mtv.corp.google.com/
> 
> [3] https://lore.kernel.org/lkml/6915fa2a-e211-476f-8317-6825e280c322@foss.st.com/#t
> 
> Best Regards
> Dillon
> 
> On Tue, 19 Oct 2021 at 16:44, Dillon Min <dillon.minfei@gmail.com> wrote:
>>
>> stm32's clk driver register two ltdc gate clk to clk core by
>> clk_hw_register_gate() and clk_hw_register_composite()
>>
>> first: 'stm32f429_gates[]', clk name is 'ltdc', which no user to use.
>> second: 'stm32f429_aux_clk[]', clk name is 'lcd-tft', used by ltdc driver
>>
>> both of them point to the same offset of stm32's RCC register. after
>> kernel enter console, clk core turn off ltdc's clk as 'stm32f429_gates[]'
>> is no one to use. but, actually 'stm32f429_aux_clk[]' is in use.
>>
>> stm32f469/746/769 have the same issue, fix it.
>>
>> Fixes: daf2d117cbca ("clk: stm32f4: Add lcd-tft clock")
>> Acked-by: Stephen Boyd <sboyd@kernel.org>
>> Link: https://lore.kernel.org/linux-arm-kernel/1590564453-24499-7-git-send-email-dillon.minfei@gmail.com/
>> Link: https://lore.kernel.org/lkml/CAPTRvHkf0cK_4ZidM17rPo99gWDmxgqFt4CDUjqFFwkOeQeFDg@mail.gmail.com/
>> Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
>> ---
>> v6: no change.
>>
>>   drivers/clk/clk-stm32f4.c | 4 ----
>>   1 file changed, 4 deletions(-)
>>
>> diff --git a/drivers/clk/clk-stm32f4.c b/drivers/clk/clk-stm32f4.c
>> index af46176ad053..473dfe632cc5 100644
>> --- a/drivers/clk/clk-stm32f4.c
>> +++ b/drivers/clk/clk-stm32f4.c
>> @@ -129,7 +129,6 @@ static const struct stm32f4_gate_data stm32f429_gates[] __initconst = {
>>          { STM32F4_RCC_APB2ENR, 20,      "spi5",         "apb2_div" },
>>          { STM32F4_RCC_APB2ENR, 21,      "spi6",         "apb2_div" },
>>          { STM32F4_RCC_APB2ENR, 22,      "sai1",         "apb2_div" },
>> -       { STM32F4_RCC_APB2ENR, 26,      "ltdc",         "apb2_div" },
>>   };
>>
>>   static const struct stm32f4_gate_data stm32f469_gates[] __initconst = {
>> @@ -211,7 +210,6 @@ static const struct stm32f4_gate_data stm32f469_gates[] __initconst = {
>>          { STM32F4_RCC_APB2ENR, 20,      "spi5",         "apb2_div" },
>>          { STM32F4_RCC_APB2ENR, 21,      "spi6",         "apb2_div" },
>>          { STM32F4_RCC_APB2ENR, 22,      "sai1",         "apb2_div" },
>> -       { STM32F4_RCC_APB2ENR, 26,      "ltdc",         "apb2_div" },
>>   };
>>
>>   static const struct stm32f4_gate_data stm32f746_gates[] __initconst = {
>> @@ -286,7 +284,6 @@ static const struct stm32f4_gate_data stm32f746_gates[] __initconst = {
>>          { STM32F4_RCC_APB2ENR, 21,      "spi6",         "apb2_div" },
>>          { STM32F4_RCC_APB2ENR, 22,      "sai1",         "apb2_div" },
>>          { STM32F4_RCC_APB2ENR, 23,      "sai2",         "apb2_div" },
>> -       { STM32F4_RCC_APB2ENR, 26,      "ltdc",         "apb2_div" },
>>   };
>>
>>   static const struct stm32f4_gate_data stm32f769_gates[] __initconst = {
>> @@ -364,7 +361,6 @@ static const struct stm32f4_gate_data stm32f769_gates[] __initconst = {
>>          { STM32F4_RCC_APB2ENR, 21,      "spi6",         "apb2_div" },
>>          { STM32F4_RCC_APB2ENR, 22,      "sai1",         "apb2_div" },
>>          { STM32F4_RCC_APB2ENR, 23,      "sai2",         "apb2_div" },
>> -       { STM32F4_RCC_APB2ENR, 26,      "ltdc",         "apb2_div" },
>>          { STM32F4_RCC_APB2ENR, 30,      "mdio",         "apb2_div" },
>>   };
>>
>> --
>> 2.7.4
>>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
