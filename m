Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E59D5282666
	for <lists+linux-stm32@lfdr.de>; Sat,  3 Oct 2020 21:43:22 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 99F6AC424B0;
	Sat,  3 Oct 2020 19:43:22 +0000 (UTC)
Received: from smtprelay.hostedemail.com (smtprelay0060.hostedemail.com
 [216.40.44.60])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A8766C3FAFF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  3 Oct 2020 19:43:19 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay02.hostedemail.com (Postfix) with ESMTP id 91E911DED;
 Sat,  3 Oct 2020 19:43:18 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, ,
 RULES_HIT:41:355:379:599:967:973:982:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1542:1593:1594:1711:1730:1747:1777:1792:2393:2553:2559:2562:2828:3138:3139:3140:3141:3142:3355:3622:3865:3866:3867:3868:3870:3871:3872:3874:4321:4362:4470:4605:5007:6248:6742:6743:7576:7875:7974:9010:9040:9545:10004:10400:10848:11232:11658:11914:12297:12663:12740:12760:12895:13161:13229:13436:13439:14659:14721:21080:21325:21433:21451:21627:21819:30034:30054:30090:30091,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:1, LUA_SUMMARY:none
X-HE-Tag: loss06_3d0c09b271af
X-Filterd-Recvd-Size: 4162
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf07.hostedemail.com (Postfix) with ESMTPA;
 Sat,  3 Oct 2020 19:43:15 +0000 (UTC)
Message-ID: <9ab43333596f08abbbbbf1fa8cdf1ded4b65af2a.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, Julia Lawall
 <julia.lawall@inria.fr>
Date: Sat, 03 Oct 2020 12:43:13 -0700
In-Reply-To: <20201003193137.z2bpwzlz5a66kkex@chatter.i7.local>
References: <1601233948-11629-1-git-send-email-Julia.Lawall@inria.fr>
 <160132172369.55460.9237357219623604216.b4-ty@kernel.org>
 <b1174f9be2ce65f6b5ebefcba0b48e792926abbc.camel@perches.com>
 <20200929113745.GB4799@sirena.org.uk>
 <db26d49401dc0bd6b9013a603a155f9827f404a4.camel@perches.com>
 <20201001110150.GA6715@sirena.org.uk>
 <f44d19ad596f261c0287c9ab18c45161003efb43.camel@perches.com>
 <20201003191501.o56tqq63d2buq5ox@chatter.i7.local>
 <alpine.DEB.2.22.394.2010032118420.2741@hadrien>
 <20201003193137.z2bpwzlz5a66kkex@chatter.i7.local>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, linux-iio@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-ide@vger.kernel.org,
 linux-clk@vger.kernel.org, drbd-dev@lists.linbit.com,
 Neil Armstrong <narmstrong@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-acpi@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>, David Lechner <david@lechnology.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-block@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-amlogic@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 Valdis =?UTF-8?Q?Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, openipmi-developer@lists.sourceforge.net,
 tools@linux.kernel.org
Subject: Re: [Linux-stm32] [PATCH 00/18] use semicolons rather than commas
 to separate statements
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

On Sat, 2020-10-03 at 15:31 -0400, Konstantin Ryabitsev wrote:
> On Sat, Oct 03, 2020 at 09:18:51PM +0200, Julia Lawall wrote:
> > > > There seems to be some mismatch between b4's use of the
> > > > cover letter to a patch series and what maintainers that
> > > > apply a subset of the patches in the patch series.
> > > > 
> > > > The merge description shows the entire patch series as
> > > > applied, but the actual merge is only a subset of the
> > > > series.
> > > > 
> > > > Can this be improved in b4?
> > > 
> > > So, the following logic should be applied:
> > > 
> > > - if the entire series was applied, reply to 0/n
> > > - if a subset only is applied, reply to each n/n of the patch that was
> > >   cherry-picked out of the series
> > > 
> > > Is that an accurate summary?
> > 
> > That sounds good.
> 
> I'm worried that this can get unwieldy for series of 50 patches where 49 
> got applied. Would the following be better:
> 
> -----
> From: ...
> To: ...
> Subject: Re: [PATCH 00/18] use semicolons...
> 
> On Sun...
> > These patches...
> > 
> > [...]
> 
> A subset of these patches was applied to
> 
>   https://...
> 
> Thanks!
> 
> [5/18] regmap: debugfs:
>        commit:
> 
> (etc)
> -----
> 
> In other words, we:
> 
> - specifically say that it's a subset
> - instead of just enumerating the number of patches that were applied, 
>   as is currently the case ([1/1]) we list the exact numbers out of the 
>   posted series (e.g. [5/18])
> 
> I think this is a better solution than potentially flooding everyone 
> with 49 emails.

I think it would be better to reply individually as
the likelihood that the maintainer skips just a few
patches of a large series is relatively low.

It's more likely for a treewide or multi-subsystem
patch set for a maintainer to apply just a single one
or a selected few of the patches and individual
replies make it much easier to determine which ones
were applied.

thanks, Joe

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
