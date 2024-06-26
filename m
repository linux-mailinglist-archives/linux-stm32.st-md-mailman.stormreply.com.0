Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F823918560
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Jun 2024 17:10:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F0ED1C71282;
	Wed, 26 Jun 2024 15:10:58 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 26F62C6DD9F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jun 2024 15:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=5m14rGTG9LmbrjjJ/l2NwU7Y0IP12ob5tulLHsA6h8Y=; b=x5uAcgRSuDey6PsbTz4RgEk3QC
 drc99olvsjw4sho1UzY7/RgPeU+6fqMXABv4CCYbvOHKAIvSvbybYg3tum5gjF2jlknX8p6SVbSQi
 9aaPjlimypP6O7gE7ewL7dQEICSVKlTqAqjToRvGJSov3kD/jukiN1oByp9Y0KBMx+iE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1sMUI7-0013Aj-CP; Wed, 26 Jun 2024 17:10:35 +0200
Date: Wed, 26 Jun 2024 17:10:35 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Andrew Halaney <ahalaney@redhat.com>
Message-ID: <d2bb85e4-fab5-49fe-aaf0-9d1bf2279e3d@lunn.ch>
References: <20240625-icc_bw_voting_from_ethqos-v2-0-eaa7cf9060f0@quicinc.com>
 <20240625-icc_bw_voting_from_ethqos-v2-3-eaa7cf9060f0@quicinc.com>
 <qf4zl7qupkzbrb6ik4v4nkjct7tsh34cmoufy23zozcht5gch6@kvymsd2ue6cd>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <qf4zl7qupkzbrb6ik4v4nkjct7tsh34cmoufy23zozcht5gch6@kvymsd2ue6cd>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 kernel@quicinc.com, linux-kernel@vger.kernel.org,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, devicetree@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Sagar Cheluvegowda <quic_scheluve@quicinc.com>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 3/3] net: stmmac: Bring down the clocks
 to lower frequencies when mac link goes down
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

> I'm still curious if any of the netdev folks have any opinion on scaling
> things down like this on link down.

It does make sense, in that there are no frames to process, so the
clock can be reduced. But i also think it is a bit of a workaround for
poor hardware design. Often you can tell the MAC the link is down, and
it can shut down a lot more, and even turn all the clocks off.

I also wounder if there are going to be any side effects of this. Some
Ethernet MACs export a clock to the PHY. Is that clock going to
change? I don't think it will, because we are changing to a valid MAC
speed, not 0. So the PHY has to work at this speed clock.

But to make it easier to find issues like this, open() should probably
set the clocks to a low speed until the link is up. That way, if there
are going to be problems, the link should never come up, as opposed to
the link never comes up after being lost the first time...

     Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
