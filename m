Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E27B3B94D
	for <lists+linux-stm32@lfdr.de>; Fri, 29 Aug 2025 12:54:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EB6CBC36B2E;
	Fri, 29 Aug 2025 10:54:11 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 86570C36B2C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 29 Aug 2025 10:54:10 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57TAmX4E017538;
 Fri, 29 Aug 2025 12:53:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 4xaeXPbiHj1WXGO3LyY/YVYaZRplgC67AGgIQ0JaCzQ=; b=I9PG/Tts+8+sWE0v
 iB/btJghfuyYmvscjR0cyoH4rHTCxk3tjAXGOQmMIqZCIHS9vQkpuo0jjDoO/W6h
 REgP/7WCuTQT3ACMTJzhKXt91r0VOP7Bt7dbQljGhUR0IVxGAU13DL4VGKx9mpnY
 cwQI1tRdhGuOddgHKvR4/WluY3ueD6PExzDb2G50G/D3rK8VORpDh74IMAzVKT3Q
 1dmuf2mEwKN7qHtn8M4GYwz9NO75zx0EvPpWBUaK99s6m1l+MS6PBS6bt5g4AEv0
 NTfAyBYvbmTAAwmOjlKz3OiN8AtGn2OUoT+lxxdMJAiWuNHbsVq8r/rLBOahuP2T
 wcQukw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48q5v0h561-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Aug 2025 12:53:50 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 6D07E40045;
 Fri, 29 Aug 2025 12:52:38 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CFFBA78F630;
 Fri, 29 Aug 2025 12:51:45 +0200 (CEST)
Received: from [10.48.87.141] (10.48.87.141) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Fri, 29 Aug
 2025 12:51:45 +0200
Message-ID: <57196414-5ab5-41b7-b2e3-ff6831589811@foss.st.com>
Date: Fri, 29 Aug 2025 12:51:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jakub Kicinski <kuba@kernel.org>
References: <20250827-relative_flex_pps-v3-0-673e77978ba2@foss.st.com>
 <20250827-relative_flex_pps-v3-1-673e77978ba2@foss.st.com>
 <20250827193105.47aaa17b@kernel.org>
Content-Language: en-US
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <20250827193105.47aaa17b@kernel.org>
X-Originating-IP: [10.48.87.141]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-29_03,2025-08-28_01,2025-03-28_01
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v3 1/2] drivers: net: stmmac:
 handle start time set in the past for flexible PPS
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



On 8/28/25 04:31, Jakub Kicinski wrote:
> On Wed, 27 Aug 2025 13:04:58 +0200 Gatien Chevallier wrote:
>> +		curr_time = ns_to_timespec64(ns);
>> +		if (target_ns < ns + PTP_SAFE_TIME_OFFSET_NS) {
>> +			cfg->start = timespec64_add_safe(cfg->start, curr_time);
> 
> Is there a strong reason to use timespec64_add_safe()?
> It's not exported to modules:
> ERROR: modpost: "timespec64_add_safe" [drivers/net/ethernet/stmicro/stmmac/stmmac.ko] undefined!

Hello Jakub,

you're absolutely right. I don't know how I did not encounter the build
error while performing some tests, that I'm getting now as well.

The handling of overflows is already done in that function. Either
I can make a patch to export the symbol or handle the computation in the
driver. What do you think is best?

Cheers,
Gatien

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
