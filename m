Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 739264773A4
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Dec 2021 14:53:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2897DC5F1D8;
	Thu, 16 Dec 2021 13:53:08 +0000 (UTC)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com
 [209.85.210.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 44DDCC597BA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Dec 2021 13:53:06 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id
 x3-20020a05683000c300b0057a5318c517so28956812oto.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Dec 2021 05:53:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=K3q3sT5gz9V74YhNPyceV1V6wk4tRvJfYiaAGVR5wDk=;
 b=zP+lqgDO+tdCbtxVCMrGwI723sw0whLjn6ErjF+mxKHUEGYekiWHQFQArlvH2PZOs0
 nyxMF9WMQ/IYn5sD+yH25svNjflHEas9kk6NMpv/uRQSmq291I/tXyaOy+Cb1uAApp4c
 bmNK0MLvhRrAYXsjSAK13gBd6VXjiYaIo2413E37q7YoLGbi95QpJgx4GjJXs967/k5g
 KAPZJ3AEwTHHfuicnHcofV3Su0wkmcqRthZIJfwd7ZOJBVN6ovPkeDffnqDixSWZKT0W
 DLEsq3XKuF3tlxxM6dGTJzlNJvG/fTLW8UyUeEpbZK0qbwL4JW23mJMqrK92Ky6tyYG/
 +bUQ==
X-Gm-Message-State: AOAM533fxk+FoLCpEtPfSsSb7TryBQBR6ePrhsG+P9Fhf0Zo4lrA7gux
 CqtOYJE7IxHW2yuzF3iBHQ==
X-Google-Smtp-Source: ABdhPJwzi2LUj+RCSn0XStSyJDnnJAJ+K5H1xEp0vB1nUSgaPfqCMGLhpagEgc0ZOqdMMiDluU4UEg==
X-Received: by 2002:a9d:461:: with SMTP id 88mr13058565otc.300.1639662785099; 
 Thu, 16 Dec 2021 05:53:05 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id 52sm381367oth.52.2021.12.16.05.53.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 05:53:04 -0800 (PST)
Received: (nullmailer pid 4004876 invoked by uid 1000);
 Thu, 16 Dec 2021 13:53:02 -0000
From: Rob Herring <robh@kernel.org>
To: Biao Huang <biao.huang@mediatek.com>
In-Reply-To: <20211216055328.15953-7-biao.huang@mediatek.com>
References: <20211216055328.15953-1-biao.huang@mediatek.com>
 <20211216055328.15953-7-biao.huang@mediatek.com>
Date: Thu, 16 Dec 2021 07:53:02 -0600
Message-Id: <1639662782.987227.4004875.nullmailer@robh.at.kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 srv_heupstream@mediatek.com, netdev@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh+dt@kernel.org>, davem@davemloft.net, dkirjanov@suse.de,
 Jose Abreu <joabreu@synopsys.com>, linux-mediatek@lists.infradead.org,
 macpaul.lin@mediatek.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Subject: Re: [Linux-stm32] [PATCH net-next v10 6/6] net: dt-bindings: dwmac:
	add support for mt8195
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

On Thu, 16 Dec 2021 13:53:28 +0800, Biao Huang wrote:
> Add binding document for the ethernet on mt8195.
> 
> Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> ---
>  .../bindings/net/mediatek-dwmac.yaml          | 29 ++++++++++++++++---
>  1 file changed, 25 insertions(+), 4 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml: properties:clock-names: {'minItems': 5, 'maxItems': 6, 'items': [{'const': 'axi'}, {'const': 'apb'}, {'const': 'mac_main'}, {'const': 'ptp_ref'}, {'const': 'rmii_internal'}, {'const': 'mac_cg'}]} should not be valid under {'required': ['maxItems']}
	hint: "maxItems" is not needed with an "items" list
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml: ignoring, error in schema: properties: clock-names
warning: no schema found in file: ./Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
Documentation/devicetree/bindings/net/mediatek-dwmac.example.dt.yaml:0:0: /example-0/ethernet@1101c000: failed to match any schema with compatible: ['mediatek,mt2712-gmac', 'snps,dwmac-4.20a']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1568902

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
