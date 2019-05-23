Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C2B28002
	for <lists+linux-stm32@lfdr.de>; Thu, 23 May 2019 16:42:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 69148CD1DB5
	for <lists+linux-stm32@lfdr.de>; Thu, 23 May 2019 14:42:21 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 631BFCD1DB4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 May 2019 14:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oe0GIDHTZ2hjKY163zBRnNo0jGG1opp88uh5+/y+h7o=; b=CbpAzPlFGvlp5rI0S6srpIYsZK
 bu7DUcdO975IKQ5EjySFuo7UeUxwuDBD9uu2On077lOKnW0f2+eoai89nsWoF3XTSj0k0ndY34jfW
 8vRBDf/DEDlriwcoX+FB8TNNBPFXrJzUwFOLiBqw1393psHPtmv4dbs4Mw7sp5tNRo5Q=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.89)
 (envelope-from <andrew@lunn.ch>)
 id 1hTov9-0005hY-Pl; Thu, 23 May 2019 16:42:15 +0200
Date: Thu, 23 May 2019 16:42:15 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Rob Herring <robh+dt@kernel.org>
Message-ID: <20190523144215.GC19369@lunn.ch>
References: <74d98cc3c744d53710c841381efd41cf5f15e656.1558605170.git-series.maxime.ripard@bootlin.com>
 <CAL_JsqJnFUt55b+AGpcNNjvsKsHNz9PY+b7FJ4+6CMNppzb3vg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAL_JsqJnFUt55b+AGpcNNjvsKsHNz9PY+b7FJ4+6CMNppzb3vg@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 "David S . Miller" <davem@davemloft.net>,
 Maxime Ripard <maxime.ripard@bootlin.com>, netdev <netdev@vger.kernel.org>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart@bootlin.com>,
 Chen-Yu Tsai <wens@csie.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Frank Rowand <frowand.list@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 1/8] dt-bindings: net: Add YAML schemas
 for the generic Ethernet options
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

> > +            link-gpios:
> > +              description:
> > +                GPIO to determine if the link is up
> 
> Only 1?

Hi Rob

Yes, only one.

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
