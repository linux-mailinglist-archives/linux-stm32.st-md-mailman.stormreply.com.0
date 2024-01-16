Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 608B182F45E
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Jan 2024 19:36:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1126AC6B476;
	Tue, 16 Jan 2024 18:36:45 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 48B3EC6B457
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Jan 2024 18:36:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 14698CE1919;
 Tue, 16 Jan 2024 18:36:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57C84C433C7;
 Tue, 16 Jan 2024 18:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705430199;
 bh=I2G0ZiEcqMEXhbfeorisjs31sXqvnsEWf2BYWizY+SI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=goRIDPSIwbL/zs316N/BZQYhs5sVT//+8hgnCuelHawmR8qYlsS2SInXbrd48MgNs
 cjrcHQtJWIj4G3ccbeHo0Kgu7FhB8ko45BPPt9Dsa11HQhaNmFEZ99hcRYFecSO75G
 fU2tTSqcAhrI3eT1sphnEHqRmYuD6odsyo66GY5qsF97Fb1rjDkHTdIap+EvceJh45
 dzJXD1spdNmVxuTzBONGcxpPibsWv870ceQAwOAvYp8PCT1SQRvF2jzWOLksV4mRMX
 oZPbHyy2+xLvRBqiwAIMIKqOn+hcz4eB1xyP2MWh5Lro0nZe0ywlmmm2auU0OE/qkN
 6crfKl5Hystug==
Date: Tue, 16 Jan 2024 10:36:37 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Romain Gantois <romain.gantois@bootlin.com>
Message-ID: <20240116103637.794811a6@kernel.org>
In-Reply-To: <d844c643-16bd-6f9d-1d39-a4f93b3fcf87@bootlin.com>
References: <20240111-prevent_dsa_tags-v5-1-63e795a4d129@bootlin.com>
 <20240112181327.505b424e@kernel.org>
 <fca39a53-743e-f79d-d2d1-f23d8e919f82@bootlin.com>
 <20240116072300.3a6e0dbe@kernel.org>
 <d844c643-16bd-6f9d-1d39-a4f93b3fcf87@bootlin.com>
MIME-Version: 1.0
Cc: Vladimir Oltean <olteanv@gmail.com>,
 Richard Tresidder <rtresidd@electromag.com.au>,
 Pascal EBERHARD <pascal.eberhard@se.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Andrew Lunn <andrew@lunn.ch>,
 netdev@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 Sylvain Girard <sylvain.girard@se.com>,
 linux-stm32@st-md-mailman.stormreply.com, stable@vger.kernel.org,
 Vladimir Oltean <vladimir.oltean@nxp.com>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net v5] net: stmmac: Prevent DSA tags from
	breaking COE
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

On Tue, 16 Jan 2024 17:18:30 +0100 (CET) Romain Gantois wrote:
> > which makes it sound like bit 5 will not be set for a Ethernet II frame
> > with unsupported IP payload, or not an IP frame. Does the bit mean other
> > things in different descriptor formats?  
> 
> The description of this bit in my datasheet is:
> 
> ```
> b5 FT Frame Type
> When set, this bit indicates that the Receive Frame is an Ethernet-type frame 
> (the Length/Type field is greater than or equal to 1,536). When this bit is 
> reset, it indicates that the received frame is an IEEE 802.3 frame. This bit is 
> not valid for Runt frames less than 14 bytes
> ```
> 
> There is no mention of a more subtle check to detect non-IP Ethernet II frames. 
> I ran some tests on my hardware and EDSA-tagged packets consistently come in 
> with status 0b100, so the MAC sets the frame type bit even for frames that don't 
> have an IP ethertype.

Boo, who designed this thing :(

v6 is good to go in then, thank you for investigating and testing!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
