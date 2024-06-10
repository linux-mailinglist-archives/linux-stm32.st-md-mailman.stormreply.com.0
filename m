Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 449B490220B
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Jun 2024 14:53:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0A2A0C78019;
	Mon, 10 Jun 2024 12:53:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 346ACC62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jun 2024 12:52:58 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45ACQpDx023425;
 Mon, 10 Jun 2024 14:52:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 4nQIhTEpp8eDIIoRXVmHoi9JKLGBN6G1TMA/hr/mDCI=; b=2rIOVCljVIVe7FZq
 TbTuMPJwrmb18j6fZCtB6HBNyOEiIUXVCNUV6RrIlf8Nzw/YZmkVa6CawIo9M7Xu
 nI68AfAeEgqHTjzzJaWhmQL0dIn/e0l83ojmflHjOvxC++Nv6Cu8fiQeoZ2Z/A8c
 UuLlG5AEFw3DGJoARpQzwTKfZMPTSvitQ3z0l6fX+BMhW4x9+yVyLg02884+oR46
 tWZH8u4SJX0WlgxlQS7lrfcgWFGg8wKNgipInKT0aUhxLwtFJ9ftvFsCKLjPcnQh
 4MAlwNAVD1Xln8Vp8dQFwPOdUBbklLt2o3bGgo99WTpirPhhiEQSa6of842ymaJU
 BIa1qw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3yn0v14ufk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Jun 2024 14:52:41 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id D9B2D40045;
 Mon, 10 Jun 2024 14:52:37 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1D5DD217B76;
 Mon, 10 Jun 2024 14:52:09 +0200 (CEST)
Received: from [10.48.86.164] (10.48.86.164) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 10 Jun
 2024 14:52:08 +0200
Message-ID: <ede482e3-58a1-4664-84b1-f80e59841e28@foss.st.com>
Date: Mon, 10 Jun 2024 14:52:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Richard Cochran <richardcochran@gmail.com>,
 Jose Abreu <joabreu@synopsys.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Marek Vasut <marex@denx.de>
References: <20240610080604.291102-1-christophe.roullier@foss.st.com>
 <06703c03-e1ce-4a94-942d-b556c6084728@linaro.org>
 <ef4d2ebb-dd2a-423d-acd1-43fdb42c1896@foss.st.com>
 <e7f1ea08-41af-47e0-b478-652e67e5aebb@linaro.org>
Content-Language: en-US
From: Christophe ROULLIER <christophe.roullier@foss.st.com>
In-Reply-To: <e7f1ea08-41af-47e0-b478-652e67e5aebb@linaro.org>
X-Originating-IP: [10.48.86.164]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-10_02,2024-06-10_01,2024-05-17_01
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 1/1] ARM: multi_v7_defconfig: Add MCP23S08
	pinctrl support
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


On 6/10/24 14:27, Krzysztof Kozlowski wrote:
> On 10/06/2024 10:14, Christophe ROULLIER wrote:
>>>> @@ -469,6 +469,7 @@ CONFIG_SPI_XILINX=y
>>>>    CONFIG_SPI_SPIDEV=y
>>>>    CONFIG_SPMI=y
>>>>    CONFIG_PINCTRL_AS3722=y
>>>> +CONFIG_PINCTRL_MCP23S08=y
>>> This is not an on-SoC pinctrl, so it should be module (=m).
>> The stmmac is in built-in, if IO-Expander (MCP23S08) is on module, we
>> have huge of message during kernel boot
>>
>> because stmmac driver is deferred several times. (need to wait that
>> module are ready)
> Which is normal and not a reason to change defconfig. It it was a
> problem, you should solve it not in defconfig but in kernel. That's just
> defconfig, an example, reference or debugging tool if you wish, so
> fixing issue here is not a fix at all.
Ok so it will not be possible to boot in NFS mode
>
> Best regards,
> Krzysztof
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
