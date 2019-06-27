Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A36C58358
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jun 2019 15:22:14 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C928DC06139;
	Thu, 27 Jun 2019 13:22:13 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3D2A5C5719A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jun 2019 13:22:12 +0000 (UTC)
X-Originating-IP: 92.137.69.152
Received: from localhost (alyon-656-1-672-152.w92-137.abo.wanadoo.fr
 [92.137.69.152])
 (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id BD3BD1C0011;
 Thu, 27 Jun 2019 13:22:00 +0000 (UTC)
Date: Thu, 27 Jun 2019 15:22:00 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Wolfram Sang <wsa@the-dreams.de>
Message-ID: <20190627132200.GK3692@piout.net>
References: <1561449642-26956-1-git-send-email-eugen.hristev@microchip.com>
 <1561449642-26956-7-git-send-email-eugen.hristev@microchip.com>
 <4e81d3c9-25f3-ca6e-f2d5-17fad5905bb8@axentia.se>
 <84628b5e-bea7-7d91-f790-f3a2650040fa@microchip.com>
 <20190625093156.GF5690@piout.net> <20190625095533.GC1688@kunai>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190625095533.GC1688@kunai>
User-Agent: Mutt/1.12.0 (2019-05-25)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Nicolas.Ferre@microchip.com,
 Pierre-Yves MORDRET <pierre-yves.mordret@st.com>, linux-kernel@vger.kernel.org,
 Ludovic.Desroches@microchip.com, robh+dt@kernel.org, linux-i2c@vger.kernel.org,
 Eugen.Hristev@microchip.com, peda@axentia.se,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] I2C filtering (was Re: [PATCH v2 6/9]
 dt-bindings: i2c: at91: add binding for enable-ana-filt)
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

On 25/06/2019 11:55:33+0200, Wolfram Sang wrote:
> On Tue, Jun 25, 2019 at 11:31:56AM +0200, Alexandre Belloni wrote:
> > On 25/06/2019 09:14:13+0000, Eugen.Hristev@microchip.com wrote:
> > > > Perhaps
> > > > 
> > > > 	microchip,digital-filter;
> > > > 	microchip,analog-filter;
> > > > 
> > > > ?
> > > 
> > > Hi Peter,
> > > 
> > > Thanks for reviewing. The name of the property does not matter much to 
> > > me, and we have properties prefixed with vendor, and some are not.
> > > 
> > > @Alexandre Belloni: which name you think it's best ?
> > > 
> > 
> > I'm not sure, it depends on whether Wolfram thinks it is generic enough
> > to be used without a vendor prefix.
> 
> I could imagine that we design a generic property for filters. The ones
> above make me wonder, though, because they are bool. I'd think you can
> configure the filters in some way, too?
> 

Apart from enabling the filter there is indeed one configuration
setting, the maximum pulse width of spikes to be suppressed by the input
filter.

> I never used such filtering, so I am unaware of the parameters needed /
> suitable. Quick grepping through I2C master drivers reveals that
> i2c-stm32f7.c also handles filters, but only with default values. Maybe
> DT configuration would be benefitial to that driver, too?
> 
> Adding some people to CC.
> 



-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
