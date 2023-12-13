Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 55BFD810DB8
	for <lists+linux-stm32@lfdr.de>; Wed, 13 Dec 2023 10:54:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 07947C6B47F;
	Wed, 13 Dec 2023 09:54:14 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1D356C6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Dec 2023 09:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=7F13S8FLoutiZ3CalADES9Ypom9LrrGw6pCO4/ixxqw=; b=RuvoDMyVMMqqs1yxb8x0Hv1lR0
 MgvpCopZwbFbh/IJm/HmhiDSH5+was538qxsXbKTUCGvI1RgOdw3EukXbMtf4pwwf9A84COngxvsk
 1BE9R0UJ0+69oMZogGPSJ6B9j/7kgyya2bTz0TOfJerchu+fUph//fKvnOTIkCtIR4sQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1rDLwI-002nrP-E7; Wed, 13 Dec 2023 10:54:02 +0100
Date: Wed, 13 Dec 2023 10:54:02 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Sneh Shah <quic_snehshah@quicinc.com>
Message-ID: <428bba44-c0b9-48b2-b4fc-feba3e2245ae@lunn.ch>
References: <20231204084854.31543-1-quic_snehshah@quicinc.com>
 <3e4a1b9c-ed0f-466e-ba11-fc5b7ef308a1@lunn.ch>
 <5d5f3955-fc30-428c-99f4-42f9b7580a84@quicinc.com>
 <0c966845-2bbc-4196-806d-6a33e435bf7d@lunn.ch>
 <dd585977-50c4-40a4-a664-0ecb5a84807a@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dd585977-50c4-40a4-a664-0ecb5a84807a@quicinc.com>
Cc: kernel@quicinc.com, linux-kernel@vger.kernel.org,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, netdev@vger.kernel.org,
 andersson@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Vinod Koul <vkoul@kernel.org>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-arm-msm@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Andrew Halaney <ahalaney@redhat.com>
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: qcom-ethqos: Add
 sysfs nodes for qcom ethqos
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

> >> We need to route vlan traffic of a specific Priority to GVM Queue
> >> (Ethernet queue 5) via programming a MAC register. The MAC register
> >> is not accessible in GVM and has to be programmed from PVM. stmmac
> >> already has TC OPS to program this routing via vlan
> >> priority. However, as PVM has only 4 queues enabled, TC tool will
> >> not take 5th queue as input. Hence, these nodes were added to
> >> conifure the MAC register to route specific vlan packets to 5th
> >> queue in GVM.
> >  
> >> Note: The queues mentioned above are HW MTL Queues and DMA
> >> Channels. The routing can be done in the HW itself based on vlan pcp
> >> before the packets reach to driver.
> > 
> > Is the normal way you would do this is like this:
> > 
> > tc qdisc add dev eth1 parent root handle 100 \
> > mqprio num_tc 4 \
> > map 0 1 2 3 0 0 0 0 0 0 0 0 0 0 0 0 \
> > queues 1@0 1@1 1@2 1@3 \
> > hw 1
> > 
> > But you are saying that you cannot extend this to 5 queues?
> > 
> >     Andrew
> 

> Yes this can't extend to 5 queues. Because, stmmac in primary
> virtual machine will only have 4 netdev queues. So TC won't take
> input for 5th queue.

I still don't understand your architecture. How can you have 5 queues
if the physical hardware only has 4?

Is there any documentation for all this? Any datasheet?

   Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
