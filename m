Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6523FF534
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Apr 2019 13:14:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1DC79C35E03
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Apr 2019 11:14:36 +0000 (UTC)
Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com
 [209.85.217.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 43F5DC36B3F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Apr 2019 11:14:35 +0000 (UTC)
Received: by mail-vs1-f66.google.com with SMTP id b74so4596641vsd.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Apr 2019 04:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+apvPOK9hOKuyGFcfXqjcVJRX/KMiOheouDto7GSYrU=;
 b=OlG3x6DSEKoTSrHDdX3ybp6fgR+JxEYnOW6sgWdoouyfjOMZfIZE834Z0i1m4d147e
 yh01OWpa7Edvr5/DLSw4qqB8LMCNiX6xfb3u9ldeB5liaei3o+eamVJpoz15S4Di9YII
 N6OoTOfeYCULR2C/P3lYgfImFJYDCIrkgWUkZczpN1A48fy5NIuyoJS3kmm+qXRQDaW7
 fQTR+sko1QYp8Y9xuuWEQmS/WEufRgOb11yfjRtsiozp+zLSS624cIH40INcfhqvWQzF
 5/ZF1BLNue1OMHom1HohEH3No7Eg1JyIyx+xodFErGChH//VZmOfMLRkNZCuTkzjv/Ks
 d+VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+apvPOK9hOKuyGFcfXqjcVJRX/KMiOheouDto7GSYrU=;
 b=TNZQ9YAwWz+9SpdUBcdPiKCK1eieiFy313pSYDxIulqPbNkdN9aGtxaQUGgVv8fhYg
 4O6hDHQyrjfUKGFJn1tTkpaOa5+MX6jB85fbGsBALvXqILqUqRksQEX762dNf+8glCwk
 yZYYBYPhOXUG57G16DB2m6vsjsbBqBOY9RI3SqPb4vIyFCKF1kxRAwAYw2kIkB2qSzSY
 WSwhJPEw26jWDL+gweXMyaYW3Lrp247aogMeq0fI9NPgSp8zQ/Vpn5Y1LpJiEH13+1bR
 aXe+NafkiDgl+ZoomzFT4g7OkLUb1gLYdTJQypFvZWw1PndXgmSE74qyue+OYVShNBBX
 +7iQ==
X-Gm-Message-State: APjAAAXQ7HWYs1Op7yaA4556taYmYCL6yY3oXEJEcUvx8geTa7dSNrFs
 UZY4VRJL9ZkX4slUMcBmj6UM0/6hemorWqC0Cti1rA==
X-Google-Smtp-Source: APXvYqyAUnACtUpQ/7yb1Sl1GxiGdH/gfNEqoAuzPz1Lm3B7D3UA4Nrusr1PmU9LKsLBG5dbHrkeoO4MOXsyUmN5ypY=
X-Received: by 2002:a67:c987:: with SMTP id y7mr310439vsk.35.1556622874058;
 Tue, 30 Apr 2019 04:14:34 -0700 (PDT)
MIME-Version: 1.0
References: <1556264798-18540-1-git-send-email-ludovic.Barre@st.com>
In-Reply-To: <1556264798-18540-1-git-send-email-ludovic.Barre@st.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 30 Apr 2019 13:13:57 +0200
Message-ID: <CAPDyKFqbn=UcbwoH_z+yjrjvHQZaMtmsD=n0yrBV7DAK5VRJEQ@mail.gmail.com>
To: Ludovic Barre <ludovic.Barre@st.com>
Cc: DTML <devicetree@vger.kernel.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH V2 0/5] mmc: mmci: add busy detect for
	stm32 sdmmc variant
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

On Fri, 26 Apr 2019 at 09:46, Ludovic Barre <ludovic.Barre@st.com> wrote:
>
> From: Ludovic Barre <ludovic.barre@st.com>
>
> This patch series adds busy detect for stm32 sdmmc variant.
> Some adaptations are required:
> -Avoid to check and poll busy status when is not expected.
> -Clear busy status bit if busy_detect_flag and busy_detect_mask are
>  different.
> -Add hardware busy timeout with MMCIDATATIMER register.
>
> V2:
> -mmci_cmd_irq cleanup in separate patch.
> -simplify the busy_detect_flag exclude
> -replace sdmmc specific comment in
> "mmc: mmci: avoid fake busy polling in mmci_irq"
> to focus on common behavior
>
> Ludovic Barre (5):
>   mmc: mmci: cleanup mmci_cmd_irq for busy detect feature
>   mmc: mmci: avoid fake busy polling in mmci_irq
>   mmc: mmci: fix clear of busy detect status
>   mmc: mmci: add hardware busy timeout feature
>   mmc: mmci: add busy detect for stm32 sdmmc variant
>
>  drivers/mmc/host/mmci.c | 61 ++++++++++++++++++++++++++++++++++++++-----------
>  drivers/mmc/host/mmci.h |  3 +++
>  2 files changed, 51 insertions(+), 13 deletions(-)
>
> --
> 2.7.4
>

Ludovic, just wanted to let you know that I am reviewing and testing
this series.

However, while running some tests on Ux500 for validating the busy
detection code, even without your series applied, I encounter some odd
behaviors. I am looking into the problem to understand better and will
let you know as soon as I have some more data to share.

Kind regards
Uffe
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
