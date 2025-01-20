Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 656E0A170BC
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Jan 2025 17:50:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 09F10C78018;
	Mon, 20 Jan 2025 16:50:17 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6321DC6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Jan 2025 16:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=FoFI85rkVFBhTO2so9SNQoSkivg8MsoOQMlqZ8as4og=; b=D33MXrMklXGaGHGOc2v/lGG1Cq
 wAXHeEbVrNr4AwJ5BVzB9A/TubsknReXImJIK2XPWJDQkwQv43Zg6810meNNRzo5JN7zyFWbLKeIN
 prsrIGwQpsKyFYnbZ74p4Nv3EVmgQmnTI5dhxuMKqdhxLiIcsNiNrUvzreXGfdmNGJ2I=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1tZuyJ-006OCq-8Z; Mon, 20 Jan 2025 17:49:55 +0100
Date: Mon, 20 Jan 2025 17:49:55 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Yijie Yang <quic_yijiyang@quicinc.com>
Message-ID: <0fe23cfd-9326-4664-9c94-cf010aec882c@lunn.ch>
References: <20241225-support_10m100m-v1-0-4b52ef48b488@quicinc.com>
 <20241225-support_10m100m-v1-2-4b52ef48b488@quicinc.com>
 <4b4ef1c1-a20b-4b65-ad37-b9aabe074ae1@kernel.org>
 <278de6e8-de8f-458a-a4b9-92b3eb81fa77@quicinc.com>
 <e47f3b5c-9efa-4b71-b854-3a5124af06d7@lunn.ch>
 <87a7729d-ccdd-46f0-bcfd-3915452344fd@quicinc.com>
 <7e046761-7787-4f01-b47b-9374402489ac@lunn.ch>
 <5bc3f4e0-6c3f-412c-a825-54707c70f779@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5bc3f4e0-6c3f-412c-a825-54707c70f779@quicinc.com>
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

> > So this indicates any board might need this feature, not just this one
> > board. Putting the board name in the driver then does not scale.
> > 
> 
> Should I ignore this if I choose to use the following standard properties?

You should always follow standard properties unless they don't
work. And if they don't work, your commit message needs to explain why
they don't work forcing your to do something special.

> > > This means the time
> > > delay introduced by the PC board may not be zero. Therefore, it's necessary
> > > for software developers to tune both the RX programming swap bit and the
> > > delay to ensure correct sampling.
> > 
> > O.K. Now look at how other boards tune their delays. There are
> > standard properties for this:
> > 
> >          rx-internal-delay-ps:
> >            description:
> >              RGMII Receive Clock Delay defined in pico seconds. This is used for
> >              controllers that have configurable RX internal delays. If this
> >              property is present then the MAC applies the RX delay.
> >          tx-internal-delay-ps:
> >            description:
> >              RGMII Transmit Clock Delay defined in pico seconds. This is used for
> >              controllers that have configurable TX internal delays. If this
> >              property is present then the MAC applies the TX delay.
> > 
> > I think you can use these properties, maybe with an additional comment
> > in the binding. RGMII running at 1G has a clock of 125MHz. That is a
> > period of 8ns. So a half clock cycle delay is then 4ns.
> > 
> > So an rx-internal-delay-ps of 0-2000 means this clock invert should be
> > disabled. A rx-internal-delay-ps of 4000-6000 means the clock invert
> > should be enabled.
> 
> This board was designed to operate at different speed rates, not a fixed
> speed, and the clock rate varies for each speed. Thus, the delay introduced
> by inverting the clock is not fixed. Additionally, I noticed that some
> vendors apply the same routine for this property across all speeds in their
> driver code. Can this property be used just as a flag, regardless of its
> actual value?

Maybe you should go read the RGMII standard, and then think about how
your hardware actually works.

RGMII always has a variable clock, with different clock speeds for
10/100/1G. So your board design is just plain normal, not
special. Does the standard talk about different delays for different
speeds? As you say, other drivers apply the same delay for all
speeds. Why should your hardware be special?

RGMII has been around for 25 years. Do you really think your RGMII
implementation needs something special which no other implementation
has needed in the last 25 years?

> > Now, ideally, you want the PHY to add the RGMII delays, that is what i
> > request all MAC/PHY pairs do, so we have a uniform setup across all
> > boards. So unless the PHY does not support RGMII delays, you would
> > expect rx-internal-delay-ps to be either just a small number of
> > picoseconds for fine tuning, or a small number of picoseconds + 4ns
> > for fine tuning.
> 
> The delay for both TX and RX sides is added by the MAC in the Qualcomm
> driver, which was introduced by the initial patch. I believe there may be a
> refactor in the future to ensure it follows the requirements.
 
You can do it in the MAC. But you probably want to clearly document
this, that your design is different to > 95% of systems in Linux which
have the PHY do the delays.

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
