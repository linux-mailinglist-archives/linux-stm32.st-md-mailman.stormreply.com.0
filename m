Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 48FB0A7BCA1
	for <lists+linux-stm32@lfdr.de>; Fri,  4 Apr 2025 14:29:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D7E15C7A827;
	Fri,  4 Apr 2025 12:29:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8E65BC7A824
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Apr 2025 12:29:29 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 534C4rlN019849;
 Fri, 4 Apr 2025 14:29:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 PX8HMUoBjUQH8f441S3m5UlI1PDj19al//F5PjyAvQM=; b=lcrV7mf+1aKq4ncl
 X8GicNvEeYlQ/YXrV0GF6CfEDJZ4e54+tzxPwNPxc9K+vJ0Pi2X5FNqGgk3SF+JR
 g/zPMpVGG/gzuaV3WyQoxz6s43dC0qmMMxRiNXOpCmFsitUwX879JKy1nO+kVm79
 7OOoKw+iNatnKMlQXzinmcLXU4B+h4vNSb90nJ0UBGv0JmymYdMn4jxXOhV4XKOZ
 8Jsakge7t/zKLrhJuD7oukXtTO9POx8Nfaw7WT90zE5lOrfADgneki4xDBespZOg
 GsEMTjFoLpVk2wB407H2FDitZiapJGyJ+pyiVrfijsdP5PoYDyA81o2f0KTszkmD
 k4BS2Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45t2cqk4sw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Apr 2025 14:29:18 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 2C8CD4002D;
 Fri,  4 Apr 2025 14:28:20 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 976A79234AD;
 Fri,  4 Apr 2025 14:27:33 +0200 (CEST)
Received: from [10.130.77.120] (10.130.77.120) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 4 Apr
 2025 14:27:33 +0200
Message-ID: <6e2b1717-6189-4115-ab55-01227a5a1d5a@foss.st.com>
Date: Fri, 4 Apr 2025 14:25:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Gleixner <tglx@linutronix.de>, <maz@kernel.org>, <robh@kernel.org>, 
 <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>
References: <20250403122805.1574086-1-christian.bruel@foss.st.com>
 <20250403122805.1574086-3-christian.bruel@foss.st.com> <87mscxuu6f.ffs@tglx>
From: Christian Bruel <christian.bruel@foss.st.com>
Content-Language: en-US
In-Reply-To: <87mscxuu6f.ffs@tglx>
X-Originating-IP: [10.130.77.120]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-04_05,2025-04-03_03,2024-11-22_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 2/3] irqchip/gic: Use 0x10000 offset to
 access GICC_DIR on STM32MP2
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

Hello Thomas,

thanks for your comments.
After Marc's suggestion we found a better solution. So dropping this 
patch set.

Christian

On 4/3/25 17:43, Thomas Gleixner wrote:
> On Thu, Apr 03 2025 at 14:28, Christian Bruel wrote:
> 
>> When GIC_4KNOT64K bit in the GIC configuration register is
>> 0 (64KB), address block is modified in such a way than only the
> 
> s/than/that/
> 
>> first 4KB of the GIC cpu interface are accessible with default
>> offsets.
>> With this bit mapping GICC_DIR register is accessible at
> 
> What's 'this bit mapping' ? This sentence does not parse.
> 
>> offset 0x10000 instead of 0x1000, thus remap accordingly
> 
> ...
> 
>> +/*
>> + * 8kB GICC range is not accessible with the default 4kB translation
>> + * granule. 0x1000 offset is accessible at 64kB translation.
>> + */
> 
> I have a hard time to map this comment to the change log, which suggests
> to me that this is the other way round.
> 
>> +static bool gic_8kbaccess(void *data)
>> +{
>> +	struct gic_chip_data *gic = data;
>> +	void __iomem *alt;
>> +
>> +	if (!is_hyp_mode_available())
>> +		return false;
>> +
>> +	alt = ioremap(gic->cpu_phys_base, GIC_STM32MP2_CPU_DEACTIVATE + 4);
>> +	if (!alt) {
>> +		pr_err("Unable to remap GICC_DIR register\n");
>> +		return false;
> 
> That's a hack because in case that the remap fails, this leaves the
> thing enabled, but disfunctional.
> 
> Thanks,
> 
>          tglx
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
