Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA68280F9E
	for <lists+linux-stm32@lfdr.de>; Fri,  2 Oct 2020 11:13:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7A10BC424AF;
	Fri,  2 Oct 2020 09:13:07 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A8DFFC32EA8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Oct 2020 09:13:05 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CAE2520874
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Oct 2020 09:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601629984;
 bh=8a9a2j+Q9TdoEDPH23Ae2HnjNbpRmIF9vtNV8rnH2vQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=e2Ws41X+UNrnNFSTOb3hHvWb3YfjncnZQ59oCGnE7JOU6e7heO6JfoSLH5pHei0eg
 BC2b71jVluyqxGHJ0QR5kWnUooypgWbQFCErWr5684bzCO+XF6iFpwxtP7Y+nxZdxZ
 RpIRhmFkBimbov+669+iCgi5oldne2Y5z8G4dV28=
Received: by mail-ed1-f49.google.com with SMTP id dn5so904882edb.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 02 Oct 2020 02:13:03 -0700 (PDT)
X-Gm-Message-State: AOAM530z56VlrO3O/qIwRkcmZrb7E5oGBaUso10PMf1LQeHy+HEqmdYg
 oDEHN0fzqTOForPW3jQugOOmTzVd1jA6CKJt1Q8=
X-Google-Smtp-Source: ABdhPJxBtB7fdjB7sO1ypylhPr0oi8dpib+2DW5jCMpkty90gseodUSNpkeVzNSqRvn/UxzjtCaV66+yk1Gc6ZLF7DA=
X-Received: by 2002:a05:6402:22b7:: with SMTP id
 cx23mr1353773edb.246.1601629982305; 
 Fri, 02 Oct 2020 02:13:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200930234637.7573-1-post@lespocky.de>
 <20200930234637.7573-6-post@lespocky.de>
In-Reply-To: <20200930234637.7573-6-post@lespocky.de>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Fri, 2 Oct 2020 11:12:50 +0200
X-Gmail-Original-Message-ID: <CAJKOXPfBKnESpRkSDZp5CB3T-t95DXg2dNKQnNNXv6Q_ywck2w@mail.gmail.com>
Message-ID: <CAJKOXPfBKnESpRkSDZp5CB3T-t95DXg2dNKQnNNXv6Q_ywck2w@mail.gmail.com>
To: Alexander Dahl <post@lespocky.de>
Cc: devicetree@vger.kernel.org,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 Alexander Dahl <ada@thorsis.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-mips@vger.kernel.org, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-leds@vger.kernel.org,
 Pavel Machek <pavel@ucw.cz>, linux-amlogic@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Dan Murphy <dmurphy@ti.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Thu, 1 Oct 2020 at 01:53, Alexander Dahl <post@lespocky.de> wrote:
>
> The node names for devices using the pwm-leds driver follow a certain
> naming scheme (now).
>
> Signed-off-by: Alexander Dahl <post@lespocky.de>
> ---
>
> Notes:
>     v6:
>       * added this patch to series
>
>  arch/arm/boot/dts/at91-kizbox.dts             | 10 +++----
>  arch/arm/boot/dts/at91-kizbox2-common.dtsi    |  8 +++---
>  arch/arm/boot/dts/at91-kizbox3-hs.dts         | 16 ++++++------
>  arch/arm/boot/dts/at91-kizbox3_common.dtsi    | 10 +++----
>  arch/arm/boot/dts/at91-kizboxmini-common.dtsi |  8 +++---
>  arch/arm/boot/dts/at91sam9m10g45ek.dts        | 10 +++----
>  arch/arm/boot/dts/at91sam9rlek.dts            | 10 +++----
>  .../boot/dts/berlin2cd-google-chromecast.dts  |  6 ++---
>  arch/arm/boot/dts/exynos5422-odroidhc1.dts    |  4 +--
>  arch/arm/boot/dts/exynos5422-odroidxu4.dts    |  4 +--

Somehow you did not CC the maintainers... please use
scripts/get_maintainers.pl to obtain list of addresses.

All these should be separate patches per sub-architecture.

Best regards,
Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
