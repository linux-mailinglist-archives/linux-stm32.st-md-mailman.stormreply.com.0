Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8CD256008
	for <lists+linux-stm32@lfdr.de>; Fri, 28 Aug 2020 19:52:03 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 53ECEC32EA6;
	Fri, 28 Aug 2020 17:52:03 +0000 (UTC)
Received: from smtprelay.hostedemail.com (smtprelay0082.hostedemail.com
 [216.40.44.82])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DBE61C36B26
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Aug 2020 17:52:01 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay01.hostedemail.com (Postfix) with ESMTP id 9C5C8100E7B4C;
 Fri, 28 Aug 2020 17:52:00 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, ,
 RULES_HIT:41:355:379:599:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:2198:2199:2393:2559:2562:2828:2892:2911:3138:3139:3140:3141:3142:3353:3622:3865:3866:3867:3868:3871:3872:3873:3874:4321:4425:4560:5007:6742:6743:7903:10004:10400:10848:11232:11658:11914:12297:12663:12740:12760:12895:13069:13311:13357:13439:14096:14097:14659:14721:21067:21080:21324:21433:21451:21627:30012:30054:30070:30075:30091,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:1, LUA_SUMMARY:none
X-HE-Tag: edge90_0e065aa27077
X-Filterd-Recvd-Size: 3579
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf05.hostedemail.com (Postfix) with ESMTPA;
 Fri, 28 Aug 2020 17:51:56 +0000 (UTC)
Message-ID: <d8dce79d93363e19ea132ba8237a607a1ff28f09.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Peter Rosin <peda@axentia.se>, Krzysztof Kozlowski <krzk@kernel.org>
Date: Fri, 28 Aug 2020 10:51:55 -0700
In-Reply-To: <b7a5a441-cda1-ad02-b723-255231f2bd94@axentia.se>
References: <20200827192642.1725-1-krzk@kernel.org>
 <20200827192642.1725-9-krzk@kernel.org>
 <f4a5777e-fe85-9f3f-4818-f7539f223adc@axentia.se>
 <20200828062443.GA17343@pi3>
 <3a5cb59b-454e-2c3f-9f31-43147e843c66@axentia.se>
 <CAJKOXPcqNE5U82UThzBTPCvucCf2LsCVSfAHE1vnecJGCKCaig@mail.gmail.com>
 <b7a5a441-cda1-ad02-b723-255231f2bd94@axentia.se>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Cc: Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-iio@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>,
 Tomasz Duszynski <tomasz.duszynski@octakon.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Kevin Hilman <khilman@baylibre.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Kukjin Kim <kgene@kernel.org>,
 Beniamin Bia <beniamin.bia@analog.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Hartmut Knaack <knaack.h@gmx.de>,
 Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v2 09/18] iio: afe: iio-rescale: Simplify
 with dev_err_probe()
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

On Fri, 2020-08-28 at 11:39 +0200, Peter Rosin wrote:
> On 2020-08-28 09:03, Krzysztof Kozlowski wrote:
> > > > If there is no consensus among discussing people, I find this 100 line
> > > > more readable, already got review, checkpatch accepts it so if subsystem
> > > > maintainer likes it, I prefer to leave it like this.
> > > 
> > > I'm not impressed by that argument. For the files I have mentioned, it
> > > does not matter very much to me if you and some random person think that
> > > 100 columns might *slightly* improve readability.
> > > 
> > > Quoting coding-style
> > > 
> > >   Statements longer than 80 columns should be broken into sensible chunks,
> > >   unless exceeding 80 columns significantly increases readability and does
> > >   not hide information.
> > > 
> > > Notice that word? *significantly*
> > 
> > Notice also checkpatch change...
> 
> How is that relevant? checkpatch has *never* had the final say and its
> heuristics can never be perfect. Meanwhile, coding style is talking about
> exactly the case under discussion, and agrees with me perfectly.

As the checkpatch maintainer, checkpatch is stupid.
Using it as a primary argument should never be acceptable.

But line lengths from 81 to 100 columns should be exceptions
rather than
standard use.

Any named maintainer of actual code determines the style for
that code.

Style consistency and use of kernel standard mechanisms
should be the primary goals here.


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
