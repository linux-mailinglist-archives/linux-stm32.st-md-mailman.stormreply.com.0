Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AE659326D84
	for <lists+linux-stm32@lfdr.de>; Sat, 27 Feb 2021 16:14:16 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 53545C57B59;
	Sat, 27 Feb 2021 15:14:16 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2DDB9C36B37
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 27 Feb 2021 15:14:13 +0000 (UTC)
Received: from archlinux (cpc108967-cmbg20-2-0-cust86.5-4.cable.virginm.net
 [81.101.6.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 09C0164D79;
 Sat, 27 Feb 2021 15:14:08 +0000 (UTC)
Date: Sat, 27 Feb 2021 15:14:05 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Message-ID: <20210227151405.0de48038@archlinux>
In-Reply-To: <YDgzq6t5YRm6cFvO@shinobu>
References: <cover.1613131238.git.vilhelm.gray@gmail.com>
 <c9b55d1cff6acac692a7853b0a25777ecf017b12.1613131238.git.vilhelm.gray@gmail.com>
 <20210214180913.05bd3498@archlinux> <YC98GTwzwt+pkzMO@shinobu>
 <20210221140507.0a5ef57f@archlinux> <YDgzq6t5YRm6cFvO@shinobu>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, o.rempel@pengutronix.de,
 Dan Carpenter <dan.carpenter@oracle.com>, kernel@pengutronix.de,
 fabrice.gasnier@st.com, syednwaris@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 alexandre.torgue@st.com
Subject: Re: [Linux-stm32] [PATCH v8 19/22] counter: Implement
 extension*_name sysfs attributes
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

On Fri, 26 Feb 2021 08:32:59 +0900
William Breathitt Gray <vilhelm.gray@gmail.com> wrote:

> On Sun, Feb 21, 2021 at 02:05:07PM +0000, Jonathan Cameron wrote:
> > On Fri, 19 Feb 2021 17:51:37 +0900
> > William Breathitt Gray <vilhelm.gray@gmail.com> wrote:
> >   
> > > On Sun, Feb 14, 2021 at 06:09:13PM +0000, Jonathan Cameron wrote:  
> > > > On Fri, 12 Feb 2021 21:13:43 +0900
> > > > William Breathitt Gray <vilhelm.gray@gmail.com> wrote:
> > > >     
> > > > > The Generic Counter chrdev interface expects users to supply extension
> > > > > IDs in order to select extensions for requests. In order for users to
> > > > > know what extension ID belongs to which extension this information must
> > > > > be exposed. The extension*_name attribute provides a way for users to
> > > > > discover what extension ID belongs to which extension by reading the
> > > > > respective extension name for an extension ID.
> > > > > 
> > > > > Cc: David Lechner <david@lechnology.com>
> > > > > Cc: Gwendal Grignou <gwendal@chromium.org>
> > > > > Cc: Dan Carpenter <dan.carpenter@oracle.com>
> > > > > Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
> > > > > ---
> > > > >  Documentation/ABI/testing/sysfs-bus-counter |  9 ++++
> > > > >  drivers/counter/counter-sysfs.c             | 51 +++++++++++++++++----
> > > > >  2 files changed, 50 insertions(+), 10 deletions(-)
> > > > > 
> > > > > diff --git a/Documentation/ABI/testing/sysfs-bus-counter b/Documentation/ABI/testing/sysfs-bus-counter
> > > > > index 6353f0a2f8f8..847e96f19d19 100644
> > > > > --- a/Documentation/ABI/testing/sysfs-bus-counter
> > > > > +++ b/Documentation/ABI/testing/sysfs-bus-counter
> > > > > @@ -100,6 +100,15 @@ Description:
> > > > >  		Read-only attribute that indicates whether excessive noise is
> > > > >  		present at the channel Y counter inputs.
> > > > >  
> > > > > +What:		/sys/bus/counter/devices/counterX/countY/extensionZ_name
> > > > > +What:		/sys/bus/counter/devices/counterX/extensionZ_name
> > > > > +What:		/sys/bus/counter/devices/counterX/signalY/extensionZ_name
> > > > > +KernelVersion:	5.13
> > > > > +Contact:	linux-iio@vger.kernel.org
> > > > > +Description:
> > > > > +		Read-only attribute that indicates the component name of
> > > > > +		Extension Z.    
> > > > 
> > > > Good to say what form this takes.    
> > > 
> > > Do you mean a description like this: "Read-only string attribute that
> > > indicates the component name of Extension Z"?  
> > 
> > My expectation would be that the possible strings are tightly constrained
> > (perhaps via review). So I'd like to see what they are and a brief description
> > of what each one means.
> > 
> > Jonathan  
> 
> Okay I see what you mean now. These names will match the sysfs attribute
> filenames. So for example, if Extension 9 of Count 2 of Counter device
> is /sys/bus/counter/devices/counter4/count2/ceiling, then the attribute
> /sys/bus/counter/devices/counter4/count2/extension9_name will hold a
> value of "ceiling".
> 
> The idea is that the user walks down through each extension*_name to
> find sysfs attribute name for the Extension that they want. When they
> find the desired Extension name in say sysfs attribute extension9_name,
> then they know 9 is the ID number for that Extension.
> 
> There is an alternative design I was considering: instead of
> extension*_name attributes, we could have each Extension sysfs attribute
> have a matching *_extension_id attribute which provides the respective
> Extension ID. So for example, using the same Extension as before:
> /sys/bus/counter/devices/counter4/count2/ceiling_extension_id will hold
> a value of 9.
> 
> Do you think this alternative design would be more intuitive to users?
It feels like the user is going to start from what they want to enable
then get the ID from that.   With the current way around they'll have
to search the extensionX_name files to find it, rather than a direct
look up.  So immediate thought is this second way would be easier to
use, but perhaps others think differently.

Jonathan

> 
> William Breathitt Gray

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
