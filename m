Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E1D3BC5F
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Jun 2019 21:03:03 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 87DF6C6DD69
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Jun 2019 19:03:03 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EDC8DCF2413
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jun 2019 19:03:02 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 87BA820859
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jun 2019 19:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560193381;
 bh=NblxIERz+Cyc8pebQ/YTyK3Qt134gIJ9b11F5HCfcSw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=PgJJh642AWLqqi0z4cBc8Uz8AaKinC3+7XqnMIaw+qbjRmFeUnOF9pmKTHsL4eTK+
 00D2dCkgrqb7KkPk9lllmW1lWRxp2XPZ1jf4C905eYEKe+RTNiHPksmJInX6DeFguH
 ajEfOhWUGO9IuJjJNba0/6WgzIHh7EeZvR62u+8s=
Received: by mail-qt1-f171.google.com with SMTP id x47so11651587qtk.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jun 2019 12:03:01 -0700 (PDT)
X-Gm-Message-State: APjAAAXXbTHacNwS5U9gBXqAF6JtpX2LkfYdEJtLG6ATyixGnF4+chwh
 GIIp7m4CoU804Hf35Kx2tqJye5PJ/MWNj4wfSg==
X-Google-Smtp-Source: APXvYqy9lwcAc459jdixSn0EhQcrOn2ydIJGUumtuZb7Ajh2SHHffvWIy0UNqYr9ntVCWt/AeFq56dTqVeVGcjluGpQ=
X-Received: by 2002:aed:3b33:: with SMTP id p48mr53898280qte.143.1560193380845; 
 Mon, 10 Jun 2019 12:03:00 -0700 (PDT)
MIME-Version: 1.0
References: <91618c7e9a5497462afa74c6d8a947f709f54331.1560158667.git-series.maxime.ripard@bootlin.com>
In-Reply-To: <91618c7e9a5497462afa74c6d8a947f709f54331.1560158667.git-series.maxime.ripard@bootlin.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 10 Jun 2019 13:02:49 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+8_+OPVO14xu1yZU8q1Nux70TjP42j6SiBo9KdHL-4qQ@mail.gmail.com>
Message-ID: <CAL_Jsq+8_+OPVO14xu1yZU8q1Nux70TjP42j6SiBo9KdHL-4qQ@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH v2 01/11] dt-bindings: net: Add YAML
 schemas for the generic Ethernet options
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
> The Ethernet controllers have a good number of generic options that can be
> needed in a device tree. Add a YAML schemas for those.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
>
> ---
>
> Changes from v1:
>   - Use an enum for phy-connection-types
>   - Validate the items for the fixed-link array
>   - Set the number of valid items for link-gpios to 1
>   - Removed deprecated properties (phy-mode, phy, phy-device)
> ---
>  Documentation/devicetree/bindings/net/ethernet-controller.yaml | 194 +++++++-
>  Documentation/devicetree/bindings/net/ethernet.txt             |  69 +--
>  Documentation/devicetree/bindings/net/fixed-link.txt           |  55 +--
>  3 files changed, 196 insertions(+), 122 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/net/ethernet-controller.yaml

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
