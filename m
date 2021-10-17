Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E2B430974
	for <lists+linux-stm32@lfdr.de>; Sun, 17 Oct 2021 15:50:18 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AD0CFC5C847;
	Sun, 17 Oct 2021 13:50:17 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 74E35C597AF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 17 Oct 2021 13:50:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CB18C61039;
 Sun, 17 Oct 2021 13:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1634478614;
 bh=tfA7oucleLVKuvXIcjTuZZfdbNUsWA+rU4EDlt0R3OY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=V6ULbkcWXClmBXpwMjJCozJ45kjb60ISvdM+ofe247OQQ3jjQDvK4WElPV1B4oplQ
 UkJqtG0kM3j2UJ45i7Oc3YsnN8cYYFG1oKMPtuR94C9nApvv+Oo5X7dtMyOl6INU5b
 cjE0lgeY4IA0AtuEOkUGAYu3rBDAjb8IasF367b8=
Date: Sun, 17 Oct 2021 15:50:11 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Message-ID: <YWwqE5T6h5j14M/M@kroah.com>
References: <cover.1632884256.git.vilhelm.gray@gmail.com>
 <b8b8c64b4065aedff43699ad1f0e2f8d1419c15b.1632884256.git.vilhelm.gray@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b8b8c64b4065aedff43699ad1f0e2f8d1419c15b.1632884256.git.vilhelm.gray@gmail.com>
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
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

Note, review of this now that it has been submitted in a pull request to
me, sorry I missed this previously...

On Wed, Sep 29, 2021 at 12:15:59PM +0900, William Breathitt Gray wrote:
> +static int counter_chrdev_open(struct inode *inode, struct file *filp)
> +{
> +	struct counter_device *const counter = container_of(inode->i_cdev,
> +							    typeof(*counter),
> +							    chrdev);
> +
> +	/* Ensure chrdev is not opened more than 1 at a time */
> +	if (!atomic_add_unless(&counter->chrdev_lock, 1, 1))
> +		return -EBUSY;

I understand the feeling that you wish to stop userspace from doing
this, but really, it does not work.  Eventhough you are doing this
correctly (you should see all the other attempts at doing this), you are
not preventing userspace from having multiple processes access this
device node at the same time, so please, don't even attempt to stop this
from happening.

So you can drop the atomic "lock" you have here, it's not needed at all.

thanks,

greg k-h
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
