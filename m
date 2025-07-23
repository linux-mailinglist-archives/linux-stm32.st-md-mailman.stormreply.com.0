Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 64CDDB0F580
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Jul 2025 16:38:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EB2DEC36B3F;
	Wed, 23 Jul 2025 14:38:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 12A98C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Jul 2025 14:38:30 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NDqKnl004953;
 Wed, 23 Jul 2025 16:38:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 ybWW2x8fDcj+N5hV7PM0YQEibulS1fH0S8JJpPe47GY=; b=LybQKPjRkNFAQoU9
 jItT0px77hEvmRmGQGwlo1zkH7+hdzJESsucEbEjPfO9Shhwb23BFMH3CtJ1CNoa
 PDKwJjTf0D7Pep+h+c2+IS70t9IB4OwLQU1AVRdhGvSXPbvl6182Q8+4IXFOBZm0
 EeXVOGrWybDqCpSmHuokH7MKzCUEoDbrbiQyqKn9o16voLXmvGKBo5HOOdvZXRB5
 /3pNmrQ+U2AO778De/wACI3+ZXPu8zvJkFusYHtxJFuPhlXhiI9fwTFTbVGIbxFc
 xWBdmUhOz5RkOd2jITayDh21zcAKqAYgCsU/yTU2ysR4Zl9QduPsLgVvgND8DZ97
 BA4+7A==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4800g8v8ss-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Jul 2025 16:38:01 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C013440046;
 Wed, 23 Jul 2025 16:36:18 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 26AD077F15C;
 Wed, 23 Jul 2025 16:35:14 +0200 (CEST)
Received: from [10.48.87.141] (10.48.87.141) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Jul
 2025 16:35:13 +0200
Message-ID: <7a900f56-355e-42f7-93fe-be5a586cc083@foss.st.com>
Date: Wed, 23 Jul 2025 16:35:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
References: <20250721-wol-smsc-phy-v1-1-89d262812dba@foss.st.com>
 <faea23d5-9d5d-4fbb-9c6a-a7bc38c04866@kernel.org>
 <f5c4bb6d-4ff1-4dc1-9d27-3bb1e26437e3@foss.st.com>
 <e3c99bdb-649a-4652-9f34-19b902ba34c1@lunn.ch>
 <38278e2a-5a1b-4908-907e-7d45a08ea3b7@foss.st.com>
 <5b8608cb-1369-4638-9cda-1cf90412fc0f@lunn.ch>
 <383299bb-883c-43bf-a52a-64d7fda71064@foss.st.com>
 <2563a389-4e7c-4536-b956-476f98e24b37@lunn.ch>
 <aH_yiKJURZ80gFEv@shell.armlinux.org.uk>
 <5a2e0cd8-6d20-4f5a-a3a0-9010305509e3@foss.st.com>
 <aICpe63iqldl9NFd@shell.armlinux.org.uk>
Content-Language: en-US
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <aICpe63iqldl9NFd@shell.armlinux.org.uk>
X-Originating-IP: [10.48.87.141]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_02,2025-07-23_01,2025-03-28_01
Cc: Andrew Lunn <andrew@lunn.ch>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Eric Dumazet <edumazet@google.com>, linux-stm32@st-md-mailman.stormreply.com,
 Rob Herring <robh@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
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



On 7/23/25 11:20, Russell King (Oracle) wrote:
> On Wed, Jul 23, 2025 at 10:50:12AM +0200, Gatien CHEVALLIER wrote:
>> On 7/22/25 22:20, Russell King (Oracle) wrote:
>>> On Tue, Jul 22, 2025 at 03:40:16PM +0200, Andrew Lunn wrote:
>>>> I know Russell has also replied about issues with stmmac. Please
>>>> consider that when reading what i say... It might be not applicable.
>>>>
>>>>> Seems like a fair and logical approach. It seems reasonable that the
>>>>> MAC driver relies on the get_wol() API to know what's supported.
>>>>>
>>>>> The tricky thing for the PHY used in this patchset is to get this
>>>>> information:
>>>>>
>>>>> Extract from the documentation of the LAN8742A PHY:
>>>>> "The WoL detection can be configured to assert the nINT interrupt pin
>>>>> or nPME pin"
>>>>
>>>> https://www.kernel.org/doc/Documentation/devicetree/bindings/power/wakeup-source.txt
>>>>
>>>> It is a bit messy, but in the device tree, you could have:
>>>>
>>>>       interrupts = <&sirq 0 IRQ_TYPE_LEVEL_LOW>
>>>>                    <&pmic 42 IRQ_TYPE_LEVEL_LOW>;
>>>>       interrupt-names = "nINT", "wake";
>>>>       wakeup-source
>>>>
>>>> You could also have:
>>>>
>>>>       interrupts = <&sirq 0 IRQ_TYPE_LEVEL_LOW>;
>>>>       interrupt-names = "wake";
>>>>       wakeup-source
>>>>
>>>> In the first example, since there are two interrupts listed, it must
>>>> be using the nPME. For the second, since there is only one, it must be
>>>> using nINT.
>>>>
>>>> Where this does not work so well is when you have a board which does
>>>> not have nINT wired, but does have nPME. The phylib core will see
>>>> there is an interrupt and request it, and disable polling. And then
>>>> nothing will work. We might be able to delay solving that until such a
>>>> board actually exists?
>>>
>>> (Officially, I'm still on vacation...)
>>>
>>> At this point, I'd like to kick off a discussion about PHY-based
>>> wakeup that is relevant to this thread.
>>>
>>> The kernel has device-based wakeup support. We have:
>>>
>>> - device_set_wakeup_capable(dev, flag) - indicates that the is
>>>     capable of waking the system depending on the flag.
>>>
>>> - device_set_wakeup_enable(dev, flag) - indicates whether "dev"
>>>     has had wake-up enabled or disabled depending on the flag.
>>>
>>> - dev*_pm_set_wake_irq(dev, irq) - indicates to the wake core that
>>>     the indicated IRQ is capable of waking the system, and the core
>>>     will handle enabling/disabling irq wake capabilities on the IRQ
>>>     as appropriate (dependent on device_set_wakeup_enable()). Other
>>>     functions are available for wakeup IRQs that are dedicated to
>>>     only waking up the system (e.g. the WOL_INT pin on AR8031).
>>>
>>> Issue 1. In stmmac_init_phy(), we have this code:
>>>
>>>           if (!priv->plat->pmt) {
>>>                   struct ethtool_wolinfo wol = { .cmd = ETHTOOL_GWOL };
>>>
>>>                   phylink_ethtool_get_wol(priv->phylink, &wol);
>>>                   device_set_wakeup_capable(priv->device, !!wol.supported);
>>>                   device_set_wakeup_enable(priv->device, !!wol.wolopts);
>>>           }
>>>
>>> This reads the WoL state from the PHY (a different struct device)
>>> and sets the wakeup capability and enable state for the _stmmac_
>>> device accordingly, but in the case of PHY based WoL, it's the PHY
>>> doing the wakeup, not the MAC. So this seems wrong on the face of
>>> it.
>>
>> 2 cents: Maybe even remove in stmmac_set_wol() if !priv->plat->pmt.
> 
> On the face of it, that seems like a sane solution, but sadly we
> can't do that. If we did, then at least Jetson Xavier NX would break if
> WoL were enabled, because DT describes the PHY interrupt, and currently
> the PHY driver switches the interrupt pin from interrupt mode (where it
> signals link changes) to PMEB mode (where it only pulses when a wake-up
> packet is received) when WoL is enabled at the PHY. This will mean
> phylib won't receive link state interrupts anymore, so unplugging/
> replugging the cable won't be detected by phylib.
> 
> Even my further suggestions do not get us to a state where we can pass
> the set_wol() to the PHY, and then work out what the MAC needs to do,
> because e.g. in the case of RTL8211F, even if we use the "wakeup-source"
> to fix the above, we still have the problem of "is wake-up supported
> by the PHY wiring or is it not". We just have not described that in the
> DT trees for platforms, so this is basically unknown.
> 

Yes but the PHY is described as board level, so for each board, each
vendor/industrial/amateur has the knowledge of the pin being wired.
or not. Therefore, the "wakeup-source" property could be added only
if that's the case, couldn't it? Maybe I'm missing something.

This way, the PHY driver could ultimately return an AND of the property
being present and the PHY WoL capabilities for wol.supported field.
However, that's seems a bit messy and suggests not relying on pmt being
present when setting WoL for stmmac and other reworks in other places.

TBH I'm not sure how to handle this without massive changes...

> Adding any logic to the kernel to make that decision will cause
> regressions - either by making WoL unavailable on platforms where it
> previously worked (e.g. because PHY WoL was being used) or the opposite
> (where MAC WoL was used but now PHY WoL gets used but isn't wired.)
> 
> This is why I say we've boxed ourselves into a corner on this - this is
> not phylib maintainers fault, because we can't know everything about
> every device out there, and we don't have time to read every damn data
> sheet which may or may not be publically available. We have to go by
> what submitters provide us, which leads to problems like this.
> 
> So, we need flexibility from everyone to try and find a way forward.
> We can't have people sticking to ideals - such as DT maintainers being
> rigid about "DT describes hardware only". As I've already stated, our
> DT currently does *not* describe hardware with respect to PHY wake-up,
> and because this has been overlooked, we're now in a mess where there
> is *no* easy solutions, and no solution that could be said to purely
> describe hardware.
> 
> If we didn't have any PHY drivers, and were starting afresh, then we
> would have the latitude to come up with something clean. That boat has
> long since sailed.
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
