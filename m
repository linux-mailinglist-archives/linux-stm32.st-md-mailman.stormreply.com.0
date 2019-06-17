Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 914AA57E97
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jun 2019 10:49:50 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 508F6C937E5
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jun 2019 08:49:50 +0000 (UTC)
Received: from smtprelay.hostedemail.com (smtprelay0020.hostedemail.com
 [216.40.44.20])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9043AC676A8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2019 16:17:44 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay06.hostedemail.com (Postfix) with ESMTP id F0530182251A2;
 Mon, 17 Jun 2019 16:17:42 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, :::::::::,
 RULES_HIT:41:355:379:599:800:960:982:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:2198:2199:2393:2559:2562:2828:3138:3139:3140:3141:3142:3352:3622:3653:3865:3866:3867:3868:3870:3871:3872:3874:4321:5007:10004:10400:10848:11232:11658:11914:12043:12296:12663:12679:12740:12760:12895:13069:13071:13161:13229:13311:13357:13439:14180:14181:14659:14721:21060:21080:21451:21627:21740:30029:30054:30070:30091,
 0,
 RBL:23.242.196.136:@perches.com:.lbl8.mailshell.net-62.14.0.180 64.201.201.201,
 CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none, DomainCache:0,
 MSF:not bulk, SPF:fn, MSBL:0, DNSBL:neutral, Custom_rules:0:0:0, LFtime:27,
 LUA_SUMMARY:none
X-HE-Tag: dock02_2616e45532807
X-Filterd-Recvd-Size: 2206
Received: from XPS-9350 (cpe-23-242-196-136.socal.res.rr.com [23.242.196.136])
 (Authenticated sender: joe@perches.com)
 by omf03.hostedemail.com (Postfix) with ESMTPA;
 Mon, 17 Jun 2019 16:17:41 +0000 (UTC)
Message-ID: <9f241554ff74531d3a61e6bd1c1043831e870819.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>
Date: Mon, 17 Jun 2019 09:17:39 -0700
In-Reply-To: <20190617142320.2830-1-geert+renesas@glider.be>
References: <20190617142320.2830-1-geert+renesas@glider.be>
User-Agent: Evolution 3.30.5-0ubuntu0.18.10.1 
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 27 Jun 2019 08:49:47 +0000
Cc: linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] [RFC] get_maintainer: Really limit regex
 patterns to words
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

On Mon, 2019-06-17 at 16:23 +0200, Geert Uytterhoeven wrote:
> Limit file and directory regex matching to paths that contain the
> pattern as a word, i.e. that contain word boundaries before and after
> the pattern.  This helps avoiding false positives.
> 
> Without this, e.g. "scripts/get_maintainer.pl -f
> tools/perf/pmu-events/arch/x86/westmereex" lists the STM32 maintainers,
> due to the presence of "stm" in the middle of a word in the path name.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> What to do with drivers/pwm/pwm-stmpe.c, which is no longer caught?
> Add a new pattern to MAINTAINERS?

Hi Geert

> diff --git a/scripts/get_maintainer.pl b/scripts/get_maintainer.pl
[]
> @@ -884,7 +884,7 @@ sub get_maintainers {
>  				}
>  			    }
>  			} elsif ($type eq 'N') {
> -			    if ($file =~ m/$value/x) {
> +			    if ($file =~ m/\b$value\b/x) {

I'm not sure this is the right approach as it also
affects regexes like
"N:	rockchip" where there
are multiple current matches that wouldn't
work anymore.

It might be better to change the regexes in MAINTAINERS
where appropriate.

There is also a regex with a directory slash so it's
probably better to use m{<foo>}

MAINTAINERS:N:  /pmac

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
