Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AB715B2EBF7
	for <lists+linux-stm32@lfdr.de>; Thu, 21 Aug 2025 05:33:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B74DCC3F92F;
	Thu, 21 Aug 2025 03:33:34 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 03A94C3F92E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Aug 2025 03:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=NhecIOpybuUkmVRn+RV36PWvwdJyuFnrfxzmzDFBna8=; b=Hmv4e2X61kfRt4AKpoofe646kq
 +OlNDQvtDGPXi8oms7OYJ/6oEIjEzhjsJL7A5gesXFfDlcKge+jHv9dBJY7j3XTHjRIhzF4LDk1xe
 gSVBZl88aCPwpRJU9bXmBTeLW2ajoPbGtz6VNWFLA7d3SqcqG1hM3eowksQ0wkAClWoE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1uow3G-005P9K-PC; Thu, 21 Aug 2025 05:33:22 +0200
Date: Thu, 21 Aug 2025 05:33:22 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Yijie Yang <yijie.yang@oss.qualcomm.com>
Message-ID: <f93d325f-2c04-49ab-ae92-b87ae88ab49d@lunn.ch>
References: <20250819-qcs615_eth-v4-0-5050ed3402cb@oss.qualcomm.com>
 <20250819-qcs615_eth-v4-2-5050ed3402cb@oss.qualcomm.com>
 <80a60564-3174-4edd-a57c-706431f2ad91@lunn.ch>
 <f467aade-e604-448d-b23e-9b169c30ff2e@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f467aade-e604-448d-b23e-9b169c30ff2e@oss.qualcomm.com>
Cc: Richard Cochran <richardcochran@gmail.com>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, netdev@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Vinod Koul <vkoul@kernel.org>,
 stable+noautosel@kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-arm-msm@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 2/6] net: stmmac: Inverse the phy-mode
	definition
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

On Thu, Aug 21, 2025 at 10:22:05AM +0800, Yijie Yang wrote:
> 
> 
> On 2025-08-20 00:20, Andrew Lunn wrote:
> > >   static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
> > >   {
> > >   	struct device *dev = &ethqos->pdev->dev;
> > > -	int phase_shift;
> > > +	int phase_shift = 0;
> > >   	int loopback;
> > >   	/* Determine if the PHY adds a 2 ns TX delay or the MAC handles it */
> > > -	if (ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_ID ||
> > > -	    ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_TXID)
> > > -		phase_shift = 0;
> > > -	else
> > > +	if (ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_ID)
> > >   		phase_shift = RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN;
> > 
> > Does this one setting control both RX and TX delays? The hardware
> > cannot support 2ns delay on TX, but 0ns on RX? Or 2ns on RX but 0ns on
> > TX?
> > 
> 
> This setting is only for Tx delay. Rx delays are taken care separately with
> DLL delays.

If this is only for Tx delays, why is it also not used for
PHY_INTERFACE_MODE_RGMII_TXID?

It is simpler to just let the PHY add the delays, the PHY drivers get
this right, are well tested, and just work. MAC drivers often get
delays wrong.

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
