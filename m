Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C98A295AF
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Feb 2025 17:06:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C1D67C78F88;
	Wed,  5 Feb 2025 16:06:56 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0D820C6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Feb 2025 16:06:50 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 515G0p1F031520;
 Wed, 5 Feb 2025 17:06:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 YzSHclRpZjXdpbypTAK2KFPhVA+qCoQsT3woG1zZJrE=; b=6afy8HNXwQBSd43T
 W8I2uCt96QhaXrBk5F49orAmd1WXv32fTK/pQNTq7dZ5sVTFqy3+EgJJLGjdmL4F
 w+o7QnWoOP8w4G/Ej+ABVk5j0NCslt1Gv94j4UxzHBbV2e0x9k1N4uCqwngeuiru
 j14PHwKduUWpfAf8VBOkUuMBsfX+/F9dqx0zLbw1yU0bcu/pcO84W2iL5BVFvPn5
 xpDHWtADAoB3otEOEDiTJpsh+TGIuuL7GWt6VSDBOtOBTeDzf5r7pU+7fi5xXSpi
 ayDUvTQB+njys7UJbC9LcsyTDFaMz+ru6iXiMDLGdaUiVusXhHRG9RYTzCTtG66/
 qshRwA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 44m2ru2mmc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Feb 2025 17:06:29 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 0C44D40046;
 Wed,  5 Feb 2025 17:05:01 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 489692AF21F;
 Wed,  5 Feb 2025 17:02:21 +0100 (CET)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 5 Feb
 2025 17:02:20 +0100
Message-ID: <6db6e1d4-a0b1-4ce3-9235-d92bb19da1d6@foss.st.com>
Date: Wed, 5 Feb 2025 17:02:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Oleksij Rempel <o.rempel@pengutronix.de>, "Rob Herring (Arm)"
 <robh@kernel.org>
References: <20250203085820.609176-1-o.rempel@pengutronix.de>
 <173859694746.2601652.11244969424431209545.robh@kernel.org>
 <Z6Msn8AxgG_JTVNs@pengutronix.de>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <Z6Msn8AxgG_JTVNs@pengutronix.de>
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-05_06,2025-02-05_03,2024-11-22_01
Cc: Woojung Huh <woojung.huh@microchip.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, kernel@pengutronix.de,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, "David S.
 Miller" <davem@davemloft.net>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v3 0/4] Add support for Priva
	E-Measuringbox board
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

Hi Oleksij

On 2/5/25 10:17, Oleksij Rempel wrote:
> Hi Alexandre,
> 
> On Mon, Feb 03, 2025 at 09:37:06AM -0600, Rob Herring (Arm) wrote:
>>
>> On Mon, 03 Feb 2025 09:58:16 +0100, Oleksij Rempel wrote:
>>> This patch series introduces support for the Priva E-Measuringbox board
>>> based on the ST STM32MP133 SoC. The set includes all the necessary
>>> changes for device tree bindings, vendor prefixes, thermal support, and
>>> board-specific devicetree to pass devicetree validation and checkpatch
>>> tests.
>>>
> 
> ...
> 
>> arch/arm/boot/dts/st/stm32mp133c-prihmb.dtb: adc@48004000: adc@0:interrupts: 0 was expected
>> 	from schema $id: http://devicetree.org/schemas/iio/adc/st,stm32-adc.yaml#
>> arch/arm/boot/dts/st/stm32mp133c-prihmb.dtb: adc@48003000: adc@0:interrupts: 0 was expected
>> 	from schema $id: http://devicetree.org/schemas/iio/adc/st,stm32-adc.yaml#
>
> 
> Can I please get your attention here. The reported issue is not related
> to this patch set. adc@0:interrupts are set in the dtsi file.

Yes I saw this issue too when I tried to merge your series. I'm 
discussing with STM32 ADC driver owner to fix the issue (either in stm32 
adc yaml or maybe in schema).

Anyway we also have the issue for STM32MP135F-DK board so I'll merge 
your series as it doesn't introduce the issue.

regards
Alex




> Kind regards,
> Oleksij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
