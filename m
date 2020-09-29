Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0BE27CD77
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Sep 2020 14:44:34 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 82D70C36B37;
	Tue, 29 Sep 2020 12:44:34 +0000 (UTC)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CF5ECC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Sep 2020 12:44:31 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.77,318,1596492000"; d="scan'208";a="470059088"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Sep 2020 14:44:29 +0200
Date: Tue, 29 Sep 2020 14:44:29 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <20200929123734.GC4799@sirena.org.uk>
Message-ID: <alpine.DEB.2.22.394.2009291441530.2808@hadrien>
References: <1601233948-11629-1-git-send-email-Julia.Lawall@inria.fr>
 <160132172369.55460.9237357219623604216.b4-ty@kernel.org>
 <b1174f9be2ce65f6b5ebefcba0b48e792926abbc.camel@perches.com>
 <20200929113745.GB4799@sirena.org.uk>
 <alpine.DEB.2.22.394.2009291344590.2808@hadrien>
 <20200929123734.GC4799@sirena.org.uk>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, linux-iio@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-ide@vger.kernel.org,
 linux-clk@vger.kernel.org, drbd-dev@lists.linbit.com,
 Neil Armstrong <narmstrong@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-acpi@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>, David Lechner <david@lechnology.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-block@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 =?UTF-8?Q?Valdis_Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 Julia Lawall <julia.lawall@inria.fr>, linux-crypto@vger.kernel.org,
 Joe Perches <joe@perches.com>, openipmi-developer@lists.sourceforge.net
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



On Tue, 29 Sep 2020, Mark Brown wrote:

> On Tue, Sep 29, 2020 at 01:46:19PM +0200, Julia Lawall wrote:
> > On Tue, 29 Sep 2020, Mark Brown wrote:
>
> > > Feel free to submit patches to b4.  Ideally things like this wouldn't be
> > > being sent as serieses in the first place, there's no dependencies or
> > > interactions between the patches.
>
> > It was suggested (a long time ago, not with respect to this patch in
> > particular) that sending such patches in a series is useful because it
> > allows people who are not interested in the 18 patches to skip over them
> > more easily.  So there are two conflicting needs...
>
> I'm not convinced that there are huge numbers of people reading LKML as
> a list TBH, and if you are sending things as a series then the way
> you're doing it at the minute where you don't CC the cover letter to
> people makes things confusing as it's unclear if there are dependencies
> to worry about.

The cover letter goes to all of the specific mailing lists affected by the
patch, or if there is no list, then to at least one developer.  Sending
the cover letter to everyone would lead to too many recipients for some
lists.

If there is a preference for the rest of these patches to be sent one by
one, then that is possible.

julia
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
