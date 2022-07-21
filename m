Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9404957CE95
	for <lists+linux-stm32@lfdr.de>; Thu, 21 Jul 2022 17:06:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2E21AC5A4FD;
	Thu, 21 Jul 2022 15:06:52 +0000 (UTC)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E7185C03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Jul 2022 15:06:50 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 9A1B6339DE;
 Thu, 21 Jul 2022 15:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1658416010; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oSBrM4FdSKRCKBsymNl6arKewQhlbJQ1SN7EpKFfZ0w=;
 b=jygmK9DbdsCtPtWwOlIr22Oe1AR8xr1mPnbGxf9zV/2/FwYYhM/FSacjzhuNv6ZGTUnoB2
 v0wFBNuVFa+3gOuJSYAS6O8t7774cpWCRmK4DugQExOihYzFUYZLKeOkUizabzkZUyyvJZ
 yGbohJ3RS/C2LCfTfXPwrqW1QVrjCgg=
Received: from suse.cz (pathway.suse.cz [10.100.12.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 4C5F72C14B;
 Thu, 21 Jul 2022 15:06:50 +0000 (UTC)
Date: Thu, 21 Jul 2022 17:06:49 +0200
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Message-ID: <20220721150649.GA23294@pathway.suse.cz>
References: <20220719122831.19890-1-pmladek@suse.com>
 <878ropw7h9.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <878ropw7h9.fsf@jogness.linutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Kieran Bingham <kbingham@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v2] scripts/gdb: fix 'lx-dmesg' on 32 bits
	arch
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

On Tue 2022-07-19 15:41:30, John Ogness wrote:
> On 2022-07-19, Petr Mladek <pmladek@suse.com> wrote:
> > From: Antonio Borneo <antonio.borneo@foss.st.com>
> >
> ...
> >
> > Query the really used atomic_long_t counter type size.
> >
> > Fixes: e60768311af8 ("scripts/gdb: update for lockless printk ringbuffer")
> > Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
> > [pmladek@suse.com: Query the really used atomic_long_t counter type size]
> > Tested-by: Antonio Borneo <antonio.borneo@foss.st.com>
> > Link: https://lore.kernel.org/r/20220617143758.137307-1-antonio.borneo@foss.st.com
> 
> Reviewed-by: John Ogness <john.ogness@linutronix.de>

The patch has been committed into printk/linux.git, branch for-5.20.

Best Regards,
Petr
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
