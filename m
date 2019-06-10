Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B52DD3B785
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Jun 2019 16:37:41 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AC252CD5E22
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Jun 2019 14:37:40 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5098FCD5DE0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jun 2019 14:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HYYn865njW+2W8J+eqxrwIHkaNNxdD54yyMpNkodzM0=; b=uxDrju9eEcQmw4Tk8oZUqdFbTK
 3OWC9nYXDuIZpNyADLbkfap6YB15xFamOw8k/X8ZxyjTRLbUDYJrlNxiZHD8nKPjE0o2d4slQ4KGy
 yJHgMQ+OHeNoVFXpDfpPQtEd27s4p5f3gEwPbFhv6ow3I1xXZTxtz55NpI3ARJa4mVBI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.89)
 (envelope-from <andrew@lunn.ch>)
 id 1haLQQ-0007nJ-DG; Mon, 10 Jun 2019 16:37:30 +0200
Date: Mon, 10 Jun 2019 16:37:30 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Maxime Ripard <maxime.ripard@bootlin.com>
Message-ID: <20190610143730.GH28724@lunn.ch>
References: <91618c7e9a5497462afa74c6d8a947f709f54331.1560158667.git-series.maxime.ripard@bootlin.com>
 <664da05aaf9a7029494d72d7c536baa192672fbe.1560158667.git-series.maxime.ripard@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <664da05aaf9a7029494d72d7c536baa192672fbe.1560158667.git-series.maxime.ripard@bootlin.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Florian Fainelli <f.fainelli@gmail.com>,
 Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart@bootlin.com>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Frank Rowand <frowand.list@gmail.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v2 06/11] dt-bindings: net: sun4i-mdio:
 Convert the binding to a schemas
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

On Mon, Jun 10, 2019 at 11:25:45AM +0200, Maxime Ripard wrote:
> Switch our Allwinner A10 MDIO controller binding to a YAML schema to enable
> the DT validation.
> 
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>

Should there be a generic part to cover what is listed in:

Documentation/devicetree/bindings/net/mdio.txt

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
