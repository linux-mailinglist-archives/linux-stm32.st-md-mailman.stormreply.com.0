Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E7246BE5C
	for <lists+linux-stm32@lfdr.de>; Tue,  7 Dec 2021 15:58:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5A903C5F1E8;
	Tue,  7 Dec 2021 14:58:18 +0000 (UTC)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
 [209.85.210.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 04190C57183
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Dec 2021 14:58:15 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id
 47-20020a9d0332000000b005798ac20d72so18339010otv.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 07 Dec 2021 06:58:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=ISwB/Cqr0g2fR9Rv1ZPSZGA/iwpQtfwdBswG+ia19pY=;
 b=ZF2AQrMJSYgFkoMx+AEhU4T5ncICADlTq5/y3ZaAV6x09gku1tNXRzp1gP9KunzGVn
 TT6Q5HSoLYub01i1qFRPh5DGsdRn8qYE9k7iyxfmt7WxEvz/Mk+mGulXahW2ptvT47if
 WE/3WoXZN5mPEa4iuNNgq4mu1vd5wXxTjkcoU1VOWGb+/CuxfVef8Edfejh21pTZwFJ1
 XAesyWWgIsBKrnb6M6mMJGqY46oVTUZj40d+UKr2pBe9oKXRxgwa70c8Kj6pqBoctArE
 Ygpe5gRRZDuFFocF6LYQX1NYhMfqYlxUmSLcmXltkKYurOuQccLHrVLmAf+NjGendn4r
 oNEg==
X-Gm-Message-State: AOAM530m72J3SbGPTaQ056XBsaLTOyCiURw+ClCoCu5lrCFPEXWYX8Be
 O1qKvQk5gL6TuJ0Vf9kc7Q==
X-Google-Smtp-Source: ABdhPJzWbIjQ5ndnddb4GSl+z61bTtoUDb/1KYBoxAMiY033kVvOuMdyLuS3XWH3MrvukZoClyRG5g==
X-Received: by 2002:a05:6830:2643:: with SMTP id
 f3mr35971443otu.187.1638889094869; 
 Tue, 07 Dec 2021 06:58:14 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id g4sm2719201oof.40.2021.12.07.06.58.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Dec 2021 06:58:13 -0800 (PST)
Received: (nullmailer pid 5806 invoked by uid 1000);
 Tue, 07 Dec 2021 14:58:10 -0000
From: Rob Herring <robh@kernel.org>
To: Biao Huang <biao.huang@mediatek.com>
In-Reply-To: <20211207015505.16746-5-biao.huang@mediatek.com>
References: <20211207015505.16746-1-biao.huang@mediatek.com>
 <20211207015505.16746-5-biao.huang@mediatek.com>
Date: Tue, 07 Dec 2021 08:58:10 -0600
Message-Id: <1638889090.734543.5805.nullmailer@robh.at.kernel.org>
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jose Abreu <joabreu@synopsys.com>,
 davem@davemloft.net, dkirjanov@suse.de, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, macpaul.lin@mediatek.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Subject: Re: [Linux-stm32] [PATCH v5 4/7] net-next: dt-bindings: dwmac:
	Convert mediatek-dwmac to DT schema
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

On Tue, 07 Dec 2021 09:55:02 +0800, Biao Huang wrote:
> Convert mediatek-dwmac to DT schema, and delete old mediatek-dwmac.txt.
> And there are some changes in .yaml than .txt, others almost keep the same:
>   1. compatible "const: snps,dwmac-4.20".
>   2. delete "snps,reset-active-low;" in example, since driver remove this
>      property long ago.
>   3. add "snps,reset-delay-us = <0 10000 10000>" in example.
>   4. the example is for rgmii interface, keep related properties only.
> 
> Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> ---
>  .../bindings/net/mediatek-dwmac.txt           |  91 ----------
>  .../bindings/net/mediatek-dwmac.yaml          | 156 ++++++++++++++++++
>  2 files changed, 156 insertions(+), 91 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/net/mediatek-dwmac.txt
>  create mode 100644 Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/1564459


ethernet@1101c000: clock-names: ['axi', 'apb', 'mac_main', 'ptp_ref'] is too short
	arch/arm64/boot/dts/mediatek/mt2712-evb.dt.yaml

ethernet@1101c000: clocks: [[27, 34], [27, 37], [6, 154], [6, 155]] is too short
	arch/arm64/boot/dts/mediatek/mt2712-evb.dt.yaml

ethernet@1101c000: compatible: ['mediatek,mt2712-gmac'] does not contain items matching the given schema
	arch/arm64/boot/dts/mediatek/mt2712-evb.dt.yaml

ethernet@1101c000: compatible: 'oneOf' conditional failed, one must be fixed:
	arch/arm64/boot/dts/mediatek/mt2712-evb.dt.yaml

ethernet@1101c000: Unevaluated properties are not allowed ('compatible', 'reg', 'interrupts', 'interrupt-names', 'mac-address', 'clock-names', 'clocks', 'power-domains', 'snps,axi-config', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'snps,txpbl', 'snps,rxpbl', 'clk_csr', 'phy-mode', 'phy-handle', 'snps,reset-gpio', 'mdio' were unexpected)
	arch/arm64/boot/dts/mediatek/mt2712-evb.dt.yaml

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
