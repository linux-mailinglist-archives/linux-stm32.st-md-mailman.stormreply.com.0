Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 365D27368F2
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Jun 2023 12:14:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D497EC6B455;
	Tue, 20 Jun 2023 10:14:37 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com
 [209.85.128.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 489B6C6907C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Jun 2023 10:14:36 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-57001c0baddso40581937b3.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Jun 2023 03:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687256075; x=1689848075;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NJJmgVmTa9f7iC7uetyObrO68r9W6Xg4F51QYpcRfPM=;
 b=KnoTmyXWN5md3fERuYS0Dm1jkxj7MOSAMZonVdYOgYkrdxFKHgtTDDuTuK8KUTyj9F
 ez9ntj+NgYS95fgZWQPJruaiSIYe6DmuXCqTZQamUic/P9E35BVDJiSd5vsyEyaM16Bf
 wR7r7uhN3GgiQOopbgClgUByAhApfqvyZiHfIyx+REd7jzadhjy2+7y5PDGqudOU1rso
 HZPvU8QWJkIZAib7qlTYb56ZiOVD/k7bfSdUgw3xVD682z9SxYylNhf2o0v/tn0e3OAH
 TL9ffDVzjAWeQR5L6BktCyIelKExgehj76tEmDiT/DeraQ/v0MKdX9v8kXJhXq7XI5GI
 I/fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687256075; x=1689848075;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NJJmgVmTa9f7iC7uetyObrO68r9W6Xg4F51QYpcRfPM=;
 b=JBUlTHo3PZ6G8E2AZEO8rxsnVB0mAouANmlDxdD2h8TCgrh4/slBXTj74X2Bmct+Rz
 79itPwuGyKF99NEsPrenalm18920GPUp5KTPSbDfKfY/I+g4sPXtVro2qr5cAPZWKwab
 3vUOnBtP2smnIKYHmvseZXY/vW6y2rNM/qgUmYo9vb1Wu6Euo6Qtwbv/VoYA9U7sIQZA
 lvM1r0QIkgWIjXx15UeWe3UpZVvRQ/pcPhQhLBR2NQ81EVH/jSml9PRZFO0vJGDuhVHC
 BpG010iJ02ptt8OOufzfG1esjuucOrRnLPNCk0pJg4G4sZYJ6YupZC1pGwZJGakH9Rld
 wJ3A==
X-Gm-Message-State: AC+VfDwG42jZ0ku6XA/5/nkFa5l6k/gWYFG9QVBUw3RI67k6elvC8Mfl
 N62U7UVOWgKlNr03xihKAmpbe7Z9aGo4oY9qmV8YSg==
X-Google-Smtp-Source: ACHHUZ6iVAXtSlfEagdTRkw6Q+YSAN1J8b9rGKXips/cn5kKkmDKHU27IPuCLZFV6BZvBtFEqfel4P+d3RXAqP/kWDA=
X-Received: by 2002:a25:d310:0:b0:bc8:f082:2301 with SMTP id
 e16-20020a25d310000000b00bc8f0822301mr2837948ybf.6.1687256075120; Tue, 20 Jun
 2023 03:14:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230619115120.64474-1-yann.gautier@foss.st.com>
In-Reply-To: <20230619115120.64474-1-yann.gautier@foss.st.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 20 Jun 2023 12:13:59 +0200
Message-ID: <CAPDyKFrYfZHovci0ekTi3WWUrQDWv60MACEe0A_Sd0RmOdW=oQ@mail.gmail.com>
To: Yann Gautier <yann.gautier@foss.st.com>
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Xiang wangx <wangxiang@cdjrlc.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>, linux-mmc@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Yang Yingliang <yangyingliang@huawei.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v2 0/6] Update MMCI driver for STM32MP25
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

On Mon, 19 Jun 2023 at 13:51, Yann Gautier <yann.gautier@foss.st.com> wrote:
>
> STM32MP25 is a new SoC from STMicroelectronics. The machine was
> pushed by Alexandre [1] in his tree.
> On this new SoC, the SDMMC peripheral, using PL18x/MMCI driver
> has been updated to v3.
> The driver has been updated to manage this new version, and the new
> features it supports:
> * FIFO size increased from 64B to 1kB
> * IDMA size alignment/mask updated
> * New block gap hardware flow control
> * Delay block updated and dependent on SoC
>
> This series was pushed on top of next branch in Ulf's mmc tree, as it
> requires feedback clock update patch [2].
>
> [1] https://lore.kernel.org/lkml/59f4a900-34ee-d991-c350-265d38e7c862@foss.st.com/T/
> [2] https://lore.kernel.org/r/20230613150148.429828-1-yann.gautier@foss.st.com
>
> Changes in v2:
> - update dt-bindings file (remove bootloader reference and use enum)
>
> Yann Gautier (6):
>   dt-bindings: mmc: mmci: Add st,stm32mp25-sdmmc2 compatible
>   mmc: mmci: add stm32_idmabsize_align parameter
>   mmc: mmci: Add support for sdmmc variant revision v3.0
>   mmc: mmci: stm32: manage block gap hardware flow control
>   mmc: mmci: stm32: prepare other delay block support
>   mmc: mmci: stm32: add delay block support for STM32MP25
>
>  .../devicetree/bindings/mmc/arm,pl18x.yaml    |   7 +-
>  drivers/mmc/host/mmci.c                       |  35 ++++
>  drivers/mmc/host/mmci.h                       |   8 +-
>  drivers/mmc/host/mmci_stm32_sdmmc.c           | 149 ++++++++++++++++--
>  4 files changed, 179 insertions(+), 20 deletions(-)
>

Applied for next, thanks!

Kind regards
Uffe
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
