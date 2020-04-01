Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E3CC219ABDE
	for <lists+linux-stm32@lfdr.de>; Wed,  1 Apr 2020 14:41:03 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A090FC36B0B;
	Wed,  1 Apr 2020 12:41:03 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 48AFEC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Apr 2020 12:41:01 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=localhost)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1jJcfv-0002fd-Vc; Wed, 01 Apr 2020 14:40:56 +0200
Message-ID: <84ebedc52340f57487f2e75fddef2be1df825d77.camel@pengutronix.de>
From: Lucas Stach <l.stach@pengutronix.de>
To: Marek Vasut <marex@denx.de>, Alexandre Torgue <alexandre.torgue@st.com>,
 linux-arm-kernel@lists.infradead.org
Date: Wed, 01 Apr 2020 14:40:46 +0200
In-Reply-To: <9ed8f864-9bbe-b090-2399-6cea8b088fe2@denx.de>
References: <20200331175811.205153-1-marex@denx.de>
 <20200331175811.205153-14-marex@denx.de>
 <eb93de42-1fa2-e4ee-e104-3c8b57b64c40@st.com>
 <9ed8f864-9bbe-b090-2399-6cea8b088fe2@denx.de>
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [Linux-stm32] [PATCH V3 13/22] ARM: dts: stm32: Enable GPU on
 AV96
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

Am Mittwoch, den 01.04.2020, 14:21 +0200 schrieb Marek Vasut:
> On 4/1/20 11:59 AM, Alexandre Torgue wrote:
> > Hi Marek
> 
> Hi,
> 
> > On 3/31/20 7:58 PM, Marek Vasut wrote:
> > > Enable the GPU present on the STM32MP1 populated on AV96.
> > > 
> > > Reviewed-by: Manivannan Sadhasivam <
> > > manivannan.sadhasivam@linaro.org>
> > > Signed-off-by: Marek Vasut <marex@denx.de>
> > > Cc: Alexandre Torgue <alexandre.torgue@st.com>
> > > Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> > > Cc: Patrice Chotard <patrice.chotard@st.com>
> > > Cc: Patrick Delaunay <patrick.delaunay@st.com>
> > > Cc: linux-stm32@st-md-mailman.stormreply.com
> > > To: linux-arm-kernel@lists.infradead.org
> > > ---
> > > V2: No change
> > > V3: No change
> > > ---
> > >   arch/arm/boot/dts/stm32mp157a-avenger96.dts | 4 ++++
> > >   1 file changed, 4 insertions(+)
> > > 
> > > diff --git a/arch/arm/boot/dts/stm32mp157a-avenger96.dts
> > > b/arch/arm/boot/dts/stm32mp157a-avenger96.dts
> > > index 27c48f988540..19a7a130b148 100644
> > > --- a/arch/arm/boot/dts/stm32mp157a-avenger96.dts
> > > +++ b/arch/arm/boot/dts/stm32mp157a-avenger96.dts
> > > @@ -139,6 +139,10 @@ phy0: ethernet-phy@7 {
> > >       };
> > >   };
> > >   +&gpu {
> > > +    status = "okay";
> > > +};
> > > +
> > 
> > GPU is now enable by so you can drop this patch.
> 
> Why is it enabled by default ? That's somewhat useless on headless
> systems.

The better question is: why wouldn't it be enabled by default? It's a
SoC peripheral and has no external dependencies. Even on a headless
system you can still do stuff like color conversion/balancing via GL in
a video pipeline or something like this. There is simply no good reason
to hide the existence of the GPU.

If you are really concerned about the few ms it takes to initialize the
GPU on boot, you can always choose to not build the driver, or use a
specific DT for your use-case.

Regards,
Lucas

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
