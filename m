Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AE32A83D4EF
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Jan 2024 09:52:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 63505C6B476;
	Fri, 26 Jan 2024 08:52:47 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 84C93C6B444
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Jan 2024 08:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com; 
 s=default2211;
 h=Content-Type:MIME-Version:Message-ID:Date:References:
 In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=oxqeIC7ttI03nT3m0P4jBVoLhILJzKjA4P3WHMGd76k=; b=y6BD1jbex9IqxWEA69pQNSDqVH
 D0wyfPojU3G20lcfmkgh3caXY+0zFvYLv8Y5ekKvYk9Ppu/iicTshnhlNd6NBaeici2ZeXDVcxXCU
 k+TP8tVNpunouS3ayFL2Cw09SDIPo2PKzfFcbVOxEEEsEo/zrDk3orOmQ0Nx21nmSsgRDWNwwhBwN
 60ITWFGCgRmafdPAtkvowwFvFy8M5vFjS5Gs0i0L+NZnlSBJvKlszD7L4VwZDvxifQ4L+ZbW2+b+E
 DOGfioj//Pvxrra8sLl9Z0B+7VRS25gox0tt9/4M/Ni8+duLziTaxVw4O93SbzVoB/VL+S2iJXOmE
 O46vT+NQ==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
 by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <esben@geanix.com>)
 id 1rTHx4-000DSM-8S; Fri, 26 Jan 2024 09:52:42 +0100
Received: from [87.49.42.9] (helo=localhost)
 by sslproxy03.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <esben@geanix.com>)
 id 1rTHx3-000LGD-7I; Fri, 26 Jan 2024 09:52:41 +0100
From: Esben Haabendal <esben@geanix.com>
To: rohan.g.thomas@intel.com
In-Reply-To: <20230929051758.21492-1-rohan.g.thomas@intel.com> (rohan g.
 thomas's message of "Fri, 29 Sep 2023 13:17:58 +0800")
References: <20230928180942.GA932326-robh@kernel.org>
 <20230929051758.21492-1-rohan.g.thomas@intel.com>
Date: Fri, 26 Jan 2024 09:52:40 +0100
Message-ID: <87msss4gtj.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27165/Thu Jan 25 10:51:15 2024)
Cc: robh@kernel.org, conor+dt@kernel.org, mcoquelin.stm32@gmail.com,
 devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, fancer.lancer@gmail.com,
 linux-kernel@vger.kernel.org, edumazet@google.com, joabreu@synopsys.com,
 krzysztof.kozlowski+dt@linaro.org, peppe.cavallaro@st.com, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 1/2] dt-bindings: net: snps,
 dwmac: Time Based Scheduling
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

rohan.g.thomas@intel.com writes:

> From: Rohan G Thomas <rohan.g.thomas@intel.com>
>
> On Wed, Sep 27, 2023 at 09:09:18PM +0800, Rohan G Thomas wrote:
>>> Add new property tbs-enabled to enable Time Based Scheduling(TBS)
>>
>>That's not the property you added.
>>
>>> support per Tx queues. TBS feature can be enabled later using ETF
>>> qdisc but for only those queues that have TBS support enabled.
>>
>>This property defines capable or enabled? 
>
> This property is to enable TBS support for any Tx queue. Why this
> added is because I think TBS need not be enabled for all capable
> Tx queues(Tx DMA channels) because of the following hw limitations.
> 1. As per DWMAC QoS and DWXGMAC databooks, TBS cannot coexist with
> TSO. So TBS cannot be enabled for a Tx queue which is for TSO. 
> 2. Also as per DWXGMAC databook, "Do not enable time-based scheduling
> (or enhanced descriptors) for the channel for which TSO or transmit
> timestamp or one-step timestamping control correction feature is
> enabled".
> 3. As per DWXGMAC databook, "Use separate channel (without TBS
> enabled) for time critical traffic. Mixing such traffic with TBS
> enabled traffic can cause delays in transmitting time critical
> traffic."
> More explanation below...
>
>>
>>Seems like OS configuration and policy.
>
> Tx queues need to be configured for TBS during hw setup itself as
> special enhanced descriptors are used by the hw for TBS support
> enabled queues. Switching between enhanced and normal descriptors on
> run is not feasible. So this flag is for enabling "Enhanced
> Descriptors for Time Based Scheduling". This I think is a hw specific
> requirement.

Support for enhanced descriptors is definitely hardware specific.
Enabling the use of enhanced descriptors is a configuration choice.

The tricky part here is that the whole devicetree bindings story for the
stmmac driver is filled with such configuration choices. As such, it is
only natural to add the property you are suggesting here. I completely
agree. But you can also argue that it is "wrong", because it does not
just describe the hardware, but also a configuration choice.

>>Doesn't eh DWMAC have capability registers for supported features? Or
>>did they forget per queue capabilities?
>
> Yes, capability registers are available. For DWMAC5 IP, if TBSSEL bit
> is set, then TBS is supported by all Tx queues.

Not true. Some NXP imx8 and imx9 chips support Synopsys MAC 5.10a IP,
and does not support TBS for queue 0. And they have TBSSEL bit set, but
no TBS_CH support.

> For DWXGMAC IP, if TBSSEL bit is set, then TBS is supported by TBS_CH
> number of Tx queues starting from the highest Tx queue. But because of
> the hw limitations mentioned above, TBS cannot be enabled for all
> capable queues.
>
>>
>>> 
>>> Commit 7eadf57290ec ("net: stmmac: pci: Enable TBS on GMAC5 IPK PCI
>>> entry") enables similar support from the stmmac pci driver.
>>
>>Why does unconditionally enabling TBS work there, but not here?
>
> There, Tx queue 0 is not enabled for TBS as it is used for TSO.
>
>>
>>> 
>>> Signed-off-by: Rohan G Thomas <rohan.g.thomas@intel.com>
>>> ---
>>>  Documentation/devicetree/bindings/net/snps,dwmac.yaml | 8 ++++++++
>>>  1 file changed, 8 insertions(+)
>>> 
>> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/>devicetree/bindings/net/snps,dwmac.yaml
>>> index 5c2769dc689a..db1eb0997602 100644
>>> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>>> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>>> @@ -399,6 +399,14 @@ properties:
>>>              type: boolean
>>>              description: TX checksum offload is unsupported by the TX queue.
>>>  
>>> +          snps,tbs-enabled:
>>> +            type: boolean
>>> +            description:
>>> +              Enable Time Based Scheduling(TBS) support for the TX queue. TSO and
>>> +              TBS cannot be supported by a queue at the same time. If TSO support
>>> +              is enabled, then default TX queue 0 for TSO and in that case don't
>>> +              enable TX queue 0 for TBS.
>>> +
>>>          allOf:
>>>            - if:
>>>                required:
>>> -- 
>>> 2.26.2
>>> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
