Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6450CA961FE
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Apr 2025 10:39:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1E4AAC78F68;
	Tue, 22 Apr 2025 08:39:25 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 14E5EC78F67
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Apr 2025 08:39:23 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53M7dHvO023461;
 Tue, 22 Apr 2025 10:39:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 p1HgdGedqFLflmSyTqaih9yVCR93DL2hpGbz6kInKgQ=; b=aC/BBYhR30IsKwaq
 tyXav00NKeBxVSsNoWFNtYcD6H9WlT1jyliHwkZlkjlzTA/WZMWKKmL1deiqVbVt
 htwGqnGex+KHq+8vJt+g2M2eKMEjYxkefrVasUGA+dllSKegRZD+nrgwCVl5xrqO
 28E+zfrbHA4tUUPmN/WDR7Yy7kGKVi1imh1Eb8ZRj9AR4uDs4Z3Zppptoz2grf2E
 KVt0F1ClLRjN/9OxEVWjHE4QFDnJWRS64EP72K59/tWbg483bcB33G2JXE+cKOVq
 JKVfhOSs/rDH8J7y2lEvP5MD4D3mupygVYw9iv1EkuSD2Z7Cydpze78W8zX9iFiN
 rQdc2g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 464nd3y1w8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Apr 2025 10:39:00 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B88C340059;
 Tue, 22 Apr 2025 10:37:54 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E93E99D6100;
 Tue, 22 Apr 2025 10:37:04 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 22 Apr
 2025 10:37:04 +0200
Message-ID: <2bdbee00-07d2-4f6d-830a-1e5e6982d5a6@foss.st.com>
Date: Tue, 22 Apr 2025 10:37:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>
References: <20250410-upstream_ospi_v6-v9-0-cf119508848a@foss.st.com>
 <20250410-upstream_ospi_v6-v9-2-cf119508848a@foss.st.com>
 <3dd741ef-4589-49cd-967f-8a2d72e75cf4@kernel.org>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <3dd741ef-4589-49cd-967f-8a2d72e75cf4@kernel.org>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_04,2025-04-21_02,2024-11-22_01
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v9 2/3] memory: Add STM32 Octo Memory
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



On 4/15/25 08:00, Krzysztof Kozlowski wrote:
> On 10/04/2025 11:27, Patrice Chotard wrote:
>> +	for (i = 0; i < omm->nb_child; i++) {
>> +		idx = of_property_match_string(dev->of_node,
>> +					       "memory-region-names",
>> +					       mm_name[i]);
>> +		if (idx < 0)
>> +			continue;
>> +
>> +		/* res1 only used on second loop iteration */
>> +		res1.start = res.start;
>> +		res1.end = res.end;
>> +
>> +		node = of_parse_phandle(dev->of_node, "memory-region", idx);
>> +		if (!node)
>> +			continue;
>> +
>> +		ret = of_address_to_resource(node, 0, &res);
>> +		if (ret) {
>> +			of_node_put(node);
>> +			dev_err(dev, "unable to resolve memory region\n");
>> +			return ret;
>> +		}
>> +
>> +		/* check that memory region fits inside OMM memory map area */
>> +		if (!resource_contains(omm->mm_res, &res)) {
>> +			dev_err(dev, "%s doesn't fit inside OMM memory map area\n",
>> +				mm_name[i]);
>> +			dev_err(dev, "%pR doesn't fit inside %pR\n", &res, omm->mm_res);
>> +
> 
> I don't understand. I already pointed out that you leak OF reference.
> You fixed it in one place, ignoring all the rest. You must fix it
> everywhere.
> 

Hi Krzysztof

My bad, i will add all missing of_node_put().

Thanks
Patrice

>> +			return -EFAULT;
>> +		}
>> +
> 
> 
> Best regards,
> Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
