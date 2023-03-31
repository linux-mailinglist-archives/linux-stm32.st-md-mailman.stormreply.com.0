Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5310A6D2175
	for <lists+linux-stm32@lfdr.de>; Fri, 31 Mar 2023 15:27:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EA362C6905A;
	Fri, 31 Mar 2023 13:27:20 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9917AC65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Mar 2023 13:27:19 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 09B3CB82EAE;
 Fri, 31 Mar 2023 13:27:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ABD5C433D2;
 Fri, 31 Mar 2023 13:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680269237;
 bh=FNfbBuac+lfXIPgQ6rZLOIA4FEfDXjWwi1WDy/J/i1Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YZcpBkshWdInjpxLsM1OJBROP5WFjd6vzUeqcGrsiLAhqRfCO+C25nWM7xV3xJxcX
 IGHF16yN5bTbaVGrzcfdj/8LGOlEQBFdPiqSrhgcr/S3G8UEoOtwvsgOmQd66gnQqV
 Z30fQXqViOkw89Uds2O36clXZNbXN6fAPyPRJNiK/+45vRSZQLZuuKrXs+Q3TMd9NM
 Lo6JMAiM2cqyrki0GRrwaKTx5If3lgPdHcAY69qADq8n0WYnqIJCnXvswrcjSK2OMf
 cAhE/Wr3ENWPFXIM2giREH4sI4Pl0VqSZUCM22AFE1tIK5uoL8Nnu/HA00fmC2oEdY
 sb7xIr3KqcRfg==
Date: Fri, 31 Mar 2023 18:57:13 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Message-ID: <ZCbfsUldPi5dvL0k@matsya>
References: <1869feff-06b1-17f1-4628-b433c858ad79@foss.st.com>
 <20230227151318.1894938-1-m.grzeschik@pengutronix.de>
 <27b9e057-bdd7-b4e6-445c-8da700423600@foss.st.com>
 <20230310104438.GB7352@pengutronix.de>
 <20230320120210.GA26652@pengutronix.de>
 <20230331120627.GJ6000@pengutronix.de> <ZCbd1TyLhBvfEsoE@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZCbd1TyLhBvfEsoE@kroah.com>
Cc: kishon@kernel.org, error27@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com,
 Michael Grzeschik <mgr@pengutronix.de>, mcoquelin.stm32@gmail.com,
 linux-phy@lists.infradead.org, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] phy: stm32-usphyc: add 200 to 300 us
 delay to fix timeout on some machines
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

On 31-03-23, 15:19, Greg KH wrote:
> On Fri, Mar 31, 2023 at 02:06:27PM +0200, Michael Grzeschik wrote:
> > Cc'ing: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > 
> > 
> > On Mon, Mar 20, 2023 at 01:02:10PM +0100, Michael Grzeschik wrote:
> > > Gentle Ping!
> > > 
> > > On Fri, Mar 10, 2023 at 11:44:38AM +0100, Michael Grzeschik wrote:
> > > > Hi Fabrice,
> > > > 
> > > > On Tue, Feb 28, 2023 at 06:28:21PM +0100, Fabrice Gasnier wrote:
> > > > > On 2/27/23 16:13, Michael Grzeschik wrote:
> > > > > > An minimum udelay of 200 us seems to be necessary on some machines. After
> > > > > > the setup of the pll, which needs about 100 us to be locked there seem
> > > > > > to be additional 100 us to get the phy really functional. Without this
> > > > > > delay the usb runs not functional. With this additional short udelay
> > > > > > this issue was not reported again.
> > > > > > 
> > > > > > Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> > > > > > 
> > > > > 
> > > > > Hi Michael,
> > > > > 
> > > > > Thank you for the updates,
> > > > > 
> > > > > Fell free to add my:
> > > > > Reviewed-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> > > > 
> > > > Thanks!
> > > > 
> > > > Through which tree will this be picked?
> > > > Will it be possible to add this to v6.3?
> > 
> > Hi Greg!
> > 
> > Since nobody seem to catch this, is it possible that you pick this?
> 
> What is "this"?  The change to the following file:
> 
> > > > > > ---
> > > > > > v1 -> v2: - changed the mdelay to udelay_range(200, 300), like suggested by fabrice
> > > > > >         - moved the delay to pll enable so it will only be triggered once
> > > > > > 
> > > > > > drivers/phy/st/phy-stm32-usbphyc.c | 3 +++
> > > > > > 1 file changed, 3 insertions(+)
> 
> That one?
> 
> I'm not anywhere on the maintainer path for it:
> 
> $ ./scripts/get_maintainer.pl drivers/phy/st/phy-stm32-usbphyc.c
> Vinod Koul <vkoul@kernel.org> (supporter:GENERIC PHY FRAMEWORK,commit_signer:3/3=100%)
> Kishon Vijay Abraham I <kishon@kernel.org> (supporter:GENERIC PHY FRAMEWORK)
> Maxime Coquelin <mcoquelin.stm32@gmail.com> (maintainer:ARM/STM32 ARCHITECTURE)
> Alexandre Torgue <alexandre.torgue@foss.st.com> (maintainer:ARM/STM32 ARCHITECTURE)
> Philipp Zabel <p.zabel@pengutronix.de> (maintainer:RESET CONTROLLER FRAMEWORK)
> Liam Girdwood <lgirdwood@gmail.com> (supporter:VOLTAGE AND CURRENT REGULATOR FRAMEWORK)
> Mark Brown <broonie@kernel.org> (supporter:VOLTAGE AND CURRENT REGULATOR FRAMEWORK)
> Amelie Delaunay <amelie.delaunay@foss.st.com> (commit_signer:2/3=67%)
> Dan Carpenter <error27@gmail.com> (commit_signer:2/3=67%,authored:2/3=67%,added_lines:4/7=57%)
> Fabrice Gasnier <fabrice.gasnier@foss.st.com> (commit_signer:1/3=33%,authored:1/3=33%,added_lines:3/7=43%,removed_lines:1/1=100%)
> linux-phy@lists.infradead.org (open list:GENERIC PHY FRAMEWORK)
> linux-stm32@st-md-mailman.stormreply.com (moderated list:ARM/STM32 ARCHITECTURE)
> linux-arm-kernel@lists.infradead.org (moderated list:ARM/STM32 ARCHITECTURE)
> linux-kernel@vger.kernel.org (open list)
> 
> 
> What happened to the maintainers involved here?

That would be me, sorry to have missed this one. I should be able to
review and do the needful shortly


-- 
~Vinod
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
