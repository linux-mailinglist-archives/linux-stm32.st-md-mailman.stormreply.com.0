Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4064BB26
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Jun 2019 16:19:26 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9329CC5BB01
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Jun 2019 14:19:26 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 36EDDC5BB00
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jun 2019 14:19:25 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BF1D221874
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jun 2019 14:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560953963;
 bh=n8TEMp5NfQkh8hO6ix5AyOImy509Oc/VLYfShgqtBWw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=TQQzzcQOVDYujYjhiqpIrjGpja5ysim7xreIt+TN34F1ZsHgv6nHPk3OxP8icYFAD
 /4yV+c0m9zEmrqiyzOdAUMc8E7d/L6CCS4/dHHDBrcQ9Hyseb+KJGWqm294Lm1AlYO
 Zk7JA9zUGhIitAcrZj+D9Vw2m2VCiTZf1p9uTW7A=
Received: by mail-qk1-f173.google.com with SMTP id m14so10985644qka.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jun 2019 07:19:23 -0700 (PDT)
X-Gm-Message-State: APjAAAVbJ71YwrTs0idMDPxlWAcsvQ7F4H71TGBKFlWY9ZRyb3AOZXEa
 IjqMZuGjuhJk8d1rV2AnoetzL/+6t/HHHzhaHw==
X-Google-Smtp-Source: APXvYqz30or7ej65/SsSJs4x/X0k8P1S6woBKs9hS49G7m6m1H5U7iWLwPFZp3nxyKc4KLu6ce8JHx53OeFWyc6rypc=
X-Received: by 2002:a05:620a:13d1:: with SMTP id
 g17mr45012878qkl.121.1560953963047; 
 Wed, 19 Jun 2019 07:19:23 -0700 (PDT)
MIME-Version: 1.0
References: <27aeb33cf5b896900d5d11bd6957eda268014f0c.1560937626.git-series.maxime.ripard@bootlin.com>
 <36bc43471d12502b3b49169ca16cf1f5de415f95.1560937626.git-series.maxime.ripard@bootlin.com>
In-Reply-To: <36bc43471d12502b3b49169ca16cf1f5de415f95.1560937626.git-series.maxime.ripard@bootlin.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 19 Jun 2019 08:19:11 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+thwOWdfu8Wa2=VeHNHbcUDtAzYEisntY=txnKriG2BA@mail.gmail.com>
Message-ID: <CAL_Jsq+thwOWdfu8Wa2=VeHNHbcUDtAzYEisntY=txnKriG2BA@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH v3 07/16] dt-bindings: net: sun4i-mdio:
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
> Switch our Allwinner A10 MDIO controller binding to a YAML schema to enable
> the DT validation.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
>
> ---
>
> Changes from v2:
>   - Add the generic MDIO YAML schema
>
> Changes from v1:
>   - Add a select statement with the deprecated compatible, and remove it
>     from the valid compatibles
> ---
>  Documentation/devicetree/bindings/net/allwinner,sun4i-a10-mdio.yaml | 70 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  Documentation/devicetree/bindings/net/allwinner,sun4i-mdio.txt      | 27 ---------------------------
>  2 files changed, 70 insertions(+), 27 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/net/allwinner,sun4i-a10-mdio.yaml
>  delete mode 100644 Documentation/devicetree/bindings/net/allwinner,sun4i-mdio.txt

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
