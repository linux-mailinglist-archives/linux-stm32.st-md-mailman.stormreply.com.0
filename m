Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D61981B9CC
	for <lists+linux-stm32@lfdr.de>; Thu, 21 Dec 2023 15:46:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EFEC1C6B477;
	Thu, 21 Dec 2023 14:46:04 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B5021C6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Dec 2023 14:46:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 22AC4B82073;
 Thu, 21 Dec 2023 14:46:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BCFFC433C7;
 Thu, 21 Dec 2023 14:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1703169962;
 bh=thWZKn3LobCE6e6aQM2Yre45Naiy5TVPR/p07htNFWs=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=h/CjY5L+a5dEjJqvVIGFMZj2f59MlKhsq9pFWymGuLHkq4VT2WmdJWnHPm/D7mvgD
 SYGt/ajHFVTDkxhUgq+0orV0jRDbHAdKrlq853JzqVVHOX86FgDMJENp2EarMFvEnV
 T5RwD6M+XWbM+lqeNVyOSORS9+0LPaUB1Z+rUkhx4m6/BUvAoWcJCtaVw3ykP3Jh7C
 Ea1QAE21miY5PmyynsJeuvYK6zb7KSd/ufObGbLwTWd0ztaty0I2qZ29b8+DmGIoJ8
 vPtoSwsjmenOl4QweCo4nveV/Mo1mNb2U9+6KJOsqTaBNeHzc4mlio6SzFZe97DEiM
 dsp0/UzakXuIw==
Received: (nullmailer pid 3869255 invoked by uid 1000);
 Thu, 21 Dec 2023 14:45:59 -0000
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <20231221124339.420119-3-raphael.gallais-pou@foss.st.com>
References: <20231221124339.420119-1-raphael.gallais-pou@foss.st.com>
 <20231221124339.420119-3-raphael.gallais-pou@foss.st.com>
Message-Id: <170316995910.3869238.14321525013510097521.robh@kernel.org>
Date: Thu, 21 Dec 2023 08:45:59 -0600
Cc: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, linux-stm32@st-md-mailman.stormreply.com,
 David Airlie <airlied@gmail.com>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Yannick Fertre <yannick.fertre@foss.st.com>, linux-kernel@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [Linux-stm32] [PATCH RESEND v1 2/8] dt-bindings: display: add
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


On Thu, 21 Dec 2023 13:43:33 +0100, Raphael Gallais-Pou wrote:
> Add dt-binding file for "st,stm32-lvds" compatible.
> 
> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> ---
>  .../bindings/display/st,stm32-lvds.yaml       | 114 ++++++++++++++++++
>  1 file changed, 114 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/st,stm32-lvds.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/display/st,stm32-lvds.example.dts:18:18: fatal error: dt-bindings/bus/stm32mp25_sys_bus.h: No such file or directory
   18 |         #include <dt-bindings/bus/stm32mp25_sys_bus.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[2]: *** [scripts/Makefile.lib:419: Documentation/devicetree/bindings/display/st,stm32-lvds.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1424: dt_binding_check] Error 2
make: *** [Makefile:234: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20231221124339.420119-3-raphael.gallais-pou@foss.st.com

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
