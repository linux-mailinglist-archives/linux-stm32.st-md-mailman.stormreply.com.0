Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 009D2583B5
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jun 2019 15:39:41 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BFE82C06E8E;
	Thu, 27 Jun 2019 13:39:40 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 391A7C06E77
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jun 2019 13:39:40 +0000 (UTC)
X-Originating-IP: 92.137.69.152
Received: from localhost (alyon-656-1-672-152.w92-137.abo.wanadoo.fr
 [92.137.69.152])
 (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id AAFAF60018;
 Thu, 27 Jun 2019 13:39:33 +0000 (UTC)
Date: Thu, 27 Jun 2019 15:39:32 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Wolfram Sang <wsa@the-dreams.de>
Message-ID: <20190627133932.GL3692@piout.net>
References: <1561449642-26956-1-git-send-email-eugen.hristev@microchip.com>
 <1561449642-26956-7-git-send-email-eugen.hristev@microchip.com>
 <4e81d3c9-25f3-ca6e-f2d5-17fad5905bb8@axentia.se>
 <84628b5e-bea7-7d91-f790-f3a2650040fa@microchip.com>
 <20190625093156.GF5690@piout.net> <20190625095533.GC1688@kunai>
 <20190627132200.GK3692@piout.net>
 <eb2d87b7-437c-53ee-a1ca-37c4d3fadea6@microchip.com>
 <20190627133440.GA7158@ninjato>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190627133440.GA7158@ninjato>
User-Agent: Mutt/1.12.0 (2019-05-25)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Nicolas.Ferre@microchip.com,
 pierre-yves.mordret@st.com, linux-kernel@vger.kernel.org,
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

On 27/06/2019 15:34:40+0200, Wolfram Sang wrote:
> 
> > > Apart from enabling the filter there is indeed one configuration
> > > setting, the maximum pulse width of spikes to be suppressed by the input
> > > filter.
> 
> Yup, this is what I anticipated.
> 
> > This is a number 0 to 7 (3 bits) that represents the width of the spike 
> > in periph clock cycles.
> 
> For a generic binding, we would need some time-value as a parameter and
> convert it to clock cycles in the driver then, I'd think.
> 

Yes, that is what I was going to suggest.


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
