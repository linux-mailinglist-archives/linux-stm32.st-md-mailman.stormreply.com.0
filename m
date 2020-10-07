Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4A92858A2
	for <lists+linux-stm32@lfdr.de>; Wed,  7 Oct 2020 08:26:05 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 202DEC32EA6;
	Wed,  7 Oct 2020 06:26:05 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D6B1AC36B37
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Oct 2020 06:26:02 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B003A21548
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Oct 2020 06:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602051961;
 bh=9J6pd4Urt8nLaYajtW0xX9CVZZNmrwIcH02wFm6GCzo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=cjP10fipeHTdrU/XdlnBVJ7nEBd1DP/mHTZ4wefjHHoLp9lxNvYU9bP5xkqznMJxe
 wdl3FjyjprNsFoIgfs4MvjUw8+2mX9yOGKdDx/q7PdKmPRqW4i18tmFXSJXv87xb/w
 jYTrYjlyVbMDlYgJfvP/m4NxZ5TcwBYezWVwQrWs=
Received: by mail-ed1-f47.google.com with SMTP id b12so905049edz.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 06 Oct 2020 23:26:00 -0700 (PDT)
X-Gm-Message-State: AOAM531yk0IZgW2Z26vwvb9tQMM1NMr9FOcJ1X1dItQfG2Fz7waR0bsT
 by4Cs3/hp3wu2W0lOc01DIN4eYCsxIhKAnhaPOc=
X-Google-Smtp-Source: ABdhPJzlgSjYiE8Nro65NAUBEhu5or+8YJ/UtMdDrVp9y+cPmyFnaghXEP0Rg3rNv4h1igGfmvWPgDizOURlpLSk7PM=
X-Received: by 2002:a50:a452:: with SMTP id v18mr1834674edb.143.1602051959063; 
 Tue, 06 Oct 2020 23:25:59 -0700 (PDT)
MIME-Version: 1.0
References: <20201005203451.9985-1-post@lespocky.de>
 <20201005203451.9985-8-post@lespocky.de>
In-Reply-To: <20201005203451.9985-8-post@lespocky.de>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Wed, 7 Oct 2020 08:25:47 +0200
X-Gmail-Original-Message-ID: <CAJKOXPcGXpbJDxLZ1ygi+4c==Lbxt_QA+HZ0Kn7Aq3jjh2YHDg@mail.gmail.com>
Message-ID: <CAJKOXPcGXpbJDxLZ1ygi+4c==Lbxt_QA+HZ0Kn7Aq3jjh2YHDg@mail.gmail.com>
To: Alexander Dahl <post@lespocky.de>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 Kukjin Kim <kgene@kernel.org>, Alexander Dahl <ada@thorsis.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-mips@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Dan Murphy <dmurphy@ti.com>, Pavel Machek <pavel@ucw.cz>,
 linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-leds@vger.kernel.org,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v7 07/12] ARM: dts: exynos: Fix schema
	warnings for pwm-leds
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

On Mon, 5 Oct 2020 at 22:36, Alexander Dahl <post@lespocky.de> wrote:
>
> The node names for devices using the pwm-leds driver follow a certain
> naming scheme (now).  Parent node name is not enforced, but recommended
> by DT project.
>
>   DTC     arch/arm/boot/dts/exynos5410-odroidxu.dt.yaml
>   CHECK   arch/arm/boot/dts/exynos5410-odroidxu.dt.yaml
> /home/alex/build/linux/arch/arm/boot/dts/exynos5410-odroidxu.dt.yaml: pwmleds: 'blueled', 'greenled' do not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
>         From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml
>   DTC     arch/arm/boot/dts/exynos5422-odroidhc1.dt.yaml
>   CHECK   arch/arm/boot/dts/exynos5422-odroidhc1.dt.yaml
> /home/alex/build/linux/arch/arm/boot/dts/exynos5422-odroidhc1.dt.yaml: pwmleds: 'blueled' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
>         From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml
>   DTC     arch/arm/boot/dts/exynos5422-odroidxu3.dt.yaml
>   CHECK   arch/arm/boot/dts/exynos5422-odroidxu3.dt.yaml
> /home/alex/build/linux/arch/arm/boot/dts/exynos5422-odroidxu3.dt.yaml: pwmleds: 'blueled', 'greenled' do not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
>         From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml
>   DTC     arch/arm/boot/dts/exynos5422-odroidxu3-lite.dt.yaml
>   CHECK   arch/arm/boot/dts/exynos5422-odroidxu3-lite.dt.yaml
> /home/alex/build/linux/arch/arm/boot/dts/exynos5422-odroidxu3-lite.dt.yaml: pwmleds: 'blueled', 'greenled' do not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
>         From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml
>   DTC     arch/arm/boot/dts/exynos5422-odroidxu4.dt.yaml
>   CHECK   arch/arm/boot/dts/exynos5422-odroidxu4.dt.yaml
> /home/alex/build/linux/arch/arm/boot/dts/exynos5422-odroidxu4.dt.yaml: pwmleds: 'blueled' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
>         From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml
>
> Signed-off-by: Alexander Dahl <post@lespocky.de>
> ---
>
> Notes:
>     v6 -> v7:
>       * split up patch (one per sub arch)
>       * added actual warnings to commit message
>
>  arch/arm/boot/dts/exynos5422-odroidhc1.dts      |  4 ++--
>  arch/arm/boot/dts/exynos5422-odroidxu4.dts      |  4 ++--
>  arch/arm/boot/dts/exynos54xx-odroidxu-leds.dtsi | 11 ++++++-----
>  3 files changed, 10 insertions(+), 9 deletions(-)

Looks OK but it is too late for this cycle. I'll pick it up after merge window.

Best regards,
Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
