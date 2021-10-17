Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 65984430A3B
	for <lists+linux-stm32@lfdr.de>; Sun, 17 Oct 2021 17:35:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 148E6C5C847;
	Sun, 17 Oct 2021 15:35:21 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EBA25C32E90
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 17 Oct 2021 15:35:18 +0000 (UTC)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 719CE240003;
 Sun, 17 Oct 2021 15:35:16 +0000 (UTC)
Date: Sun, 17 Oct 2021 17:35:16 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Greg KH <gregkh@linuxfoundation.org>
Message-ID: <YWxCtGcJ8s4gjgZj@piout.net>
References: <cover.1632884256.git.vilhelm.gray@gmail.com>
 <b8b8c64b4065aedff43699ad1f0e2f8d1419c15b.1632884256.git.vilhelm.gray@gmail.com>
 <YWwqE5T6h5j14M/M@kroah.com> <YWwtAm0o6wVMG6xc@piout.net>
 <YWw1zoGX6SwSEVw/@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YWw1zoGX6SwSEVw/@kroah.com>
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 William Breathitt Gray <vilhelm.gray@gmail.com>, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, o.rempel@pengutronix.de,
 jarkko.nikula@linux.intel.com, linux-arm-kernel@lists.infradead.org,
 kernel@pengutronix.de, Dan Carpenter <dan.carpenter@oracle.com>,
 fabrice.gasnier@st.com, syednwaris@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, jic23@kernel.org,
 alexandre.torgue@st.com
Subject: Re: [Linux-stm32] [PATCH v17 2/9] counter: Add character device
	interface
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

On 17/10/2021 16:40:14+0200, Greg KH wrote:
> On Sun, Oct 17, 2021 at 04:02:42PM +0200, Alexandre Belloni wrote:
> > On 17/10/2021 15:50:11+0200, Greg KH wrote:
> > > Note, review of this now that it has been submitted in a pull request to
> > > me, sorry I missed this previously...
> > > 
> > > On Wed, Sep 29, 2021 at 12:15:59PM +0900, William Breathitt Gray wrote:
> > > > +static int counter_chrdev_open(struct inode *inode, struct file *filp)
> > > > +{
> > > > +	struct counter_device *const counter = container_of(inode->i_cdev,
> > > > +							    typeof(*counter),
> > > > +							    chrdev);
> > > > +
> > > > +	/* Ensure chrdev is not opened more than 1 at a time */
> > > > +	if (!atomic_add_unless(&counter->chrdev_lock, 1, 1))
> > > > +		return -EBUSY;
> > > 
> > > I understand the feeling that you wish to stop userspace from doing
> > > this, but really, it does not work.  Eventhough you are doing this
> > > correctly (you should see all the other attempts at doing this), you are
> > > not preventing userspace from having multiple processes access this
> > > device node at the same time, so please, don't even attempt to stop this
> > > from happening.
> > > 
> > > So you can drop the atomic "lock" you have here, it's not needed at all.
> > > 
> > 
> > Could you elaborate a bit here because we've had a similar thing in the
> > RTC subsystem:
> > 
> > https://elixir.bootlin.com/linux/latest/source/drivers/rtc/dev.c#L28
> 
> Yeah, that too will not work :(  Note, it does stop open from being
> called from different processes, but think of the following sequence of
> userspace calls:
> 	open()
> 	fork/exec()
> 	both processes access the file descriptor
> 
> or passing a fd across a socket?
> 
> Or duplicating the file descriptor and sending it to a different task
> (like across a socket or many other IPC ways)?
> 
> Once userspace has a file descriptor, all bets are off as to where it
> goes and what it does with it.  There's no need to try to save userspace
> from itself by preventing multiple opens when really, it doesn't stop
> anyone who really wants to do this.
> 
> If userspace does do multiple read/writes from different threads /
> processes / whatever on the same file descriptor, it gets to keep the
> pieces of the mess it causes.  It's not the kernel's job to try to
> "protect" userspace from itself here.
> 
> Look at serial/tty connections as one example of this always being the
> case.
> 
> Does that help?
> 

Thanks for the explanation, this is now clear to me.

> > And it would mean I can remove rtc->flags completely.
> 
> I think you can do that.
> 
> thanks,
> 
> greg k-h

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
