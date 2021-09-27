Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C2C4192FE
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Sep 2021 13:20:19 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 19ABDC5AB62;
	Mon, 27 Sep 2021 11:20:19 +0000 (UTC)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2B2C3C5719E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Sep 2021 11:20:17 +0000 (UTC)
Received: from fraeml713-chm.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4HJ0VH71Dnz67nPm;
 Mon, 27 Sep 2021 19:17:43 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml713-chm.china.huawei.com (10.206.15.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Mon, 27 Sep 2021 13:20:15 +0200
Received: from localhost (10.52.124.219) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.8; Mon, 27 Sep
 2021 12:20:14 +0100
Date: Mon, 27 Sep 2021 12:20:00 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Message-ID: <20210927122000.00007d65@Huawei.com>
In-Reply-To: <YVGbHQnpBTQYm/7/@shinobu>
References: <cover.1630031207.git.vilhelm.gray@gmail.com>
 <422c765c91d060cdebc4f17f7aeb255d9c1a4e16.1630031207.git.vilhelm.gray@gmail.com>
 <20210912171821.54af145b@jic23-huawei> <YUhdyRdzuBtUxOzT@shinobu>
 <20210926161542.5cf99b58@jic23-huawei> <YVGbHQnpBTQYm/7/@shinobu>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; i686-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.52.124.219]
X-ClientProxiedBy: lhreml707-chm.china.huawei.com (10.201.108.56) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, o.rempel@pengutronix.de,
 jarkko.nikula@linux.intel.com, linux-arm-kernel@lists.infradead.org,
 kernel@pengutronix.de, Dan Carpenter <dan.carpenter@oracle.com>,
 fabrice.gasnier@st.com, syednwaris@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, Jonathan Cameron <jic23@kernel.org>,
 alexandre.torgue@st.com
Subject: Re: [Linux-stm32] [PATCH v16 07/14] counter: Add character device
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

On Mon, 27 Sep 2021 19:21:17 +0900
William Breathitt Gray <vilhelm.gray@gmail.com> wrote:

> On Sun, Sep 26, 2021 at 04:15:42PM +0100, Jonathan Cameron wrote:
> > On Mon, 20 Sep 2021 19:09:13 +0900
> > William Breathitt Gray <vilhelm.gray@gmail.com> wrote:
> >   
> > > On Sun, Sep 12, 2021 at 05:18:42PM +0100, Jonathan Cameron wrote:  
> > > > On Fri, 27 Aug 2021 12:47:51 +0900
> > > > William Breathitt Gray <vilhelm.gray@gmail.com> wrote:
> > > >     
> > > > > This patch introduces a character device interface for the Counter
> > > > > subsystem. Device data is exposed through standard character device read
> > > > > operations. Device data is gathered when a Counter event is pushed by
> > > > > the respective Counter device driver. Configuration is handled via ioctl
> > > > > operations on the respective Counter character device node.
> > > > > 
> > > > > Cc: David Lechner <david@lechnology.com>
> > > > > Cc: Gwendal Grignou <gwendal@chromium.org>
> > > > > Cc: Dan Carpenter <dan.carpenter@oracle.com>
> > > > > Cc: Oleksij Rempel <o.rempel@pengutronix.de>
> > > > > Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>    
> > > > 
> > > > Hi William,
> > > > 
> > > > Why the bit based lock?  It feels like a mutex_trylock() type approach or
> > > > spinlock_trylock() would be a more common solution to this problem.
> > > > There is precedence for doing what you have here though so I'm not that
> > > > worried about it.    
> > > 
> > > Hi Jonathan,
> > > 
> > > We originally used a mutex for this, but Jarkko discovered that this
> > > produced a warning because chrdev_lock would be held when returning to
> > > user space:
> > > https://lore.kernel.org/linux-arm-kernel/YOq19zTsOzKA8v7c@shinobu/T/#m6072133d418d598a5f368bb942c945e46cfab9a5
> > > 
> > > Following David Lechner's suggestion, I decided to reimplement
> > > chrdev_lock as a bitmap using an atomic flag.  
> > 
> > Ok.  I'm not sure bit lock was quite what was intended (as there is only one of them)
> > but I suppose it doesn't greatly matter.  
> 
> It didn't cross my mind before, but would declaring chrdev_lock as an
> atomic_t be a more appropriate solution here because we have only one
> flag?
> 
> William Breathitt Gray
> 

It would be less esoteric.  This was the first time I've ever come across the bitlock stuff
whereas atomics are an every day thing.

Thanks,

Jonathan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
