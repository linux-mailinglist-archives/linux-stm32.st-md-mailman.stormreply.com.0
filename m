Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 767086BF8B8
	for <lists+linux-stm32@lfdr.de>; Sat, 18 Mar 2023 08:58:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 408FEC57B6A;
	Sat, 18 Mar 2023 07:58:26 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 761D0C57B6A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 18 Mar 2023 07:58:25 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id h8so28557034ede.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 18 Mar 2023 00:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679126305;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q9kflyUcTWOTgsVwiqFTEkSUTt2K/ujv6iGh8wMMvAQ=;
 b=l8plMcCPzCZtCNBthUUK+41tDhVCAYgiH4aDsOcZpsnNoPr7C/IrE8GTOruwU897mZ
 JaFzYC1xuFQbMuOgq1+bng+0aR36hJWmPqLSFhmKuyOTBudmLiXxMFYXnwI7FqBkc0C/
 KijF8RsXZAnLuJNiYSZc3jjb1GsMOa3S4OuebkTMfdl14Nf2n+jgP6I0ts0jkMeR3Je6
 Qu5DXuVxIdUyOGz1tjqXbgSIwXHtwHblbzl6RD0Eb/yJSHYCABe5+OjPiUng6ZFyP3j8
 0PtPN7vtg6WQNAUlLzoNUBhwEl7KO+/nkOQIPGoSqM7aAr2o9PLP5/SQseXuUYl6tPZk
 dmxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679126305;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q9kflyUcTWOTgsVwiqFTEkSUTt2K/ujv6iGh8wMMvAQ=;
 b=NBLR672Iclun2DyAGnPDAcuty1gSfYasbGhl4ai0NL4SGnRXYF4Rw381rvf+ydbRiv
 i0EkSUVnDjscOImSBurmwJVbYvitedSZt1wB9XkOyGCSPyU5zLJRAseKU21zkZRNqo5v
 xiaM1Ii8JfYq3Dw4i14qM4KdGGScjziajCHYMO9CSY4qw4WiLCKLsCyIqwR6uGWHoZb3
 Z8Zlm9+TqlS5k3fU6Z2M6s07nddcNlpToVzPX8/vos9hUgftdI6se/Jkd83W1W9UWk54
 gj45HlilJ4p8CL2q4TQx0ssmnxNi8F9iXpGHRIhIXrEro8O1pYbWqz5n5QIDCwLPPQDB
 qryw==
X-Gm-Message-State: AO0yUKV9KAsLMFIzfaGk/LVlaKXnzTSwvA9qAZMkouLLOj4PLwSSOUcm
 PIRelqe0OzclUCk2xZ3oA7E=
X-Google-Smtp-Source: AK7set/+wd8GvkU+GWt8EQFwAYDXiruK5Y/G5wh4Q6eZzERrvFCmP2DEItDmgOokh3JCyB3Wf3+HYQ==
X-Received: by 2002:a17:906:4c8b:b0:8b1:3131:76e9 with SMTP id
 q11-20020a1709064c8b00b008b1313176e9mr2597465eju.46.1679126304867; 
 Sat, 18 Mar 2023 00:58:24 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net.
 [89.212.118.115]) by smtp.gmail.com with ESMTPSA id
 o7-20020a1709062e8700b00933356c681esm374615eji.150.2023.03.18.00.58.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Mar 2023 00:58:24 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 Linus Walleij <linus.walleij@linaro.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh@kernel.org>
Date: Sat, 18 Mar 2023 08:58:22 +0100
Message-ID: <2275127.ElGaqSPkdT@jernej-laptop>
In-Reply-To: <20230317233631.3968509-1-robh@kernel.org>
References: <20230317233631.3968509-1-robh@kernel.org>
MIME-Version: 1.0
X-Topics: 
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-mtd@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: mtd: Drop unneeded quotes
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

Dne sobota, 18. marec 2023 ob 00:36:30 CET je Rob Herring napisal(a):
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml     | 2 +-

For Allwinner:
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

>  .../devicetree/bindings/mtd/arasan,nand-controller.yaml       | 2 +-
>  .../devicetree/bindings/mtd/arm,pl353-nand-r2p1.yaml          | 2 +-
>  Documentation/devicetree/bindings/mtd/gpmi-nand.yaml          | 2 +-
>  Documentation/devicetree/bindings/mtd/intel,lgm-ebunand.yaml  | 2 +-
>  Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml      | 2 +-
>  Documentation/devicetree/bindings/mtd/mtd-physmap.yaml        | 2 +-
>  Documentation/devicetree/bindings/mtd/mxc-nand.yaml           | 2 +-
>  Documentation/devicetree/bindings/mtd/nand-chip.yaml          | 2 +-
>  Documentation/devicetree/bindings/mtd/nand-controller.yaml    | 2 +-
>  .../bindings/mtd/partitions/brcm,bcm4908-partitions.yaml      | 2 +-
>  .../bindings/mtd/partitions/linksys,ns-partitions.yaml        | 2 +-
>  Documentation/devicetree/bindings/mtd/qcom,nandc.yaml         | 2 +-
>  Documentation/devicetree/bindings/mtd/renesas-nandc.yaml      | 2 +-
>  .../devicetree/bindings/mtd/rockchip,nand-controller.yaml     | 2 +-
>  Documentation/devicetree/bindings/mtd/spi-nand.yaml           | 2 +-
>  Documentation/devicetree/bindings/mtd/st,stm32-fmc2-nand.yaml | 2 +-
>  Documentation/devicetree/bindings/mtd/ti,gpmc-nand.yaml       | 4 ++--
>  Documentation/devicetree/bindings/mtd/ti,gpmc-onenand.yaml    | 4 ++--
>  19 files changed, 21 insertions(+), 21 deletions(-)



_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
