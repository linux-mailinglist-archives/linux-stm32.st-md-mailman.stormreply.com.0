Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B033AACE254
	for <lists+linux-stm32@lfdr.de>; Wed,  4 Jun 2025 18:40:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 62440C36B18;
	Wed,  4 Jun 2025 16:40:00 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 25733C36B15
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Jun 2025 16:39:59 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 554F7slN011211;
 Wed, 4 Jun 2025 18:39:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 0BbnVS9D20ezMI4EQTDWMDtbyTWlsW9ZoYQZlC7MMog=; b=mSugKeI2mDPxVCh1
 HeGvrpJFummrgU1JBzlCbO6Inv6ABcTf1xTboAGXebQ4Va750dqiRf4t7gDXvgcp
 WylEgtUpxhieyEkf9TNCZeZoPe6Oc0DQBD9JmAUCQhNLPztUPazCLOGgUSCwHoFx
 2DEIoVPRSjgIfJOTjizbCsMG3KTVl44wQGE/Czla21dwM++eZZ3DCb6d+lJIvmbe
 7mk7Y+PWPbC9AyIhOGtgRr6A9yIhAfXzbVA3BODhITE/zm00qhRKH0LI8SVW+PEU
 arW8pHI5Jvm538mPnHgbSljWUwKisScM0COJ7pIgjE2Zslf6i4LMPz9yNWd4H4ug
 qgA7Lg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 471g8vanv1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Jun 2025 18:39:21 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B11B840049;
 Wed,  4 Jun 2025 18:37:36 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 45605B4A8DE;
 Wed,  4 Jun 2025 18:35:51 +0200 (CEST)
Received: from [10.130.77.120] (10.130.77.120) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 4 Jun
 2025 18:35:50 +0200
Message-ID: <3c7da784-e58e-4acd-a37f-93020796c0e7@foss.st.com>
Date: Wed, 4 Jun 2025 18:35:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Christian Bruel <christian.bruel@foss.st.com>
To: Manivannan Sadhasivam <mani@kernel.org>
References: <20250423090119.4003700-1-christian.bruel@foss.st.com>
 <20250423090119.4003700-3-christian.bruel@foss.st.com>
 <gzw3rcuwuu7yswljzde2zszqlzkfsilozdfv2ebrcxjpvngpkk@hvzqb5wbjalb>
 <c01d0d72-e43c-4e10-b298-c8ed4f5d1942@foss.st.com>
 <ec33uuugief45swij7eu3mbx7htfxov6qa5miucqsrdp36z7qe@svpbhliveks4>
 <7df0c1e5-f53b-4a44-920a-c2dfe8842481@foss.st.com>
 <q4rbaadr7amsrtwaeickdjmcst77onuopir5rzpvixa7ow7udk@txwsmidjs3im>
Content-Language: en-US
In-Reply-To: <q4rbaadr7amsrtwaeickdjmcst77onuopir5rzpvixa7ow7udk@txwsmidjs3im>
X-Originating-IP: [10.130.77.120]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_03,2025-06-03_02,2025-03-28_01
Cc: kw@linux.com, conor+dt@kernel.org, p.zabel@pengutronix.de, robh@kernel.org,
 linux-pci@vger.kernel.org, lpieralisi@kernel.org, thippeswamy.havalige@amd.com,
 linux-kernel@vger.kernel.org, cassel@kernel.org, devicetree@vger.kernel.org,
 quic_schintav@quicinc.com, linux-arm-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, bhelgaas@google.com,
 krzk+dt@kernel.org, shradha.t@samsung.com,
 linux-stm32@st-md-mailman.stormreply.com, johan+linaro@kernel.org
Subject: Re: [Linux-stm32] [PATCH v8 2/9] PCI: stm32: Add PCIe host support
	for STM32MP25
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



>>>>>> +
>>>>>> +	ret = devm_pm_runtime_enable(dev);
>>>>>> +	if (ret < 0) {
>>>>>> +		dev_err(dev, "Failed to enable runtime PM %d\n", ret);
>>>>>> +		return ret;
>>>>>> +	}
>>>>>> +
>>>>>> +	pm_runtime_get_noresume(dev);
>>>>>> +
>>>>>
>>>>> I know that a lot of the controller drivers do this for no obvious reason. But
>>>>> in this case, I believe you want to enable power domain or genpd before
>>>>> registering the host bridge. Is that right?
>>>>
...
Runtime PM was broken in version 6.6 without pm_runtime_get_noresume()

On the 6.15 baseline, without this call, pm_genpd_summary reports the 
correct information: active when a device is plugged, and suspended when not

So, I can proceed without pm_runtime_get_noresume(), as you mentioned in 
your review.
I suspect the other platforms might have this call for the same 
historical reasons.

thank you,

Christian
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
