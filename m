Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A7A82AFF9
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Jan 2024 14:52:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6A5BBC6DD73;
	Thu, 11 Jan 2024 13:52:53 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CD287C6B452
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Jan 2024 13:52:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 910D461AC2;
 Thu, 11 Jan 2024 13:52:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F230BC43390;
 Thu, 11 Jan 2024 13:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1704981170;
 bh=oqf5JLOymInwHwtg+ilEG0ySqEqtsaLxlVErWKWg6FM=; h=Date:From:From;
 b=u3aJqUoCeL+stGSFheGYRoSJE2kN9pnZIsjeRBUe0wlLt5qRnFuA8dKuk9zpjPT2o
 WhSzzqKzUIb30jV6OuuOc8E+R5uWeCH0YrZjDTvAE3Y9QceWH7jgTdz0VgwA6ORp9L
 IHwSY06yReZjZZbMy8yjYFN/Iqd+wjmz3omPxdJBReMM8hXEbpXMB/qaTUAHMU0Qsw
 hZWeG1A4Jx5zQC0PmFtmmWKMZHTMeqiKslvc4MXx2X9lAf9K9kg3EkO7hCT0PM6uz3
 iRvO0ar6gpcgNivzzKE9qhWjaov6bSERc7vQCO+hlnpWdPfbrwM4GJVfflv+RyQLzi
 OCR4Gx2SV5W1g==
Date: Thu, 11 Jan 2024 07:52:48 -0600
Message-Id: <20240111135249.F230BC43390@smtp.kernel.org>
From: robh@kernel.org
Subject: [Linux-stm32] (no subject)
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

From rob Thu Jan  1 00:00:00 1970
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 Philipp Zabel <p.zabel@pengutronix.de>, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Yannick Fertre <yannick.fertre@foss.st.com>, 
 Philippe Cornu <philippe.cornu@foss.st.com>, 
 Maxime Ripard <mripard@kernel.org>, Daniel Vetter <daniel@ffwll.ch>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>, 
 devicetree@vger.kernel.org, David Airlie <airlied@gmail.com>
In-Reply-To: <20240111104049.38695-2-raphael.gallais-pou@foss.st.com>
References: <20240111104049.38695-1-raphael.gallais-pou@foss.st.com>
 <20240111104049.38695-2-raphael.gallais-pou@foss.st.com>
Message-Id: <170498111721.407937.7040925641869885600.robh@kernel.org>
Subject: Re: [PATCH v2 1/6] dt-bindings: display: add dt-bindings for STM32
 LVDS device


On Thu, 11 Jan 2024 11:40:44 +0100, Raphael Gallais-Pou wrote:
> Add "st,stm32-lvds" compatible.
> 
> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> ---
> Changes in v2:
> 	- Switch compatible and clock-cells related areas
> 	- Remove faulty #include in the example.
> 	- Add entry in MAINTAINERS
> ---
>  .../bindings/display/st,stm32-lvds.yaml       | 117 ++++++++++++++++++
>  MAINTAINERS                                   |   1 +
>  2 files changed, 118 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/st,stm32-lvds.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/display/st,stm32-lvds.example.dts:18:18: fatal error: dt-bindings/clock/stm32mp25-clks.h: No such file or directory
   18 |         #include <dt-bindings/clock/stm32mp25-clks.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[2]: *** [scripts/Makefile.lib:419: Documentation/devicetree/bindings/display/st,stm32-lvds.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1424: dt_binding_check] Error 2
make: *** [Makefile:234: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240111104049.38695-2-raphael.gallais-pou@foss.st.com

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
