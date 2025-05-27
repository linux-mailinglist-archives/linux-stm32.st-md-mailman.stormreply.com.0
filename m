Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D36AC4F86
	for <lists+linux-stm32@lfdr.de>; Tue, 27 May 2025 15:20:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8EF8EC36B1E;
	Tue, 27 May 2025 13:20:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4BE58C36B19
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 May 2025 13:20:15 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RAsMIT011814;
 Tue, 27 May 2025 15:19:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 BFoE3HK0D28qwdUZStsXbkkPYfcQlaxFa0f8RDcbnCs=; b=psqZ4Sn+GcELhcem
 mXF6fCpefDL4VWSOiNFZnJ1fhr7KtX4F1kZb416PE4LaACw3r9T5oZQx38jo71oM
 IK1Tzl6EcIiCFK4mLYWNU7IsDkzORs8xyRhr7tYBK389R4sAp9Fq6Yl0lLcDJl1P
 Pt6rartBtbNDZI9AE3Edvw8jyvxBhoTrQSIcttAX0pOHCi/DqJ9YzitHk2SYz1yH
 MJzaN/5+mO4KEfrKhQXbVjM9tcj3szqckscmusjVmWKQnJqU7ZpQSMnV5kLRRQc3
 Dkv/KL5B7ZsJz22yE8jHEwG/PCrJzeA4wFHO+4g9jZCqoh6P3b3lKmK4ZiHeMMzT
 EUk0yQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46u3hk4ghh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 May 2025 15:19:59 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id EF61840055;
 Tue, 27 May 2025 15:18:48 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 45D52AE88C2;
 Tue, 27 May 2025 15:18:01 +0200 (CEST)
Received: from [10.48.86.139] (10.48.86.139) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 27 May
 2025 15:18:00 +0200
Message-ID: <ca047799-6ec2-4386-a3aa-068766ea24d1@foss.st.com>
Date: Tue, 27 May 2025 15:17:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark
 Brown <broonie@kernel.org>
References: <20250527-stm32mp157f-dk2-v1-0-8aef885a4928@foss.st.com>
 <20250527-stm32mp157f-dk2-v1-4-8aef885a4928@foss.st.com>
 <79fac1e2-c90f-49b0-9f9c-357c994b27ad@kernel.org>
Content-Language: en-US
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
In-Reply-To: <79fac1e2-c90f-49b0-9f9c-357c994b27ad@kernel.org>
X-Originating-IP: [10.48.86.139]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_06,2025-05-27_01,2025-03-28_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>,
 Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 4/5] dt-bindings: arm: stm32: add
 STM32MP157F-DK2 board compatible
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



On 5/27/25 15:09, Krzysztof Kozlowski wrote:
> On 27/05/2025 15:03, Amelie Delaunay wrote:
>> From: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
>>
>> Add the "st,stm32mp157f-dk2" compatible string to the STM32 SoC
>> bindings. The MP157F is functionally similar to the MP157C.
>>
>> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> 
> How did you get Ack on something which is v1? Cover letter does not
> explain any history here.

Hi,

Instead of using my own patch, since Himanshu sent the same earlier than 
me, I rerolled Himanshu's bindings patch from there 
https://lore.kernel.org/linux-arm-kernel/20250524100319.22521-3-himanshu.bhavani@siliconsignals.io/.
I should have mention that.

Regards,
Amelie

> 
> Best regards,
> Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
