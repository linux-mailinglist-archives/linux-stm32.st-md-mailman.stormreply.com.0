Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2F28B233F
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Apr 2024 15:57:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C1837C71292;
	Thu, 25 Apr 2024 13:57:05 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7514EC71291
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Apr 2024 13:57:04 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43PCfwiL029882;
 Thu, 25 Apr 2024 15:56:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=z2KbHlfPPNmNdidIl6BW3+Ahv5hYokeRGG3kRqWEAJM=; b=6T
 NY6uGcyj6bnDhV0GfwEOIhLbK7rplt7NdBCaUYGNS2Z/BNpCOQz7zGNXThfrUfWa
 vZm18ddLvzPiodC/lT+tJIcmNIO4gVKmA4PQtjMGAPowbx9djFTPI6bDMDShco7q
 3BPIl7eK69D66Az4HQpzBbRpM6Ycv1qV/nJD5jpTf2G5tVPy4HDfDC5jAOs4HFaW
 kjVj0zis3q43Osa5qlCjj7ni0RDIM5rklYG+7rfziLrkKgG7Omt7Mr5yIAT049E6
 CCtO5EGJmwMVZoj0lhzG0Om7AQZ2u2pVOtlzQvIRfZog/57mqwD/gBQD09OF5SOA
 1ISHICeIJ7XOg8A37LBQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xmrnjbe6s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Apr 2024 15:56:52 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 111DA4002D;
 Thu, 25 Apr 2024 15:56:48 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4557C221979;
 Thu, 25 Apr 2024 15:56:02 +0200 (CEST)
Received: from [10.48.86.112] (10.48.86.112) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 25 Apr
 2024 15:56:01 +0200
Message-ID: <7ce28eee-263c-4a06-85b5-5b382cbed35a@foss.st.com>
Date: Thu, 25 Apr 2024 15:55:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzk@kernel.org>, Alexandre TORGUE
 <alexandre.torgue@foss.st.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark
 Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>,
 Pascal Paillet <p.paillet@foss.st.com>
References: <20240425074835.760134-1-patrick.delaunay@foss.st.com>
 <20240425094829.1.Ia0a99d90acb512aa020a6e7a8cca8cc1b71f1759@changeid>
 <2b78be92-08a5-4bf8-a1e1-477ecbbe73da@kernel.org>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <2b78be92-08a5-4bf8-a1e1-477ecbbe73da@kernel.org>
X-Originating-IP: [10.48.86.112]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-25_13,2024-04-25_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 1/3] dt-bindings: regulator: st,
 stm32mp1-pwr-reg: add correct compatible
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

Hi,

On 4/25/24 10:52, Krzysztof Kozlowski wrote:
> On 25/04/2024 09:48, Patrick Delaunay wrote:
>> Remove the unexpected comma in the compatible "st,stm32mp1,pwr-reg"
>> and define the new compatible "st,stm32mp1-pwr-reg".
>> The old compatible is only keep for compatibility with old device trees.
>>
>> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
>> ---
>>
>>   .../devicetree/bindings/regulator/st,stm32mp1-pwr-reg.yaml  | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/regulator/st,stm32mp1-pwr-reg.yaml b/Documentation/devicetree/bindings/regulator/st,stm32mp1-pwr-reg.yaml
>> index c9586d277f41..2a52f9e769c2 100644
>> --- a/Documentation/devicetree/bindings/regulator/st,stm32mp1-pwr-reg.yaml
>> +++ b/Documentation/devicetree/bindings/regulator/st,stm32mp1-pwr-reg.yaml
>> @@ -11,7 +11,9 @@ maintainers:
>>   
>>   properties:
>>     compatible:
>> -    const: st,stm32mp1,pwr-reg
>> +    enum:
>> +      - st,stm32mp1-pwr-reg
>> +      - st,stm32mp1,pwr-reg
> Please make it oneOf:
>   - const: new one
>   - const: old one
>     deprecated: true

ok, I push a V2 soon.


>
> Best regards,
> Krzysztof

Regards

Patrick

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
