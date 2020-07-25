Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D47DE22DA13
	for <lists+linux-stm32@lfdr.de>; Sat, 25 Jul 2020 23:31:35 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8B0A6C36B27;
	Sat, 25 Jul 2020 21:31:35 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 248D1C36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 25 Jul 2020 21:31:34 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4302423D;
 Sat, 25 Jul 2020 23:31:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1595712693;
 bh=jzCVvUJiFPvDHKbRsrvnEOTmmBHou2QVTtxdK9/s4Lk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Pve+7WxW8V+hSFPXgi9ILGg3vNu9mw1T9Nox3aDDACbJzXp3UYhnIM52NXtRXukFZ
 zOzXeUQTklodTH/n7Gc3Bk+zSBs8PZtgmc2dvD5dwIWItrzqrXL407/EXNDElAMnG7
 JMR2PQ+RnmaSCeWYyzvZUcBpCoejD6vbrghvK4DA=
Date: Sun, 26 Jul 2020 00:31:25 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@iki.fi>
Message-ID: <20200725213125.GE6253@pendragon.ideasonboard.com>
References: <20200717132859.237120-1-jacopo+renesas@jmondi.org>
 <20200717132859.237120-9-jacopo+renesas@jmondi.org>
 <20200717205722.GJ5961@pendragon.ideasonboard.com>
 <20200723222259.GB829@valkosipuli.retiisi.org.uk>
 <20200723231549.GE21353@pendragon.ideasonboard.com>
 <20200725211833.GE829@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200725211833.GE829@valkosipuli.retiisi.org.uk>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 robh+dt@kernel.org, Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, slongerbeam@gmail.com,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>, linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 08/13] dt-bindings: media: ov5640: Remove
	data-shift
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

Hi Sakari,

On Sun, Jul 26, 2020 at 12:18:33AM +0300, Sakari Ailus wrote:
> On Fri, Jul 24, 2020 at 02:15:49AM +0300, Laurent Pinchart wrote:
> > On Fri, Jul 24, 2020 at 01:22:59AM +0300, Sakari Ailus wrote:
> > > On Fri, Jul 17, 2020 at 11:57:22PM +0300, Laurent Pinchart wrote:
> > > > Hi Jacopo,
> > > > 
> > > > (CC'ing Sakari)
> > > > 
> > > > Thank you for the patch.
> > > > 
> > > > On Fri, Jul 17, 2020 at 03:28:54PM +0200, Jacopo Mondi wrote:
> > > > > The value of the data-shift property solely depend on the selected
> > > > > bus width and it's not freely configurable.
> > > > > 
> > > > > Remove it from the bindings document and update its users accordingly.
> > > > 
> > > > Hmmmm that's an interesting one. Sakari, what do you think ?
> > > > 
> > > > > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > > > > ---
> > > > >  Documentation/devicetree/bindings/media/i2c/ov5640.yaml | 9 ---------
> > > > >  arch/arm/boot/dts/stm32mp157c-ev1.dts                   | 1 -
> > > > >  2 files changed, 10 deletions(-)
> > > > > 
> > > > > diff --git a/Documentation/devicetree/bindings/media/i2c/ov5640.yaml b/Documentation/devicetree/bindings/media/i2c/ov5640.yaml
> > > > > index 5e1662e848bd..ab700a1830aa 100644
> > > > > --- a/Documentation/devicetree/bindings/media/i2c/ov5640.yaml
> > > > > +++ b/Documentation/devicetree/bindings/media/i2c/ov5640.yaml
> > > > > @@ -92,12 +92,6 @@ properties:
> > > > >                parallel bus.
> > > > >              enum: [8, 10]
> > > > > 
> > > > > -          data-shift:
> > > > > -            description: |
> > > > > -              Shall be set to <2> for 8 bits parallel bus (lines 9:2 are used) or
> > > > > -              <0> for 10 bits parallel bus.
> > > > > -            enum: [0, 2]
> > > > 
> > > > Should you document in the description of bus-width that data-shift is
> > > > implied ?
> > > 
> > > The purpose of the datas-shift property is to convey how the parallel bus
> > > lines are connected for a given bus width for devices where it is
> > > configurable. As this device does not not support that, then indeed this
> > > property is not relevant for the device IMO.
> > 
> > Could you elaborate on this ? I believe the case that Jacopo is
> > describing connects D[9:2] from the sensor to D[7:0] of the receiver
> > (Jacopo, could you confirm ?). Isn't that what data-shift is for ?
> 
> Yes, it is. But in this case what data-shift configures is not configurable
> as such but defined by another configuration, making the data-shift
> property redundant. We generally haven't documented redundant things in DT
> bindings --- for instance data-lanes is documented in bindings only if it
> is configurable.

Then I think we share the same understanding. I believe the
documentation in video-interfaces.txt needs to be expanded, as it's
quite terse and not very clear.

> That said, it'd be nice to say which pins are used on less than full width
> busses.

-- 
Regards,

Laurent Pinchart
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
