Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C442E830228
	for <lists+linux-stm32@lfdr.de>; Wed, 17 Jan 2024 10:21:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 79D79C6B476;
	Wed, 17 Jan 2024 09:21:38 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 360D5C6B452
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Jan 2024 09:21:37 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40H7HG3b027265; Wed, 17 Jan 2024 10:21:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=W+P7IO36D8CPAvUJClxapgFvmEeQRWVbVRywsFh/heo=; b=XG
 3UpAnQVt7wrCWveSYqIxqrxwWNd8mw+auxgc7IxFPXdGBqHQYxmAVuvlig8YPwaR
 K6/vdv0fNgCSJkwABEme0e7d9MnwLAetgrR1t3KgSbbixblLlU52Snl6DS0Sexmw
 PYgarnXflU4WAlbrHtZ5DtLVs+7hAIKiPhN6/yHUNVLD/bl98lumcnl6X+TK8XdU
 8kH+OSGDqYiuX+pg8eUocBWa4SA7HqhyfKVEoIPfabv9vbnzrYs3/0gvqVJL3M9s
 Cy2v12033pT9OUi4qOxO0m33XKAQWi9UIIlFJwu5CvLfjzai7FS/dJWUsu7j5AZW
 q1Pk0hXLtadSfTOP9pgQ==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3vnbqc84xe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Jan 2024 10:21:14 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F21B810007A;
 Wed, 17 Jan 2024 10:21:12 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D33E321ED56;
 Wed, 17 Jan 2024 10:21:12 +0100 (CET)
Received: from [10.201.21.102] (10.201.21.102) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 17 Jan
 2024 10:21:12 +0100
Message-ID: <1639c6b9-1cca-4f4c-a329-fc4618c572f6@foss.st.com>
Date: Wed, 17 Jan 2024 10:21:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20240111112450.1727866-1-valentin.caron@foss.st.com>
 <aae32b47-1bb0-4af0-baf0-836dc91b9427@linaro.org>
From: Valentin CARON <valentin.caron@foss.st.com>
In-Reply-To: <aae32b47-1bb0-4af0-baf0-836dc91b9427@linaro.org>
X-Originating-IP: [10.201.21.102]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-17_04,2024-01-16_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: serial: stm32: add
	power-domains property
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


On 1/15/24 16:05, Krzysztof Kozlowski wrote:
> On 11/01/2024 12:24, Valentin Caron wrote:
>> Add "power-domains" property in stm32 serial binding to avoid:
>>
>> serial@40010000: Unevaluated properties are not allowed
>> ('power-domains' were unexpected)
>>
> It would be better if you checked whether it can be part of power domain
> or not. What if the DTS is wrong?
>
> Best regards,
> Krzysztof
>
Hi Krzysztof,

I'm not sure to understand, but if you mean that there is no
power-domains properties right now in all stm32mp device trees
and so it does not required to add this stm32 serial bindings:

Theses will be upstreamed in the future, and because power-domains
property is optional, I can add it right now in stm32 serial binding
to anticipate.

Best regards,
Valentin
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
