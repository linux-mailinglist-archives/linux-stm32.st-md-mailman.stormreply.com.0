Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D87C281143
	for <lists+linux-stm32@lfdr.de>; Fri,  2 Oct 2020 13:32:59 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E8E8BC424B1;
	Fri,  2 Oct 2020 11:32:58 +0000 (UTC)
Received: from mail.thorsis.com (mail.thorsis.com [92.198.35.195])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 17DCAC424AF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Oct 2020 09:27:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.thorsis.com (Postfix) with ESMTP id 6E2F13B69
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Oct 2020 11:27:44 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.thorsis.com
Received: from mail.thorsis.com ([127.0.0.1])
 by localhost (mail.thorsis.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KBXQG14nQJlg
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Oct 2020 11:27:44 +0200 (CEST)
Received: by mail.thorsis.com (Postfix, from userid 109)
 id 2911D4729; Fri,  2 Oct 2020 11:27:42 +0200 (CEST)
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NO_RECEIVED,
 NO_RELAYS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
 version=3.4.2
From: Alexander Dahl <ada@thorsis.com>
To: linux-leds@vger.kernel.org
Date: Fri, 02 Oct 2020 11:27:32 +0200
Message-ID: <4533120.poq1GmoeVQ@ada>
In-Reply-To: <CAJKOXPfBKnESpRkSDZp5CB3T-t95DXg2dNKQnNNXv6Q_ywck2w@mail.gmail.com>
References: <20200930234637.7573-1-post@lespocky.de>
 <20200930234637.7573-6-post@lespocky.de>
 <CAJKOXPfBKnESpRkSDZp5CB3T-t95DXg2dNKQnNNXv6Q_ywck2w@mail.gmail.com>
X-Mailman-Approved-At: Fri, 02 Oct 2020 11:32:57 +0000
Cc: devicetree@vger.kernel.org,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-mips@vger.kernel.org,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Rob Herring <robh+dt@kernel.org>,
 Alexander Dahl <post@lespocky.de>, Dan Murphy <dmurphy@ti.com>,
 Pavel Machek <pavel@ucw.cz>, linux-amlogic@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v6 5/7] ARM: dts: Fix schema warnings for
	pwm-leds
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hello Krzysztof,

Am Freitag, 2. Oktober 2020, 11:12:50 CEST schrieb Krzysztof Kozlowski:
> On Thu, 1 Oct 2020 at 01:53, Alexander Dahl <post@lespocky.de> wrote:
> > The node names for devices using the pwm-leds driver follow a certain
> > naming scheme (now).
> > 
> > Signed-off-by: Alexander Dahl <post@lespocky.de>
> > ---
> > 
> > Notes:
> >     v6:
> >       * added this patch to series
> >  
> >  arch/arm/boot/dts/at91-kizbox.dts             | 10 +++----
> >  arch/arm/boot/dts/at91-kizbox2-common.dtsi    |  8 +++---
> >  arch/arm/boot/dts/at91-kizbox3-hs.dts         | 16 ++++++------
> >  arch/arm/boot/dts/at91-kizbox3_common.dtsi    | 10 +++----
> >  arch/arm/boot/dts/at91-kizboxmini-common.dtsi |  8 +++---
> >  arch/arm/boot/dts/at91sam9m10g45ek.dts        | 10 +++----
> >  arch/arm/boot/dts/at91sam9rlek.dts            | 10 +++----
> >  .../boot/dts/berlin2cd-google-chromecast.dts  |  6 ++---
> >  arch/arm/boot/dts/exynos5422-odroidhc1.dts    |  4 +--
> >  arch/arm/boot/dts/exynos5422-odroidxu4.dts    |  4 +--
> 
> Somehow you did not CC the maintainers... please use
> scripts/get_maintainers.pl to obtain list of addresses.

Well, that will be a huge list of Cc then.  What is the policy?  Everybody 
gets the whole series or different list of receivers per patch?

> All these should be separate patches per sub-architecture.

I already suspected that.  Will do in v7.

Thanks for your feedback.
Alex



_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
