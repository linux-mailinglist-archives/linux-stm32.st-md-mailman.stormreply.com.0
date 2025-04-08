Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD4FA80F3D
	for <lists+linux-stm32@lfdr.de>; Tue,  8 Apr 2025 17:06:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 49BC1C78F75;
	Tue,  8 Apr 2025 15:06:59 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7DA88C7803B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Apr 2025 15:06:58 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538AP600020633;
 Tue, 8 Apr 2025 17:06:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 ez4gDIlBBH+Xt/jxlym+6D8PrFcPq4pA7m+d0k6jmiY=; b=BjuefYLAsLMzeKdd
 Y5l/I7U8eNDKmsvtftIAVwH/NUGcuqzYXugQdSUYX14C+PcgJn2PLnVz+9k0G+Q0
 JqWnYAs+BcOWl0JCm5s89sb9/jg/Br9YFaSQ3+FGUCd9zoIoXF1b+NNAYuOGIhL2
 YpP/PumnrfpNcAwqrW9wKo7WxzZycYLgTpoURmMicwZmD6AYnEhkrSNukXytOhLo
 6KsdMJMIkBvRScSNBbA/Z0x0uUJZOd4AoBjlZFAdrEAKfWiBuRPunMl63PidS68v
 hVcl684xOiaXg6L07W1w0zZwpl9y+EUAHWXDs91aDdrBEWAKyJuXHM0NrxDdFHME
 ZC2psA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45uffmk9rg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Apr 2025 17:06:45 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A6BD740046;
 Tue,  8 Apr 2025 17:05:35 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 862DD9353D9;
 Tue,  8 Apr 2025 17:04:46 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Apr
 2025 17:04:45 +0200
Message-ID: <b1398416-3391-474b-9944-1d0995639a0e@foss.st.com>
Date: Tue, 8 Apr 2025 17:04:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Philipp Zabel <p.zabel@pengutronix.de>, Krzysztof Kozlowski
 <krzk@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>
References: <20250407-upstream_ospi_v6-v8-0-7b7716c1c1f6@foss.st.com>
 <20250407-upstream_ospi_v6-v8-3-7b7716c1c1f6@foss.st.com>
 <710569e305924a0a84e9792bc779d37a24011477.camel@pengutronix.de>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <710569e305924a0a84e9792bc779d37a24011477.camel@pengutronix.de>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_06,2025-04-08_03,2024-11-22_01
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v8 3/7] memory: Add STM32 Octo Memory
	Manager driver
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



On 4/8/25 10:59, Philipp Zabel wrote:
> On Mo, 2025-04-07 at 15:27 +0200, Patrice Chotard wrote:
>> Octo Memory Manager driver (OMM) manages:
>>   - the muxing between 2 OSPI busses and 2 output ports.
>>     There are 4 possible muxing configurations:
>>       - direct mode (no multiplexing): OSPI1 output is on port 1 and OSPI2
>>         output is on port 2
>>       - OSPI1 and OSPI2 are multiplexed over the same output port 1
>>       - swapped mode (no multiplexing), OSPI1 output is on port 2,
>>         OSPI2 output is on port 1
>>       - OSPI1 and OSPI2 are multiplexed over the same output port 2
>>   - the split of the memory area shared between the 2 OSPI instances.
>>   - chip select selection override.
>>   - the time between 2 transactions in multiplexed mode.
>>   - check firewall access.
>>
>> Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
>> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
>> ---
>>  drivers/memory/Kconfig     |  17 ++
>>  drivers/memory/Makefile    |   1 +
>>  drivers/memory/stm32_omm.c | 474 +++++++++++++++++++++++++++++++++++++++++++++
>>  3 files changed, 492 insertions(+)
>>
> [...]
>> diff --git a/drivers/memory/stm32_omm.c b/drivers/memory/stm32_omm.c
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..db50aeffb0aa32a9d51a205d8ba30ab2299e1c34
>> --- /dev/null
>> +++ b/drivers/memory/stm32_omm.c
>> @@ -0,0 +1,474 @@
> [...]
>> +static int stm32_omm_disable_child(struct device *dev)
>> +{
>> +	static const char * const resets_name[] = {"ospi1", "ospi2"};
>> +	struct stm32_omm *omm = dev_get_drvdata(dev);
>> +	struct reset_control *reset;
>> +	int ret;
>> +	u8 i;
>> +
>> +	ret = stm32_omm_toggle_child_clock(dev, true);
>> +	if (!ret)
>> +		return ret;
>> +
>> +	for (i = 0; i < omm->nb_child; i++) {
>> +		reset = reset_control_get_exclusive(dev, resets_name[i]);
>> +		if (IS_ERR(reset)) {
>> +			dev_err(dev, "Can't get %s reset\n", resets_name[i]);
>> +			return PTR_ERR(reset);
>> +		};
>> +
>> +		/* reset OSPI to ensure CR_EN bit is set to 0 */
>> +		reset_control_assert(reset);
>> +		udelay(2);
>> +		reset_control_deassert(reset);
>> +
>> +		reset_control_put(reset);
> 
> With this reset_control_put(), you are effectively stating that you
> don't care about the state of the reset line after this point. To
> guarantee the reset line stays deasserted, the driver should keep the
> reset control around.
> 
> Are you requesting and dropping the reset controls here so the child
> drivers can request them at some point? If so, there is an
> acquire/relase mechanism for this:
> 
> https://docs.kernel.org/driver-api/reset.html#c.reset_control_acquire

Hi Philipp,

Yes, that's my point, children will request these resets during their
initialization.
I will have a look at reset acquire/release.

Thanks
Patrice

> 
> Either way, reset_control_get/put() belong in probe/remove.
> 
> regards
> Philipp
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
