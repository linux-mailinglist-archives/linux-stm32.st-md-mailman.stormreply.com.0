Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D03346D495
	for <lists+linux-stm32@lfdr.de>; Wed,  8 Dec 2021 14:44:35 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EC9D1C5F1E8;
	Wed,  8 Dec 2021 13:44:34 +0000 (UTC)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com
 [209.85.167.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5F913C5F1E2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Dec 2021 13:44:33 +0000 (UTC)
Received: by mail-oi1-f176.google.com with SMTP id s139so4101283oie.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 08 Dec 2021 05:44:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=2FBGOv0PegNkvtOMGaZYa1BsopYp6ezUI2k+MFWsRkg=;
 b=llUTMR0f9/SWnRIQfwKJfR1HAi/h93P7j1SSzSIfEpyxE3HaJuU+K6KEZJf9f7S3a1
 7b4b8CKM4ZerX10cfjhcl/uGZeVxyEKhdXS18VIuaeJBQeeRM2jsInVqAdw3uPrHOtph
 zZqTY3E3lPQjaNawOz1xXOIi9EnZguOBlveBeQKZS+Fe3+0fKiZ2WSj1TA36fBzUc4Pb
 Mwd8ePIZLJdqucPOUvI6TbjM/xoBMDmqqRGDMvp/NU3v5AYDsr3QQxvoanTfhMcxrsqu
 wsVSYOLnrTUOD3z/d8isdMmsTIyxVVAUAyTXLEE300IdaPtNLeoODlUlPI78LV/+TwQl
 52rA==
X-Gm-Message-State: AOAM532vtEvsxf9lhJ1Uvl1voiLS//l01mXo7yswAhspK+L0AmejYWLS
 oaL01SEytmuYAJ/uaumMUQ==
X-Google-Smtp-Source: ABdhPJy4QOKFBXVt9kjHp3l6spBp74LPhwun2A8oRCnVjLpYafUk8Begm5tyq5EWMDExu9pfz3il7Q==
X-Received: by 2002:a54:4402:: with SMTP id k2mr11425020oiw.141.1638971072200; 
 Wed, 08 Dec 2021 05:44:32 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id 109sm477713otv.30.2021.12.08.05.44.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Dec 2021 05:44:31 -0800 (PST)
Received: (nullmailer pid 3857740 invoked by uid 1000);
 Wed, 08 Dec 2021 13:44:28 -0000
From: Rob Herring <robh@kernel.org>
To: Biao Huang <biao.huang@mediatek.com>
In-Reply-To: <20211208054716.603-5-biao.huang@mediatek.com>
References: <20211208054716.603-1-biao.huang@mediatek.com>
 <20211208054716.603-5-biao.huang@mediatek.com>
Date: Wed, 08 Dec 2021 07:44:28 -0600
Message-Id: <1638971068.792969.3857739.nullmailer@robh.at.kernel.org>
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
Subject: Re: [Linux-stm32] [PATCH net-next v7 4/6] net: dt-bindings: dwmac:
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

On Wed, 08 Dec 2021 13:47:14 +0800, Biao Huang wrote:
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

Full log is available here: https://patchwork.ozlabs.org/patch/1565082


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
