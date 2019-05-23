Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A73C27B5C
	for <lists+linux-stm32@lfdr.de>; Thu, 23 May 2019 13:07:23 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0E30DCCAF67
	for <lists+linux-stm32@lfdr.de>; Thu, 23 May 2019 11:07:23 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DB7A4CCAF66
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 May 2019 11:07:21 +0000 (UTC)
X-Originating-IP: 90.88.22.185
Received: from localhost (aaubervilliers-681-1-80-185.w90-88.abo.wanadoo.fr
 [90.88.22.185]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 13C8C1BF211;
 Thu, 23 May 2019 11:07:15 +0000 (UTC)
Date: Thu, 23 May 2019 13:07:15 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Jose Abreu <Jose.Abreu@synopsys.com>
Message-ID: <20190523110715.ckyzpec3quxr26cp@flea>
References: <74d98cc3c744d53710c841381efd41cf5f15e656.1558605170.git-series.maxime.ripard@bootlin.com>
 <ba1a5d8ad34a8c9ab99f504c04fbe65bde42081b.1558605170.git-series.maxime.ripard@bootlin.com>
 <78EB27739596EE489E55E81C33FEC33A0B92B864@DE02WEMBXB.internal.synopsys.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <78EB27739596EE489E55E81C33FEC33A0B92B864@DE02WEMBXB.internal.synopsys.com>
User-Agent: NeoMutt/20180716
Cc: Mark Rutland <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Antoine =?utf-8?Q?T=C3=A9nart?= <antoine.tenart@bootlin.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Frank Rowand <frowand.list@gmail.com>,
 "David S . Miller" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 6/8] dt-bindings: net: stmmac: Convert the
 binding to a schemas
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

Hi!

On Thu, May 23, 2019 at 10:11:39AM +0000, Jose Abreu wrote:
> From: Maxime Ripard <maxime.ripard@bootlin.com>
> Date: Thu, May 23, 2019 at 10:56:49
>
> > Switch the STMMAC / Synopsys DesignWare MAC controller binding to a YAML
> > schema to enable the DT validation.
> >
> > Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
>
> How exactly can I see the final results of this ? Do you have any link ?
> (I'm no expert in YAML at all).

You need some extra tooling, that you can find here:
https://github.com/devicetree-org/dt-schema

You can then run make dtbs_check, and those YAML files will be used to
validate that any devicetree using those properties are doing it
properly. That implies having the right node names, properties, types,
ranges of values when relevant, and so on.

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
