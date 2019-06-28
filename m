Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BFBA58F93
	for <lists+linux-stm32@lfdr.de>; Fri, 28 Jun 2019 03:16:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 08844C3F949;
	Fri, 28 Jun 2019 01:16:17 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 17D74C3F933
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Jun 2019 01:16:15 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 69C472146E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Jun 2019 01:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561684573;
 bh=Z9yocx8qQWhLGVeHQQwWu+OcwqV+thBQlAOsCplTlCk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=A1BokdVi10ZhUBO/HUkH3Y4ylk6a6ZBSyja4sDiAtoFTq3CS+UOmoclUJewcAKtvV
 ud48/RJ5R10WnjQBJeaQw5vsMjXmvNOp8nmhJesOK58bXRaIx4cR2bhgBsA2+nv7N0
 WDv0wkzrT7CQAgA+GgUZ1UNUcartqHNWWrb7YkQY=
Received: by mail-qt1-f177.google.com with SMTP id x47so4562618qtk.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jun 2019 18:16:13 -0700 (PDT)
X-Gm-Message-State: APjAAAVHNRmEKTMhJs3ovsHDlag4lz3YxTArlA3znGBOHRjXEpuQA4MO
 no2MetJp1TinD80mPPjTzXJMRE42cI4II2HVKw==
X-Google-Smtp-Source: APXvYqy3SrNqxnKgSsphHt1HwJRh2CjKXy+obFOvY+TpNLf1WKgrdAvAlOo5bMvYt0Olym7oKFynePl1OSb37uMLnUw=
X-Received: by 2002:aed:3fb0:: with SMTP id s45mr6010512qth.136.1561684572669; 
 Thu, 27 Jun 2019 18:16:12 -0700 (PDT)
MIME-Version: 1.0
References: <cover.e80da8845680a45c2e07d5f17280fdba84555b8a.1561649505.git-series.maxime.ripard@bootlin.com>
 <945e54f02cc36a543b4c0bfd960475147359f7ff.1561649505.git-series.maxime.ripard@bootlin.com>
In-Reply-To: <945e54f02cc36a543b4c0bfd960475147359f7ff.1561649505.git-series.maxime.ripard@bootlin.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Thu, 27 Jun 2019 19:16:01 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJ0-p2w77OyaN07=DEdMzmUpPmPPMyqYj3jZJX+PV8LiA@mail.gmail.com>
Message-ID: <CAL_JsqJ0-p2w77OyaN07=DEdMzmUpPmPPMyqYj3jZJX+PV8LiA@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH v4 02/13] dt-bindings: net: Add a YAML
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

On Thu, Jun 27, 2019 at 9:32 AM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> The networking PHYs have a number of available device tree properties that
> can be used in their device tree node. Add a YAML schemas for those.
>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> ---
>  Documentation/devicetree/bindings/net/ethernet-phy.yaml | 179 +++++++++-
>  Documentation/devicetree/bindings/net/phy.txt           |  80 +----
>  2 files changed, 180 insertions(+), 79 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/net/ethernet-phy.yaml
>
> diff --git a/Documentation/devicetree/bindings/net/ethernet-phy.yaml b/Documentation/devicetree/bindings/net/ethernet-phy.yaml
> new file mode 100644
> index 000000000000..81d2016d7232
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/ethernet-phy.yaml
> @@ -0,0 +1,179 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/ethernet-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Ethernet PHY Generic Binding
> +
> +maintainers:
> +  - Andrew Lunn <andrew@lunn.ch>
> +  - Florian Fainelli <f.fainelli@gmail.com>
> +  - Heiner Kallweit <hkallweit1@gmail.com>
> +
> +# The dt-schema tools will generate a select statement first by using
> +# the compatible, and second by using the node name if any. In our
> +# case, the node name is the one we want to match on, while the
> +# compatible is optional.
> +select:
> +  properties:
> +    $nodename:
> +      pattern: "^ethernet-phy(@[a-f0-9]+)?$"
> +
> +  required:
> +    - $nodename
> +
> +properties:
> +  $nodename:
> +    pattern: "^ethernet-phy(@[a-f0-9]+)?$"
> +
> +  compatible:
> +    oneOf:
> +      - const: ethernet-phy-ieee802.3-c22
> +        description: PHYs that implement IEEE802.3 clause 22
> +      - const: ethernet-phy-ieee802.3-c45
> +        description: PHYs that implement IEEE802.3 clause 45
> +      - pattern: "^ethernet-phy-id[a-f0-9]{4}\\.[a-f0-9]{4}$"
> +        description:
> +          If the PHY reports an incorrect ID (or none at all) then the
> +          compatible list may contain an entry with the correct PHY ID
> +          in the above form.
> +          The first group of digits is the 16 bit Phy Identifier 1
> +          register, this is the chip vendor OUI bits 3:18. The
> +          second group of digits is the Phy Identifier 2 register,
> +          this is the chip vendor OUI bits 19:24, followed by 10
> +          bits of a vendor specific ID.
> +      - items:
> +          - pattern: "^ethernet-phy-id[a-f0-9]{4}\\.[a-f0-9]{4}$"
> +          - const: ethernet-phy-ieee802.3-c45
> +
> +  reg:
> +    maxItems: 1
> +    minimum: 0
> +    maximum: 31
> +    description:
> +      The ID number for the PHY.

Mixing array and scalar properties is something we shouldn't be doing,
so I dropped maxItems as that is implied. I have a meta-schema check
for this once a couple of occurrences are fixed in the tree.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
