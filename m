Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FBB8894B5F
	for <lists+linux-stm32@lfdr.de>; Tue,  2 Apr 2024 08:26:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 21B9FC6B46B;
	Tue,  2 Apr 2024 06:26:35 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9F30BC6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Apr 2024 06:26:33 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 4324Y9qi002614; Tue, 2 Apr 2024 08:25:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=CcHHM/KryYZsBrWCT1i/gA0cscKu+WS8QKGpJmnNtqc=; b=e3
 Al1ZUWIfAl4zB6kK+OA/GK+Y8yj4OGmyfDWO0asVmBBNf6K6QwhqlUUeOjXlFfeu
 It1AeSUJ28+ANgHNTV+sPRhy5w4vtw7atgeItaiL0MJJQyOXU4dJ+6hdBndg2Ro5
 qQ2H0aOKo6TtW6XgYw8bTXppdT1HfeqijYq3zyGZduRcV2p2DMhq+gpD/KGApJNp
 rRqnfVwEe3kOWWGokwZQLDN9QGCvo91E79V8921VF9YsQBLkmSPl7ThS45LlH8Hc
 A8TZ6nwGioznpn0rzmknmZue6PZWvA49jKgJVtRUGYyTrlX+9k9z0qmC1EzGtg+9
 NPjyJgkTx7aQIIwZt/mg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3x6wsu792t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Apr 2024 08:25:58 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 8E79A4002D;
 Tue,  2 Apr 2024 08:25:55 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D603420F2C1;
 Tue,  2 Apr 2024 08:24:37 +0200 (CEST)
Received: from [10.201.21.128] (10.201.21.128) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 2 Apr
 2024 08:24:36 +0200
Message-ID: <514c9f18-1ab8-425c-b78d-d13c30a25049@foss.st.com>
Date: Tue, 2 Apr 2024 08:24:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: <patchwork-bot+netdevbpf@kernel.org>
References: <20240328185337.332703-1-christophe.roullier@foss.st.com>
 <171175263052.1693.263504657362042828.git-patchwork-notify@kernel.org>
From: Christophe ROULLIER <christophe.roullier@foss.st.com>
In-Reply-To: <171175263052.1693.263504657362042828.git-patchwork-notify@kernel.org>
X-Originating-IP: [10.201.21.128]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-02_02,2024-04-01_01,2023-05-22_02
Cc: marex@denx.de, joabreu@synopsys.com, conor+dt@kernel.org,
 linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com,
 devicetree@vger.kernel.org, netdev@vger.kernel.org, richardcochran@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, lgirdwood@gmail.com,
 edumazet@google.com, robh+dt@kernel.org, broonie@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, kuba@kernel.org, pabeni@redhat.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v6 0/1] Add property in dwmac-stm32
	documentation
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


On 3/29/24 23:50, patchwork-bot+netdevbpf@kernel.org wrote:
> Hello:
>
> This patch was applied to netdev/net-next.git (main)
> by Jakub Kicinski <kuba@kernel.org>:
Thanks
>
> On Thu, 28 Mar 2024 19:53:36 +0100 you wrote:
>> Introduce property in dwmac-stm32 documentation
>>
>>   - st,ext-phyclk: is present since 2020 in driver so need to explain
>>     it and avoid dtbs check issue : views/kernel/upstream/net-next/arch/arm/boot/dts/st/stm32mp157c-dk2.dtb:
>> ethernet@5800a000: Unevaluated properties are not allowed
>> ('st,ext-phyclk' was unexpected)
>>     Furthermore this property will be use in upstream of MP13 dwmac glue. (next step)
>>
>> [...]
> Here is the summary with links:
>    - [v6,1/1] dt-bindings: net: dwmac: Document STM32 property st,ext-phyclk
>      https://git.kernel.org/netdev/net-next/c/929107d3d2a3
>
> You are awesome, thank you!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
