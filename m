Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A46D748E00
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Jul 2023 21:39:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C3B86C6B45C;
	Wed,  5 Jul 2023 19:39:45 +0000 (UTC)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
 [209.85.166.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 27AE0C6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Jul 2023 19:39:44 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id
 ca18e2360f4ac-777a4c8e8f4so354691039f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 05 Jul 2023 12:39:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688585983; x=1691177983;
 h=date:subject:message-id:references:in-reply-to:cc:to:from
 :mime-version:content-transfer-encoding:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=OR44xsl8dcDDRHket6JLRoRPh10jvQanfxZD4Qq5o5A=;
 b=UAmpLNVx9i1GmCWoBAMX5dSl421gwK0dS/BccottPtDFvxKNme2qcONRWNE3f3Onr1
 NaBxKJea0Rl5agS2vNpBBFVnBx7M6HQt6Aum/EszV3T7qSdVplbhUfFjEyXXe7W+ozDa
 KGArQkXI2Xx2hbHAVn01ncstEx/juo1w3NTaQPtVWOvSbo+c7pqVA1xfTs2YCkSnwfqw
 Tauk7r4epuNQv0bMkPFPQ7KzFT8MkutXpyincVxLb7DdzMo4pFXIOKgdNj7hsUB7kfFA
 jiygfSQXSBhl9cG8jyxZcds9pPyb9qojvPrRLPLgHi4mlmt7YVVnZSLLJv4gzteN212i
 islg==
X-Gm-Message-State: ABy/qLatkie7uLieB2AsaARobzRrHyatsuLXSG78XPT8mytpgSzV1pZm
 NToJq95Sedg51qjnZmxb0g==
X-Google-Smtp-Source: APBJJlFTsATQZZbeDYi05vWkxMhLO+2kIHQFYrmGtwqcASMsu98qNuBpLmP0dT/ZyPLVLU0YF4GwxA==
X-Received: by 2002:a6b:f208:0:b0:77e:3598:e511 with SMTP id
 q8-20020a6bf208000000b0077e3598e511mr177308ioh.2.1688585983078; 
 Wed, 05 Jul 2023 12:39:43 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id
 l10-20020a056638220a00b0042b1cd4c096sm3797893jas.74.2023.07.05.12.39.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jul 2023 12:39:42 -0700 (PDT)
Received: (nullmailer pid 1714650 invoked by uid 1000);
 Wed, 05 Jul 2023 19:39:32 -0000
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
In-Reply-To: <20230705172759.1610753-3-gatien.chevallier@foss.st.com>
References: <20230705172759.1610753-1-gatien.chevallier@foss.st.com>
 <20230705172759.1610753-3-gatien.chevallier@foss.st.com>
Message-Id: <168858597155.1714560.12250834903693245143.robh@kernel.org>
Date: Wed, 05 Jul 2023 13:39:32 -0600
Cc: alsa-devel@alsa-project.org, linux-iio@vger.kernel.org,
 catalin.marinas@arm.com, edumazet@google.com, linux-i2c@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-phy@lists.infradead.org,
 will@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 andi.shyti@kernel.org, herbert@gondor.apana.org.au, hugues.fruchet@foss.st.com,
 lee@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org,
 linux-serial@vger.kernel.org, richardcochran@gmail.com, mchehab@kernel.org,
 linux-arm-kernel@lists.infradead.org, arnd@kernel.org,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 ulf.hansson@linaro.org, linux-spi@vger.kernel.org, vkoul@kernel.org,
 robh+dt@kernel.org, linux-crypto@vger.kernel.org, netdev@vger.kernel.org,
 dmaengine@vger.kernel.org, davem@davemloft.net, jic23@kernel.org,
 Oleksii_Moisieiev@epam.com
Subject: Re: [Linux-stm32] [PATCH 02/10] dt-bindings: bus: add device tree
 bindings for RIFSC
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


On Wed, 05 Jul 2023 19:27:51 +0200, Gatien Chevallier wrote:
> Document RIFSC (RIF security controller). RIFSC is a firewall controller
> composed of different kinds of hardware resources.
> 
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> ---
>  .../bindings/bus/st,stm32-rifsc.yaml          | 101 ++++++++++++++++++
>  1 file changed, 101 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/bus/st,stm32-rifsc.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/bus/st,stm32-rifsc.yaml: title: 'STM32 Resource isolation framework security controller bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
	hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230705172759.1610753-3-gatien.chevallier@foss.st.com

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
