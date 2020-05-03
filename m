Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BCA21C2D41
	for <lists+linux-stm32@lfdr.de>; Sun,  3 May 2020 17:18:22 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 31421C36B18;
	Sun,  3 May 2020 15:18:22 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 217BAC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  3 May 2020 15:18:21 +0000 (UTC)
Received: from archlinux (cpc149474-cmbg20-2-0-cust94.5-4.cable.virginm.net
 [82.4.196.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CE4FD2071C;
 Sun,  3 May 2020 15:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588519099;
 bh=MDSoPNcgg0x8HewOG7f665U3drtcbP5E05HUQNAS2pc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=j4yPv1BbfJmtHMdT/xRbz45EcjuSODlDNNR1LGfkWykBYP/bGLo/iTo240yvrpwxS
 KsNShL05vuZvF8zm60/AnGdPmDbEGJx2Ca0hOjNx8hiLnLPEHTgEcj2OujEUz92OFs
 w+Z6/9/gOXAL2t9No9638zsWvnkVEsSjZ0wPniZw=
Date: Sun, 3 May 2020 16:18:12 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: David Laight <David.Laight@ACULAB.COM>
Message-ID: <20200503161812.024fc2ae@archlinux>
In-Reply-To: <b2d51e3f9dfb4dd78156b2e945607e8d@AcuMS.aculab.com>
References: <cover.1588176662.git.vilhelm.gray@gmail.com>
 <20200503151314.2ac1fc2e@archlinux>
 <b2d51e3f9dfb4dd78156b2e945607e8d@AcuMS.aculab.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: "kamel.bouhara@bootlin.com" <kamel.bouhara@bootlin.com>,
	"gwendal@chromium.org" <gwendal@chromium.org>,
	"  <fabrice.gasnier@st.com>, "@stm-ict-prod-mailman-01.stormreply.prv,
	mcoquelin.stm32@gmail.com,
	"david@lechnology.com" <david@lechnology.com>,
	"felipe.balbi@linux.intel.com" <felipe.balbi@linux.intel.com>,
	"  <syednwaris@gmail.com>, "@stm-ict-prod-mailman-01.stormreply.prv,
	patrick.havelange@essensium.com,
	"linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
	<alexandre.torgue@st.com>,
	William Breathitt Gray <vilhelm.gray@gmail.com>,
	"  <patrick.havelange@essensium.com>, "@stm-ict-prod-mailman-01.stormreply.prv,
	fabrice.gasnier@st.com,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"  <mcoquelin.stm32@gmail.com>, "@stm-ict-prod-mailman-01.stormreply.prv,
	alexandre.torgue@st.com,
	"alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
	"linux-stm32@st-md-mailman.stormreply.com\"          <linux-stm32@st-md-mailman.stormreply.com>,  "@stm-ict-prod-mailman-01.stormreply.prv,
	linux-arm-kernel@lists.infradead.org,,
	"          <linux-arm-kernel@lists.infradead.org>, "@stm-ict-prod-mailman-01.stormreply.prv,
	syednwaris@gmail.com,
	"fabien.lahoudere@collabora.com" <fabien.lahoudere@collabora.com>
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

On Sun, 3 May 2020 14:21:11 +0000
David Laight <David.Laight@ACULAB.COM> wrote:

> From: Jonathan Cameron
> > Sent: 03 May 2020 15:13  
> ...
> > > The following are some questions I have about this patchset:
> > >
> > > 1. Should enums be used to represent standard counter component states
> > >    (e.g. COUNTER_SIGNAL_LOW), or would these be better defined as int?
> > >
> > >    These standard counter component states are defined in the
> > >    counter-types.h file and serve as constants used by counter device
> > >    drivers and Counter subsystem components in order to ensure a
> > >    consistent interface.
> > >
> > >    My concern is whether enum constants will cause problems when passed
> > >    to userspace via the Counter character device ioctl calls. Along the
> > >    same lines is whether the C bool datatype is safe to pass as well,
> > >    given that it is a more modern C datatype.  
> > 
> > For enums, I'd pass them as integers.
> > 
> > Bool is probably fine either way.  
> 
> Always use fixed size types in any API structures.
> Ensure that fields are always on their natural boundaries.
> 
> So no enums and no bools.
> It may even be worth using uint64_t for any userspace pointers.
> 
> At some point you'll live to regret anything else.

Fair point I'd forgotten that c still doesn't make bool a particular
size.  c99 defines it a 0 or 1, but not what the storage size is..

Jonathan



> 
> 	David
> 
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
