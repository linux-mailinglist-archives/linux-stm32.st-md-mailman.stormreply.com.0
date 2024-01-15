Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD0082DB4D
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Jan 2024 15:33:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ED57AC6A61A;
	Mon, 15 Jan 2024 14:33:03 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E1EEBC6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Jan 2024 14:33:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id DF624CE1752;
 Mon, 15 Jan 2024 14:32:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 558BFC433C7;
 Mon, 15 Jan 2024 14:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705329175;
 bh=UDXSE/qtWCzHMmFjVVnygMyOMC3FExubEjUc3q/oLS4=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=qv4qfy7yX9RT7tt6dA8ycrcxnkTXIoJBSli7ZdjMfsr9t82l5SQlV87dVby8LzqXL
 /bo5NU4pAq98klmQM3D/S42jcMrERTJOGfUjwzku+B3nBX+3wPwVIQ6YQqXn81EEff
 gJzx65ym3W8YnUgTk2ItqzqsS8mxAm85nvu2lcPZcuSsEpOPUAbvGP6p+RRScFLLc5
 2SpyPkLbCaQHNXx8OTzwuVFHf+Wa/46vd0B2Su73cO0UnWAycTEF0ts2NpymAe36+K
 bW10U8+uPblfgY3wGlU0eoEWO2V69ehcxXcTPf2yJot/pmZOWtD1JB+ubVeeDAqyqz
 OsmZKr1Zc6K/A==
Date: Mon, 15 Jan 2024 08:32:54 -0600
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <20240115132009.101718-2-raphael.gallais-pou@foss.st.com>
References: <20240115132009.101718-1-raphael.gallais-pou@foss.st.com>
 <20240115132009.101718-2-raphael.gallais-pou@foss.st.com>
Message-Id: <170532917312.565061.10381473169126019945.robh@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 1/6] dt-bindings: display: add
 dt-bindings for STM32 LVDS device
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


On Mon, 15 Jan 2024 14:20:04 +0100, Raphael Gallais-Pou wrote:
> Add "st,stm32mp25-lvds" compatible.
> 
> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> ---
> Depends on: "dt-bindings: stm32: add clocks and reset binding for
> 	    stm32mp25 platform" by Gabriel Fernandez
> 
> Changes in v3:
> 	- Clarify commit dependency
> 	- Fix includes in the example
> 	- Fix YAML
> 	- Add "clock-cells" description
> 	- s/regroups/is composed of/
> 	- Changed compatible to show SoC specificity
> 
> Changes in v2:
> 	- Switch compatible and clock-cells related areas
> 	- Remove faulty #include in the example.
> 	- Add entry in MAINTAINERS
> ---
>  .../bindings/display/st,stm32-lvds.yaml       | 119 ++++++++++++++++++
>  MAINTAINERS                                   |   1 +
>  2 files changed, 120 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/st,stm32-lvds.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/display/st,stm32-lvds.example.dts:18:18: fatal error: dt-bindings/clock/st,stm32mp25-rcc.h: No such file or directory
   18 |         #include <dt-bindings/clock/st,stm32mp25-rcc.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[2]: *** [scripts/Makefile.lib:419: Documentation/devicetree/bindings/display/st,stm32-lvds.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1424: dt_binding_check] Error 2
make: *** [Makefile:234: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240115132009.101718-2-raphael.gallais-pou@foss.st.com

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
