Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5315F7B2B1C
	for <lists+linux-stm32@lfdr.de>; Fri, 29 Sep 2023 07:18:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DD028C6B477;
	Fri, 29 Sep 2023 05:18:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 097E9C6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 29 Sep 2023 05:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695964689; x=1727500689;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QE7xX2WezWE3ftoKtKzbLcE6HA7lPFiTOPv5jyc5Dxg=;
 b=SFh8TI8REFIzzFMInufZ2yWTecVqyPp4W44I1MnRqWLEwHjU8Q0HAUet
 8VboWFNHPETr2vJCxf4daZDUxMB1r1NFDoG38VGvq81smfjh081mc1yjE
 zJcQ53UM7rJ+t89V/NRl1kTX0XZ0oIrKwn+EE5Ox/oFkhfJxlygKOyF/y
 ivMk4XffKz8+63k1XTH90R8SfH9XNQ6wlqo+Cy6wkM4we/0SaqUhew8qO
 nyOYnpqJPkLsc3/wmSRf0WXks67VEAm15g0dQrFE0oRhPBO5gtroMPQaI
 1e6v3ZGJPTgdy5OtTB0cFwCABZNdc2JUCZnTLCZLao3dSjsX4x54UaHV/ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="3807794"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; 
   d="scan'208";a="3807794"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 22:18:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="840171527"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; d="scan'208";a="840171527"
Received: from pglc00352.png.intel.com ([10.221.235.155])
 by FMSMGA003.fm.intel.com with ESMTP; 28 Sep 2023 22:18:02 -0700
From: rohan.g.thomas@intel.com
To: robh@kernel.org
Date: Fri, 29 Sep 2023 13:17:58 +0800
Message-Id: <20230929051758.21492-1-rohan.g.thomas@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20230928180942.GA932326-robh@kernel.org>
References: <20230928180942.GA932326-robh@kernel.org>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 fancer.lancer@gmail.com, linux-kernel@vger.kernel.org, edumazet@google.com,
 joabreu@synopsys.com, krzysztof.kozlowski+dt@linaro.org,
 peppe.cavallaro@st.com, kuba@kernel.org, rohan.g.thomas@intel.com,
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

From: Rohan G Thomas <rohan.g.thomas@intel.com>

On Wed, Sep 27, 2023 at 09:09:18PM +0800, Rohan G Thomas wrote:
>> Add new property tbs-enabled to enable Time Based Scheduling(TBS)
>
>That's not the property you added.
>
>> support per Tx queues. TBS feature can be enabled later using ETF
>> qdisc but for only those queues that have TBS support enabled.
>
>This property defines capable or enabled? 

This property is to enable TBS support for any Tx queue. Why this
added is because I think TBS need not be enabled for all capable
Tx queues(Tx DMA channels) because of the following hw limitations.
1. As per DWMAC QoS and DWXGMAC databooks, TBS cannot coexist with
TSO. So TBS cannot be enabled for a Tx queue which is for TSO. 
2. Also as per DWXGMAC databook, "Do not enable time-based scheduling
(or enhanced descriptors) for the channel for which TSO or transmit
timestamp or one-step timestamping control correction feature is
enabled".
3. As per DWXGMAC databook, "Use separate channel (without TBS
enabled) for time critical traffic. Mixing such traffic with TBS
enabled traffic can cause delays in transmitting time critical
traffic."
More explanation below...

>
>Seems like OS configuration and policy.

Tx queues need to be configured for TBS during hw setup itself as
special enhanced descriptors are used by the hw for TBS support
enabled queues. Switching between enhanced and normal descriptors
on run is not feasible. So this flag is for enabling "Enhanced
Descriptors for Time Based Scheduling". This I think is a hw specific
requirement.

>
>Doesn't eh DWMAC have capability registers for supported features? Or 
>did they forget per queue capabilities?

Yes, capability registers are available. For DWMAC5 IP, if TBSSEL bit
is set, then TBS is supported by all Tx queues. For DWXGMAC IP, if
TBSSEL bit is set, then TBS is supported by TBS_CH number of Tx
queues starting from the highest Tx queue. But because of the hw
limitations mentioned above, TBS cannot be enabled for all capable
queues.

>
>> 
>> Commit 7eadf57290ec ("net: stmmac: pci: Enable TBS on GMAC5 IPK PCI
>> entry") enables similar support from the stmmac pci driver.
>
>Why does unconditionally enabling TBS work there, but not here?

There, Tx queue 0 is not enabled for TBS as it is used for TSO.

>
>> 
>> Signed-off-by: Rohan G Thomas <rohan.g.thomas@intel.com>
>> ---
>>  Documentation/devicetree/bindings/net/snps,dwmac.yaml | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>> 
> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/>devicetree/bindings/net/snps,dwmac.yaml
>> index 5c2769dc689a..db1eb0997602 100644
>> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>> @@ -399,6 +399,14 @@ properties:
>>              type: boolean
>>              description: TX checksum offload is unsupported by the TX queue.
>>  
>> +          snps,tbs-enabled:
>> +            type: boolean
>> +            description:
>> +              Enable Time Based Scheduling(TBS) support for the TX queue. TSO and
>> +              TBS cannot be supported by a queue at the same time. If TSO support
>> +              is enabled, then default TX queue 0 for TSO and in that case don't
>> +              enable TX queue 0 for TBS.
>> +
>>          allOf:
>>            - if:
>>                required:
>> -- 
>> 2.26.2
>> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
