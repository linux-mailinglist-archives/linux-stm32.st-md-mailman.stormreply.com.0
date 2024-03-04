Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A86786FC0C
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Mar 2024 09:42:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 37070C6B45E;
	Mon,  4 Mar 2024 08:42:08 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2FE25C6A61A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Mar 2024 08:42:07 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 4247gAFC026675; Mon, 4 Mar 2024 09:41:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=bJnRc0D0H74QihxsMJduhmW8GQyOwkO9RFjU12y0p4M=; b=m4
 1JRwtTlXG3PcefLldIGEl77X0tUzuX+IDQXBAmHPBC+tOYP8w+XPQ9oqzVVDSJ8p
 dG9F5BbzPgdp6eHuOSyBrgE3B9oIFZA8U5rdki+EXke2aT4mQyO0sXWsUVt5bXFA
 3+dO8XJm8hfWyt1RSiRnQHT1angHmSEvKMivYax6ZkCoeHnWxSFAFjjtvH/a3WM4
 /RFWp74L8NlLfmaFny43+2JvSpVzbB2HVogeui34sDQhYfT95ZMLKZ1MC4KqyuYO
 EB++E08T+M3PlmY8fjXumYfQd0qtjfj/Du80U34MqRTLapNdflV0p6DblR6KSDWa
 smqORLvSC+TfwCrRRMnA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3wktdkxss1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Mar 2024 09:41:56 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 7E2584002D;
 Mon,  4 Mar 2024 09:41:51 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C3E60255E46;
 Mon,  4 Mar 2024 09:41:16 +0100 (CET)
Received: from [10.252.5.201] (10.252.5.201) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 4 Mar
 2024 09:41:15 +0100
Message-ID: <562cdbfe-9353-4f5d-a804-34e158a190a7@foss.st.com>
Date: Mon, 4 Mar 2024 09:41:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: William Breathitt Gray <william.gray@linaro.org>
References: <20240301102505.591918-1-fabrice.gasnier@foss.st.com>
 <ZeH6e02zzfAjw-sd@ishi>
Content-Language: en-US
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
In-Reply-To: <ZeH6e02zzfAjw-sd@ishi>
X-Originating-IP: [10.252.5.201]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-04_04,2024-03-01_03,2023-05-22_02
Cc: vigneshr@ti.com, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 jpanis@baylibre.com, syednwaris@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v5] counter: Introduce the
	COUNTER_COMP_FREQUENCY() macro
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

On 3/1/24 16:55, William Breathitt Gray wrote:
> On Fri, Mar 01, 2024 at 11:25:05AM +0100, Fabrice Gasnier wrote:
>> Now that there are two users for the "frequency" extension, introduce a
>> new COUNTER_COMP_FREQUENCY() macro.
>> This extension is intended to be a read-only signal attribute.
>>
>> Suggested-by: William Breathitt Gray <william.gray@linaro.org>
>> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
>> ---
>> Changes in v5
>> - "frequency" extension is read-only, so there's no need to provide
>>   a write parameter.
>> - patch sent separately from "counter: Add stm32 timer events support" [1]
>> [1] https://lore.kernel.org/lkml/20240227173803.53906-2-fabrice.gasnier@foss.st.com/
>> ---
>>  include/linux/counter.h | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/include/linux/counter.h b/include/linux/counter.h
>> index 702e9108bbb4..0ac36f815b7d 100644
>> --- a/include/linux/counter.h
>> +++ b/include/linux/counter.h
>> @@ -602,6 +602,13 @@ struct counter_array {
>>  #define COUNTER_COMP_FLOOR(_read, _write) \
>>  	COUNTER_COMP_COUNT_U64("floor", _read, _write)
>>  
>> +#define COUNTER_COMP_FREQUENCY(_read) \
>> +{ \
>> +	.type = COUNTER_COMP_U64, \
>> +	.name = "frequency", \
>> +	.signal_u64_read = (_read), \
>> +}
>> +
>>  #define COUNTER_COMP_POLARITY(_read, _write, _available) \
>>  { \
>>  	.type = COUNTER_COMP_SIGNAL_POLARITY, \
>> -- 
>> 2.25.1
> 
> Hi Fabrice,
> 
> Setting the structure members directly works, but why not use
> COUNTER_COMP_SIGNAL_U64("frequency", _read, NULL) instead to keep the
> code more succinct?

Hi William,

I originally wrote it this way, but I had a doubt since some macros use
the structure members directly.

I can update to use COUNTER_COMP_SIGNAL_U64() instead, that will spare
few lines.

Please let me know what you prefer (I guess your proposal above ?).

Best Regards,
Thanks,
Fabrice

> 
> William Breathitt Gray
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
