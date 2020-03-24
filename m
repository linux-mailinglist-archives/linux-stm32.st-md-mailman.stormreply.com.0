Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4F4190A88
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Mar 2020 11:19:44 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C1A84C36B0B;
	Tue, 24 Mar 2020 10:19:43 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5A438C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Mar 2020 10:19:42 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5D0F82080C;
 Tue, 24 Mar 2020 10:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585045180;
 bh=q4q2MlAIz6+C/hLPcO9TRU1z0kw29IK3WElI+UFhXgg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XQ94ZQUDRRdi3qTMyMKloWf8WGl5UrXJKTuuKZYg1OZ2U3a9Osi3YQaw5Ouz8i0f7
 /20hISeB3SITV1C6h5yiH3eHmg3H0lETiiiCU26eYgVEbZ3doVo+3Qn5C3PsMtviII
 GxB/SJyxk+IJoh1lqlXqAXs6Xh7HBTjS+rwjSl9I=
Date: Tue, 24 Mar 2020 11:19:38 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Eugene Syromiatnikov <esyr@redhat.com>
Message-ID: <20200324101938.GA2220478@kroah.com>
References: <20200324042213.GA10452@asgard.redhat.com>
 <20200324062853.GD1977781@kroah.com>
 <20200324095304.GA2444@asgard.redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200324095304.GA2444@asgard.redhat.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
 Michael Williams <michael.williams@arm.com>, linux-kernel@vger.kernel.org,
 Chunyan Zhang <zhang.chunyan@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "Dmitry V. Levin" <ldv@altlinux.org>, Pratik Patel <pratikp@codeaurora.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] coresight: do not use the BIT() macro in
	the UAPI header
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

On Tue, Mar 24, 2020 at 10:53:04AM +0100, Eugene Syromiatnikov wrote:
> On Tue, Mar 24, 2020 at 07:28:53AM +0100, Greg Kroah-Hartman wrote:
> > On Tue, Mar 24, 2020 at 05:22:13AM +0100, Eugene Syromiatnikov wrote:
> > > The BIT() macro definition is not available for the UAPI headers
> > > (moreover, it can be defined differently in the user space); replace
> > > its usage with the _BITUL() macro that is defined in <linux/const.h>.
> > 
> > Why is somehow _BITUL() ok to use here instead?
> 
> It is provided in an UAPI header (include/uapi/linux/const.h)
> and is appropriately prefixed with an underscore to avoid conflicts.

Because no one uses _ in their own macros?  :)

Anyway, this is fine, but if it's really the way forward, I think a lot
of files will end up being changed...

thanks,

greg k-h
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
