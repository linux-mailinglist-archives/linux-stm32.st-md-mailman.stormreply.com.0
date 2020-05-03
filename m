Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6531C2D21
	for <lists+linux-stm32@lfdr.de>; Sun,  3 May 2020 16:52:53 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 635EEC36B16;
	Sun,  3 May 2020 14:52:53 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8AA32C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  3 May 2020 14:52:52 +0000 (UTC)
Received: from archlinux (cpc149474-cmbg20-2-0-cust94.5-4.cable.virginm.net
 [82.4.196.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 918FD206F0;
 Sun,  3 May 2020 14:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588517571;
 bh=xXDUieDuCzRqcEpqQa4OH8QkYBoUMGQ7uE6Ln2swCE8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BwzIx5JNlgm+xPpdHNmK6Ug/5+tkTXai709h5BlOsaYVzJ70JQUz02hooslHlBOpm
 cvowAwVs5jIu5veh1ttXQnvWEGfN4Feo4hghFrLb49giSYHDa16woOeomwk/qq32g5
 L/RSkXW+YBlKnRkpnbcJgJIo7mU7ZHX4hiwzt2Zo=
Date: Sun, 3 May 2020 15:52:45 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: David Lechner <david@lechnology.com>
Message-ID: <20200503155245.08916211@archlinux>
In-Reply-To: <a6402ade-648d-6e49-85cd-a7fd7f58fd1d@lechnology.com>
References: <cover.1588176662.git.vilhelm.gray@gmail.com>
 <a6402ade-648d-6e49-85cd-a7fd7f58fd1d@lechnology.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org,
 felipe.balbi@linux.intel.com, linux-iio@vger.kernel.org, syednwaris@gmail.com,
 William Breathitt Gray <vilhelm.gray@gmail.com>, linux-kernel@vger.kernel.org,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 patrick.havelange@essensium.com, fabrice.gasnier@st.com,
 fabien.lahoudere@collabora.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 0/4] Introduce the Counter character
	device interface
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

On Wed, 29 Apr 2020 15:21:05 -0500
David Lechner <david@lechnology.com> wrote:

> On 4/29/20 1:11 PM, William Breathitt Gray wrote:
> > Over the past couple years we have noticed some shortcomings with the
> > Counter sysfs interface. Although useful in the majority of situations,
> > there are certain use-cases where interacting through sysfs attributes
> > can become cumbersome and inefficient. A desire to support more advanced
> > functionality such as timestamps, multi-axis positioning tables, and
> > other such latency-sensitive applications, has motivated a reevaluation
> > of the Counter subsystem. I believe a character device interface will be
> > helpful for this more niche area of counter device use.  
> 
> Nice to see some progress being made. :-)
> 
> > 
> > Interaction with Counter character devices occurs via ioctl commands.
> > This allows userspace applications to access and set counter data using
> > native C datatypes rather than working through string translations.  
> 
> For most aspects of the counter subsystem, this is not an issue since
> configuring a counter is not a time-sensitive operation. Instead of
> ioctls, I was expecting to just be able to read the character device
> and receive counter events or poll to wait for events similar to how
> the input subsystem works or how buffers work in the iio subsystem.
> 
> I'm afraid I don't really see much use in having ioctls that do
> exactly what sysfs already does. And my intuition tells me that the
> extra work needed to maintain it will probably cost more than any
> benefit gained. (Maybe other have a different experience that leads
> to a different conclusion?)

I agree with David here.  The ioctls are currently doing what could have
been done nicely with a userspace library.  Moving away from the string
based internal interface is a good move to my mind, because it ensures
consistency in they sysfs interface and provides for in kernel users
when they make sense.  The step of then using that to simplify providing
an IOCTL interface to do the same things doesn't seem particularly useful.
So what do we gain?

Jonathan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
