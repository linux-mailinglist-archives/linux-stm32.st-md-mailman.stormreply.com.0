Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 00618667D1E
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Jan 2023 18:57:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A22A5C65E45;
	Thu, 12 Jan 2023 17:57:26 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3BAB2C6334A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Jan 2023 17:57:25 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 078D4620E3;
 Thu, 12 Jan 2023 17:57:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58D08C433D2;
 Thu, 12 Jan 2023 17:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673546243;
 bh=4fREWKs39x0OpV+BpNa4fj8zgSJ2BT7scxPi54dQkTU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Z0s9aydO4tD6/ABWiCyVNGM4KqorjqMLHeaViHcQfFOQ6QW2lXyPq5BeUf1WVhla8
 p+rJFycJ1MmhO4qVkHN8Ih0lIrCbpn/OKKUhpuZDourB5XoTYdmqg2VlzRL38edNqE
 iirymmiTilxdy9EsNz9iZWTZL8DKzp6oTZq256B8VBGyptJb+UGyDWFyFeFOQgmsE9
 yPOaCpKwL9756Zj2/NPD67y7Gb9WU/qinc6n+nymLg1smJPN0zXmysNJwzCPqM7j6b
 duxgEysI6+6Q/JjiNOO5ZhdvR/JFFaYX0s/Ov75kIXL788t/Eft4KXKIB905bLkWzA
 NcmDn6uibGOWQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan@kernel.org>)
 id 1pG1pS-0005ef-6w; Thu, 12 Jan 2023 18:57:30 +0100
Date: Thu, 12 Jan 2023 18:57:30 +0100
From: Johan Hovold <johan@kernel.org>
To: Marek Vasut <marex@denx.de>
Message-ID: <Y8BKCka8vZocuz65@hovoldconsulting.com>
References: <20221216115338.7150-1-marex@denx.de>
 <Y6sHr5kuxUoahlzJ@hovoldconsulting.com>
 <Y7vou3wAeLP4X+TY@linutronix.de>
 <Y8AHaJIttNga68q4@hovoldconsulting.com>
 <78e3f61f-4f87-9ac5-7c7c-172714da69d3@denx.de>
 <Y8A+1wUUNCU+3Kry@hovoldconsulting.com>
 <c2f69d59-7c10-53a2-44d3-e3d274da0892@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c2f69d59-7c10-53a2-44d3-e3d274da0892@denx.de>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-serial@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Jiri Slaby <jirislaby@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3] serial: stm32: Merge hard IRQ and
 threaded IRQ handling into single IRQ handler
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

On Thu, Jan 12, 2023 at 06:50:34PM +0100, Marek Vasut wrote:
> On 1/12/23 18:09, Johan Hovold wrote:

> > Fair enough. And it's not obvious that the stable team should backport
> > patches that only concern PREEMPT_RT either (e.g. as parts of it are
> > still out-of-tree).
> > 
> > The stable tag is still missing from the final revision though.
> 
> Please pardon my ignorance, which stable tag is missing ?
> 
> Can you maybe just comment on the V4 and point this out to me ? I'll 
> send a V5 then.

It's gone from my inbox.

But as per Documentation/process/stable-kernel-rules.rst:

    To have the patch automatically included in the stable tree, add the tag
    
    .. code-block:: none
    
         Cc: stable@vger.kernel.org
    
    in the sign-off area. Once the patch is merged it will be applied to
    the stable tree without anything else needing to be done by the author
    or subsystem maintainer.

A Fixes tag only indicates which commit introduced a bug, not
necessarily that the patch should be backported to stable (even if
autosel is likely to pick it up these days).

Johan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
