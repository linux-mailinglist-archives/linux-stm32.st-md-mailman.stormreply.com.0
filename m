Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE4387D749
	for <lists+linux-stm32@lfdr.de>; Sat, 16 Mar 2024 00:19:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8F804C6DD69;
	Fri, 15 Mar 2024 23:19:56 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 28FF1C64102
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Mar 2024 23:19:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 05687CE1E3F;
 Fri, 15 Mar 2024 23:19:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D366C433F1;
 Fri, 15 Mar 2024 23:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710544790;
 bh=jBWgkYqvqhVvrT8m7OLF+JmN106sgWSvhxbbqyPfUDI=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=CVbH5fRerXnTKiVloaqImqoEZu0gtZV5dhBTBtdVFe7IITRZnp3YH3Nm265Meyl6b
 Hq0gD6iGzKSezqxwEXCyokTEUjRxFzFba/ooq9hRIgIfvWtTa/8Zspfoubyu/6+lIr
 DdZZIyf0o271jpS8VO8TjXCnzIawIzZJaUPgUm0F7VlCw8hFS76TuE8OINHwPXneZf
 rQ79E8HCSodoBeIF8tKehqrVyX2uFbR7Y40g2I988ZMJgw9Wg1840a8Ebj1H142ZbW
 2l2mwlCE9t4WbaxJ8YOQ9xhlQmE9IGl0GLYWVHCFQJQ958tdnrTE4gTSQ4jTb0FYvM
 QJ9OwANVCIeng==
Date: Fri, 15 Mar 2024 17:19:49 -0600
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Wadim Mueller <wafgo01@gmail.com>
In-Reply-To: <20240315222754.22366-4-wafgo01@gmail.com>
References: <20240315222754.22366-1-wafgo01@gmail.com>
 <20240315222754.22366-4-wafgo01@gmail.com>
Message-Id: <171054478795.2084826.7994527965167081853.robh@kernel.org>
Cc: Jose Abreu <joabreu@synopsys.com>, NXP S32 Linux Team <s32@nxp.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Swee Leong Ching <leong.ching.swee@intel.com>,
 Eric Dumazet <edumazet@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Johannes Zink <j.zink@pengutronix.de>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-clk@vger.kernel.org, Shenwei Wang <shenwei.wang@nxp.com>,
 NXP Linux Team <linux-imx@nxp.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Andrew Halaney <ahalaney@redhat.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Richard Cochran <richardcochran@gmail.com>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 Rob Herring <robh+dt@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, Chester Lin <chester62515@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matthias Brugger <mbrugger@suse.com>, Stephen Boyd <sboyd@kernel.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, Simon Horman <horms@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>,
 =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Subject: Re: [Linux-stm32] [PATCH 3/3] dt-bindings: net: add schema for NXP
 S32 dwmac glue driver
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


On Fri, 15 Mar 2024 23:27:49 +0100, Wadim Mueller wrote:
> Add DT binding schema documentation for the NXP S32 dwmac glue driver. This documentation is based on the patchset originally provided by Chester Lin [1]. This commit is a re-send of [2] and [3].
> 
> [1] https://patchwork.kernel.org/project/netdevbpf/patch/20221031101052.14956-6-clin@suse.com/#25068228
> [2] https://lore.kernel.org/lkml/20221031101052.14956-1-clin@suse.com/T/#me96c28bd0536de276dee941469ea084d51b42244
> [3] https://lore.kernel.org/lkml/20221031101052.14956-1-clin@suse.com/T/#m887a1b34e612f8dc0d5b718e4d6834c083f1e245
> 
> Signed-off-by: Wadim Mueller <wafgo01@gmail.com>
> ---
>  .../bindings/net/nxp,s32-dwmac.yaml           | 130 ++++++++++++++++++
>  .../devicetree/bindings/net/snps,dwmac.yaml   |   5 +-
>  2 files changed, 133 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml:5:10: [error] string value is redundantly quoted with any quotes (quoted-strings)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml: 'maintainers' is a required property
	hint: Metaschema for devicetree binding documentation
	from schema $id: http://devicetree.org/meta-schemas/base.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240315222754.22366-4-wafgo01@gmail.com

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
