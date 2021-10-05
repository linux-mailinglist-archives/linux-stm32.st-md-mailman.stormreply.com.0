Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7D8422DB3
	for <lists+linux-stm32@lfdr.de>; Tue,  5 Oct 2021 18:17:29 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5FD0FC5AB7C;
	Tue,  5 Oct 2021 16:17:28 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BF594C32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Oct 2021 16:17:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D77486137C;
 Tue,  5 Oct 2021 16:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1633450645;
 bh=nQv7TJEC1TeCgBAiwKp27Mfu6BsaQKwTda6n316fuX8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=1nIyA7ALvDj7ddhUgoWPXH8vgwq94IAIJdqo1jbt9uBl8yB/kAUrjMkADZMnkeVXJ
 YF9olLZHFpkYLvizwAqn+4wt1vFvoqq1FhMLUGGTsQq+YQTs1OqFiBhzC/LdCvZPwH
 eNZ/cxOLnq544/4tcHA9JzvMfske7q6VX8tJSFOk=
Date: Tue, 5 Oct 2021 18:17:23 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <YVx6k1MMx0BTmgO6@kroah.com>
References: <20210930160520.19678-1-arnaud.pouliquen@foss.st.com>
 <20210930160520.19678-3-arnaud.pouliquen@foss.st.com>
 <YVxMKekWW0w0+qoM@kroah.com>
 <4cfc7497-ac85-828b-0b2f-a212c5a0503c@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4cfc7497-ac85-828b-0b2f-a212c5a0503c@foss.st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Suman Anna <s-anna@ti.com>, Jiri Slaby <jirislaby@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v8 2/2] tty: add rpmsg driver
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

On Tue, Oct 05, 2021 at 06:03:25PM +0200, Arnaud POULIQUEN wrote:
> Hello Greg,
> 
> On 10/5/21 2:59 PM, Greg Kroah-Hartman wrote:
> > On Thu, Sep 30, 2021 at 06:05:20PM +0200, Arnaud Pouliquen wrote:
> >> This driver exposes a standard TTY interface on top of the rpmsg
> >> framework through a rpmsg service.
> >>
> >> This driver supports multi-instances, offering a /dev/ttyRPMSGx entry
> >> per rpmsg endpoint.
> >>
> >> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> >> ---
> >>  Documentation/serial/tty_rpmsg.rst |  15 ++
> >>  drivers/tty/Kconfig                |   9 +
> >>  drivers/tty/Makefile               |   1 +
> >>  drivers/tty/rpmsg_tty.c            | 275 +++++++++++++++++++++++++++++
> >>  4 files changed, 300 insertions(+)
> >>  create mode 100644 Documentation/serial/tty_rpmsg.rst
> >>  create mode 100644 drivers/tty/rpmsg_tty.c
> >>
> >> diff --git a/Documentation/serial/tty_rpmsg.rst b/Documentation/serial/tty_rpmsg.rst
> >> new file mode 100644
> >> index 000000000000..b055107866c9
> >> --- /dev/null
> >> +++ b/Documentation/serial/tty_rpmsg.rst
> >> @@ -0,0 +1,15 @@
> >> +.. SPDX-License-Identifier: GPL-2.0
> >> +
> >> +=========
> >> +RPMsg TTY
> >> +=========
> >> +
> >> +The rpmsg tty driver implements serial communication on the RPMsg bus to makes possible for
> >> +user-space programs to send and receive rpmsg messages as a standard tty protocol.
> >> +
> >> +The remote processor can instantiate a new tty by requesting a "rpmsg-tty" RPMsg service.
> >> +
> >> +The "rpmsg-tty" service is directly used for data exchange. No flow control is implemented.
> >> +
> >> +Information related to the RPMsg and associated tty device is available in
> >> +/sys/bus/rpmsg/devices/.
> > 
> > 
> > Why is this file needed?  Nothing references it, and this would be the
> > only file in this directory.
> 
> This file is created by the RPMsg framework, it allows to have information about
> RPMsg endpoint addresses associated to the rpmsg tty service instance.
> I can add this additional information to clarify the sentence.

As you are not tying in this into the kernel documentation build at all,
it makes no sense to add it.

Just use normal kernel-doc comments in your .c file and tie _THAT_ into
the kernel documentation build.  No need for a .rst file at all.

thanks,

greg k-h
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
