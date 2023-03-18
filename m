Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B30266BF8C4
	for <lists+linux-stm32@lfdr.de>; Sat, 18 Mar 2023 08:59:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 76661C6907C;
	Sat, 18 Mar 2023 07:59:54 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 653FDC57B6A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 18 Mar 2023 07:59:53 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id eh3so28531038edb.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 18 Mar 2023 00:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679126393;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YasiHKbTXqEuhZFRJQqb5T7TuhAHkb8N9LQidXJ7/pY=;
 b=eM7X7zl7pYcqG2Do9ACqzR9B9rxyb4mcEJXDseHAY4WnkJ5GCMqQIUmFl2inlG5wAW
 4NJFR3Kl7nbS1rslMMrQA1gKmh1ae2nOBhERqy/dGQFv3nVMG0UWfBDWCjOaoZ/CmewD
 AmHDFXkGvwKi6ONRVqAOd/n3lEX3AS1Y3Ncu9/HeEAsbiZR1if1gwUVwldFR2dJtzcev
 Wt+eA1qQs1VSCvLLmFq69BMnGAwMd4cKBF26MpLP3hISH+DKPFk9yBoZpXUMy+BJtWM9
 XBLFnheRK8YRE+Xo9abb4yb/a6n3whloiYBmlTpgjP6RZCLBPruX9uE9G/oDe57Cbv9M
 om0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679126393;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YasiHKbTXqEuhZFRJQqb5T7TuhAHkb8N9LQidXJ7/pY=;
 b=TIRbJg7edmarMmZpHAclT9qHZzqgXqSlvZgfQcvoQQG4SBDqSvXFKLBi6BatOR1dpO
 pFkGMVdfgOagYFGbuN9cxQJsmr7gdDvq2vG5d0D1BnH9lk904cN1CyPHa7Dp32tEJWzJ
 GGYqTnQn0UR1A69Q8yVB8xUi+crF6ddLQy4rAhhhZ++IdLl0MebJJYPvZW8i3dyTaa4E
 Yep3THV0bu7c/8VPOz4j5IOAlRpI0YhzaofVx1+UMcwLobQ33hHG8sUl7nuXJOTersrP
 bGHuPiCZ54qmmABqhlL+zxbYTx7xVpflqWoyCrFFCgZXph8NPoByrdDEE3OCNEdwU/7R
 EAag==
X-Gm-Message-State: AO0yUKVIBh+i4njQv9G9dEBOlBlpuebbNamsOenWRob+ooL0n7RrFn3c
 2KCPxHDldv+iyJuNfAdz1lw=
X-Google-Smtp-Source: AK7set9Q/KrzGCCOYVSTXlr1ys2EaxAejyGMpp1UqTCP/gqONBsQjGGqTRaVHyr4mLrqyXsedimeNw==
X-Received: by 2002:a05:6402:5167:b0:4fa:315a:cb55 with SMTP id
 d7-20020a056402516700b004fa315acb55mr6766776ede.21.1679126392827; 
 Sat, 18 Mar 2023 00:59:52 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net.
 [89.212.118.115]) by smtp.gmail.com with ESMTPSA id
 t14-20020a508d4e000000b004d8287c775fsm1997858edt.8.2023.03.18.00.59.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Mar 2023 00:59:52 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andreas =?ISO-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
 Manivannan Sadhasivam <mani@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Florian Fainelli <f.fainelli@gmail.com>,
 Appana Durga Kedareswara rao <appana.durga.rao@xilinx.com>,
 Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>,
 Wolfgang Grandegger <wg@grandegger.com>,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 Michal Simek <michal.simek@xilinx.com>, Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <olteanv@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 Tobias Waldekranz <tobias@waldekranz.com>,
 Lars Povlsen <lars.povlsen@microchip.com>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Heiko Stuebner <heiko@sntech.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh@kernel.org>
Date: Sat, 18 Mar 2023 08:59:49 +0100
Message-ID: <13224434.uLZWGnKmhe@jernej-laptop>
In-Reply-To: <20230317233605.3967621-1-robh@kernel.org>
References: <20230317233605.3967621-1-robh@kernel.org>
MIME-Version: 1.0
X-Topics: 
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-aspeed@lists.ozlabs.org, netdev@vger.kernel.org,
 linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-can@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: net: Drop unneeded quotes
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

Dne sobota, 18. marec 2023 ob 00:36:03 CET je Rob Herring napisal(a):
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/net/actions,owl-emac.yaml  |  2 +-
>  .../bindings/net/allwinner,sun4i-a10-emac.yaml     |  2 +-
>  .../bindings/net/allwinner,sun4i-a10-mdio.yaml     |  2 +-

For Allwinner:
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

>  .../devicetree/bindings/net/altr,tse.yaml          |  2 +-
>  .../bindings/net/aspeed,ast2600-mdio.yaml          |  2 +-
>  .../devicetree/bindings/net/brcm,amac.yaml         |  2 +-
>  .../devicetree/bindings/net/brcm,systemport.yaml   |  2 +-
>  .../bindings/net/broadcom-bluetooth.yaml           |  2 +-
>  .../devicetree/bindings/net/can/xilinx,can.yaml    |  6 +++---
>  .../devicetree/bindings/net/dsa/brcm,sf2.yaml      |  2 +-
>  .../devicetree/bindings/net/dsa/qca8k.yaml         |  2 +-
>  .../devicetree/bindings/net/engleder,tsnep.yaml    |  2 +-
>  .../devicetree/bindings/net/ethernet-phy.yaml      |  2 +-
>  .../bindings/net/fsl,qoriq-mc-dpmac.yaml           |  2 +-
>  .../bindings/net/intel,ixp4xx-ethernet.yaml        |  8 ++++----
>  .../devicetree/bindings/net/intel,ixp4xx-hss.yaml  | 14 +++++++-------
>  .../devicetree/bindings/net/marvell,mvusb.yaml     |  2 +-
>  .../devicetree/bindings/net/mdio-gpio.yaml         |  2 +-
>  .../devicetree/bindings/net/mediatek,net.yaml      |  2 +-
>  .../bindings/net/mediatek,star-emac.yaml           |  2 +-
>  .../bindings/net/microchip,lan966x-switch.yaml     |  2 +-
>  .../bindings/net/microchip,sparx5-switch.yaml      |  4 ++--
>  .../devicetree/bindings/net/mscc,miim.yaml         |  2 +-
>  .../devicetree/bindings/net/nfc/marvell,nci.yaml   |  2 +-
>  .../devicetree/bindings/net/nfc/nxp,pn532.yaml     |  2 +-
>  .../bindings/net/pse-pd/podl-pse-regulator.yaml    |  2 +-
>  .../devicetree/bindings/net/qcom,ipq4019-mdio.yaml |  2 +-
>  .../devicetree/bindings/net/qcom,ipq8064-mdio.yaml |  2 +-
>  .../devicetree/bindings/net/rockchip,emac.yaml     |  2 +-
>  .../devicetree/bindings/net/snps,dwmac.yaml        |  2 +-
>  .../devicetree/bindings/net/stm32-dwmac.yaml       |  4 ++--
>  .../devicetree/bindings/net/ti,cpsw-switch.yaml    | 10 +++++-----
>  .../devicetree/bindings/net/ti,davinci-mdio.yaml   |  2 +-
>  .../devicetree/bindings/net/ti,dp83822.yaml        |  2 +-
>  .../devicetree/bindings/net/ti,dp83867.yaml        |  2 +-
>  .../devicetree/bindings/net/ti,dp83869.yaml        |  2 +-
>  36 files changed, 53 insertions(+), 53 deletions(-)



_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
