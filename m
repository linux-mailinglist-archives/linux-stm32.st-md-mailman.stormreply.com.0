Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EDA39D2AD2
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Nov 2024 17:24:58 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 48DCAC78F9A;
	Tue, 19 Nov 2024 16:24:58 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 617BCC6C841
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Nov 2024 16:24:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DE43F5C5710;
 Tue, 19 Nov 2024 16:24:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60664C4CECF;
 Tue, 19 Nov 2024 16:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732033488;
 bh=j6RXHCNuVKCw00NDiP75RQpvT8vD3zsb2CJxkx+a5lw=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=jlQXiGc/YR8uNbwBAQKlWob4eRRzO7iH49Xg2MCH2pQBrvrnaUexWASGP81MF3YpO
 yFHIEXYEGl77SRDIAO/jQoioITCZu+wHVgqse1FJghR41Vk68PtX+S1dV9TqCwkQY9
 jbStGm1TiQaxiwtRWIiYnBynNIGFg9ZBFtG9d4c1Iy0z8C86FUw2fv9ITdEZgQvTLe
 TtEhFXM6awiApADh3Eigxax/s/dK6mDfjW9kZ4xzFYbYbTBl/dUsuylyIfbrNxAmcO
 ddiOXhgNJli1abovfQGbYKrFijo8KwzLiR3Xw0LBKWO0XZl/WwsTd0u5IXkvta/7Hd
 p7v+VxLM74kGA==
Date: Tue, 19 Nov 2024 10:24:46 -0600
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
In-Reply-To: <20241119-upstream_s32cc_gmac-v5-13-7dcc90fcffef@oss.nxp.com>
References: <20241119-upstream_s32cc_gmac-v5-0-7dcc90fcffef@oss.nxp.com>
 <20241119-upstream_s32cc_gmac-v5-13-7dcc90fcffef@oss.nxp.com>
Message-Id: <173203348678.1765163.1636321988738538785.robh@kernel.org>
Cc: imx@lists.linux.dev, NXP S32 Linux Team <s32@nxp.com>,
 Emil Renner Berthing <kernel@esmil.dk>, Andrew Lunn <andrew@lunn.ch>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Eric Dumazet <edumazet@google.com>,
 Iyappan Subramanian <iyappan@os.amperecomputing.com>,
 Quan Nguyen <quan@os.amperecomputing.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Russell King <linux@armlinux.org.uk>,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Keyur Chudgar <keyur@os.amperecomputing.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Minda Chen <minda.chen@starfivetech.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v5 13/16] dt-bindings: net: Add DT
 bindings for DWMAC on NXP S32G/R SoCs
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


On Tue, 19 Nov 2024 16:00:19 +0100, Jan Petrous (OSS) wrote:
> Add basic description for DWMAC ethernet IP on NXP S32G2xx, S32G3xx
> and S32R45 automotive series SoCs.
> 
> Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> ---
>  .../devicetree/bindings/net/nxp,s32-dwmac.yaml     | 105 +++++++++++++++++++++
>  .../devicetree/bindings/net/snps,dwmac.yaml        |   3 +
>  2 files changed, 108 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml:25:9: [warning] wrong indentation: expected 10 but found 8 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241119-upstream_s32cc_gmac-v5-13-7dcc90fcffef@oss.nxp.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
