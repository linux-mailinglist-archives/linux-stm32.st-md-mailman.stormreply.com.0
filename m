Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F03735CE9
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Jun 2023 19:17:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3A823C6B442;
	Mon, 19 Jun 2023 17:17:47 +0000 (UTC)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
 [209.85.166.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 198C7C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jun 2023 17:17:46 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id
 ca18e2360f4ac-77ac14ff51bso150597239f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jun 2023 10:17:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687195065; x=1689787065;
 h=date:subject:message-id:references:in-reply-to:cc:to:from
 :mime-version:content-transfer-encoding:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=QWcThq/h02+s+wcg2Hr4AaoQzShvDZL/nv4qKzi7L/0=;
 b=I3vT2VvSyZjknwRfbHd5GIxvP+TlEeRuH0ruTXi3V8TZnf9TYZGWW7z5NMqkc17bn8
 FvCoDesC9h7jPXo4zEEPLjTuYNeqUOu8MPvrIPfbrZKcA33tWGLf+S/iw6OFadd298J8
 429FI0XUWbkKRH759M04580eKlyzuizr2i7CFuotApXu3Pwn4cHAmcf1gVqVUuJara/V
 PPGBYrPQy1rk/hX2y20oUDoIAmRyp3mXYxqQLgitxJCxVN59FZkL/LA12T/mh74bhcla
 zfcqDbDPgTb5PsDDKTg/viK5mbhRvi3zCsg6dOH0qI9wkCCAnDkEDW2T4P2fKZCpcDev
 +kQQ==
X-Gm-Message-State: AC+VfDznSj/IT4eHNvUDgKcNJ5luSlvcp21hkSyYXvV6tSRVWrkRQquF
 2KVg1KNPPe5+K3wNfrF6Ng==
X-Google-Smtp-Source: ACHHUZ6rYV4VuZykUXSkm0tKMSUKMNa10Ofovryp4YB+E712Rgarm82iPHFXZnH0jReYkDPABmnYmw==
X-Received: by 2002:a5e:880b:0:b0:774:84f4:6ea with SMTP id
 l11-20020a5e880b000000b0077484f406eamr6600673ioj.11.1687195064770; 
 Mon, 19 Jun 2023 10:17:44 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id
 h4-20020a02b604000000b0040fadba66b0sm101906jam.58.2023.06.19.10.17.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jun 2023 10:17:44 -0700 (PDT)
Received: (nullmailer pid 1420938 invoked by uid 1000);
 Mon, 19 Jun 2023 17:17:42 -0000
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
In-Reply-To: <20230619165525.1035243-5-dario.binacchi@amarulasolutions.com>
References: <20230619165525.1035243-1-dario.binacchi@amarulasolutions.com>
 <20230619165525.1035243-5-dario.binacchi@amarulasolutions.com>
Message-Id: <168719506209.1420922.17702142182740385412.robh@kernel.org>
Date: Mon, 19 Jun 2023 11:17:42 -0600
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 michael@amarulasolutions.com, David Airlie <airlied@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 4/6] dt-bindings: display: stm32-ltdc:
 add optional st, fb-bpp property
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


On Mon, 19 Jun 2023 18:55:23 +0200, Dario Binacchi wrote:
> Boards that use the STM32F{4,7} series have limited amounts of RAM. The
> added property allows to size, within certain limits, the memory footprint
> required by the framebuffer.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
> 
> (no changes since v1)
> 
>  .../devicetree/bindings/display/st,stm32-ltdc.yaml          | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml: properties:st,fb-bpp:maxItems: False schema does not allow 1
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230619165525.1035243-5-dario.binacchi@amarulasolutions.com

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
