Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F071490B73
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Jan 2022 16:35:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C4B18C5C82B;
	Mon, 17 Jan 2022 15:35:48 +0000 (UTC)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com
 [209.85.210.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1D1D1C57183
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jan 2022 15:35:48 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id
 c3-20020a9d6c83000000b00590b9c8819aso20255143otr.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jan 2022 07:35:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=uz9rWH9EExEde9e83L6Ci5xDXHmn67olZ/Bo1AaALIk=;
 b=eFc/KEUUa0FiRBsyyi5QQqnKMibhAChUoCE4C0Oj8PHBrOOYpRWWKox5fFySV/sX1R
 Sw0/6JFKi+03R22EhHLT+9ZAD9/IS+2me3cLbRql5HHRtEyzmxjYns6eAeZGinefqJQ5
 j3SCYZZaVGkpca05aSEHXE6E9KcgkBvC7yU6sMKy81xHmesJ+3MCJa/7z5CCj/446765
 lQBByi2aXs5LPiAOH5avGvkNG8Bt04UdRKg912sco6sdtrWeKuhklnLG/oniTlpX9hCX
 1cy+CJOryIWCOeEr4meJFJOgtJoXSCmiHBFQO0znt47D30Q4ObGFAp9dtBuKelMd9S0L
 jlzA==
X-Gm-Message-State: AOAM532F0SjjSTN00buEN2JMoXdJq688D7YNXTQkndGYypRvCZERNdO7
 lQIYeriM1m9oRCI5t5BpNg==
X-Google-Smtp-Source: ABdhPJzAopoamav84cvKKv308QfSUylWTMQX34XDs9D8wI7eeXkkB7i7iaF0ajflyRA76l5dpV6RKg==
X-Received: by 2002:a05:6830:1f56:: with SMTP id
 u22mr9420465oth.138.1642433746928; 
 Mon, 17 Jan 2022 07:35:46 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id bg17sm7015383oib.25.2022.01.17.07.35.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 07:35:45 -0800 (PST)
Received: (nullmailer pid 3923087 invoked by uid 1000);
 Mon, 17 Jan 2022 15:35:42 -0000
From: Rob Herring <robh@kernel.org>
To: Biao Huang <biao.huang@mediatek.com>
In-Reply-To: <20220117070706.17853-8-biao.huang@mediatek.com>
References: <20220117070706.17853-1-biao.huang@mediatek.com>
 <20220117070706.17853-8-biao.huang@mediatek.com>
Date: Mon, 17 Jan 2022 09:35:42 -0600
Message-Id: <1642433742.934070.3923086.nullmailer@robh.at.kernel.org>
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jose Abreu <joabreu@synopsys.com>,
 linux-stm32@st-md-mailman.stormreply.com, dkirjanov@suse.de,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 macpaul.lin@mediatek.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Subject: Re: [Linux-stm32] [PATCH net-next v12 7/7] net: dt-bindings: dwmac:
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

On Mon, 17 Jan 2022 15:07:06 +0800, Biao Huang wrote:
> Add binding document for the ethernet on mt8195.
> 
> Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> ---
>  .../bindings/net/mediatek-dwmac.yaml          | 28 ++++++++++++++++---
>  1 file changed, 24 insertions(+), 4 deletions(-)
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/1580608


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
