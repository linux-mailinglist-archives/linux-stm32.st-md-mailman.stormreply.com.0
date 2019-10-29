Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D702E8E06
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Oct 2019 18:25:02 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4D3CDC36B0B;
	Tue, 29 Oct 2019 17:25:02 +0000 (UTC)
Received: from smtprelay.hostedemail.com (smtprelay0045.hostedemail.com
 [216.40.44.45])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 179ABC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Oct 2019 17:25:01 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay07.hostedemail.com (Postfix) with ESMTP id C4978181D3039;
 Tue, 29 Oct 2019 17:24:59 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com,
 :::::::::::::::::::::::::::::::::,
 RULES_HIT:41:355:379:599:800:968:973:988:989:1260:1277:1311:1313:1314:1345:1359:1381:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:2393:2559:2562:2693:2828:2904:3138:3139:3140:3141:3142:3353:3622:3865:3867:3870:3871:3872:3873:3874:4250:4321:5007:6678:6737:7875:7903:10004:10400:10848:11232:11658:11914:12043:12048:12297:12438:12740:12760:12895:13069:13311:13357:13439:14181:14659:14721:21080:21365:21451:21627:30045:30054:30091,
 0,
 RBL:47.151.135.224:@perches.com:.lbl8.mailshell.net-62.8.0.100 64.201.201.201,
 CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none, DomainCache:0,
 MSF:not bulk, SPF:fn, MSBL:0, DNSBL:neutral, Custom_rules:0:0:0, LFtime:26,
 LUA_SUMMARY:none
X-HE-Tag: honey62_829271995af5b
X-Filterd-Recvd-Size: 2690
Received: from XPS-9350.home (unknown [47.151.135.224])
 (Authenticated sender: joe@perches.com)
 by omf19.hostedemail.com (Postfix) with ESMTPA;
 Tue, 29 Oct 2019 17:24:57 +0000 (UTC)
Message-ID: <9dd814577107edc42c4469ee7c923e062a2b5368.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Pascal Paillet
 <p.paillet@st.com>, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, 
 robh+dt@kernel.org, mark.rutland@arm.com, rui.zhang@intel.com,
 edubezval@gmail.com,  amit.kucheria@verdurent.com,
 david.hernandezsanchez@st.com,  wsa+renesas@sang-engineering.com,
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, Andy Whitcroft
 <apw@canonical.com>
Date: Tue, 29 Oct 2019 10:24:50 -0700
In-Reply-To: <026e676e-0a6c-81ca-3af4-2832118b9ddf@linaro.org>
References: <20191029164537.1561-1-p.paillet@st.com>
 <20191029164537.1561-3-p.paillet@st.com>
 <8952e975-3bad-4b7d-49ff-b74af942008c@linaro.org>
 <f668de19e156bd7a1bf599d9ce1f9d4f4fca4095.camel@perches.com>
 <026e676e-0a6c-81ca-3af4-2832118b9ddf@linaro.org>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [Linux-stm32] [PATCH 2/4] thermal: stm32: fix IRQ flood on low
	threshold
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

On Tue, 2019-10-29 at 18:21 +0100, Daniel Lezcano wrote:
> On 29/10/2019 18:15, Joe Perches wrote:
> > On Tue, 2019-10-29 at 18:11 +0100, Daniel Lezcano wrote:
> > > On 29/10/2019 17:45, Pascal Paillet wrote:
> > > > Fix IRQ flood on low threshold by too ways:
> > > 
> > > Can you state the issue first ?
> > > 
> > > > - improve temperature reading resolution,
> > > > - add an hysteresis to the low threshold: on low threshold interrupt,
> > > > it is not possible to get the temperature value that has fired the
> > > > interrupt. The time to acquire a new value is enough for the CPU to
> > > > become hotter than the current low threshold.
> > []
> > > > Signed-off-by: Pascal Paillet <p.paillet@st.com>
> > > > Change-Id: I3b63b8aab38fd651a165c4e69a2d090b3c6f5db3
> > > 
> > > Please remove the Change-Id tag.
> > > 
> > > Joe, Andy? checkpatch does not see the Change-Id, is it the expected
> > > behavior?
> > 
> > Yes.  It's after a sign-off so checkpatch doesn't care.
> 
> Ah, I guess it is for Gerrit but we don't want those Change-Id in the
> kernel history, right?

So remove it from the patch.

checkpatch is not a perfect tool.
checkpatch will never be a perfect tool.
It's not possible for checkpatch to be a perfect tool.


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
