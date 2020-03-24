Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8D9190D17
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Mar 2020 13:13:17 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 94917C36B0B;
	Tue, 24 Mar 2020 12:13:17 +0000 (UTC)
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [216.205.24.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 15663C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Mar 2020 12:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585051992;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=58l/H2MApEOu+ie/Vjhf3T42AhKzIjQCCWFefzgW4/M=;
 b=XSI1Kt31F6Ly2dBgAbbuQ46gMEIOeOL+Av3mypHXJQP6WW1KROfMrlK9i0ztIpcNUyRxd4
 0ngnBz4wIca3DJFl93U0XHQt7SXtOCXSZA6lTY/83D6AhRK5l5AZ5B5pYXPA4BAYjVYtjb
 SRsDECq+82U9SH4xrb6ODr4T2/9m+0c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-433-gjGvKRESNcSsA9rl3IRp-g-1; Tue, 24 Mar 2020 08:13:06 -0400
X-MC-Unique: gjGvKRESNcSsA9rl3IRp-g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0C5FB100550D;
 Tue, 24 Mar 2020 12:13:04 +0000 (UTC)
Received: from asgard.redhat.com (unknown [10.36.110.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F0BB03A4;
 Tue, 24 Mar 2020 12:13:00 +0000 (UTC)
Date: Tue, 24 Mar 2020 13:13:06 +0100
From: Eugene Syromiatnikov <esyr@redhat.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <20200324121306.GA5735@asgard.redhat.com>
References: <20200324042213.GA10452@asgard.redhat.com>
 <20200324062853.GD1977781@kroah.com>
 <20200324095304.GA2444@asgard.redhat.com>
 <20200324101938.GA2220478@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200324101938.GA2220478@kroah.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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

On Tue, Mar 24, 2020 at 11:19:38AM +0100, Greg Kroah-Hartman wrote:
> On Tue, Mar 24, 2020 at 10:53:04AM +0100, Eugene Syromiatnikov wrote:
> > On Tue, Mar 24, 2020 at 07:28:53AM +0100, Greg Kroah-Hartman wrote:
> > > On Tue, Mar 24, 2020 at 05:22:13AM +0100, Eugene Syromiatnikov wrote:
> > > > The BIT() macro definition is not available for the UAPI headers
> > > > (moreover, it can be defined differently in the user space); replace
> > > > its usage with the _BITUL() macro that is defined in <linux/const.h>.
> > > 
> > > Why is somehow _BITUL() ok to use here instead?
> > 
> > It is provided in an UAPI header (include/uapi/linux/const.h)
> > and is appropriately prefixed with an underscore to avoid conflicts.
> 
> Because no one uses _ in their own macros?  :)

Well, it is a reserved prefix (ANSI C99, 4.1.2 "Standard headers": "All
other identifiers that begin with an underscore and either an upper-case
letter or another underscore are reserved"), so valid C files shouldn't
use them.

> Anyway, this is fine, but if it's really the way forward, I think a lot
> of files will end up being changed...

There are 5 cases for using BIT() in UAPI headers so far (rtc.h[1],
serio.h[2], psci.h[3], pkt_sched.h[4], coresight-stm.h), two of them were
conversions from the open-coded variant; the usage of _BITUL in pkt_sched.h
made me think that it is the better approach since people tend to use
BIT-like macro anyway, so, by increasing a number of cases it may raise
awareness of the UAPI specifics.

[1] https://lore.kernel.org/lkml/20200324041209.GA30727@asgard.redhat.com/
[2] https://lore.kernel.org/lkml/20200324041341.GA32335@asgard.redhat.com/
[3] https://lore.kernel.org/lkml/20200324041526.GA1978@asgard.redhat.com/
[4] https://lore.kernel.org/lkml/20200324041920.GA7068@asgard.redhat.com/

> 
> thanks,
> 
> greg k-h
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
