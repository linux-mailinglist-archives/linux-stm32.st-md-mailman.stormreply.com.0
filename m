Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 98527757CE9
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Jul 2023 15:10:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5BCC5C6B442;
	Tue, 18 Jul 2023 13:10:29 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8482AC65E70
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Jul 2023 13:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=ZObdJe8z/FH7zyHM59qxcKSRiK8MNQZG6bz1KjetFWc=; b=bGSb5YgyK1ofKeyANqnrfWiqLC
 DunnFcwfGSxCdPLD3qDwwGLCxZscB1JWxVai2j/EBpGbjtLA1LxBqwnuMz9Fuj14fatVofdQGOcXR
 Hwf2ATdxNjd+iLwFzCe7lKFiw7Zeeg/tdGOC6wda1EHC3F4y4XN0A9BjoTzEXPyXXK8g=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1qLkT1-001cvq-KC; Tue, 18 Jul 2023 15:10:15 +0200
Date: Tue, 18 Jul 2023 15:10:15 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Marco Felsch <m.felsch@pengutronix.de>
Message-ID: <9214ae14-b501-4d94-9d52-fd7dab2a86af@lunn.ch>
References: <20230717164307.2868264-1-m.felsch@pengutronix.de>
 <20230717164307.2868264-2-m.felsch@pengutronix.de>
 <cd8c177e-7840-4636-a039-dbe8884b3d2b@lunn.ch>
 <20230718083841.p67wflhjlwnu56j4@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230718083841.p67wflhjlwnu56j4@pengutronix.de>
Cc: kernel@pengutronix.de, joabreu@synopsys.com, conor+dt@kernel.org,
 mcoquelin.stm32@gmail.com, devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 edumazet@google.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 peppe.cavallaro@st.com, kuba@kernel.org, pabeni@redhat.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 2/2] net: stmmac: platform: add
 support for phy-supply
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

On Tue, Jul 18, 2023 at 10:38:41AM +0200, Marco Felsch wrote:
> On 23-07-18, Andrew Lunn wrote:
> > > +static int stmmac_phy_power(struct platform_device *pdev,
> > > +			    struct plat_stmmacenet_data *plat,
> > > +			    bool enable)
> > > +{
> > > +	struct regulator *regulator = plat->phy_regulator;
> > > +	int ret = 0;
> > > +
> > > +	if (regulator) {
> > > +		if (enable)
> > > +			ret = regulator_enable(regulator);
> > > +		else
> > > +			regulator_disable(regulator);
> > > +	}
> > > +
> > > +	if (ret)
> > > +		dev_err(&pdev->dev, "Fail to enable regulator\n");
> > 
> > 'enable' is only correct 50% of the time.
> 
> You mean to move it under the enable path.

Or don't use the word 'enable'. 'modify' ?

> Good point didn't consider WOL. Is there a way to check if WOL is
> enabled?

Yes, plenty of MAC drivers do this. Look around.

     Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
