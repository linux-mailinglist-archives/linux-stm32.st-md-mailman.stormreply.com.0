Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EF76E1C2C91
	for <lists+linux-stm32@lfdr.de>; Sun,  3 May 2020 14:55:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 94095C36B11;
	Sun,  3 May 2020 12:55:07 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8A67EC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  3 May 2020 12:55:05 +0000 (UTC)
Received: from archlinux (cpc149474-cmbg20-2-0-cust94.5-4.cable.virginm.net
 [82.4.196.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5892520757;
 Sun,  3 May 2020 12:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588510504;
 bh=KCKCMBkmmw/LbQq3L2XpZoFryPWfOj1OfuZUm2ZaWCU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=hycPYQGJzzVyhw5GYLqZgCXHX4CCIyndZPoG8wquHh55na8UueM4SiWJwUWT7NzLz
 EKqKQ1VYircPbGtfyCQj3GGrdFRph1dx2PHqsUBq2vbM/MiskrQxar+A6Pv4wP0TXi
 huamDBl6CPTwQarigW8Wrs21jMZUZJgdZ80z4zl0=
Date: Sun, 3 May 2020 13:54:58 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <20200503135458.38debbbf@archlinux>
In-Reply-To: <20200503092316.GA570888@kroah.com>
References: <cover.1588176662.git.vilhelm.gray@gmail.com>
 <20200430201345.GX51277@piout.net> <20200501154519.GA4581@icarus>
 <20200502175536.1e9ac944@archlinux>
 <20200503092316.GA570888@kroah.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: kamel.bouhara@bootlin.com,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, david@lechnology.com,
 felipe.balbi@linux.intel.com, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, gwendal@chromium.org,
 William Breathitt Gray <vilhelm.gray@gmail.com>, syednwaris@gmail.com,
 mcoquelin.stm32@gmail.com, patrick.havelange@essensium.com,
 fabrice.gasnier@st.com, fabien.lahoudere@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
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

On Sun, 3 May 2020 11:23:16 +0200
Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:

> On Sat, May 02, 2020 at 05:55:36PM +0100, Jonathan Cameron wrote:
> > On Fri, 1 May 2020 11:46:10 -0400
> > William Breathitt Gray <vilhelm.gray@gmail.com> wrote:
> >   
> > > On Thu, Apr 30, 2020 at 10:13:45PM +0200, Alexandre Belloni wrote:  
> > > > Hi,
> > > > 
> > > > On 29/04/2020 14:11:34-0400, William Breathitt Gray wrote:    
> > > > > Over the past couple years we have noticed some shortcomings with the
> > > > > Counter sysfs interface. Although useful in the majority of situations,
> > > > > there are certain use-cases where interacting through sysfs attributes
> > > > > can become cumbersome and inefficient. A desire to support more advanced
> > > > > functionality such as timestamps, multi-axis positioning tables, and
> > > > > other such latency-sensitive applications, has motivated a reevaluation
> > > > > of the Counter subsystem. I believe a character device interface will be
> > > > > helpful for this more niche area of counter device use.
> > > > > 
> > > > > To quell any concerns from the offset: this patchset makes no changes to
> > > > > the existing Counter sysfs userspace interface -- existing userspace
> > > > > applications will continue to work with no modifications necessary. I
> > > > > request that driver maintainers please test their applications to verify
> > > > > that this is true, and report any discrepancies if they arise.
> > > > >     
> > > > 
> > > > On that topic, I'm wondering why the counter subsystem uses /sys/bus
> > > > instead of /sys/class that would be more natural for a class of devices.
> > > > I can't see how counters would be considered busses. I think you should
> > > > consider moving it over to /sys/class (even if deprecating
> > > > /sys/bus/counter will be long).    
> > > 
> > > At the time I wasn't quite familiar with sysfs development so I was
> > > following the iio sysfs code rather closely. However, I see now that
> > > you're probably right: this isn't really a bus but rather a collection
> > > of various types of counters -- i.e. a class of devices.
> > > 
> > > Perhaps I should migrate this then to /sys/class/counter. Of course, the
> > > /sys/bus/counter location will have to remain for compatibility with
> > > existing applications, but I think a simple symlink to the new
> > > /sys/class/counter location should suffice for that.
> > > 
> > > If anyone sees an issue with this give me a heads up.  
> > To just address this point as I've not read the rest of the thread yet...
> > 
> > I would resist moving it.  This one is an old argument. 
> > 
> > Some info in https://lwn.net/Articles/645810/
> > As that puts it a "bus" is better known as a "subsystem".
> > 
> > When we originally considered class vs bus for IIO, the view expressed
> > at the times was that the whole separation of the two didn't mean anything
> > and for non trivial cases bus was always preferred.  It's nothing to do
> > with with whether the thing is a bus or not.  Now I suppose it's possible
> > opinion has moved on this topic...    However, I'd say there
> > is really 0 advantage in moving an existing subsystem even if opinion
> > has changed.
> > 
> > +CC Greg in case he wants to add anything.  
> 
> Traditionally classes are a unified way of representing data to
> userspace, independant of the physical transport that the data came to
> userspace on (i.e. input devices are a class, it doesn't matter if they
> came on serial, USB, PS/2, or virtual busses.)
> 
> A bus is traditionally a collection of drivers that all talk on a same
> physical transport, that then expose data from that transport to a
> specific userspace class.  Again, think USB mice drivers, serial mice
> drivers, PS/2 mice drivers.
> 
> Busses bind a driver to a device it creates based on that "bus".
> Classes create virtual devices that export data to userspace for a
> specific common protocol.
> 
> Does that help?
> 
> One can argue (and have properly in the past), that classes and busses
> really are not all that different, and there used to be code floating
> around that made them the same exact thing in the kernel, with loads of
> userspace sysfs symlinks to preserve things, but those are well out of
> date and I don't think anyone feels like reviving them.  However I think
> systemd might still have code in it to work properly if that ever
> happens, haven't looked in a few years...
> 
> thanks,
> 
> greg k-h

Thanks for the explanation. Here key thing to my mind is counters went
in as a bus and should stay so because there is limited benefit in a move
and it would be ABI breaking.  Maybe it 'should' have been a class, but
too late now.

Jonathan

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
