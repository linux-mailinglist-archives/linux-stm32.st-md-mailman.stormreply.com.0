Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EBDAAB0C495
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Jul 2025 14:57:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9A686C32E8F;
	Mon, 21 Jul 2025 12:57:55 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E77C0C349C7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Jul 2025 12:57:53 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56LBu24b002202;
 Mon, 21 Jul 2025 14:57:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 QrwPvtm0Y3jVd4A8YMJUm1x2eIlSHpKGIqbTIjvz8DE=; b=0GGCxJo2waUxHJ5n
 tpo0ZXAtI2x1IQX/mSnLBB2UWXUm8KIM1YYSdht2vwrAt8hPJ60gHkJ9BkepTsne
 S6KPhuKi4YiazGtGYy5f5sIGs+ghPVjqj9+9VKWwaThEd7P9mYmLu8eNGwEF+kuH
 VU323u+2uJqOfjh4cDh4NednVsafixyjGv9DsnOex5IwjRzRjQ9LH40CI/E6S/VG
 hMXz2PONOqf/yvjBjBmz48SmTtMEoo8sKfROTPM2HNWb434oTuu/G2B2AM+6HQJa
 lV06ykGVAFC8KcrkY6CBGg3schMPNtzYlYSC24vAmGVdCLnhnZbGadm1S2SADXcV
 G62OpQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4802q211x4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Jul 2025 14:57:32 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id BDF4C40057;
 Mon, 21 Jul 2025 14:56:01 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5B8B37A63A1;
 Mon, 21 Jul 2025 14:54:41 +0200 (CEST)
Received: from [10.48.87.141] (10.48.87.141) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 21 Jul
 2025 14:54:40 +0200
Message-ID: <5c7dd351-2fca-4a96-b911-c79d326d82df@foss.st.com>
Date: Mon, 21 Jul 2025 14:54:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzk@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Christophe Roullier <christophe.roullier@foss.st.com>, Andrew Lunn
 <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, Simon Horman <horms@kernel.org>, Tristram Ha
 <Tristram.Ha@microchip.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>
References: <20250721-wol-smsc-phy-v1-0-89d262812dba@foss.st.com>
 <20250721-wol-smsc-phy-v1-1-89d262812dba@foss.st.com>
 <faea23d5-9d5d-4fbb-9c6a-a7bc38c04866@kernel.org>
 <f5c4bb6d-4ff1-4dc1-9d27-3bb1e26437e3@foss.st.com>
 <b220ae01-81b5-47f1-bf99-9aa0903995e1@kernel.org>
Content-Language: en-US
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <b220ae01-81b5-47f1-bf99-9aa0903995e1@kernel.org>
X-Originating-IP: [10.48.87.141]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_04,2025-07-21_01,2025-03-28_01
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
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



On 7/21/25 14:16, Krzysztof Kozlowski wrote:
> On 21/07/2025 14:10, Gatien CHEVALLIER wrote:
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
> 
> 
> Where does this property exist that you suggest that a new binding "can"
> use it?
> 

I'm not sure if you're only targeting the wording here?

I found this property: "mediatek,mac-wol". Its non-presence sets the
same flag AFAICT.

I need to set the flag so that the stmmac_set_wol() in
drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c eventually
reaches the PHY driver.

>>
>> For the WoL from PHY to be supported, the PHY line that is raised
>> (On nPME pin for this case) when receiving a wake up event has to be
>> wired to a wakeup event input of the Extended interrupt and event
>> controller(EXTI), and that's implementation dependent.
> 
> 
> So it is not "can" but some implementations do not have proper wiring.
> You need to justify your commits and changes.
> 

Ok, does:
In case of proper wiring from the PHY to a wake up event input,
set the "st,phy-wol" to indicate that the PHY WoL capability is
preferred over the MAC one.

seems better?

> 
> 
> Best regards,
> Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
