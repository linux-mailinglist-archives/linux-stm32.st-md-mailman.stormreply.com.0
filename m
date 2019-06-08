Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B2C39C7E
	for <lists+linux-stm32@lfdr.de>; Sat,  8 Jun 2019 12:51:34 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 07F12CA4CBF
	for <lists+linux-stm32@lfdr.de>; Sat,  8 Jun 2019 10:51:34 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [85.118.1.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A82F6CA4CBD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  8 Jun 2019 10:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mgeScMz6rj/dz5CujtnU7v335CfKeHECqxwDNtzgkgY=; b=GyrjwBj00gZE9eaLRKHfky58Co
 YsT7v1zKxGTRvz3OUQxC2wRK3KGwYNzVaJd373H4vT21rbQ+uXfQf4Fbu1PcDWukxtxDdy4EW14F/
 jFrRYnMRazPXuy3XfTL0BR39hlBuk5CA1M0gb8F4nCw4LMsdqfsVJAibH+ocVsdtyBqxlznRDB68R
 7dqTfCETv2iBfVGkcAVSH85f5+Dd1+4flbQ+VBoWD6GJSXFYBHPZ7rnCcXLlObMLw84xH332yK0G9
 vxf9/2dI2KqhBMn8sWr67PA1PKVI2eFqEOQy0vU6C0DXIcf+ptS4nvZ6myRKE0bfWnXL9BkXQT2FN
 I5k5Swcg==;
Received: from [179.181.119.115] (helo=coco.lan)
 by casper.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hZYwS-0002D7-9q; Sat, 08 Jun 2019 10:51:20 +0000
Date: Sat, 8 Jun 2019 07:51:13 -0300
From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To: Mark Brown <broonie@kernel.org>
Message-ID: <20190608075113.32f2c7bb@coco.lan>
In-Reply-To: <20190607185728.GJ2456@sirena.org.uk>
References: <ff457774d46d96e8fe56b45409aba39d87a8672a.1559933665.git.mchehab+samsung@kernel.org>
 <effeafed3023d8dc5f2440c8d5637ea31c02a533.1559933665.git.mchehab+samsung@kernel.org>
 <20190607185728.GJ2456@sirena.org.uk>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Jonathan Corbet <corbet@lwn.net>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel@vger.kernel.org, Mauro Carvalho Chehab <mchehab@infradead.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 17/20] dt: bindings: fix some broken
 links from txt->yaml conversion
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

Em Fri, 7 Jun 2019 19:57:28 +0100
Mark Brown <broonie@kernel.org> escreveu:

> On Fri, Jun 07, 2019 at 03:54:33PM -0300, Mauro Carvalho Chehab wrote:
> > Some new files got converted to yaml, but references weren't
> > updated accordingly.  
> 
> These should probably just be sent as normal patches rather than tied in
> with the rest of this series...

Thanks for applying it!

Yeah, but the problem with documentation patches is that sometimes
the patches are merged via docs tree, and sometimes via maintainer's
tree, depending on the subsystem.

Anyway, Jon merged this week a patch that should produce warnings
on COMPILE_TEST builds when a file has a broken link.

Hopefully, this will help a lot to warn people against regressions
related to it.


Thanks,
Mauro
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
