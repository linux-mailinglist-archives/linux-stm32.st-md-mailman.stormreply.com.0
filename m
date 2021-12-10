Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF0F470259
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Dec 2021 15:03:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3EE01C5F1EC;
	Fri, 10 Dec 2021 14:03:11 +0000 (UTC)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com
 [209.85.210.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8F23BC5F1EB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Dec 2021 14:03:09 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id
 n17-20020a9d64d1000000b00579cf677301so9696164otl.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Dec 2021 06:03:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=k7EaRnob3zOEquu+wkUbm05857jqaStaszAJkkyFu8I=;
 b=Gzk9u5l2xduPEEDU2Eoug41fPplPnmZIDKlnins/RRG/hDOCZuqu3O2euBHKPz5OO6
 lj1fXE57u6W1mdQQDp79SQq5KEbfe3q/tCezUOJo4Uki6KXSptkiGS+j5becrp1ucMhi
 SrvEVihvb7DGc0F5GspCY1EJkj/AEEyc8Gix9/tjaLcqDMvab0HyYAb3n/wa9BF96ZfG
 D+E9ut2w9bR99tPq0uevjy3fkc75MuPi8WoTc7xF1hAqpaE+p/GeoSyWEWzd3u6BKSYe
 N7A65VveSh9wt75DCQ2nOPQg1Xh+J5OXySSkZwYKwGZNVsundt/VIN4ky5M8/UspvWFV
 a38g==
X-Gm-Message-State: AOAM532VRz+B8/O1KT9QsdUZKmZjTyDuyCZROtSM6Xxe5Q0qZeqmJz9t
 oeHgJgXrjrLn867CCDlDj+BOICv3/g==
X-Google-Smtp-Source: ABdhPJw8097NeWY7msvS0XSMdwLw1NEYFR27r4qN30zbTRskT35vsrks871Xs7VoBvqNOAmesE3DHQ==
X-Received: by 2002:a05:6830:18b:: with SMTP id
 q11mr11543396ota.113.1639144985532; 
 Fri, 10 Dec 2021 06:03:05 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id t14sm554859oth.81.2021.12.10.06.03.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 06:03:04 -0800 (PST)
Received: (nullmailer pid 1252259 invoked by uid 1000);
 Fri, 10 Dec 2021 14:02:56 -0000
From: Rob Herring <robh@kernel.org>
To: Biao Huang <biao.huang@mediatek.com>
In-Reply-To: <20211210013129.811-5-biao.huang@mediatek.com>
References: <20211210013129.811-1-biao.huang@mediatek.com>
 <20211210013129.811-5-biao.huang@mediatek.com>
Date: Fri, 10 Dec 2021 08:02:56 -0600
Message-Id: <1639144976.227854.1252258.nullmailer@robh.at.kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 srv_heupstream@mediatek.com, netdev@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh+dt@kernel.org>, davem@davemloft.net, dkirjanov@suse.de,
 Jose Abreu <joabreu@synopsys.com>, linux-mediatek@lists.infradead.org,
 macpaul.lin@mediatek.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Subject: Re: [Linux-stm32] [PATCH net-next v8 4/6] net: dt-bindings: dwmac:
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

On Fri, 10 Dec 2021 09:31:27 +0800, Biao Huang wrote:
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

Full log is available here: https://patchwork.ozlabs.org/patch/1566169


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
