Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7272A140BB
	for <lists+linux-stm32@lfdr.de>; Sun,  5 May 2019 17:44:19 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A98D5C5A4C2
	for <lists+linux-stm32@lfdr.de>; Sun,  5 May 2019 15:44:17 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1FABAC5A4C0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  5 May 2019 15:44:17 +0000 (UTC)
Received: from archlinux (cpc91196-cmbg18-2-0-cust659.5-4.cable.virginm.net
 [81.96.234.148])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 74FA4206DF;
 Sun,  5 May 2019 15:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1557071055;
 bh=hWYalqQTLkdyCSrGSc5APPCAjay5CZvAjqDb92JkxVg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=mSd8GYX0Mclnh+IGIVvZmz82m+nQ7Kv+Q0PvhYZdCl3XNRXdnTwRqIlU0aYcVpoir
 g3tjdVuLQJPYFbr+bUaHQuw2swDdRORnVWpJ/LmmlZG9K3isIoKuCrSBeO1GQ3MsQd
 xwHI3Ash72pwcRl2WwgTYENoMAGFfQ+RdgbylZ48=
Date: Sun, 5 May 2019 16:44:09 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Philippe Schenker <philippe.schenker@toradex.com>
Message-ID: <20190505164409.7976f43e@archlinux>
In-Reply-To: <1aa6533aa8b1bf4a01c1c5f8d6a208337be6b57e.camel@toradex.com>
References: <20190503135725.9959-1-dev@pschenker.ch>
 <20190503135725.9959-2-dev@pschenker.ch>
 <0aab3e91bb9644acb430a8beba927b5a@AcuMS.aculab.com>
 <1aa6533aa8b1bf4a01c1c5f8d6a208337be6b57e.camel@toradex.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: "lars@metafoo.de" <lars@metafoo.de>,
	Max Krummenacher <max.krummenacher@toradex.com>,
	"        <linux-arm-kernel@lists.infradead.org>, "@stm-ict-prod-mailman-01.stormreply.prv,
	alexandre.torgue@st.com,
	"linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
	<alexandre.torgue@st.com>,
	"  <lee.jones@linaro.org>, "@stm-ict-prod-mailman-01.stormreply.prv,
	linux-kernel@vger.kernel.org, "stefan@agner.ch" <stefan@agner.ch>,
	Marcel Ziswiler <marcel.ziswiler@toradex.com>,
	"David.Laight@ACULAB.COM" <David.Laight@ACULAB.COM>,
	"linux-stm32@st-md-mailman.stormreply.com\"          <linux-stm32@st-md-mailman.stormreply.com>, "@stm-ict-prod-mailman-01.stormreply.prv,
	lee.jones@linaro.org, "pmeerw@pmeerw.net" <pmeerw@pmeerw.net>,
	"knaack.h@gmx.de" <knaack.h@gmx.de>,
	" <mcoquelin.stm32@gmail.com>, "@stm-ict-prod-mailman-01.stormreply.prv,
	linux-arm-kernel@lists.infradead.org,,
	"  <linux-kernel@vger.kernel.org>, "@stm-ict-prod-mailman-01.stormreply.prv,
	mcoquelin.stm32@gmail.com
Subject: Re: [Linux-stm32] [PATCH 2/3] iio: stmpe-adc: Make wait_completion
 non interruptible
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

On Fri, 3 May 2019 15:58:38 +0000
Philippe Schenker <philippe.schenker@toradex.com> wrote:

> On Fri, 2019-05-03 at 14:39 +0000, David Laight wrote:
> > From: Philippe Schenker  
> > > Sent: 03 May 2019 14:57
> > > In some cases, the wait_completion got interrupted. This caused the
> > > error-handling to mutex_unlock the function. The before turned on
> > > interrupt then got called anyway. In the ISR then completion()
> > > was called causing problems.
> > > 
> > > Making this wait_completion non interruptible solves the problem.  
> > 
> > Won't the same thing happen if the interrupt occurs just after
> > the timeout?
> > 
> > 	David
> >  
> > 
> > -
> > Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT,
> > UK
> > Registration No: 1397386 (Wales)
> >   
> 
> You're of course right... Thanks for pointing this out. I will send a v2 with a
> better solution then.
> 

Isn't the timeout long enough that it should only happen if the hardware has
a fault? If that's the case, I wouldn't worry too much about possibility of
an interrupt causing confusion as long as it isn't catastrophic.
Always hard to paper over hardware faults...

> Philippe

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
