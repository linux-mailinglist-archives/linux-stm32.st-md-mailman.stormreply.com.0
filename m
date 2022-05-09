Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A417A520518
	for <lists+linux-stm32@lfdr.de>; Mon,  9 May 2022 21:16:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5E95AC5F1D3;
	Mon,  9 May 2022 19:16:49 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com
 [209.85.160.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5AD8FC57183
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 May 2022 19:16:48 +0000 (UTC)
Received: by mail-oa1-f49.google.com with SMTP id
 586e51a60fabf-e5e433d66dso15815007fac.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 09 May 2022 12:16:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=J9UHLsCgwlEtwC93yM9iNbxfAUErMfSSi5tgfl2OGhA=;
 b=3rwiV9feDSx5AJ2HJeJukETGkJgnGQmOSdSiVeEIx/77fWWGeOFnGgkhGKLojnb+BM
 C2W1OGc0M9KU3wH9D8qN/AulNCPqcskSmzb5u5f3DRYUGf35aPTjDI+ef5PD9kI2+Nf+
 1ZJ8at8c//8P0Am7Zda8W5ATYHlaDgylgeZGw2K9fNPfZoNIME3GfTn8sEJ3WlVP/+hg
 6lBCc1OqSXU/bm4+hHomk7mSbEEqqwUOo+G7R3tU64MYZTQqYJySIdv58H4ddQTailct
 eKrlN/BGrzCtKiwBqmzORz1ZE24vNfDyKWonThSVCr74lPIZ8OlLLuSZ9nJYnhMx8Xir
 bbsw==
X-Gm-Message-State: AOAM5307kGQLwxpYcIVnnGdmF8O/2pXCqe/mhxzIJygI4DYysL4fDAVp
 2LRSWO4gmMeZp9Oa2V1Gmw==
X-Google-Smtp-Source: ABdhPJyygcw6TMCxSg9TGmvmJfsyB7vAnz1q+HGku1a2ZCtUU9MEEi3VMOYqBXydfOmx6zjApJz/vA==
X-Received: by 2002:a05:6870:344f:b0:e2:c4c0:86a5 with SMTP id
 i15-20020a056870344f00b000e2c4c086a5mr8157215oah.189.1652123807049; 
 Mon, 09 May 2022 12:16:47 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 be8-20020a056808218800b00325cf57766bsm4720560oib.1.2022.05.09.12.16.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 12:16:46 -0700 (PDT)
Received: (nullmailer pid 27400 invoked by uid 1000);
 Mon, 09 May 2022 19:16:45 -0000
From: Rob Herring <robh@kernel.org>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
In-Reply-To: <20220509134658.16267-1-alexandre.torgue@foss.st.com>
References: <20220509134658.16267-1-alexandre.torgue@foss.st.com>
Date: Mon, 09 May 2022 14:16:45 -0500
Message-Id: <1652123805.754133.27398.nullmailer@robh.at.kernel.org>
Cc: devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: clock: stm32mp1: adapt
	example for "st, stm32mp1-rcc-secure"
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

On Mon, 09 May 2022 15:46:58 +0200, Alexandre Torgue wrote:
> For "st,stm32mp1-rcc-secure" schema, clocks and clock-names entries are now
> required properties.
> 
> Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.example.dts:27.33-34 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:364: Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.example.dtb] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1401: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
