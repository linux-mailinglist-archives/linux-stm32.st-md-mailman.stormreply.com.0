Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E485FC789
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Oct 2022 16:38:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4110AC640F9;
	Wed, 12 Oct 2022 14:38:36 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 24299C0D2BF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Oct 2022 14:38:34 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id 8so3091992qka.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Oct 2022 07:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=rKPVsd3W7uhNdx8AxGe9ZGmFEXcX2gtbcARjTMPwtE0=;
 b=jGgCcVxw9aYw+7+X6FUgRTvWP9wT47kEmtOZr477HoPkmQAsPEA5JGobOI6Qze1oP6
 HPXB6t9x0H25ecRAwTY0BEXhlzAMg/o6RTruu8USuaYPuJvTdljw3u9oSPXN4yGstANA
 aLxFp546AW+Ay1L/fgx7sRfkKlIGSymtayWFQ4DwNZ0T9qB9Trv5DUmuBtdlKrU41ESi
 cgyR3kfuwNlBTsq3NS01dpqfazFNVgF1b6Wr8aOSTkmeMAqBxjpEU6+Tq60kBrey2PpH
 x8y0MTNGT2fsR1ECqiiwD2wXi6jMN9JWReiWyiVOUMbL075hz+qaAOCf93KVgCINHefo
 b7cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rKPVsd3W7uhNdx8AxGe9ZGmFEXcX2gtbcARjTMPwtE0=;
 b=7W4PconPyImA+iwdMONrtjGJBAluqVKJyIKHV15xZW/kQSD8MZHsvOX3W/Al2T8aqB
 R8vqH+kJ0A1nP8aRUPHxHYyqMYpCdsldBQZezjPGHUDQ9yt2Zd1AGweUcZsJjix/+uy+
 XzvJtlTRDzdiRvmmtbDA+G+xca4pyrgMTvH6r9h+RuQMMcwop9G79KDTZCZJ6VPDJE9/
 ArHdsbDmIRcfH9GXkukVvyoSObPjTzk4R7+lX+72R1bRDR4U5ZkDtV7iD98zNwKF8NMs
 0HCuJwLDX7suzUa15E5ZQeFSU4bn50OTH3Od8DaRMbKyReX4WPX3FXsEkn29Xq3pQTFf
 iWgg==
X-Gm-Message-State: ACrzQf3xJlnMAVNO9Ivw5aZ5EGl5/eJCyRS690sFB9ufto8yvxvoMfMr
 JFE5XLd5ZmBX4uPVvlKKUbEQXGE3XqRgfOM9mZs=
X-Google-Smtp-Source: AMsMyM7b7eFUYW469t9gBAUzXjB/1SiBsX+TjGi2DrbbBdSxt9U56YHR1FbMXNHgZ43uuhcXFE2IKeNMDRcE++1W0/Y=
X-Received: by 2002:a05:620a:2552:b0:6ca:bf8f:4d27 with SMTP id
 s18-20020a05620a255200b006cabf8f4d27mr20286297qko.383.1665585512923; Wed, 12
 Oct 2022 07:38:32 -0700 (PDT)
MIME-Version: 1.0
References: <20221012142205.13041-1-olivier.moysan@foss.st.com>
In-Reply-To: <20221012142205.13041-1-olivier.moysan@foss.st.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 12 Oct 2022 17:37:56 +0300
Message-ID: <CAHp75VeUXwqeb+kZE7HshMwjRRrd0=85=qxEGmLDkiyoEEuKrA@mail.gmail.com>
To: Olivier Moysan <olivier.moysan@foss.st.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 Lars-Peter Clausen <lars@metafoo.de>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v4 0/8] iio: stm32-adc: add support of adc
	for stm32mp13
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

On Wed, Oct 12, 2022 at 5:23 PM Olivier Moysan
<olivier.moysan@foss.st.com> wrote:
>
> On STM32MP13 SoCs, each ADC peripheral has a single ADC block.
> These ADC peripherals, ADC1 and ADC2, are fully independent.
> The STM32MP131 SoC provides only ADC2, while other STM32MP13x
> SoCs provide both ADC1 and ADC2.
>
> The STM32MP13 ADC features and characteristics are slightly
> different from STM32MP15 ADC ones, requiring a specific support
> in the driver.
>
> This patchset enables the ADC peripheral on STM32MP135F-DK board.
>
> On STM32MP135F-DK board the ADC is connected to VDDA voltage
> provided by the PMIC LOD1 supply, which has to be enabled through
> SCMI regulator framework.
> This serie introduces a fixed regulator to allow ADC probing,
> while SCMI regulators support is not available. This does
> not ensure ADC regulator enabling however.

FWIW,
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
for patches 1,3, and 4.

> Changes in v4:
> - reformat patch 1 commit message
> - reorder adc1 node
>
> v3:
> - Remove blank line in tag block
> - Use HZ_PER_MHZ unit for max frequency definition
> - Coding style updates
>
> v2:
> - Rework commit message length
> - Add missing spaces
> - Remove useless defines
>
> Olivier Moysan (8):
>   iio: adc: stm32-adc: fix channel sampling time init
>   dt-bindings: iio: adc: stm32-adc: add stm32mp13 compatibles
>   iio: adc: stm32-adc: add stm32mp13 support
>   iio: adc: stm32: manage min sampling time on all internal channels
>   ARM: dts: stm32: add adc support to stm32mp13
>   ARM: dts: stm32: add adc pins muxing on stm32mp135f-dk
>   ARM: dts: stm32: add dummy vdd_adc regulator on stm32mp135f-dk
>   ARM: dts: stm32: add adc support on stm32mp135f-dk
>
>  .../bindings/iio/adc/st,stm32-adc.yaml        |  68 ++++-
>  arch/arm/boot/dts/stm32mp13-pinctrl.dtsi      |   7 +
>  arch/arm/boot/dts/stm32mp131.dtsi             |  43 +++
>  arch/arm/boot/dts/stm32mp133.dtsi             |  31 +++
>  arch/arm/boot/dts/stm32mp135f-dk.dts          |  33 +++
>  drivers/iio/adc/stm32-adc-core.c              |  30 ++-
>  drivers/iio/adc/stm32-adc-core.h              |  30 +++
>  drivers/iio/adc/stm32-adc.c                   | 247 +++++++++++++++---
>  8 files changed, 443 insertions(+), 46 deletions(-)
>
> --
> 2.25.1
>


-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
