Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 91388649FA
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Jul 2019 17:46:12 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3E178CDC0D9
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Jul 2019 15:46:12 +0000 (UTC)
Received: from smtprelay.hostedemail.com (smtprelay0058.hostedemail.com
 [216.40.44.58])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 30BFBCDC0D7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Jul 2019 15:46:11 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay05.hostedemail.com (Postfix) with ESMTP id C502F1802912E;
 Wed, 10 Jul 2019 15:46:09 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com,
 :::::::::::::::::::::::::::::::::::::::::::,
 RULES_HIT:41:355:379:599:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:2198:2199:2393:2553:2559:2562:2692:2731:2828:2917:3138:3139:3140:3141:3142:3353:3622:3865:3866:3867:3868:3870:3871:3872:3873:3874:4250:4321:5007:6691:6742:7875:7904:10004:10400:10848:11026:11232:11473:11658:11914:12296:12297:12740:12760:12895:13069:13311:13357:13439:14096:14097:14659:21080:21220:21326:21451:21627:30012:30034:30054:30056:30090:30091,
 0,
 RBL:23.242.196.136:@perches.com:.lbl8.mailshell.net-62.14.0.180 64.201.201.201,
 CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none, DomainCache:0,
 MSF:not bulk, SPF:fn, MSBL:0, DNSBL:neutral, Custom_rules:0:0:0, LFtime:25,
 LUA_SUMMARY:none
X-HE-Tag: range96_50d7d845d712e
X-Filterd-Recvd-Size: 3121
Received: from XPS-9350 (cpe-23-242-196-136.socal.res.rr.com [23.242.196.136])
 (Authenticated sender: joe@perches.com)
 by omf13.hostedemail.com (Postfix) with ESMTPA;
 Wed, 10 Jul 2019 15:45:54 +0000 (UTC)
Message-ID: <b9c3b83c9be50286062ae8cefd5d38e2baa0fb22.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>, Johannes Berg
 <johannes@sipsolutions.net>
Date: Wed, 10 Jul 2019 08:45:53 -0700
In-Reply-To: <20190710094337.wf2lftxzfjq2etro@shell.armlinux.org.uk>
References: <cover.1562734889.git.joe@perches.com>
 <5fa1fa6998332642c49e2d5209193ffe2713f333.camel@sipsolutions.net>
 <20190710094337.wf2lftxzfjq2etro@shell.armlinux.org.uk>
User-Agent: Evolution 3.30.5-0ubuntu0.18.10.1 
MIME-Version: 1.0
Cc: devel@driverdev.osuosl.org, linux-mmc@vger.kernel.org,
 alsa-devel@alsa-project.org, Benjamin Fair <benjaminfair@google.com>,
 linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>,
 Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, Nancy Yuen <yuenn@google.com>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 netdev@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 00/12] treewide: Fix GENMASK misuses
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

On Wed, 2019-07-10 at 10:43 +0100, Russell King - ARM Linux admin wrote:
> On Wed, Jul 10, 2019 at 11:17:31AM +0200, Johannes Berg wrote:
> > On Tue, 2019-07-09 at 22:04 -0700, Joe Perches wrote:
> > > These GENMASK uses are inverted argument order and the
> > > actual masks produced are incorrect.  Fix them.
> > > 
> > > Add checkpatch tests to help avoid more misuses too.
> > > 
> > > Joe Perches (12):
> > >   checkpatch: Add GENMASK tests
> > 
> > IMHO this doesn't make a lot of sense as a checkpatch test - just throw
> > in a BUILD_BUG_ON()?

I tried that.

It'd can't be done as it's used in declarations
and included in asm files and it uses the UL()
macro.

I also tried just making it do the right thing
whatever the argument order.

Oh well.

> My personal take on this is that GENMASK() is really not useful, it's
> just pure obfuscation and leads to exactly these kinds of mistakes.
> 
> Yes, I fully understand the argument that you can just specify the
> start and end bits, and it _in theory_ makes the code more readable.
> 
> However, the problem is when writing code.  GENMASK(a, b).  Is a the
> starting bit or ending bit?  Is b the number of bits?  It's confusing
> and causes mistakes resulting in incorrect code.  A BUILD_BUG_ON()
> can catch some of the cases, but not all of them.

It's a horrid little macro and I agree with Russell.

I also think if it existed at all it should have been
GENMASK(low, high) not GENMASK(high, low).

I

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
