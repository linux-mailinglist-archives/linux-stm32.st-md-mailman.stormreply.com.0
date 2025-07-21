Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A24A3B0C85A
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Jul 2025 18:00:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 534A7C32E8F;
	Mon, 21 Jul 2025 16:00:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 056C6C349C7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Jul 2025 16:00:12 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56LF5RUS011179;
 Mon, 21 Jul 2025 17:59:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 rsxdTCztBKYXlx+C4LuG8AeZggJrpJdUJ0Xm76EVhB4=; b=UvbfVzpuufx4byKp
 qcX7btJ++p/Dy6hnVJx1aUaEKMxpo1BBXfeXWmxfbJ1FmZnGrmlKIR21eP62pD3a
 Xt7q5wtTkXo7k3/l9DPZMxYeZGnqnkFzbo+zlGTbs83v4JhpISvnaDaqs/c8+Fmz
 WPGuk9MwHDXlF/xKTKnQ+9ieU5I/cjaGcsjLlgk8fwEvlLy3TV9NKigRQP94CTKq
 XlIpIXEBxXv8/KMUp3Zyyf2HI8+58l6IR4Ykhgkbn31gV+Wytx78wXmnacjBM+sR
 cM4tNVzKKl8At5JokIGjLbSPJH9dDz9ksPFtC+etuglhlBKhOXmswwzs8MzbtcT6
 IbCvgw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48028g1d9g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Jul 2025 17:59:51 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A0CE040046;
 Mon, 21 Jul 2025 17:58:12 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 34BFE76EA8F;
 Mon, 21 Jul 2025 17:56:19 +0200 (CEST)
Received: from [10.48.87.141] (10.48.87.141) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 21 Jul
 2025 17:56:18 +0200
Message-ID: <38278e2a-5a1b-4908-907e-7d45a08ea3b7@foss.st.com>
Date: Mon, 21 Jul 2025 17:56:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andrew Lunn <andrew@lunn.ch>
References: <20250721-wol-smsc-phy-v1-0-89d262812dba@foss.st.com>
 <20250721-wol-smsc-phy-v1-1-89d262812dba@foss.st.com>
 <faea23d5-9d5d-4fbb-9c6a-a7bc38c04866@kernel.org>
 <f5c4bb6d-4ff1-4dc1-9d27-3bb1e26437e3@foss.st.com>
 <e3c99bdb-649a-4652-9f34-19b902ba34c1@lunn.ch>
Content-Language: en-US
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <e3c99bdb-649a-4652-9f34-19b902ba34c1@lunn.ch>
X-Originating-IP: [10.48.87.141]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_04,2025-07-21_02,2025-03-28_01
Cc: Christophe Roullier <christophe.roullier@foss.st.com>,
 Eric Dumazet <edumazet@google.com>, linux-stm32@st-md-mailman.stormreply.com,
 Rob Herring <robh@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Russell King <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Simon Horman <horms@kernel.org>, Tristram Ha <Tristram.Ha@microchip.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 1/4] dt-bindings: net: document
 st, phy-wol property
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

Hello Andrew,

On 7/21/25 15:18, Andrew Lunn wrote:
> On Mon, Jul 21, 2025 at 02:10:48PM +0200, Gatien CHEVALLIER wrote:
>> Hello Krzysztof,
>>
>> On 7/21/25 13:30, Krzysztof Kozlowski wrote:
>>> On 21/07/2025 13:14, Gatien Chevallier wrote:
>>>> The "st,phy-wol" property can be set to use the wakeup capability of
>>>> the PHY instead of the MAC.
>>>
>>>
>>> And why would that be property of a SoC or board? Word "can" suggests
>>> you are documenting something which exists, but this does not exist.
>> Can you elaborate a bit more on the "not existing" part please?
>>
>> For the WoL from PHY to be supported, the PHY line that is raised
>> (On nPME pin for this case) when receiving a wake up event has to be
>> wired to a wakeup event input of the Extended interrupt and event
>> controller(EXTI), and that's implementation dependent.
> 
> How does this differ from normal interrupts from the PHY? Isn't the
> presence of an interrupt in DT sufficient to indicate the PHY can wake
> the system?
> 
> 	Andrew

Here's an extract from the Microchip datasheet for the LAN8742A PHY:

"In addition to the main interrupts described in this section, an nPME
pin is provided exclusively for WoL specific interrupts."

I'm not an expert of the different PHYs, but I guess there may be a
distinction needed between some "main" PHY interrupts and the WoL one
at least for deep low-power use cases.

Because this line is wired to a peripheral managed by our
TEE, the ultimate goal here would be to declare the OP-TEE node as
an interrupt provider and to forward the interrupt to the kernel using
the asynchronous notification mechanism. Then, reference the OP-TEE
node in the "interrupts-extended" property in the PHY node so that it
can be acked by the PHY driver. As of now, this patch set at least allow
to wakeup from a deep low power mode using the WoL capability of the
PHY.

Regarding this property, somewhat similar to "mediatek,mac-wol",
I need to position a flag at the mac driver level. I thought I'd go
using the same approach.

Best regards,
Gatien



_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
