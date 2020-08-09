Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 111B923FE99
	for <lists+linux-stm32@lfdr.de>; Sun,  9 Aug 2020 15:42:31 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9FB24C36B26;
	Sun,  9 Aug 2020 13:42:30 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F0A5BC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  9 Aug 2020 13:42:28 +0000 (UTC)
Received: from archlinux (cpc149474-cmbg20-2-0-cust94.5-4.cable.virginm.net
 [82.4.196.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8E9E6206B6;
 Sun,  9 Aug 2020 13:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596980546;
 bh=z5ggloJNSGbzFqqy5FHmnwMWQ3MZ9nRoSWZRpWR9klU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=2pP5p4l1UBj7LXtrfSEqaHQi1n0qTCP2tOejp5K7tgGCUl6sNPoRWR4+F2B1j36ln
 Fxh9c6u9oZyaisvh5P5Jd3KjTd7l82acjPoytbL3BDvwbNcUOWSlv/RqjfDf98xFkM
 IVcCj3Fm7boVUIEUt1TtKu+9xLkxS1x8Be74b/pM=
Date: Sun, 9 Aug 2020 14:42:21 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: David Lechner <david@lechnology.com>
Message-ID: <20200809144221.6947ea6e@archlinux>
In-Reply-To: <4061c9e4-775e-b7a6-14fa-446de4fae537@lechnology.com>
References: <cover.1595358237.git.vilhelm.gray@gmail.com>
 <e13d43849f68af8227c6aaa0ef672b459d47e9ab.1595358237.git.vilhelm.gray@gmail.com>
 <7209ac3d-d1ca-1b4c-b22c-8d98b13742e2@lechnology.com>
 <20200802210415.GA606173@shinobu>
 <4061c9e4-775e-b7a6-14fa-446de4fae537@lechnology.com>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org,
 alexandre.belloni@bootlin.com, linux-iio@vger.kernel.org,
 patrick.havelange@essensium.com,
 William Breathitt Gray <vilhelm.gray@gmail.com>, linux-kernel@vger.kernel.org,
 David.Laight@ACULAB.COM, mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com,
 syednwaris@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 1/5] counter: Internalize sysfs
	interface code
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

On Mon, 3 Aug 2020 15:00:49 -0500
David Lechner <david@lechnology.com> wrote:

> On 8/2/20 4:04 PM, William Breathitt Gray wrote:
> > On Tue, Jul 28, 2020 at 05:45:53PM -0500, David Lechner wrote:  
> >> On 7/21/20 2:35 PM, William Breathitt Gray wrote:  
> >>> This is a reimplementation of the Generic Counter driver interface.  
> 
> ...
> 
> >>> -F:	include/linux/counter_enum.h
> >>> +F:	include/uapi/linux/counter.h  
> >>
> >> Seems odd to be introducing a uapi header here since this patch doesn't
> >> make any changes to userspace.  
> > 
> > These defines are needed by userspace for the character device
> > interface, but I see your point that at this point in the patchset they
> > don't need to be exposed yet.
> > 
> > I could create temporary include/linux/counter_types.h to house these
> > defines, and then later move them to include/uapi/linux/counter.h in the
> > character device interface introduction patch. Do you think I should do
> > so?  
> 
> Since this patch is independent of the chardev changes and probably ready
> to merge after one more round of review, I would say it probably makes
> sense to just leave them in counter.h for now and move them to uapi when
> the chardev interface is finalized. This way, we can just merge this patch
> as soon as it is ready.
> 
Agreed.

...

> >>>    /**
> >>>     * struct counter_device - Counter data structure
> >>> - * @name:		name of the device as it appears in the datasheet
> >>> + * @name:		name of the device
> >>>     * @parent:		optional parent device providing the counters
> >>> - * @device_state:	internal device state container
> >>> - * @ops:		callbacks from driver
> >>> + * @signal_read:	optional read callback for Signals. The read value of
> >>> + *			the respective Signal should be passed back via the
> >>> + *			value parameter.
> >>> + * @count_read:		optional read callback for Counts. The read value of the
> >>> + *			respective Count should be passed back via the value
> >>> + *			parameter.
> >>> + * @count_write:	optional write callback for Counts. The write value for
> >>> + *			the respective Count is passed in via the value
> >>> + *			parameter.
> >>> + * @function_read:	optional read callback the Count function modes. The
> >>> + *			read function mode of the respective Count should be
> >>> + *			passed back via the function parameter.
> >>> + * @function_write:	option write callback for Count function modes. The
> >>> + *			function mode to write for the respective Count is
> >>> + *			passed in via the function parameter.
> >>> + * @action_read:	optional read callback the Synapse action modes. The
> >>> + *			read action mode of the respective Synapse should be
> >>> + *			passed back via the action parameter.
> >>> + * @action_write:	option write callback for Synapse action modes. The
> >>> + *			action mode to write for the respective Synapse is
> >>> + *			passed in via the action parameter.
> >>>     * @signals:		array of Signals  
> >>
> >> Why not keep the ops struct?  
> > 
> > Defining static ops structures in the drivers seemed to have no
> > advantage when those callbacks are always used via the counter_device
> > structure. I decided it'd be simpler to just set them directly in the
> > counter_device structure then.
> > 
> > I could reorganize them into an ops structure again if there's enough
> > interest.  
> 
> I've been working on really constrained systems lately where every byte
> counts, so this stuck out to me since there would be a copy of all
> functions for each counter instance. But probably not that big of a deal
> in the Linux kernel. :-)
> 
In addition to that..

There are other advantages to keeping an ops structure including
easy function order randomization (for security), plus
the fact that we want to make any function pointers build time assignments
if we possibly can.  Makes them harder to attack.

So in more recent kernel code we try to use ops structures wherever possible.

Jonathan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
