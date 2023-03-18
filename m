Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6736BF8A0
	for <lists+linux-stm32@lfdr.de>; Sat, 18 Mar 2023 08:57:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 15B49C6907C;
	Sat, 18 Mar 2023 07:57:11 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 943ACC57B6A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 18 Mar 2023 07:57:09 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id o12so28528142edb.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 18 Mar 2023 00:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679126229;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wCrLidp4OVEXWIbXwYSJK83G0PQpXkPRHVsrJ8zeqyc=;
 b=gn2IS9EeMuuN2iJYYd/yuXLOvz9qmg4U/sRPP40yWOvsWVZbeFifHw4f2weg80aGCC
 tLvYsdGIoe+NWqDIrMT7h9Iv2tUJP028uUZtEOUI29xEqBu1bO17Ct98eRg5F4+E4PUo
 BuwKY38VUfAMTJMzL9VL8IvtDVbj0aa8mdo677TtnT+9AitEy4hmWH81wjyW1DMSGCrf
 45U5Uh8eTLf9neZoSFsOeXK30Za/TzDdtGT7GW7refAg45BgltukIbCQEQiSwCduEPPu
 fY3XhiVCrA+Z4hjixcvvQGNcxGYuKKo04EgyflcVtlQFuOt7eF8zRwftYoAdGSAtjuZ4
 Cv7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679126229;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wCrLidp4OVEXWIbXwYSJK83G0PQpXkPRHVsrJ8zeqyc=;
 b=asCRLMmX+Sb1CXADRnHjOcogDPkib2acmK9jOlZySoouPhP+I8kzhkRCWIw67Rxw7Y
 q1dq+EqX4NgKLOdkmnDdtxffbXrWs5vMIFIYK7v1rDXpOG7cerGfYyxNrYM0Y95zaXj2
 SK0SohVip3+8IxSlQ/D89cwh8Oc2rIBKF1FzQzQSOrX1feBQmMutelbu51EedRDJ5OSa
 3mYvBG1U/acUxAowOhHjv5Uv5DcYECfSvbeYvhdg4tW0yVEflBRN2DwdSyEflqu54K/o
 JSayxLogtQNBmbL88wRYeo51djGFGcIcB+8qUKxpPnqaI/2TCIUxoDjASUtzjUjgMC7z
 Yxbw==
X-Gm-Message-State: AO0yUKWpDaP7nOLCBSYEMSFEyoJ24UoR/2osZikoi4eNDIW+QkRTmpMe
 WFPEDzYkmmJcEEvuHAnR/T0=
X-Google-Smtp-Source: AK7set+ZpTCTkVBDtoYBzI61rbVWTHWDTXRpYAoEc8uSO+dGa58EHpp0+H/L9Ew3/QTlDkVyPDgPGw==
X-Received: by 2002:aa7:c9d5:0:b0:4fb:e9b8:ca56 with SMTP id
 i21-20020aa7c9d5000000b004fbe9b8ca56mr4490833edt.41.1679126229004; 
 Sat, 18 Mar 2023 00:57:09 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net.
 [89.212.118.115]) by smtp.gmail.com with ESMTPSA id
 c25-20020a50f619000000b004bd6e3ed196sm2002916edn.86.2023.03.18.00.57.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Mar 2023 00:57:08 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Heiko Stuebner <heiko@sntech.de>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Vincent Shih <vincent.sunplus@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh@kernel.org>
Date: Sat, 18 Mar 2023 08:57:06 +0100
Message-ID: <5656590.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <20230317233640.3968821-1-robh@kernel.org>
References: <20230317233640.3968821-1-robh@kernel.org>
MIME-Version: 1.0
X-Topics: 
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
 asahi@lists.linux.dev, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: nvmem: Drop unneeded quotes
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

Dne sobota, 18. marec 2023 ob 00:36:39 CET je Rob Herring napisal(a):
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml      | 2 +-

For Allwinner:
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

>  Documentation/devicetree/bindings/nvmem/apple,efuses.yaml       | 2 +-
>  Documentation/devicetree/bindings/nvmem/brcm,nvram.yaml         | 2 +-
>  Documentation/devicetree/bindings/nvmem/fsl,layerscape-sfp.yaml | 2 +-
>  Documentation/devicetree/bindings/nvmem/imx-iim.yaml            | 2 +-
>  Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml          | 2 +-
>  .../devicetree/bindings/nvmem/ingenic,jz4780-efuse.yaml         | 2 +-
>  Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml     | 2 +-
>  .../devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml       | 2 +-
>  Documentation/devicetree/bindings/nvmem/mxs-ocotp.yaml          | 2 +-
>  Documentation/devicetree/bindings/nvmem/nintendo-otp.yaml       | 2 +-
>  Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml        | 2 +-
>  Documentation/devicetree/bindings/nvmem/qcom,spmi-sdam.yaml     | 2 +-
>  Documentation/devicetree/bindings/nvmem/rmem.yaml               | 2 +-
>  Documentation/devicetree/bindings/nvmem/rockchip-efuse.yaml     | 2 +-
>  .../devicetree/bindings/nvmem/socionext,uniphier-efuse.yaml     | 2 +-
>  Documentation/devicetree/bindings/nvmem/st,stm32-romem.yaml     | 2 +-
>  .../devicetree/bindings/nvmem/sunplus,sp7021-ocotp.yaml         | 2 +-
>  18 files changed, 18 insertions(+), 18 deletions(-)



_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
