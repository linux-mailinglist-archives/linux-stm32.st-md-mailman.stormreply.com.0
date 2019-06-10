Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4833BC69
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Jun 2019 21:05:31 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6A435C6DD6B
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Jun 2019 19:05:31 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 15529C6DD6A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jun 2019 19:05:30 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 97B9A212F5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jun 2019 19:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560193528;
 bh=cOW8s/VNjz5sOUaoGt0xllYK4pDMxQHNLdqEQWRROOU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=YRBv6Qib4JrcChVXt7vJGBYCBimV0Z81MvXdciZgBKZRyeokB4P+LP1knHVGXNKuq
 YZ/NL5olKHnzo2vNBnuPHWdh0dkYqO4oUA4uOYoKEXDtJzHv15Chy8sSi0HIF45R6C
 ORjwtB0APFirgLUa+bGp1fz5QPiPnIVuSv+yR6NU=
Received: by mail-qt1-f178.google.com with SMTP id z24so5076798qtj.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jun 2019 12:05:28 -0700 (PDT)
X-Gm-Message-State: APjAAAX5P56UIvecZzvC0y48Va1f1ds/QSBtiehrPMFDY+PHXnT+3FKo
 FuQFLe7VqGOOmI8MeDD/vNUjHXlx0tQExOLV3Q==
X-Google-Smtp-Source: APXvYqzNFAFskotptWmZSp0y4dGXTAqiAx1e+KFLMaVcOIEt50adCoQmksEswgcUSdBQTvIorzTZl1RZS8CHwOD4XHs=
X-Received: by 2002:a0c:b786:: with SMTP id l6mr33361222qve.148.1560193527816; 
 Mon, 10 Jun 2019 12:05:27 -0700 (PDT)
MIME-Version: 1.0
References: <91618c7e9a5497462afa74c6d8a947f709f54331.1560158667.git-series.maxime.ripard@bootlin.com>
 <b5c46cff5b59d021634be143cf559c597f0a0e1f.1560158667.git-series.maxime.ripard@bootlin.com>
In-Reply-To: <b5c46cff5b59d021634be143cf559c597f0a0e1f.1560158667.git-series.maxime.ripard@bootlin.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 10 Jun 2019 13:05:16 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+0DY8aZ0Gz_x+_QObJhuym7eMAf_OO7fQGiW==U4uPzQ@mail.gmail.com>
Message-ID: <CAL_Jsq+0DY8aZ0Gz_x+_QObJhuym7eMAf_OO7fQGiW==U4uPzQ@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH v2 02/11] dt-bindings: net: Add a YAML
 schemas for the generic PHY options
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
> The networking PHYs have a number of available device tree properties that
> can be used in their device tree node. Add a YAML schemas for those.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
>
> ---
>
> Changes from v1:
>   - Add missing compatible options
>   - add missing phy speeds
>   - Fix the maintainers entry
>   - Add a custom select clause to make it validate all phy nodes, and not
>     just the ones with a compatible
> ---
>  Documentation/devicetree/bindings/net/ethernet-phy.yaml | 179 +++++++++-
>  Documentation/devicetree/bindings/net/phy.txt           |  80 +----
>  2 files changed, 180 insertions(+), 79 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/net/ethernet-phy.yaml

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
