Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A99973CE6
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Sep 2024 18:04:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 11EAEC78011;
	Tue, 10 Sep 2024 16:04:25 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E1EDEC712A2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Sep 2024 16:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=0q5V/HDrRh41vRS9Fz5fpK96NnFQDgfsGbq54/gK0tY=; b=zukOn88ac0n/yjjixjNa40s1sv
 llWM2qRl4mMc7Pt+CvyOs+4A69pme6vbBNYLQIwmPi6z30w7pltfk3vgXyypj59QFxu/A1OPmheEI
 36XfzYEZitalx1+rI9X5TDGBB6Bkj1NjOPFfWvmcIo+G9qYrMBcT3oj3k2MQsRPxMnGw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1so3LY-0077mS-Af; Tue, 10 Sep 2024 18:04:04 +0200
Date: Tue, 10 Sep 2024 18:04:04 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Suraj Jaiswal <jsuraj@qti.qualcomm.com>
Message-ID: <417420b8-3010-4223-a683-55a0daf3b962@lunn.ch>
References: <20240902095436.3756093-1-quic_jsuraj@quicinc.com>
 <yy2prsz3tjqwjwxgsrumt3qt2d62gdvjwqsti3favtfmf7m5qs@eychxx5qz25f>
 <CYYPR02MB9788D9D0D2424B4F8361A736E79A2@CYYPR02MB9788.namprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CYYPR02MB9788D9D0D2424B4F8361A736E79A2@CYYPR02MB9788.namprd02.prod.outlook.com>
Cc: "Suraj Jaiswal \(QUIC\)" <quic_jsuraj@quicinc.com>,
 Eric Dumazet <edumazet@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, Rob Herring <robh@kernel.org>,
 kernel <kernel@quicinc.com>, Jose Abreu <joabreu@synopsys.com>,
 Andy Gross <agross@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Prasad Sodagudi <psodagud@quicinc.com>, Andrew Halaney <ahalaney@redhat.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 "bhupesh.sharma@linaro.org" <bhupesh.sharma@linaro.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: Stop using a single
 dma_map() for multiple descriptors
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

> On Mon, Sep 02, 2024 at 03:24:36PM GMT, Suraj Jaiswal wrote:
> > Currently same page address is shared
> > between multiple buffer addresses and causing smmu fault for other 
> > descriptor if address hold by one descriptor got cleaned.
> > Allocate separate buffer address for each descriptor for TSO path so 
> > that if one descriptor cleared it should not clean other descriptor 
> > address.
> 
> I think maybe you mean something like:
> 
>     Currently in the TSO case a page is mapped with dma_map_single(), and then
>     the resulting dma address is referenced (and offset) by multiple
>     descriptors until the whole region is programmed into the descriptors.
> 
>     This makes it possible for stmmac_tx_clean() to dma_unmap() the first of the
>     already processed descriptors, while the rest are still being processed
>     by the DMA engine. This leads to an iommu fault due to the DMA engine using
>     unmapped memory as seen below:
> 
>     <insert splat>
> 
>     You can reproduce this easily by <reproduction steps>.
> 
>     To fix this, let's map each descriptor's memory reference individually.
>     This way there's no risk of unmapping a region that's still being
>     referenced by the DMA engine in a later descriptor.
> 
> That's a bit nitpicky wording wise, but your first sentence is hard for me to follow (buffer addresses seems to mean descriptor?). I think showing a splat and mentioning how to reproduce is always a bonus as well.

What might also be interesting is some benchmark
numbers. dma_map_single() is not always cheap, since it has to flush
the cache. I've no idea if only the first call is expensive, and all
the subsequent calls are cheap? Depending on how expensive it is, some
sort of refcounting might be cheaper?

     Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
