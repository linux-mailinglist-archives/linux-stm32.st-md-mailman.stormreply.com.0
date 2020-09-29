Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C21D027CF3B
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Sep 2020 15:34:10 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 71527C32EA3;
	Tue, 29 Sep 2020 13:34:10 +0000 (UTC)
Received: from smtprelay.hostedemail.com (smtprelay0053.hostedemail.com
 [216.40.44.53])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 72552C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Sep 2020 13:34:09 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay04.hostedemail.com (Postfix) with ESMTP id 472EC180A7FFF;
 Tue, 29 Sep 2020 13:34:08 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 50, 0, 0, , d41d8cd98f00b204, joe@perches.com, ,
 RULES_HIT:41:355:379:599:967:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1539:1593:1594:1711:1714:1730:1747:1777:1792:1801:2198:2199:2393:2525:2553:2560:2563:2682:2685:2828:2859:2933:2937:2939:2942:2945:2947:2951:2954:3022:3138:3139:3140:3141:3142:3351:3622:3865:3867:3871:3872:3873:3874:3934:3936:3938:3941:3944:3947:3950:3953:3956:3959:4321:4605:5007:6742:6743:8985:9025:10004:10400:11232:11658:11854:11914:12043:12050:12297:12555:12740:12760:12895:12986:13019:13069:13311:13357:13439:14181:14659:14721:21080:21451:21627:21740:21939:30012:30054:30056:30060:30090:30091,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:1, LUA_SUMMARY:none
X-HE-Tag: event48_4a081af2718a
X-Filterd-Recvd-Size: 2674
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf20.hostedemail.com (Postfix) with ESMTPA;
 Tue, 29 Sep 2020 13:34:03 +0000 (UTC)
Message-ID: <5f0d2b20f5088281363bb4a35c5652a2c087f159.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Julia Lawall <julia.lawall@inria.fr>, Dan Carpenter
 <dan.carpenter@oracle.com>, Shuah Khan <shuah@kernel.org>
Date: Tue, 29 Sep 2020 06:34:02 -0700
In-Reply-To: <alpine.DEB.2.22.394.2009291445050.2808@hadrien>
References: <1601233948-11629-1-git-send-email-Julia.Lawall@inria.fr>
 <CAMj1kXGh+CzuXkAnqsoMO2A3T1p=D6uFOV347Ym5+VFn5U1gWg@mail.gmail.com>
 <20200929124108.GY4282@kadam>
 <alpine.DEB.2.22.394.2009291445050.2808@hadrien>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-iio@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-ide@vger.kernel.org,
 linux-clk@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, David Lechner <david@lechnology.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-block@vger.kernel.org, drbd-dev@tron.linbit.com,
 linux-amlogic@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Valdis =?UTF-8?Q?Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>,
 linux-wireless@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 openipmi-developer@lists.sourceforge.net
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

On Tue, 2020-09-29 at 14:47 +0200, Julia Lawall wrote:
> On Tue, 29 Sep 2020, Dan Carpenter wrote:
> > The times where commas are used deliberately to replace curly braces are
> > just evil.  Either way the code is cleaner with semi-colons.
> 
> I also found exaamples like the following to be particularly unforunate:
> 
>                                 fprintf(stderr,
>                                         "page_nr %lu wrong count %Lu %Lu\n",
>                                        page_nr, count,
>                                        count_verify[page_nr]), exit(1);
> 
> The exit is very hard to see, unless you know to look for it.

I sent that patch last month.
https://patchwork.kernel.org/patch/11734877/

It's still not applied.



_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
