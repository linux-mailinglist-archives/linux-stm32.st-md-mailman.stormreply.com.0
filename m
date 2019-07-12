Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A576744A
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Jul 2019 19:34:33 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4BDF7C78F78
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Jul 2019 17:34:33 +0000 (UTC)
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1B7E8C78F76
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Jul 2019 17:34:31 +0000 (UTC)
Received: from lwn.net (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id B29512CC;
 Fri, 12 Jul 2019 17:34:28 +0000 (UTC)
Date: Fri, 12 Jul 2019 11:34:27 -0600
From: Jonathan Corbet <corbet@lwn.net>
To: Alex Shi <alex.shi@linux.alibaba.com>
Message-ID: <20190712113427.62fa7ffc@lwn.net>
In-Reply-To: <20190712022018.27989-1-alex.shi@linux.alibaba.com>
References: <20190712022018.27989-1-alex.shi@linux.alibaba.com>
Organization: LWN.net
MIME-Version: 1.0
Cc: linux-s390@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, kvm@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-omap@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 01/12] Documentation: move architectures
	together
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

On Fri, 12 Jul 2019 10:20:07 +0800
Alex Shi <alex.shi@linux.alibaba.com> wrote:

> There are many different archs in Documentation/ dir, it's better to
> move them together in 'Documentation/arch' which follows from kernel source.

So this seems certain to collide badly with Mauro's RST-conversion monster
patch set.

More to the point, though...if we are going to thrash up things this
badly, we want to be sure that we're doing it right so we don't end up
renaming everything again.  Grouping stuff into a new arch/ subdirectory
adds a bit of order, but it doesn't do much toward trying to organize our
documentation for its readers, and it doesn't help us to modernize the
docs and get rid of the old, useless stuff.  A quick check shows that many
of these files have seen no changes other than typo fixes since the
beginning of the Git era.

So, in my mind, this needs some thought.  Maybe we want a
Documentation/arch in the end, but I'm not convinced that we should just
create it and fill it with a snow shovel.  This might be a good thing to
discuss at the kernel summit in September.

Thanks,

jon
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
