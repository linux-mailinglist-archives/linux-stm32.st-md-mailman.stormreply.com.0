Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0AA636284
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Nov 2022 15:56:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 78776C6506F;
	Wed, 23 Nov 2022 14:56:50 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2C72BC5F1ED
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Nov 2022 14:56:49 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2ANAZ3fN023248; Wed, 23 Nov 2022 15:56:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=weaOU0SozUctuAREeQGQtG6MoT2/RGoboxfxxM4u9+w=;
 b=C5LetEJn6bSyKN0f7vxOZTU4GI23flPFdezNz4vMYbyrSmZ3k/DgzlFHZeSxGc0Vi31G
 jtZc6rnMZ1/8rP44ELmT1KCepuXSqthGJYHs/G/TJn2+PMtTMDcXRaBhZNUKij6xzzjF
 HOPXV16YfmurCzdQflzsSgkGcmT85s+GzBq7cJx41lupf9pug03dsgnweAVnCbumz2L7
 s+6jDaYiNMb5BhXJGFErtNC/pUIreou92pcqRJCalra1tbXzuUTkom4v93Bz/dUc3qg+
 TvIXSjBD87unttgu1H67QWTixAYcM6uSdYZ5nUKZ/JSe0NGDYMag2YZDPGvtT4F3/kxy vQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3m10c4fbry-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Nov 2022 15:56:39 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0ECE6100039;
 Wed, 23 Nov 2022 15:56:34 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4BAED229A70;
 Wed, 23 Nov 2022 15:56:34 +0100 (CET)
Received: from [10.48.1.102] (10.48.1.102) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Wed, 23 Nov
 2022 15:56:33 +0100
Message-ID: <c4792fd3-73e3-20ee-cd7a-a8d00eb877f9@foss.st.com>
Date: Wed, 23 Nov 2022 15:56:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: William Breathitt Gray <william.gray@linaro.org>
References: <20221123133609.465614-1-fabrice.gasnier@foss.st.com>
 <Y3x59hNekCDuOFXT@fedora> <Y3x7YIBDT3xTeqtk@fedora>
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
In-Reply-To: <Y3x7YIBDT3xTeqtk@fedora>
X-Originating-IP: [10.48.1.102]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-23_08,2022-11-23_01,2022-06-22_01
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, jic23@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] counter: stm32-lptimer-cnt: fix the check
 on arr and cmp registers update
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

On 11/22/22 08:33, William Breathitt Gray wrote:
> On Tue, Nov 22, 2022 at 02:27:50AM -0500, William Breathitt Gray wrote:
>> On Wed, Nov 23, 2022 at 02:36:09PM +0100, Fabrice Gasnier wrote:
>>> The ARR (auto reload register) and CMP (compare) registers are
>>> successively written. The status bits to check the update of these
>>> registers are polled together with regmap_read_poll_timeout().
>>> The condition to end the loop may become true, even if one of the register
>>> isn't correctly updated.
>>> So ensure both status bits are set before clearing them.
>>>
>>> Fixes: d8958824cf07 ("iio: counter: Add support for STM32 LPTimer")
>>> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
>>> ---
>>>  drivers/counter/stm32-lptimer-cnt.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/counter/stm32-lptimer-cnt.c b/drivers/counter/stm32-lptimer-cnt.c
>>> index d6b80b6dfc28..8439755559b2 100644
>>> --- a/drivers/counter/stm32-lptimer-cnt.c
>>> +++ b/drivers/counter/stm32-lptimer-cnt.c
>>> @@ -69,7 +69,7 @@ static int stm32_lptim_set_enable_state(struct stm32_lptim_cnt *priv,
>>>  
>>>  	/* ensure CMP & ARR registers are properly written */
>>>  	ret = regmap_read_poll_timeout(priv->regmap, STM32_LPTIM_ISR, val,
>>> -				       (val & STM32_LPTIM_CMPOK_ARROK),
>>> +				       (val & STM32_LPTIM_CMPOK_ARROK) == STM32_LPTIM_CMPOK_ARROK,
>>
>> This is a reasonable fix, but I don't like seeing so much happening in
>> an argument list -- it's easy to misunderstand what's going on which can
>> lead to further bugs the future. Pull out this condition to a dedicated
>> bool variable with a comment explaining why we need the equivalence
>> check (i.e. to ensure both status bits are set and not just one).
>>
>> William Breathitt Gray
> 
> Alternatively, you could pull out just (val & STM32_LPTIM_CMPOK_ARROK)
> to a separate variable and keep the equivalence condition inline if you
> think it'll be clearer that way.

Hi William,

I'm not sure to fully understand your proposal here.
Could you clarify ?

regmap_read_poll_timeout() macro requires:

 * @val: Unsigned integer variable to read the value into
 * @cond: Break condition (usually involving @val)

So do you wish I introduce a macro that abstracts the condition check ?
(val & STM32_LPTIM_CMPOK_ARROK) == STM32_LPTIM_CMPOK_ARROK


Best regards,
Fabrice

> 
> William Breathitt Gray
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
