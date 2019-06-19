Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 66DA64BAE2
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Jun 2019 16:12:26 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 36052C56631
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Jun 2019 14:12:26 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8F714C5662F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jun 2019 14:12:23 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 246B821874
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jun 2019 14:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560953542;
 bh=LFjHq6ftsF8ixON43fD3Q6Ndtpt2rar3Y+/uG+MLXjw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=prEsNKmyAvAq7H0E/JU6DGY/fpy4Y2cDr8VFkyP0FxHF4wONETOFKBqM0n7WkBUfm
 j52OugjC0IgrqAnsfY6ZBep9HodrOSCoRjJZixWjWyXd0qw8a1RksAOO01lwa+FqSs
 q4uKK+ubteTIwOfjnQvUas0PoXRu5TyEwwd9xWFA=
Received: by mail-qt1-f181.google.com with SMTP id x2so20063144qtr.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jun 2019 07:12:22 -0700 (PDT)
X-Gm-Message-State: APjAAAVlfh0jF9w1WFgUCpLHkQnRdkABZyTMdvRIo+EfNQJLvysHFd1Q
 NXxo5ZP7Yyta4w9d6RLtl/hy6puSgOtFMcCqBQ==
X-Google-Smtp-Source: APXvYqx7bOz4FzfPsClBOol4RpULcypOHhAO+WI7MhBrQEIGcxX/3pwVQ40KBd7vbLC3LPe64QmnNa+B23EWoR33xWw=
X-Received: by 2002:ac8:368a:: with SMTP id a10mr23661785qtc.143.1560953541290; 
 Wed, 19 Jun 2019 07:12:21 -0700 (PDT)
MIME-Version: 1.0
References: <27aeb33cf5b896900d5d11bd6957eda268014f0c.1560937626.git-series.maxime.ripard@bootlin.com>
 <60569c4326437aeb1c13b3da4d00bcf6202e9e6b.1560937626.git-series.maxime.ripard@bootlin.com>
In-Reply-To: <60569c4326437aeb1c13b3da4d00bcf6202e9e6b.1560937626.git-series.maxime.ripard@bootlin.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 19 Jun 2019 08:12:09 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+D_=3V26Yj-EH4nJ0Hsx7-+73Q8iGD+s40iRz-EpS=kQ@mail.gmail.com>
Message-ID: <CAL_Jsq+D_=3V26Yj-EH4nJ0Hsx7-+73Q8iGD+s40iRz-EpS=kQ@mail.gmail.com>
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Florian Fainelli <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 =?UTF-8?Q?Antoine_T=C3=A9nart?= <antoine.tenart@bootlin.com>,
 netdev <netdev@vger.kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Chen-Yu Tsai <wens@csie.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Frank Rowand <frowand.list@gmail.com>,
 "David S . Miller" <davem@davemloft.net>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v3 08/16] dt-bindings: net: stmmac:
 Convert the binding to a schemas
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

On Wed, Jun 19, 2019 at 3:48 AM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> Switch the STMMAC / Synopsys DesignWare MAC controller binding to a YAML
> schema to enable the DT validation.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
>
> ---
>
> Changes from v2:
>   - Switch to phy-connection-type instead of phy-mode
>   - Fix the snps,*pbl properties type
>
> Changes from v1:
>   - Restrict snps,tso to only a couple of compatibles
>   - Use an enum for the compatibles
>   - Add a custom select statement with the compatibles of all the generic
>     compatibles, including the deprecated ones. Remove the deprecated ones
>     from the valid compatible values to issue a warning when used.
> ---
>  Documentation/devicetree/bindings/net/snps,dwmac.yaml | 389 +++++++++++-
>  Documentation/devicetree/bindings/net/stmmac.txt      | 179 +-----
>  2 files changed, 390 insertions(+), 178 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/net/snps,dwmac.yaml

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
