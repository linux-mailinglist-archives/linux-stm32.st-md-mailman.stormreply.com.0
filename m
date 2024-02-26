Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6D3866C12
	for <lists+linux-stm32@lfdr.de>; Mon, 26 Feb 2024 09:25:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ED484C6B46B;
	Mon, 26 Feb 2024 08:25:54 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BF88CC64102
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Feb 2024 08:25:53 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41Q3T6cD001925; Mon, 26 Feb 2024 09:25:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=ipjqMNVCa6S6fgiDE7vR21a99GdkTx/G11g4uP/BcWo=; b=re
 m6OKKwNwvCp2pW4u/6mMlfjuS8RNmSFjVPAmlz2bPp9F+JqJox3Hc/SBI2Q5yadI
 dGPwtVG/NEKZEs3agmVqVQ5BcX2oxwPMMkbh65QGAV4GlAyHist0zk+J59ucHGin
 FmAFH6qAfwOzUf2ONh9hKbTwgE0qMQbNSzWuCL1QAlBJ6OaWCzZMcyc9x3BQAkii
 +3+u4SVAdfy1xN413PoKsb3nvp+/sAmqIg415Wk/Dx6UPvlzlgelKuOlxI9tweoL
 UBeFFz/9GKvnTn6kU8fqc9Dg6w1Juv2LbZfBxpfKbUs3nfY1pmg2NT9YMF2q6rYa
 dQETh34CLS96SptsmWZA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3wf6rke8dn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Feb 2024 09:25:42 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 492164002D;
 Mon, 26 Feb 2024 09:25:38 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C3E12243FD1;
 Mon, 26 Feb 2024 09:25:07 +0100 (CET)
Received: from [10.201.21.177] (10.201.21.177) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 26 Feb
 2024 09:25:07 +0100
Message-ID: <9859023c-57bf-4316-911c-c5f5ade1ebb4@foss.st.com>
Date: Mon, 26 Feb 2024 09:25:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>
References: <20240219140202.85680-1-christophe.kerello@foss.st.com>
 <20240219140202.85680-3-christophe.kerello@foss.st.com>
 <1c4ab974-2b72-45ce-ab20-de158b91e356@linaro.org>
Content-Language: en-US
From: Christophe Kerello <christophe.kerello@foss.st.com>
In-Reply-To: <1c4ab974-2b72-45ce-ab20-de158b91e356@linaro.org>
X-Originating-IP: [10.201.21.177]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-26_05,2024-02-23_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2 2/5] memory: stm32-fmc2-ebi: check
 regmap_read return value
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

On 2/21/24 09:29, Krzysztof Kozlowski wrote:
> On 19/02/2024 15:01, Christophe Kerello wrote:
>> Check regmap_read return value to avoid to use uninitialized local
>> variables.
>>
>> Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
>> ---
>> Changes in v2:
>>   - New patch added
>>
>>   drivers/memory/stm32-fmc2-ebi.c | 128 +++++++++++++++++++++++---------
>>   1 file changed, 94 insertions(+), 34 deletions(-)
>>
> 
> ...
> 
>> -static void stm32_fmc2_ebi_save_setup(struct stm32_fmc2_ebi *ebi)
>> +static int stm32_fmc2_ebi_save_setup(struct stm32_fmc2_ebi *ebi)
>>   {
>>   	unsigned int cs;
>> +	int ret;
>>   
>>   	for (cs = 0; cs < FMC2_MAX_EBI_CE; cs++) {
>> -		regmap_read(ebi->regmap, FMC2_BCR(cs), &ebi->bcr[cs]);
>> -		regmap_read(ebi->regmap, FMC2_BTR(cs), &ebi->btr[cs]);
>> -		regmap_read(ebi->regmap, FMC2_BWTR(cs), &ebi->bwtr[cs]);
>> +		ret = regmap_read(ebi->regmap, FMC2_BCR(cs), &ebi->bcr[cs]);
>> +		if (ret)
>> +			return ret;
>> +
>> +		ret = regmap_read(ebi->regmap, FMC2_BTR(cs), &ebi->btr[cs]);
>> +		if (ret)
>> +			return ret;
>> +
>> +		ret = regmap_read(ebi->regmap, FMC2_BWTR(cs), &ebi->bwtr[cs]);
>> +		if (ret)
>> +			return ret;
> 
> These are just:
> 
> ret |= regmapr_read()
> and one "if (ret)" clause.
> 

Ok, it will be done in V3.

Regards,
Christophe Kerello.

> 
> 
> Best regards,
> Krzysztof
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
