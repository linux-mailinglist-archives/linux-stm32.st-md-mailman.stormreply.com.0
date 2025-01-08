Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A3094A05CC3
	for <lists+linux-stm32@lfdr.de>; Wed,  8 Jan 2025 14:29:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5241FC78F6C;
	Wed,  8 Jan 2025 13:29:26 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 84F8DC78F64
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Jan 2025 13:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=8NWugOCTua3U4zM1I0sMTHCzc7ebPizCAQxQ1HTI358=; b=5MCclyICiavifLu+is6XHXo+lL
 JMlKc9c2kEDa4HeGyBpaP//rY02AHLVjfDoVIPuhsn5rQCgm4I0NPI+i0f0mO8/a4sOcbRenvudAh
 ZapVFOfxUZ3YvjWIQ85GWtVRltJHsKjePk3aA+9PwD7Hf1fTQTgzY8gES+EbDBsywjh4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1tVW7L-002Zoo-A9; Wed, 08 Jan 2025 14:29:03 +0100
Date: Wed, 8 Jan 2025 14:29:03 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Yijie Yang <quic_yijiyang@quicinc.com>
Message-ID: <7e046761-7787-4f01-b47b-9374402489ac@lunn.ch>
References: <20241225-support_10m100m-v1-0-4b52ef48b488@quicinc.com>
 <20241225-support_10m100m-v1-2-4b52ef48b488@quicinc.com>
 <4b4ef1c1-a20b-4b65-ad37-b9aabe074ae1@kernel.org>
 <278de6e8-de8f-458a-a4b9-92b3eb81fa77@quicinc.com>
 <e47f3b5c-9efa-4b71-b854-3a5124af06d7@lunn.ch>
 <87a7729d-ccdd-46f0-bcfd-3915452344fd@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87a7729d-ccdd-46f0-bcfd-3915452344fd@quicinc.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, netdev@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Vinod Koul <vkoul@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-msm@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Konrad Dybcio <konradybcio@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 2/3] net: stmmac: qcom-ethqos: Enable RX
 programmable swap on qcs615
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

> > Why is it specific to this board? Does the board have a PHY which is
> > broken and requires this property? What we are missing are the details
> > needed to help you get to the correct way to solve the problem you are
> > facing.
> > 
> 
> Let me clarify why this bit is necessary and why it's board-specific. The RX
> programming swap bit can introduce a time delay of half a clock cycle. This
> bit, along with the clock delay adjustment functionality, is implemented by
> a module called 'IO Macro.' This is a Qualcomm-specific hardware design
> located between the MAC and PHY in the SoC, serving the RGMII interface. The
> bit works in conjunction with delay adjustment to meet the sampling
> requirements. The sampling of RX data is also handled by this module.
> 
> During the board design stage, the RGMII requirements may not have been
> strictly followed, leading to uncertainty in the relationship between the
> clock and data waveforms when they reach the IO Macro.

So this indicates any board might need this feature, not just this one
board. Putting the board name in the driver then does not scale.

> This means the time
> delay introduced by the PC board may not be zero. Therefore, it's necessary
> for software developers to tune both the RX programming swap bit and the
> delay to ensure correct sampling.

O.K. Now look at how other boards tune their delays. There are
standard properties for this:

        rx-internal-delay-ps:
          description:
            RGMII Receive Clock Delay defined in pico seconds. This is used for
            controllers that have configurable RX internal delays. If this
            property is present then the MAC applies the RX delay.
        tx-internal-delay-ps:
          description:
            RGMII Transmit Clock Delay defined in pico seconds. This is used for
            controllers that have configurable TX internal delays. If this
            property is present then the MAC applies the TX delay.

I think you can use these properties, maybe with an additional comment
in the binding. RGMII running at 1G has a clock of 125MHz. That is a
period of 8ns. So a half clock cycle delay is then 4ns.

So an rx-internal-delay-ps of 0-2000 means this clock invert should be
disabled. A rx-internal-delay-ps of 4000-6000 means the clock invert
should be enabled.

Now, ideally, you want the PHY to add the RGMII delays, that is what i
request all MAC/PHY pairs do, so we have a uniform setup across all
boards. So unless the PHY does not support RGMII delays, you would
expect rx-internal-delay-ps to be either just a small number of
picoseconds for fine tuning, or a small number of picoseconds + 4ns
for fine tuning.

This scales, since it can be used by an board with poor design, and it
does not require anything proprietary to Qualcomm, except the extended
range, and hopefully nobody except Qualcomms broken RDK will require
it, because obviously you will document the issue with the RDK and
tell customers how to correctly design their board to be RGMII
compliant with the clocks.

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
