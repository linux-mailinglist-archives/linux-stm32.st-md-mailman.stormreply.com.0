Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C42A3899D9F
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Apr 2024 14:55:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8AF87C6DD93;
	Fri,  5 Apr 2024 12:55:57 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1D4ADC6C83C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Apr 2024 12:55:56 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 4359V9ot028899; Fri, 5 Apr 2024 14:55:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=0cFdPsY/Q1AlffEt+XiVO9DUsg6Cv8uI4Ru07BMd9WQ=; b=K7
 859fcmksebHtW/xO2+6NxWbrCCId7k51+4xo//Bl9iBNh8FNCiuwp8oWviToA3+a
 zu22CzuYfIsHcoYhwyTH/qDjVhisTQhG0mWYz81pSPxBtilDspGBMCQbAoeM6Hs0
 FjnFSKocVrRqWEikFItsjLbCfCDLmHeHSwYrdCp53GMt7NY0ueHw3XT8XTCg3qF7
 hW7+PlP2NKvUeFtLkucs5R7kZrNGsn/eJvw9iCxD8zUUGgK9BFt5OyAhOtIg92us
 teOjTL7Gn0bGEo7jXZdXDUbNdbkv2MQrhx56uA0+9eHWO6rGDltio+CVfOsnRXMD
 wzTrBJBbE2Fr9a6p+EYQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3x9emuyjyk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Apr 2024 14:55:33 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 788154002D;
 Fri,  5 Apr 2024 14:55:30 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2174C216833;
 Fri,  5 Apr 2024 14:54:38 +0200 (CEST)
Received: from [10.252.8.38] (10.252.8.38) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 5 Apr
 2024 14:54:37 +0200
Message-ID: <285f2f64-58b0-4dd0-9f1a-89306a79d572@foss.st.com>
Date: Fri, 5 Apr 2024 14:54:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Philipp Zabel <p.zabel@pengutronix.de>
References: <20240402125312.277052-1-gabriel.fernandez@foss.st.com>
 <20240402125312.277052-3-gabriel.fernandez@foss.st.com>
 <e70dc513-df9f-4b99-b9d9-7ebaf83e8f3e@linaro.org>
Content-Language: en-US
From: Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>
In-Reply-To: <e70dc513-df9f-4b99-b9d9-7ebaf83e8f3e@linaro.org>
X-Originating-IP: [10.252.8.38]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-05_10,2024-04-05_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [RESEND PATCH v9 2/4] dt-bindings: stm32: update
 DT bingding for stm32mp25
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


On 4/5/24 09:12, Krzysztof Kozlowski wrote:
> On 02/04/2024 14:53, gabriel.fernandez@foss.st.com wrote:
>> From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
>>
>> Now RCC driver use '.index' of clk_parent_data struct to define a parent.
>> The majority of parents are SCMI clocks, then dt-bindings must be fixed.
>>
>> Fixes: b5be49db3d47 ("dt-bindings: stm32: add clocks and reset binding for stm32mp25 platform")
> And except what Rob said, this does not look as a fix. How ABI break
> could be a fix and what is even to fix here? Please describe the
> observable bug, how it manifests itself and what is exactly the fix for
> that bug.
As I replied to Rob, there are no RCC STM32MP25 drivers already upstreamed.

However, in my series, the DT binding was merged even though Stephen 
made some

important remarks that needed to be taken into account.

That's why I proposed a fix to update the documentation.

To be sure, how would you like me to proceed?

Best Regards,

Gabriel

>
> Best regards,
> Krzysztof
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
