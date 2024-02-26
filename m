Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EED2866C20
	for <lists+linux-stm32@lfdr.de>; Mon, 26 Feb 2024 09:27:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 15AD6C6B46B;
	Mon, 26 Feb 2024 08:27:10 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2ABE5C64102
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Feb 2024 08:27:09 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41Q7U9S0026021; Mon, 26 Feb 2024 09:27:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=+LqaC1k2A/CeSV89OpDz4o3lBGabPbXT8Ayn3ozZF+E=; b=eS
 YuuTHoml5z4VcKgqoFxayaUxIXvZSZB5J9MSNBejh+kYnNzSshlK2EiAPBI8DJe2
 MCNR+59y/W9S+eQXxCokj1fFMX+uSHTgnUt8hqFAuQJRdMF+6HbFCTrt5SM+7vq0
 t9gLrO9z36cI62RYxzuqB8qfS5IDP0GYIw42pVMC/zqEokI4RS2waTulWb7zBIx/
 DFOVgq1A4BKKUjaR6UFwpMyrVcELCxAl1Oq9XHZBwv9zfJ+bWyrhnnFyjWblaWo1
 G8+AheIRSbOKpbNKX+UK6U7/wRs+ejgX9goH80q1Obauw1HD22z1IFtV5CghkE28
 GEoj3u7rKgOgS+qveTtw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3wftw4kys9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Feb 2024 09:27:04 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 54A3840047;
 Mon, 26 Feb 2024 09:27:01 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B2CC424DFE9;
 Mon, 26 Feb 2024 09:26:32 +0100 (CET)
Received: from [10.201.21.177] (10.201.21.177) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 26 Feb
 2024 09:26:31 +0100
Message-ID: <9fb17963-8942-4810-ae86-508fd7b3466a@foss.st.com>
Date: Mon, 26 Feb 2024 09:26:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>
References: <20240219140202.85680-1-christophe.kerello@foss.st.com>
 <20240219140202.85680-4-christophe.kerello@foss.st.com>
 <21ad2752-ad25-451a-b892-6b3b31c1031a@linaro.org>
From: Christophe Kerello <christophe.kerello@foss.st.com>
In-Reply-To: <21ad2752-ad25-451a-b892-6b3b31c1031a@linaro.org>
X-Originating-IP: [10.201.21.177]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-26_05,2024-02-23_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2 3/5] memory: stm32-fmc2-ebi: add MP25
	support
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

Hi Krzysztof,

On 2/21/24 09:32, Krzysztof Kozlowski wrote:
> On 19/02/2024 15:02, Christophe Kerello wrote:
>> Add the support of the revision 2 of FMC2 IP.
>>       - PCSCNTR register has been removed,
>>       - CFGR register has been added,
>>       - the bit used to enable the IP has moved from BCR1 to CFGR,
>>       - the timeout for CEx deassertion has moved from PCSCNTR to BCRx,
>>       - the continuous clock enable has moved from BCR1 to CFGR,
>>       - the clk divide ratio has moved from BCR1 to CFGR.
>>
>> The MP1 SoCs have only one signal to manage all the controllers (NWAIT).
>> The MP25 SOC has one RNB signal for the NAND controller and one NWAIT
>> signal for the memory controller.
>>
>> Let's use a platform data structure for parameters that will differ
>> between MP1 and MP25.
> 
> 
> ...
> 
>> +
>>   	ebi->regmap = device_node_to_regmap(dev->of_node);
>>   	if (IS_ERR(ebi->regmap))
>>   		return PTR_ERR(ebi->regmap);
>> @@ -1190,9 +1502,11 @@ static int stm32_fmc2_ebi_probe(struct platform_device *pdev)
>>   	if (ret)
>>   		goto err_release;
>>   
>> -	ret = stm32_fmc2_ebi_save_setup(ebi);
>> -	if (ret)
>> -		goto err_release;
>> +	if (ebi->data->save_setup) {
> 
> This cannot be NULL.

Ok, it will be done in V3.

Regards,
Christophe Kerello.

> 
>> +		ret = ebi->data->save_setup(ebi);
>> +		if (ret)
>> +			goto err_release;
>> +	}
>>   
>>   	platform_set_drvdata(pdev, ebi);
>>   
>> @@ -1238,7 +1552,9 @@ static int __maybe_unused stm32_fmc2_ebi_resume(struct device *dev)
>>   	if (ret)
>>   		return ret;
>>   
>> -	stm32_fmc2_ebi_set_setup(ebi);
>> +	if (ebi->data->set_setup)
> 
> This cannot be NULL.
> 
> 
> 
> Best regards,
> Krzysztof
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
