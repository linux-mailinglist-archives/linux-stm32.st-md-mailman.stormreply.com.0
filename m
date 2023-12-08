Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0008C80A43D
	for <lists+linux-stm32@lfdr.de>; Fri,  8 Dec 2023 14:14:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A9339C6A613;
	Fri,  8 Dec 2023 13:14:54 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A2A82C65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Dec 2023 13:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=ZyIwn9UadV4oPIAt3Iw42rESNqNPVByooLrrQQomUoM=; b=ger+sbf5lz0mDcCnoWzUZY5VJZ
 331/0+XOXQ3TDJx6pxgjZkvNXuIOKiSXl0bnfVoKevRgfS8+oOwPYLaOzzBF9oSFaSCUI4q7beqp6
 xaWGCzgV5R4wM4L4ANuvF+WoOTV6mxqDlrWxirqTZbivw+YSflI8rsYmr9IKKRdU3oKw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1rBagj-002PvD-33; Fri, 08 Dec 2023 14:14:41 +0100
Date: Fri, 8 Dec 2023 14:14:41 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Andrew Halaney <ahalaney@redhat.com>
Message-ID: <9eddb32d-c798-4e1b-b0ea-c44d31cc29bf@lunn.ch>
References: <20231206-stmmac-no-mdio-node-v2-1-333cae49b1ca@redhat.com>
 <e64b14c3-4b80-4120-8cc4-9baa40cdcb75@lunn.ch>
 <nx2qggr3aget4t57qbosj6ya5ocq47t6w33ve5ycabs5mzvo7c@vctjvc5gip5d>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <nx2qggr3aget4t57qbosj6ya5ocq47t6w33ve5ycabs5mzvo7c@vctjvc5gip5d>
Cc: linux-kernel@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, netdev@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2] net: stmmac: don't create a
 MDIO bus if unnecessary
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

> I know you said the standard is to make the MDIO bus unconditionally, but
> to me that feels like a waste, and describing say an empty MDIO bus
> (which would set the phy_mask for us eventually and not scan a
> bunch of phys, untested but I think that would work) seems like a bad
> description in the devicetree (I could definitely see describing an
> empty MDIO bus getting NACKed, but that's a guess).

DT describes the hardware. The MDIO bus master exists. So typically
the SoC .dtsi file would include it in the Ethernet node. At the SoC
level it is empty, unless there is an integrated PHY in the SoC. The
board .dts file then adds any PHYs to the node which the board
actually has.

So i doubt adding an empty MDIO node to the SoC .dtsi file will get
NACKed, it correctly describes the hardware.

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
