Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 264CC748E04
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Jul 2023 21:39:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E22AAC6B45D;
	Wed,  5 Jul 2023 19:39:50 +0000 (UTC)
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com
 [209.85.166.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4A817C6B45A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Jul 2023 19:39:49 +0000 (UTC)
Received: by mail-il1-f171.google.com with SMTP id
 e9e14a558f8ab-345b231322fso28371615ab.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 05 Jul 2023 12:39:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688585988; x=1691177988;
 h=date:subject:message-id:references:in-reply-to:cc:to:from
 :mime-version:content-transfer-encoding:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=EmigWppDMAwntmLPkpHMViFD3zfbB0BalUBHyRmY93I=;
 b=AFzbz93qAN2PhRAa/bXmzEii3DP8nkpaLdA4Hk0YtgmdmoaxOA72RHIfaofEriPieq
 4MZkBPiaUVtTCzJheCD797pgCrkvyvrRmlRIQeAyaPqw1dkIsAcPTycUmwD0lgdB9Emp
 Kc0r/8o/T3rxCEqG4Rk0YUdWr7rPjTFjhNhuL4RBP5WifwSng1sUQ4p2c2BdNpmDo/93
 5qcJ/LaFZXvjm08FqWeYuAlbGdwVaT/Kdo3emw9gvOkG2tHadqdsS9L+tNa7yimlYhP4
 TBquWfeyOuwmdbZ15075KqK82D4GMUThtAIRZmcBHMCZ2pF3ItpQYtV7tbZFaD4LdwzX
 k9FA==
X-Gm-Message-State: ABy/qLaYgPGvIfFuyPGWsvrjXSzNNnpiRsa6Htx1GKEiA0VlpXXjGt7r
 9Zc72vFi1NpdJrPMGSIMAg==
X-Google-Smtp-Source: APBJJlE1T+SG//kQOjsdrxPqC6WYFy+jVqYd/9wV9AIbQOA/LFJUSpnFw6o7MHDprdjfMYp8ihzVDA==
X-Received: by 2002:a6b:3c02:0:b0:786:45f7:fb7e with SMTP id
 k2-20020a6b3c02000000b0078645f7fb7emr58527iob.13.1688585988126; 
 Wed, 05 Jul 2023 12:39:48 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id
 d21-20020a02a495000000b0042ad887f705sm6314042jam.143.2023.07.05.12.39.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jul 2023 12:39:47 -0700 (PDT)
Received: (nullmailer pid 1714652 invoked by uid 1000);
 Wed, 05 Jul 2023 19:39:32 -0000
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
In-Reply-To: <20230705172759.1610753-4-gatien.chevallier@foss.st.com>
References: <20230705172759.1610753-1-gatien.chevallier@foss.st.com>
 <20230705172759.1610753-4-gatien.chevallier@foss.st.com>
Message-Id: <168858597253.1714602.9996873148476929300.robh@kernel.org>
Date: Wed, 05 Jul 2023 13:39:32 -0600
Cc: alsa-devel@alsa-project.org, linux-iio@vger.kernel.org,
 catalin.marinas@arm.com, edumazet@google.com, linux-i2c@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-phy@lists.infradead.org,
 will@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 herbert@gondor.apana.org.au, hugues.fruchet@foss.st.com, lee@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, conor+dt@kernel.org, andi.shyti@kernel.org,
 richardcochran@gmail.com, linux-serial@vger.kernel.org, mchehab@kernel.org,
 linux-arm-kernel@lists.infradead.org, arnd@kernel.org,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 ulf.hansson@linaro.org, linux-spi@vger.kernel.org, vkoul@kernel.org,
 robh+dt@kernel.org, linux-crypto@vger.kernel.org, netdev@vger.kernel.org,
 dmaengine@vger.kernel.org, davem@davemloft.net, jic23@kernel.org,
 Oleksii_Moisieiev@epam.com
Subject: Re: [Linux-stm32] [PATCH 03/10] dt-bindings: bus: add device tree
 bindings for ETZPC
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


On Wed, 05 Jul 2023 19:27:52 +0200, Gatien Chevallier wrote:
> Document ETZPC (Extended TrustZone protection controller). ETZPC is a
> firewall controller.
> 
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> ---
>  .../bindings/bus/st,stm32-etzpc.yaml          | 90 +++++++++++++++++++
>  1 file changed, 90 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/bus/st,stm32-etzpc.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/bus/st,stm32-etzpc.yaml: title: 'STM32 Extended TrustZone protection controller bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
	hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
Documentation/devicetree/bindings/bus/st,stm32-etzpc.example.dtb: /example-0/etzpc@5c007000: failed to match any schema with compatible: ['st,stm32mp13-sys-bus']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230705172759.1610753-4-gatien.chevallier@foss.st.com

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
