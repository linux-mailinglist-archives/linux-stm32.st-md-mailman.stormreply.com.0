Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 95387281DC
	for <lists+linux-stm32@lfdr.de>; Thu, 23 May 2019 17:55:19 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5C4A1CD2C80
	for <lists+linux-stm32@lfdr.de>; Thu, 23 May 2019 15:55:19 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E3078CCB9DD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 May 2019 15:55:17 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7C581217D9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 May 2019 15:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1558626916;
 bh=JUOPRAHlxD37cj7X5mjXujgKukJ+EI5g3Of9neklXRc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Ocp40sto8Gq6/0uRuAdHyZHHkF2oG0CIBODLzqqtKumSJxpWuCby6vxTFj19gf+eG
 9FIWW+5EJzp220GZ5j8OH62sdyNyEuCD+eRtoGun/U2S9jWpB4JlUEt4bCAxHyel/w
 mZK/3l5p6LCRP+bLZqB9mlMk2s0vqj6Wz6G6CFcM=
Received: by mail-qt1-f182.google.com with SMTP id z19so4455498qtz.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 May 2019 08:55:16 -0700 (PDT)
X-Gm-Message-State: APjAAAWMOcIREbgXEPkXrBrKtbECfzyGcaaxLjyrY8O/K+Rjys7sPTNI
 Fx69V4mcsIMcVnOgK9W1npDBrYmWyaWNeqGp4g==
X-Google-Smtp-Source: APXvYqwEEihkSXSYkUOGNw6QZNJ7c5VF8WdzMUhYcRqzxhUuKrUfiTJdsCIvlXDQgQ80MHzHtm0PBbhB4PgJSALMZ1k=
X-Received: by 2002:ac8:6b14:: with SMTP id w20mr60341941qts.110.1558626915748; 
 Thu, 23 May 2019 08:55:15 -0700 (PDT)
MIME-Version: 1.0
References: <74d98cc3c744d53710c841381efd41cf5f15e656.1558605170.git-series.maxime.ripard@bootlin.com>
 <6f16585ffdc75af4e023c4d3ebba68feb65cc26e.1558605170.git-series.maxime.ripard@bootlin.com>
In-Reply-To: <6f16585ffdc75af4e023c4d3ebba68feb65cc26e.1558605170.git-series.maxime.ripard@bootlin.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Thu, 23 May 2019 10:55:04 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+PMT99aw5bkp515XDpKELdpXB2BH_n6e-BwQS+KAHy0Q@mail.gmail.com>
Message-ID: <CAL_Jsq+PMT99aw5bkp515XDpKELdpXB2BH_n6e-BwQS+KAHy0Q@mail.gmail.com>
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 =?UTF-8?Q?Antoine_T=C3=A9nart?= <antoine.tenart@bootlin.com>,
 netdev <netdev@vger.kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Chen-Yu Tsai <wens@csie.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Frank Rowand <frowand.list@gmail.com>,
 "David S . Miller" <davem@davemloft.net>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 7/8] dt-bindings: net: sun7i-gmac: Convert
 the binding to a schemas
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

On Thu, May 23, 2019 at 4:57 AM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> Switch our Allwinner A20 GMAC controller binding to a YAML schema to enable
> the DT validation. Since that controller is based on a Synopsys IP, let's
> add the validation to that schemas with a bunch of conditionals.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> ---
>  Documentation/devicetree/bindings/net/allwinner,sun7i-a20-gmac.txt | 27 ---------------------------
>  Documentation/devicetree/bindings/net/snps,dwmac.yaml              | 45 +++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 45 insertions(+), 27 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/net/allwinner,sun7i-a20-gmac.txt

I think it would be better to keep these as separate files and either
include snps,dwmac.yaml from it or only add the compatible to
snps,dwmac.yaml.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
