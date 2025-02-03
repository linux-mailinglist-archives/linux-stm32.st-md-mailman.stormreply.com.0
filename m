Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F758A25856
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Feb 2025 12:40:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DB791C78F7C;
	Mon,  3 Feb 2025 11:40:32 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 845D1C7802B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Feb 2025 11:40:31 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F1CA511FB;
 Mon,  3 Feb 2025 03:40:54 -0800 (PST)
Received: from [10.1.34.25] (e122027.cambridge.arm.com [10.1.34.25])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A8C9C3F58B;
 Mon,  3 Feb 2025 03:40:27 -0800 (PST)
Message-ID: <303db538-97ae-4582-a476-f90749c04cff@arm.com>
Date: Mon, 3 Feb 2025 11:40:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
References: <20250203093419.25804-1-steven.price@arm.com>
 <Z6CckJtOo-vMrGWy@shell.armlinux.org.uk>
 <811ea27c-c1c3-454a-b3d9-fa4cd6d57e44@arm.com>
 <Z6Clkh44QgdNJu_O@shell.armlinux.org.uk>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <Z6Clkh44QgdNJu_O@shell.armlinux.org.uk>
Cc: Furong Xu <0x1207@gmail.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Petr Tesarik <petr@tesarici.cz>, netdev@vger.kernel.org,
 Yanteng Si <si.yanteng@linux.dev>, linux-stm32@st-md-mailman.stormreply.com,
 Serge Semin <fancer.lancer@gmail.com>, linux-kernel@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Xi Ruoyao <xry111@xry111.site>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: Allow zero for
	[tr]x_fifo_size
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 03/02/2025 11:16, Russell King (Oracle) wrote:
> On Mon, Feb 03, 2025 at 11:01:28AM +0000, Steven Price wrote:
>> [Moved Kunihiko to the To: line]
>>
>> On 03/02/2025 10:38, Russell King (Oracle) wrote:
>>> On Mon, Feb 03, 2025 at 09:34:18AM +0000, Steven Price wrote:
>>>> Commit 8865d22656b4 ("net: stmmac: Specify hardware capability value
>>>> when FIFO size isn't specified") modified the behaviour to bail out if
>>>> both the FIFO size and the hardware capability were both set to zero.
>>>> However devices where has_gmac4 and has_xgmac are both false don't use
>>>> the fifo size and that commit breaks platforms for which these values
>>>> were zero.
>>>>
>>>> Only warn and error out when (has_gmac4 || has_xgmac) where the values
>>>> are used and zero would cause problems, otherwise continue with the zero
>>>> values.
>>>>
>>>> Fixes: 8865d22656b4 ("net: stmmac: Specify hardware capability value when FIFO size isn't specified")
>>>> Tested-by: Xi Ruoyao <xry111@xry111.site>
>>>> Signed-off-by: Steven Price <steven.price@arm.com>
>>>
>>> I'm still of the opinion that the original patch set was wrong, and
>>> I was thinking at the time that it should _not_ have been submitted
>>> for the "net" tree (it wasn't fixing a bug afaics, and was a risky
>>> change.)
>>>
>>> Yes, we had multiple places where we have code like:
>>>
>>>         int rxfifosz = priv->plat->rx_fifo_size;
>>>         int txfifosz = priv->plat->tx_fifo_size;
>>>
>>>         if (rxfifosz == 0)
>>>                 rxfifosz = priv->dma_cap.rx_fifo_size;
>>>         if (txfifosz == 0)
>>>                 txfifosz = priv->dma_cap.tx_fifo_size;
>>>
>>>         /* Split up the shared Tx/Rx FIFO memory on DW QoS Eth and DW XGMAC */
>>>         if (priv->plat->has_gmac4 || priv->plat->has_xgmac) {
>>>                 rxfifosz /= rx_channels_count;
>>>                 txfifosz /= tx_channels_count;
>>>         }
>>>
>>> and this is passed to stmmac_dma_rx_mode() and stmmac_dma_tx_mode().
>>>
>>> We also have it in the stmmac_change_mtu() path for the transmit side,
>>> which ensures that the MTU value is not larger than the transmit FIFO
>>> size (which is going to fail as it's always done before or after the
>>> original patch set, and whether or not your patch is applied.)
>>>
>>> Now, as for the stmmac_dma_[tr]x_mode(), these are method functions
>>> calling into the DMA code. dwmac4, dwmac1000, dwxgmac2, dwmac100 and
>>> sun8i implement methods for this.
>>>
>>> Of these, dwmac4, dwxgmac2 makes use of the value passed into
>>> stmmac_dma_[tr]x_mode() - both of which initialise dma.[tr]x_fifo_size.
>>> dwmac1000, dwmac100 and sun8i do not make use of it.
>>>
>>> So, going back to the original patch series, I still question the value
>>> of the changes there - and with your patch, it makes their value even
>>> less because the justification seemed to be to ensure that
>>> priv->plat->[tr]x_fifo_size contained a sensible value. With your patch
>>> we're going back to a situation where we allow these to effectively be
>>> "unset" or zero.
>>>
>>> I'll ask the question straight out - with your patch applied, what is
>>> the value of the original four patch series that caused the breakage?
>>>
>>
>> I've no opinion whether the original series "had value" - I'm just 
>> trying to fix the breakage that entailed. My first attempt at a patch 
>> was indeed a (partial) revert, but Andrew was keen to find a better 
>> solution[1].
> 
> There are two ways to fix the breakage - either revert the original
> patches (which if they have little value now would be the sensible
> approach IMHO) or try to fix them up, which may entail several patches
> if further breakage is found.
> 
> Does the flow control test behave the same before and after the patch
> series? Please can you test that?

Yes I see the same results from "ethtool -t eth0" on v6.13 and after
applying this patch on v6.14-rc1. Although neither exactly look healthy:

The test result is FAIL
The test extra info:
 1. MAC Loopback               	 0
 2. PHY Loopback               	 -110
 3. MMC Counters               	 0
 4. EEE                        	 -95
 5. Hash Filter MC             	 0
 6. Perfect Filter UC          	 -110
 7. MC Filter                  	 -110
 8. UC Filter                  	 0
 9. Flow Control               	 -110
10. RSS                        	 -95
11. VLAN Filtering             	 -95
12. VLAN Filtering (perf)      	 -95
13. Double VLAN Filter         	 -95
14. Double VLAN Filter (perf)  	 -95
15. Flexible RX Parser         	 -95
16. SA Insertion (desc)        	 -95
17. SA Replacement (desc)      	 -95
18. SA Insertion (reg)         	 -95
19. SA Replacement (reg)       	 -95
20. VLAN TX Insertion          	 -95
21. SVLAN TX Insertion         	 -95
22. L3 DA Filtering            	 -95
23. L3 SA Filtering            	 -95
24. L4 DA TCP Filtering        	 -95
25. L4 SA TCP Filtering        	 -95
26. L4 DA UDP Filtering        	 -95
27. L4 SA UDP Filtering        	 -95
28. ARP Offload                	 -95
29. Jumbo Frame                	 1
30. Multichannel Jumbo         	 -95
31. Split Header               	 -95
32. TBS (ETF Scheduler)        	 -95

But I'll admit I've no idea what I'm doing here, so perhaps I don't have
a correct setup for running these tests?

Thanks,
Steve

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
