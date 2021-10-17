Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C75AD430992
	for <lists+linux-stm32@lfdr.de>; Sun, 17 Oct 2021 16:02:46 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6D628C5C847;
	Sun, 17 Oct 2021 14:02:46 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6CFE5C597AF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 17 Oct 2021 14:02:45 +0000 (UTC)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 5112E20005;
 Sun, 17 Oct 2021 14:02:42 +0000 (UTC)
Date: Sun, 17 Oct 2021 16:02:42 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Greg KH <gregkh@linuxfoundation.org>
Message-ID: <YWwtAm0o6wVMG6xc@piout.net>
References: <cover.1632884256.git.vilhelm.gray@gmail.com>
 <b8b8c64b4065aedff43699ad1f0e2f8d1419c15b.1632884256.git.vilhelm.gray@gmail.com>
 <YWwqE5T6h5j14M/M@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YWwqE5T6h5j14M/M@kroah.com>
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

On 17/10/2021 15:50:11+0200, Greg KH wrote:
> Note, review of this now that it has been submitted in a pull request to
> me, sorry I missed this previously...
> 
> On Wed, Sep 29, 2021 at 12:15:59PM +0900, William Breathitt Gray wrote:
> > +static int counter_chrdev_open(struct inode *inode, struct file *filp)
> > +{
> > +	struct counter_device *const counter = container_of(inode->i_cdev,
> > +							    typeof(*counter),
> > +							    chrdev);
> > +
> > +	/* Ensure chrdev is not opened more than 1 at a time */
> > +	if (!atomic_add_unless(&counter->chrdev_lock, 1, 1))
> > +		return -EBUSY;
> 
> I understand the feeling that you wish to stop userspace from doing
> this, but really, it does not work.  Eventhough you are doing this
> correctly (you should see all the other attempts at doing this), you are
> not preventing userspace from having multiple processes access this
> device node at the same time, so please, don't even attempt to stop this
> from happening.
> 
> So you can drop the atomic "lock" you have here, it's not needed at all.
> 

Could you elaborate a bit here because we've had a similar thing in the
RTC subsystem:

https://elixir.bootlin.com/linux/latest/source/drivers/rtc/dev.c#L28

And it would mean I can remove rtc->flags completely.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
