Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D5A785E49
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Aug 2023 19:10:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 66790C6B44C;
	Wed, 23 Aug 2023 17:10:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8A53BC6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Aug 2023 17:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692810623; x=1724346623;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xrRC0v01qmst+o9CFPIeg2m8CpONvn/tnWf4Ftn+KSE=;
 b=MTFzHQI496oHJar1cHN6MdibTi58pk3Zetg12xH48BIibQhdwWVtZZDu
 2jid3BGgzzVVdiEyPUz6+7xyPO8bXsGZaZyabiYiX4ml2k9DINhUCCGJW
 P/c243x9hcUFjuMZmiOzuc7admLAWQhf98H6rgDLpztHkYQ1FofvmaLhf
 OPpGZEpL71yTDQy712eX7/dIWB0ERHCF4uT94bdnEIrWuAwdxEcvxBcI0
 02o9TocJq6wNYhNVyutLc432gZKGR0X+i093IA1zD1Ul21DKjhUpP00jC
 gwQEvuHdyes2sTPG/mGOix0Gc82qKy5t9isiUeXy/GtNTB1xWw9qwLxHc Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="376945465"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="376945465"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2023 10:10:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="806782503"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="806782503"
Received: from pglc00067.png.intel.com ([10.221.207.87])
 by fmsmga004.fm.intel.com with ESMTP; 23 Aug 2023 10:10:15 -0700
From: Rohan G Thomas <rohan.g.thomas@intel.com>
To: fancer.lancer@gmail.com
Date: Thu, 24 Aug 2023 01:10:04 +0800
Message-Id: <20230823171004.6825-1-rohan.g.thomas@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <l7yajzhpuotn62pjkxk43qtcn3u4zltpyqcvo224737bjg3eab@bzu6pirxbvh2>
References: <l7yajzhpuotn62pjkxk43qtcn3u4zltpyqcvo224737bjg3eab@bzu6pirxbvh2>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, conor.dooley@microchip.com,
 linux-stm32@st-md-mailman.stormreply.com, robh+dt@kernel.org,
 linux-kernel@vger.kernel.org, edumazet@google.com, joabreu@synopsys.com,
 krzysztof.kozlowski+dt@linaro.org, peppe.cavallaro@st.com, kuba@kernel.org,
 rohan.g.thomas@intel.com, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v5 1/2] dt-bindings: net: snps,
	dwmac: Tx queues with coe
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

>On Tue, Aug 22, 2023 at 05:15:25PM -0700, Jakub Kicinski wrote:
>> On Sat, 19 Aug 2023 10:31:31 +0800 Rohan G Thomas wrote:
>> > +      snps,tx-queues-with-coe:
>> > +        $ref: /schemas/types.yaml#/definitions/uint32
>> > +        description: number of TX queues that support TX checksum offloading
>> 
>
>> Is it going to be obvious that if not present all queues support
>> checksum offload? I think we should document the default.
>
>This question is debatable:
>1. By default the DW xGMAC and DW QoS Eth IP-cores are
>synthesized with only the very first Tx queue having Tx COE enabled.
>2. If TSO is disabled then the Tx COE can be individually enabled
>for each queue available on DW QoS Eth controller and for the very
>first N queues on DW xGMAC controller.
>3. If TSO is enabled then the Tx COE will be automatically and always
>enabled for as many first queues as there are TSO-capable
>DMA-channels.
>4. At the current state the STMMAC driver assumes that all Tx Queues
>support Tx COE.
>
>The entry 4 can't be changed since we'll risk to catch regressions on
>the platforms with no property specified. On the other hand it partly
>contradicts to the rest of the entries. I don't know what would be a
>correct way to specify the default value in this case. Most likely
>just keep the entry 4 and be done with it.
>
>BTW I just noticed that but the suggested "snps,tx-queues-with-coe"
>property semantic will only cover a DW XGMAC-part of the case 2. DW
>QoS Eth can be synthesized with Tx COE individually enabled for a
>particular queue if TSO is unavailable.

Hi Serge,

Didn't know about a different IP configuration supported by DW QoS Eth IP. If
this is the case, I think we can have a flag 'coe-unsupported' for any TX
queue subnode as below.

+          snps,coe-unsupported:
+            $ref: /schemas/types.yaml#/definitions/flag
+            description:
+              TX checksum offload is unsupported by the TX queue. If TX checksum
+              offload is requested for a packet to be transmitted through this
+              TX queue then have a software fallback in the driver for checksum
+              calculation.

If this is okay, I can rework the patch based on this. Covers both DW QoS Eth IP
and DW XGMAC IP cases.

>
>-Serge(y)
>
>> -- 
>> pw-bot: cr

BR,
Rohan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
