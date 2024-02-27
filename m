Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1847B869E19
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Feb 2024 18:44:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BA7D1C6DD66;
	Tue, 27 Feb 2024 17:44:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 39AF3C6DD65
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Feb 2024 17:44:15 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41RBi2s0029650; Tue, 27 Feb 2024 18:44:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=jTtuR9h+G7uKqcRPnsVn7E2jeHnidr9oglBzqkI2a+U=; b=1y
 oGKMjeYvQjnK1+hUSuaiK0UBujfXx++pour4YAnDdLL46F0nOa+bV3MvljzLkF75
 aKl5JdLHn/hkoxcay9PA/SHFQQVoFG3WEAuNZMk1Qiig2SYkTH2j/8pdI4wT+B+C
 dzn2eKcpujpqjvteWr9aM2fSJAiaWNkW4jS8v2dnI0gsGIwx5HUDvCV/03VwJlj5
 tRAGw4nt8Xj2p/OUFtVc/mbTpsA0kRWxYp7vnZiLIjAL5YFKWf9Q2IxnrrIu87sq
 8rsUuq3pzZusu6OwHOHCOOjEKp31ggt4oVM7ACQ0e8cz5bkMpoyZJYujfQ5jjO+W
 fTyMUduEb5bZnKdsYyWg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3whf4b9dp9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Feb 2024 18:44:06 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id EED2440045;
 Tue, 27 Feb 2024 18:44:02 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A2F4D2ADF49;
 Tue, 27 Feb 2024 18:43:38 +0100 (CET)
Received: from [10.252.26.109] (10.252.26.109) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 27 Feb
 2024 18:43:35 +0100
Message-ID: <599a7357-b4d6-4581-9d5c-c1d0ade3e410@foss.st.com>
Date: Tue, 27 Feb 2024 18:43:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: William Breathitt Gray <william.gray@linaro.org>
References: <20231220145726.640627-1-fabrice.gasnier@foss.st.com>
 <20231220145726.640627-5-fabrice.gasnier@foss.st.com>
 <ZZwm7ZyrL7vFn0Xd@ubuntu-server-vm-macos>
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
In-Reply-To: <ZZwm7ZyrL7vFn0Xd@ubuntu-server-vm-macos>
X-Originating-IP: [10.252.26.109]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-27_05,2024-02-27_01,2023-05-22_02
Cc: linux-iio@vger.kernel.org, lee@kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 04/10] counter: stm32-timer-cnt:
	introduce clock signal
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

On 1/8/24 17:46, William Breathitt Gray wrote:
> On Wed, Dec 20, 2023 at 03:57:20PM +0100, Fabrice Gasnier wrote:
>> Introduce the internal clock signal, used to count when in simple rising
>> function. Also add the "frequency" extension to the clock signal.
>>
>> With this patch, signal action reports a consistent state when "increase"
>> function is used, and the counting frequency:
>>     $ echo increase > function
>>     $ grep -H "" signal*_action
>>     signal0_action:none
>>     signal1_action:none
>>     signal2_action:rising edge
>>     $ echo 1 > enable
>>     $ cat count
>>     25425
>>     $ cat count
>>     44439
>>     $ cat ../signal2/frequency
>>     208877930
>>
>> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> 
> Reviewed-by: William Breathitt Gray <william.gray@linaro.org>
> 
> The code is all right, but some minor suggestions below.
> 
>> +static struct counter_comp stm32_count_clock_ext[] = {
>> +	COUNTER_COMP_SIGNAL_U64("frequency", stm32_count_clk_get_freq, NULL),
> 
> It might be worth introducing a new COUNTER_COMP_FREQUENCY() macro now
> that we have a second driver with the 'frequency' extension
> (ti-ecap-capture also has 'frequency'). But it's up to you if you want
> to add a precursor patch to this series, or I'll introduce it separately
> myself in a independent patch.

Thanks for suggesting.

I added a precursor patch to this series.
I guess you wishes to see it used in both ti-ecap-capture and
stm32-timer-cnt. I only cared about stm32-timer-cnt in this series.

Can I let you do ti-ecap-capture change if/when you're going to apply it?

> 
>> @@ -287,7 +321,13 @@ static struct counter_signal stm32_signals[] = {
>>  	{
>>  		.id = STM32_CH2_SIG,
>>  		.name = "Channel 2"
>> -	}
>> +	},
>> +	{
>> +		.id = STM32_CLOCK_SIG,
>> +		.name = "Clock Signal",
> 
> The word "Signal" feels unnecessary to me when both the sysfs path and
> data structure will have 'signal' already. Do you think "Clock" by
> itself is clear enough?

Agreed, I updated in v4.

Best Regards,
Fabrice

> 
> William Breathitt Gray
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
