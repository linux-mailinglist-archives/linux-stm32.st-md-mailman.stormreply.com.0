Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CABD244C92F
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Nov 2021 20:44:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 80CA5C5EC70;
	Wed, 10 Nov 2021 19:44:24 +0000 (UTC)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com
 [209.85.167.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B711DCFAC4B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Nov 2021 19:44:23 +0000 (UTC)
Received: by mail-oi1-f177.google.com with SMTP id u2so7210491oiu.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Nov 2021 11:44:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=likDWmDbN5o7SnT6cQ2yzO1g3PQ+qTt1FP1WspXaXGk=;
 b=OWVKf0rz+QlM0uHlJa/O9CvowMEk3pPU1t41Wrc21nK+bzlGv7IN7eZOUngNNV/Pd7
 aC6LziZ60wQCsXLWXt/AJiS7mjn8LDMHg8dRcqLnUUXpAy7SfqsKg1YcmEU3fxORWR4W
 smR0zWv7ECwZexknfuZiIlw2yc6A02kPPf+lya+CEMLi+a5n4IS2ZA49Q/mm/1irL8tC
 aRqhftP6l1sgApwZULK3NjouhCvC0uOue3V/+E1kW2hXr7Uh13gD5TJGj/soEfX+CUTi
 yPQXfvPgmKBzfnITqSuTdv+h1rYOHRiXQ5cnn9EfH0tdTwNI4JTgz/uq5ECebbIuvtYJ
 VOQg==
X-Gm-Message-State: AOAM533xcxS5uPecrbweqNK1pyHzJbtuWRDoobxnbVtQde7fKMEFe5JB
 tIfPLWE8rGcXvPdYo0WgJg==
X-Google-Smtp-Source: ABdhPJwlYFTqlf/pRDAF7GOesoK3aqCR/9qaTWoFXcVxyzNBSZ+QDPSjYJOp7qkgxie7eyK+wcyhhg==
X-Received: by 2002:aca:be54:: with SMTP id o81mr14764752oif.64.1636573462569; 
 Wed, 10 Nov 2021 11:44:22 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id 3sm162484otl.60.2021.11.10.11.44.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Nov 2021 11:44:22 -0800 (PST)
Received: (nullmailer pid 1783736 invoked by uid 1000);
 Wed, 10 Nov 2021 19:44:20 -0000
From: Rob Herring <robh@kernel.org>
To: Biao Huang <biao.huang@mediatek.com>
In-Reply-To: <20211110083948.6082-5-biao.huang@mediatek.com>
References: <20211110083948.6082-1-biao.huang@mediatek.com>
 <20211110083948.6082-5-biao.huang@mediatek.com>
Date: Wed, 10 Nov 2021 13:44:20 -0600
Message-Id: <1636573460.872424.1783735.nullmailer@robh.at.kernel.org>
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Jose Abreu <joabreu@synopsys.com>, linux-mediatek@lists.infradead.org,
 macpaul.lin@mediatek.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 4/5] dt-bindings: net: dwmac: Convert
	mediatek-dwmac to DT schema
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

On Wed, 10 Nov 2021 16:39:47 +0800, Biao Huang wrote:
> Convert mediatek-dwmac to DT schema, and delete old mediatek-dwmac.txt.
> 
> Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> ---
>  .../bindings/net/mediatek-dwmac.txt           |  91 ---------
>  .../bindings/net/mediatek-dwmac.yaml          | 179 ++++++++++++++++++
>  2 files changed, 179 insertions(+), 91 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/net/mediatek-dwmac.txt
>  create mode 100644 Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml: properties:mediatek,tx-delay-ps: '$ref' should not be valid under {'const': '$ref'}
	hint: Standard unit suffix properties don't need a type $ref
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml: properties:mediatek,rx-delay-ps: '$ref' should not be valid under {'const': '$ref'}
	hint: Standard unit suffix properties don't need a type $ref
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml: properties:clocks: {'minItems': 5, 'maxItems': 6, 'items': [{'description': 'AXI clock'}, {'description': 'APB clock'}, {'description': 'MAC clock gate'}, {'description': 'MAC Main clock'}, {'description': 'PTP clock'}, {'description': 'RMII reference clock provided by MAC'}]} should not be valid under {'required': ['maxItems']}
	hint: "maxItems" is not needed with an "items" list
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml: ignoring, error in schema: properties: mediatek,tx-delay-ps
warning: no schema found in file: ./Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
Documentation/devicetree/bindings/net/mediatek-dwmac.example.dt.yaml:0:0: /example-0/ethernet@1101c000: failed to match any schema with compatible: ['mediatek,mt2712-gmac', 'snps,dwmac-4.20a']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1553304

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
