Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E2B3BC8E
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Jun 2019 21:14:50 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4BD22CF2427
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Jun 2019 19:14:49 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0F44FCF2426
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jun 2019 19:14:48 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 958EA21734
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jun 2019 19:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560194086;
 bh=zvtM6TRxQjb/B1By4vuMsY7iObTb+Li2j3Tm+EvMLdo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=TGlvZMcs/FJpXPZCkptFWpPvdL4s72PHG+viHtIY82RSCS/V5RCocn4wfZwXIgujI
 sowVcaU00ECHorIr5JdcGq26ydS5zvsdRkRDlUn+XLT3JHClr90NpofFLySUwdr6aI
 OxKGI1ESby/+f2ZqpwP0N024U/F3j4pqKEkd678Q=
Received: by mail-qt1-f179.google.com with SMTP id i34so11707805qta.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jun 2019 12:14:46 -0700 (PDT)
X-Gm-Message-State: APjAAAV07pBAI1p6h4aprPgbB/gtGX/Hro8u0dUoeODq4+OWaz3cHDTs
 3DEJ02ncpJYR6sWKVOhIpO5bg6UE1AyJB59BPg==
X-Google-Smtp-Source: APXvYqzIM+MxrgW6H75JwOV7MZ+VIoxyIthyHEe9OmuqLCsypZeNSEVjW4Npk9sHZUa367vpismVBunOWLVPPaSnDrU=
X-Received: by 2002:aed:3fb0:: with SMTP id s45mr7686909qth.136.1560194085879; 
 Mon, 10 Jun 2019 12:14:45 -0700 (PDT)
MIME-Version: 1.0
References: <91618c7e9a5497462afa74c6d8a947f709f54331.1560158667.git-series.maxime.ripard@bootlin.com>
 <9fbf4e8507b7acf4840db82d9c9d910483784b2e.1560158667.git-series.maxime.ripard@bootlin.com>
In-Reply-To: <9fbf4e8507b7acf4840db82d9c9d910483784b2e.1560158667.git-series.maxime.ripard@bootlin.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 10 Jun 2019 13:14:34 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+1KWBH7vJ9sBD4CztCxx9jZBzzBPGCYKpWDthjVJ6-pg@mail.gmail.com>
Message-ID: <CAL_Jsq+1KWBH7vJ9sBD4CztCxx9jZBzzBPGCYKpWDthjVJ6-pg@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH v2 08/11] dt-bindings: net: sun7i-gmac:
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

On Mon, Jun 10, 2019 at 3:26 AM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> Switch our Allwinner A20 GMAC controller binding to a YAML schema to enable
> the DT validation. Since that controller is based on a Synopsys IP, let's
> add the validation to that schemas with a bunch of conditionals.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
>
> ---
>
> Changes from v1:
>   - Add a file of its own
> ---
>  Documentation/devicetree/bindings/net/allwinner,sun7i-a20-gmac.txt  | 27 ---------------------------
>  Documentation/devicetree/bindings/net/allwinner,sun7i-a20-gmac.yaml | 66 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  Documentation/devicetree/bindings/net/snps,dwmac.yaml               |  3 +++
>  3 files changed, 69 insertions(+), 27 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/net/allwinner,sun7i-a20-gmac.txt
>  create mode 100644 Documentation/devicetree/bindings/net/allwinner,sun7i-a20-gmac.yaml

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
