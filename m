Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE7197B11
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Aug 2019 15:38:49 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5190AC35E01;
	Wed, 21 Aug 2019 13:38:49 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 76FEAC36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Aug 2019 13:38:48 +0000 (UTC)
Received: from localhost (unknown [12.166.174.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D601C22DD3;
 Wed, 21 Aug 2019 13:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566394727;
 bh=1crXxAgFEIvSAhmR5bmvnV+IHCI5hHByods6Q3REdfo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Wj/jQxTaLBtd0YV/ei+OzDxETvK4ck8FQsAph4HCyuRWFFHB59YTGtsFZ7YhUN5P3
 gowgyGcIvQiD7XiYRFJyVgy/f/2LDxW0Ou1bi2aQiDqtP2KbZ9OOIoaySkfd/WOqUi
 oO7plV0xnjruCdJpmvHCkHMgt49NRj/fWKcFYWpI=
Date: Wed, 21 Aug 2019 06:38:46 -0700
From: Greg KH <gregkh@linuxfoundation.org>
To: Peter Zijlstra <peterz@infradead.org>
Message-ID: <20190821133846.GC4890@kroah.com>
References: <20190813121733.52480-1-maennich@google.com>
 <20190821114955.12788-1-maennich@google.com>
 <20190821131140.GC2349@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190821131140.GC2349@hirez.programming.kicks-ass.net>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: kstewart@linuxfoundation.org, oneukum@suse.com,
 linux-aspeed@lists.ozlabs.org, usb-storage@lists.one-eyed-alien.net,
 Toru Komatsu <k0ma@utam0k.jp>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 David Howells <dhowells@redhat.com>, yamada.masahiro@socionext.com,
 Will Deacon <will@kernel.org>, patches@opensource.cirrus.com,
 Michael Ellerman <mpe@ellerman.id.au>, hpa@zytor.com, joel@joelfernandes.org,
 bcm-kernel-feedback-list@broadcom.com, sam@ravnborg.org, cocci@systeme.lip6.fr,
 linux-arch@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Benjamin Fair <benjaminfair@google.com>, linux-scsi@vger.kernel.org,
 Fabio Estevam <festevam@gmail.com>, openbmc@lists.ozlabs.org, x86@kernel.org,
 lucas.de.marchi@gmail.com, Nancy Yuen <yuenn@google.com>, mingo@redhat.com,
 geert@linux-m68k.org, NXP Linux Team <linux-imx@nxp.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Patrick Venture <venture@google.com>,
 stern@rowland.harvard.edu, kernel-team@android.com,
 Dan Williams <dan.j.williams@intel.com>, Ingo Molnar <mingo@kernel.org>,
 linux-rtc@vger.kernel.org, Gleb Fotengauer-Malinovskiy <glebfm@altlinux.org>,
 sspatil@google.com, linux-watchdog@vger.kernel.org, arnd@arndb.de,
 linux-kbuild@vger.kernel.org, Jani Nikula <jani.nikula@intel.com>,
 linux-arm-msm@vger.kernel.org, jeyu@kernel.org,
 Matthias Maennich <maennich@google.com>, Julia Lawall <julia.lawall@lip6.fr>,
 linux-m68k@lists.linux-m68k.org, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, tglx@linutronix.de, maco@android.com,
 linux-arm-kernel@lists.infradead.org, Adrian Reber <adrian@lisas.de>,
 linux-hwmon@vger.kernel.org, michal.lkml@markovi.net,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Alexey Gladkov <gladkov.alexey@gmail.com>, linux-usb@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Nicolas Pitre <nico@fluxnic.net>, Patrick Bellasi <patrick.bellasi@arm.com>,
 Richard Guy Briggs <rgb@redhat.com>, maco@google.com,
 Pengutronix Kernel Team <kernel@pengutronix.de>, pombredanne@nexb.com,
 Tejun Heo <tj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>, linux-modules@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v3 00/11] Symbol Namespaces
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

On Wed, Aug 21, 2019 at 03:11:40PM +0200, Peter Zijlstra wrote:
> On Wed, Aug 21, 2019 at 12:49:15PM +0100, Matthias Maennich wrote:
> > As of Linux 5.3-rc5, there are 31205 [1] exported symbols in the kernel.
> > That is a growth of roughly 1000 symbols since 4.17 (30206 [2]).  There
> > seems to be some consensus amongst kernel devs that the export surface
> > is too large, and hard to reason about.
> > 
> > Generally, these symbols fall in one of these categories:
> > 1) Symbols actually meant for drivers
> > 2) Symbols that are only exported because functionality is split over
> >    multiple modules, yet they really shouldn't be used by modules outside
> >    of their own subsystem
> > 3) Symbols really only meant for in-tree use
> > 
> > When module developers try to upstream their code, it regularly turns
> > out that they are using exported symbols that they really shouldn't be
> > using. This problem is even bigger for drivers that are currently
> > out-of-tree, which may be using many symbols that they shouldn't be
> > using, and that break when those symbols are removed or modified.
> > 
> > This patch allows subsystem maintainers to partition their exported
> > symbols into separate namespaces, and module authors to import such
> > namespaces only when needed.
> > 
> > This allows subsystem maintainers to more easily limit availability of
> > these namespaced symbols to other parts of the kernel. It can also be
> > used to partition the set of exported symbols for documentation
> > purposes; for example, a set of symbols that is really only used for
> > debugging could be in a "SUBSYSTEM_DEBUG" namespace.
> 
> I'm missing how one can prohibit these random out of tree modules from
> doing MODULE_IMPORT_NS().

Nothing, but then they are explicitly being "bad" :)

> That is; suppose I stick all the preempt_notifier symbols in a KVM
> namespace, how do I enforce no out-of-tree modules ever do
> MODULE_IMPORT_NS(KVM) and gain access?
> 
> (the above would basically break virtualbox, which I knows uses preempt
> notifiers too, but I don't give a rats arse about that)

It's a huge red flag for anyone reviewing the code that this module is
doing something it probably really should not be doing at all.  It will
make reviewing code easier, this isn't there to try to "prevent bad
actors" at all, sorry.

thanks,

greg k-h
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
