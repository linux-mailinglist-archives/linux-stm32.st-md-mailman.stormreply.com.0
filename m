Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BDFEF9FCC5A
	for <lists+linux-stm32@lfdr.de>; Thu, 26 Dec 2024 18:15:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5D096C78027;
	Thu, 26 Dec 2024 17:15:05 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7E556C78018
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Dec 2024 17:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=OSSYTZhlNYuWLdojci1CHyfJ19u42cVdqr9Ovo7YbXU=; b=rv8yFZ1RdFiszPsIp2g446Jg9r
 5yCZ4KJnEFBfhmqSyNhi30sXvS55XbvmI+NrpvykjyVR9t/PrVw17g0cxYNoeFh7LfF8KdFGyAk4x
 PRg+itdJsllxbbDnd1gzsjgKcUmVulpX3uEAZxPg+UGKNz8KeH3YQWDjUIwFn2kukbSA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1tQrRV-00GQ1U-0i; Thu, 26 Dec 2024 18:14:37 +0100
Date: Thu, 26 Dec 2024 18:14:37 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Yijie Yang <quic_yijiyang@quicinc.com>
Message-ID: <59590ff5-676a-4cd6-a951-96f66972aad4@lunn.ch>
References: <20241225-support_10m100m-v1-0-4b52ef48b488@quicinc.com>
 <6dcfdb0b-c1ec-49f7-927e-531b20264d68@lunn.ch>
 <2aa2c6dd-e3f2-4b9b-8572-20b801edef81@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2aa2c6dd-e3f2-4b9b-8572-20b801edef81@quicinc.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, netdev@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Vinod Koul <vkoul@kernel.org>,
 Jose Abreu <joabreu@synopsys.com>, linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-msm@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Konrad Dybcio <konradybcio@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 0/3] Support tuning the RX sampling swap
	of the MAC.
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

On Thu, Dec 26, 2024 at 11:06:48AM +0800, Yijie Yang wrote:
> 
> 
> On 2024-12-26 01:49, Andrew Lunn wrote:
> > On Wed, Dec 25, 2024 at 06:04:44PM +0800, Yijie Yang wrote:
> > > The Ethernet MAC requires precise sampling times at Rx, but signals on the
> > > Rx side after transmission on the board may vary due to different hardware
> > > layouts. The RGMII_CONFIG2_RX_PROG_SWAP can be used to switch the sampling
> > > occasion between the rising edge and falling edge of the clock to meet the
> > > sampling requirements.
> > 
> > The RGMII specification says that RD[3:0] pins are sampled on the
> > rising edge for bits 3:0 and falling edge for bits 7:4.
> > 
> > Given this is part of the standard, why would you want to do anything
> > else?
> > 
> > Is this maybe another symptom of having the RGMII delays messed up?
> > 
> > Anyway, i don't see a need for this property, unless you are working
> > with a PHY which breaks the RGMII standard, and has its clock
> > reversed?
> 
> Please correct me if there are any errors. As described in the Intel and TI
> design guidelines, Dual Data Rate (DDR), which samples at both edges of the
> clock, is primarily used for 1Gbps speeds. For 100Mbps and 10Mbps speeds,
> Single Data Rate (SDR), which samples at the rising edge of the clock, is
> typically adopted.

If it is typically adopted, why do you need to support falling edge?
Because we can is not a good reason. Do you have a board with a PHY
which requires falling edge for some reason?

	Andrew

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
