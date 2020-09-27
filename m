Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E238827A3EE
	for <lists+linux-stm32@lfdr.de>; Sun, 27 Sep 2020 22:08:33 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 45838C36B37;
	Sun, 27 Sep 2020 20:08:33 +0000 (UTC)
Received: from smtprelay.hostedemail.com (smtprelay0018.hostedemail.com
 [216.40.44.18])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C3B82C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 27 Sep 2020 20:08:30 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay05.hostedemail.com (Postfix) with ESMTP id 7E77118017FB8;
 Sun, 27 Sep 2020 20:08:29 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 50, 0, 0, , d41d8cd98f00b204, joe@perches.com, ,
 RULES_HIT:41:355:379:599:967:973:988:989:1260:1263:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1538:1568:1593:1594:1711:1714:1730:1747:1777:1792:2393:2525:2560:2563:2682:2685:2693:2828:2859:2933:2937:2939:2942:2945:2947:2951:2954:3022:3138:3139:3140:3141:3142:3622:3865:3866:3867:3868:3872:3874:3934:3936:3938:3941:3944:3947:3950:3953:3956:3959:4321:4362:5007:6742:7903:9025:10004:10400:11232:11658:11914:12295:12297:12740:12760:12895:13019:13069:13311:13357:13439:14181:14659:14721:21063:21080:21451:21627:30034:30054:30091,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:1, LUA_SUMMARY:none
X-HE-Tag: toy29_471566e2717b
X-Filterd-Recvd-Size: 2021
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf19.hostedemail.com (Postfix) with ESMTPA;
 Sun, 27 Sep 2020 20:08:26 +0000 (UTC)
Message-ID: <9f6ebf51253bf420c8f6f8974a82283ae3e9e446.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Julia Lawall <Julia.Lawall@inria.fr>, linux-iio@vger.kernel.org
Date: Sun, 27 Sep 2020 13:08:25 -0700
In-Reply-To: <1601233948-11629-1-git-send-email-Julia.Lawall@inria.fr>
References: <1601233948-11629-1-git-send-email-Julia.Lawall@inria.fr>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Cc: drbd-dev@lists.linbit.com,
 Valdis =?UTF-8?Q?Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>,
 David Lechner <david@lechnology.com>, Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 kernel-janitors@vger.kernel.org, "Rafael J.
 Wysocki" <rafael@kernel.org>, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-block@vger.kernel.org, linux-ide@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-acpi@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
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

On Sun, 2020-09-27 at 21:12 +0200, Julia Lawall wrote:
> These patches replace commas by semicolons.  This was done using the
> Coccinelle semantic patch (http://coccinelle.lip6.fr/) shown below.
> 
> This semantic patch ensures that commas inside for loop headers will not be
> transformed.  It also doesn't touch macro definitions.

Thanks.

All of these appear to be correct and without effect
except for __LINE__ number changes where braces are added.



_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
