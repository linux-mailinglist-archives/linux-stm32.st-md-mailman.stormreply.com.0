Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B78B6855D2E
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Feb 2024 10:01:35 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6D1D8C62EFE;
	Thu, 15 Feb 2024 09:01:35 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EEF49CFAC50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Feb 2024 09:01:33 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41F7wfCA001809; Thu, 15 Feb 2024 10:01:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=nHyhI12A8CHJ2DXANwDSFY56v/VwqxMrvbug8JpUKUA=; b=bD
 rM88tnUp1aLAiysjOjAeJ9feO1qMffXVwqucuJGyOcWeD7hVzrTrAndea+tDrzc4
 5wmD31Jqs/JbsXVYxwtMjDW0kXK6r410pS3w1RVfyc+S7ENIoJd+2igHTsJNPdXO
 JM/mqLWXyHPWJadAK1khW6pGh+eX7AaI19qhtgiWElLXy5rj9uRKpnkwMVBhzh0C
 LUJsu/LXO21asDQ/WoBmzKedTy8xp1AMqCeD9vKY/grK5kx6LK4tYpstj8KX/E9G
 a8SC58XJGdiTACANgzg1B54ewqoNIDra0si6E9e19bKPQ6tcqTGUFthdzfRo80aC
 34ftO7bd5xPhctKfPWDQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3w6kk50cgm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Feb 2024 10:01:12 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B298F4002D;
 Thu, 15 Feb 2024 10:01:05 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 793FD229A89;
 Thu, 15 Feb 2024 10:00:22 +0100 (CET)
Received: from [10.201.22.200] (10.201.22.200) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 15 Feb
 2024 10:00:19 +0100
Message-ID: <a1badd8b-041b-495d-81cb-b264c687de80@foss.st.com>
Date: Thu, 15 Feb 2024 10:00:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
 <conor+dt@kernel.org>
References: <20240212174822.77734-1-christophe.kerello@foss.st.com>
 <20240212174822.77734-7-christophe.kerello@foss.st.com>
 <989661f0-f539-43c3-a332-13c0e99ed7b9@linaro.org>
 <edbb5e6e-44c0-426b-9c97-87ea1eee1b4c@foss.st.com>
 <1e1ae38b-7f8c-44ba-9970-0929aaaa28a8@linaro.org>
From: Christophe Kerello <christophe.kerello@foss.st.com>
In-Reply-To: <1e1ae38b-7f8c-44ba-9970-0929aaaa28a8@linaro.org>
X-Originating-IP: [10.201.22.200]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-15_08,2024-02-14_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 06/12] memory: stm32-fmc2-ebi: add RIF
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



On 2/14/24 11:07, Krzysztof Kozlowski wrote:
> On 13/02/2024 14:15, Christophe Kerello wrote:
>>>> +
>>>> +	if (ebi->majrev < FMC2_VERR_MAJREV_2)
>>>> +		return 0;
>>>> +
>>>> +	if (resource >= FMC2_MAX_RESOURCES)
>>>> +		return -EINVAL;
>>>> +
>>>> +	regmap_read(ebi->regmap, FMC2_SECCFGR, &seccfgr);
>>
>> Hi Krzysztof,
>>
>>>
>>> No checking of read value?
>>>
>>
>> No, it should never failed.
> 
> And you tested that neither smatch, sparse nor Coverity report here
> warnings?
> 

Hi Krzysztof,

There is a lot of driver in the Kernel that are using same 
implementation, and I am surprised to not have had this comment 4 years 
ago when the driver was introduced.

So, how should I proceed? Shall I initialize all local variables used by 
regmap_read? Or shall I check the return value of regmap_read?
And, as there is a lot of regmap_read call in this driver, shall I fix 
them in a separate patch?

>>
>>>> +	if (seccfgr & BIT(resource)) {
>>>
>>> Then on read failure this is random stack junk.
>>>
>>>> +		if (resource)
>>>> +			dev_err(ebi->dev, "resource %d is configured as secure\n",
>>>> +				resource);
>>>> +
>>>> +		return -EACCES;
>>>> +	}
>>>> +
>>>> +	regmap_read(ebi->regmap, FMC2_CIDCFGR(resource), &cidcfgr);
>>>> +	if (!(cidcfgr & FMC2_CIDCFGR_CFEN))
>>>> +		/* CID filtering is turned off: access granted */
>>>> +		return 0;
>>>> +
>>>> +	if (!(cidcfgr & FMC2_CIDCFGR_SEMEN)) {
>>>> +		/* Static CID mode */
>>>> +		cid = FIELD_GET(FMC2_CIDCFGR_SCID, cidcfgr);
>>>> +		if (cid != FMC2_CID1) {
>>>> +			if (resource)
>>>> +				dev_err(ebi->dev, "static CID%d set for resource %d\n",
>>>> +					cid, resource);
>>>> +
>>>> +			return -EACCES;
>>>> +		}
>>>> +
>>>> +		return 0;
>>>> +	}
>>>> +
>>>> +	/* Pass-list with semaphore mode */
>>>> +	if (!(cidcfgr & FMC2_CIDCFGR_SEMWLC1)) {
>>>> +		if (resource)
>>>> +			dev_err(ebi->dev, "CID1 is block-listed for resource %d\n",
>>>> +				resource);
>>>> +
>>>> +		return -EACCES;
>>>> +	}
>>>> +
>>>> +	regmap_read(ebi->regmap, FMC2_SEMCR(resource), &semcr);
>>>> +	if (!(semcr & FMC2_SEMCR_SEM_MUTEX)) {
>>>> +		regmap_update_bits(ebi->regmap, FMC2_SEMCR(resource),
>>>> +				   FMC2_SEMCR_SEM_MUTEX, FMC2_SEMCR_SEM_MUTEX);
>>>> +		regmap_read(ebi->regmap, FMC2_SEMCR(resource), &semcr);
>>>> +	}
>>>> +
>>>> +	cid = FIELD_GET(FMC2_SEMCR_SEMCID, semcr);
>>>> +	if (cid != FMC2_CID1) {
>>>> +		if (resource)
>>>> +			dev_err(ebi->dev, "resource %d is already used by CID%d\n",
>>>> +				resource, cid);
>>>> +
>>>> +		return -EACCES;
>>>> +	}
>>>> +
>>>> +	ebi->sem_taken |= BIT(resource);
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static void stm32_fmc2_ebi_put_sems(struct stm32_fmc2_ebi *ebi)
>>>> +{
>>>> +	unsigned int resource;
>>>> +
>>>> +	if (ebi->majrev < FMC2_VERR_MAJREV_2)
>>>> +		return;
>>>> +
>>>> +	for (resource = 0; resource < FMC2_MAX_RESOURCES; resource++) {
>>>> +		if (!(ebi->sem_taken & BIT(resource)))
>>>> +			continue;
>>>> +
>>>> +		regmap_update_bits(ebi->regmap, FMC2_SEMCR(resource),
>>>> +				   FMC2_SEMCR_SEM_MUTEX, 0);
>>>> +	}
>>>> +}
>>>> +
>>>> +static void stm32_fmc2_ebi_get_sems(struct stm32_fmc2_ebi *ebi)
>>>> +{
>>>> +	unsigned int resource;
>>>> +
>>>> +	if (ebi->majrev < FMC2_VERR_MAJREV_2)
>>>> +		return;
>>>> +
>>>> +	for (resource = 0; resource < FMC2_MAX_RESOURCES; resource++) {
>>>> +		if (!(ebi->sem_taken & BIT(resource)))
>>>> +			continue;
>>>> +
>>>> +		regmap_update_bits(ebi->regmap, FMC2_SEMCR(resource),
>>>> +				   FMC2_SEMCR_SEM_MUTEX, FMC2_SEMCR_SEM_MUTEX);
>>>> +	}
>>>> +}
>>>> +
>>>>    static int stm32_fmc2_ebi_parse_prop(struct stm32_fmc2_ebi *ebi,
>>>>    				     struct device_node *dev_node,
>>>>    				     const struct stm32_fmc2_prop *prop,
>>>> @@ -1057,6 +1191,9 @@ static void stm32_fmc2_ebi_save_setup(struct stm32_fmc2_ebi *ebi)
>>>>    	unsigned int cs;
>>>>    
>>>>    	for (cs = 0; cs < FMC2_MAX_EBI_CE; cs++) {
>>>> +		if (!(ebi->bank_assigned & BIT(cs)))
>>>> +			continue;
>>>> +
>>>>    		regmap_read(ebi->regmap, FMC2_BCR(cs), &ebi->bcr[cs]);
>>>>    		regmap_read(ebi->regmap, FMC2_BTR(cs), &ebi->btr[cs]);
>>>>    		regmap_read(ebi->regmap, FMC2_BWTR(cs), &ebi->bwtr[cs]);
>>>> @@ -1064,7 +1201,7 @@ static void stm32_fmc2_ebi_save_setup(struct stm32_fmc2_ebi *ebi)
>>>>    
>>>>    	if (ebi->majrev < FMC2_VERR_MAJREV_2)
>>>>    		regmap_read(ebi->regmap, FMC2_PCSCNTR, &ebi->pcscntr);
>>>> -	else
>>>> +	else if (ebi->access_granted)
>>>>    		regmap_read(ebi->regmap, FMC2_CFGR, &ebi->cfgr);
>>>>    }
>>>>    
>>>> @@ -1073,6 +1210,9 @@ static void stm32_fmc2_ebi_set_setup(struct stm32_fmc2_ebi *ebi)
>>>>    	unsigned int cs;
>>>>    
>>>>    	for (cs = 0; cs < FMC2_MAX_EBI_CE; cs++) {
>>>> +		if (!(ebi->bank_assigned & BIT(cs)))
>>>> +			continue;
>>>> +
>>>>    		regmap_write(ebi->regmap, FMC2_BCR(cs), ebi->bcr[cs]);
>>>>    		regmap_write(ebi->regmap, FMC2_BTR(cs), ebi->btr[cs]);
>>>>    		regmap_write(ebi->regmap, FMC2_BWTR(cs), ebi->bwtr[cs]);
>>>> @@ -1080,7 +1220,7 @@ static void stm32_fmc2_ebi_set_setup(struct stm32_fmc2_ebi *ebi)
>>>>    
>>>>    	if (ebi->majrev < FMC2_VERR_MAJREV_2)
>>>>    		regmap_write(ebi->regmap, FMC2_PCSCNTR, ebi->pcscntr);
>>>> -	else
>>>> +	else if (ebi->access_granted)
>>>>    		regmap_write(ebi->regmap, FMC2_CFGR, ebi->cfgr);
>>>
>>> So this is kind of half-allowed-half-not. How is it supposed to work
>>> with !access_granted? You configure some registers but some not. So will
>>> it work or not? If yes, why even needing to write to FMC2_CFGR!
>>>
>>
>> This register is considered as one resource and can be protected. If a
>> companion (like optee_os) has configured this resource as secure, it
>> means that the driver can not write into this register, and this
>> register will be handled by the companion. If this register is let as
>> non secure, the driver can handle this ressource.
> 
> So this is not an error? Other places print errors and return -EACCESS,
> so that's a bit confusing me.
> 

It is not an error. We are saving registers values to restore them on 
low power cases. If registers are set as secure, it is the 
responsibility of the companion to restore them when it is the 
responsibility of the non secure driver to restore them if they are 
configured as non secure.

Regards,
Christophe Kerello.

> 
> Best regards,
> Krzysztof
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
