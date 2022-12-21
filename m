Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5931C65375B
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Dec 2022 21:09:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CEBC3C6904D;
	Wed, 21 Dec 2022 20:09:44 +0000 (UTC)
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com
 [209.85.161.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9882BC6904B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Dec 2022 20:09:43 +0000 (UTC)
Received: by mail-oo1-f52.google.com with SMTP id
 z20-20020a4a4914000000b004b026afa844so1572577ooa.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Dec 2022 12:09:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=date:subject:message-id:references:in-reply-to:cc:to:from
 :mime-version:content-transfer-encoding:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=7hY8G8o4GP1gTqYrBQoBdXzTjanx+NXgVGTmmfwXwXs=;
 b=ml44x32zpdWg2V+i4wMm+ccGKdfvuhxcYI0TGisV32Xh6b15cxWE887eCC9tRRf8+m
 r8q6UJkeYqUDUHoExX9hj66zRsC7s7PprTIuLaPL+9UroNI7TuW+PXfIINjIitLw0Cem
 kuXXCMGczslTmfL+HzuLYeDxH4kA5Rm9kP58a2/YFer2YeoJ4EjI9p+oppnUXvEvDEAW
 r9XLX62GoOb7C2eY5xkcpivqe6af3U99l1dz3T8Os8p0qT8wroep0Vdl+YUkJtg9H0Si
 V33Uu+VDPmWQoGHDPVAJpCMCjnjm2qejo3Vtj7yYyGjzliTPgOz+5p0m0xmkTC/sgC99
 4G+w==
X-Gm-Message-State: AFqh2kqknn5XTnGHsUkEQDS+EXuOpIoOY8J96SBmSThBTpz6eWmgJI36
 HlesrFruaWPc1H3IUYiP9A==
X-Google-Smtp-Source: AMrXdXveW3JoX6VWWBCCN4Q7iiVTUWg23bq1ov+RfxpKJ/SnFEaIJTtMr3mHKg7dfWRpEyJaD1BcIg==
X-Received: by 2002:a4a:e7cf:0:b0:4a3:51a2:f8ba with SMTP id
 y15-20020a4ae7cf000000b004a351a2f8bamr1438923oov.6.1671653382279; 
 Wed, 21 Dec 2022 12:09:42 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 r15-20020a4a964f000000b004a085ddc771sm6463496ooi.6.2022.12.21.12.09.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 12:09:41 -0800 (PST)
Received: (nullmailer pid 3506211 invoked by uid 1000);
 Wed, 21 Dec 2022 20:09:41 -0000
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
In-Reply-To: <20221221173055.11719-3-gatien.chevallier@foss.st.com>
References: <20221221173055.11719-1-gatien.chevallier@foss.st.com>
 <20221221173055.11719-3-gatien.chevallier@foss.st.com>
Message-Id: <167165333929.3500496.17240347378760070278.robh@kernel.org>
Date: Wed, 21 Dec 2022 14:09:41 -0600
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, arnd@arndb.de,
 gregkh@linuxfoundation.org, linus.walleij@linaro.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, Oleksii_Moisieiev@epam.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [RFC PATCH 2/7] dt-bindings: bus: add STM32
	System Bus
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


On Wed, 21 Dec 2022 18:30:50 +0100, Gatien Chevallier wrote:
> Document STM32 System Bus. This bus is intended to control firewall
> access for the peripherals connected to it.
> 
> Signed-off-by: Loic PALLARDY <loic.pallardy@st.com>
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> ---
>  .../devicetree/bindings/bus/st,sys-bus.yaml   | 88 +++++++++++++++++++
>  1 file changed, 88 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/bus/st,sys-bus.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/bus/st,sys-bus.yaml:7:8: [warning] too many spaces after colon (colons)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/bus/st,sys-bus.yaml: $id: 'http://devicetree.org/schemas/bus/stm32,sys-bus.yaml' does not match 'http://devicetree.org/schemas/.*\\.yaml#'
	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/bus/st,sys-bus.yaml: properties:#feature-domain-cells: 'minItems' is not one of ['description', 'deprecated', 'const', 'enum', 'minimum', 'maximum', 'multipleOf', 'default', '$ref', 'oneOf']
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
./Documentation/devicetree/bindings/bus/st,sys-bus.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/bus/st,sys-bus.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20221221173055.11719-3-gatien.chevallier@foss.st.com

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
