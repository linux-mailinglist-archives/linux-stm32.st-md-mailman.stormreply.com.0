Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 533EF7F9575
	for <lists+linux-stm32@lfdr.de>; Sun, 26 Nov 2023 22:15:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0FCB4C6B457;
	Sun, 26 Nov 2023 21:15:31 +0000 (UTC)
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7CA3AC62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 26 Nov 2023 21:15:29 +0000 (UTC)
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 163773F6E6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 26 Nov 2023 21:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1701033329;
 bh=X6K8bPWubM7CP2uBLEzKZ5K58KMm2j9nc1xapYlq3qo=;
 h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=AZpX+ou/iuArQzC6pOsJ46vSyZejH4orcZk435ys4GBXdwDHKoEL1WB7ku21Dl2rb
 5tirpRJljI29T+5AAG74xe/8A3TaAn0+9jC4AMlgrPNjsal0eiY91eyVIr1XlFa6nW
 Oshw8lEPIE+xxkoOTFJNRo0N36RsbHIG2d/yUzfIt/CIhbATz4ZXDSxyibjXfJuSgi
 jsGVt9dHVVSO7D/XJpx/YzXRcQfgeD1xDRnrAgQpIrJn0wLZJDpgSXue1ifEbKojIV
 tmYQFKNdgMRlxR7s2G1SPh6g11tD8pyb37IFjLwLJYoK/rgbNVeXQu7Z3Sa1cHOHtQ
 8njIVhBWN/Isg==
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-1cfd21aece6so1569965ad.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 26 Nov 2023 13:15:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701033324; x=1701638124;
 h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=X6K8bPWubM7CP2uBLEzKZ5K58KMm2j9nc1xapYlq3qo=;
 b=fc5bLMBJPrESQgNFXD/ekFoRIgQtWBR7W5bePTWEpiYPI4a68Q/BAIP7AnVMhq6/51
 UQfm+NBGU4yvkYSOBKbPrT4fWcwFASZ+yNBdTK0rQORsvfGr332+/cQ6fEEgwaOLQEO4
 a8Mhz2fxxOJD3upFTBUKgm1bZFWgPDTRqXY/lDb9x3QGo+4s7Q9+dMTpNdTmSIC34hah
 yQCf0QwvPrXHBmYppClzBANphzPJZw3JlmvkBS5FrIX7ToLFxtLb0PEKZg75cTEkOON0
 FV4crru01QFWpChQRaPDXRuoqmKSo5aAjHBJI22bqfmy0KgZ9SJ4iG6xyCUnjUGQMAg5
 FrpQ==
X-Gm-Message-State: AOJu0Yxuy4785E3jMIKp91xAMIKUWp++74HXIsFi50II7cuwmFSzu11l
 bn3pI9CZdEcxJkv7BNBmtPzwOs8LiP7vf5RYGmayO1IEuM/LzyTTpEgnFU+zzMWsS25XwRdenBY
 FbxhzR6cijd9EI3hOYFH4BEXMuC9xM1YeSdgt3ARzYwAWbtbnwcsNsbgEZ/7Tb8UUMefc0Pw3AA
 ==
X-Received: by 2002:a05:622a:4d1:b0:423:93ce:56a8 with SMTP id
 q17-20020a05622a04d100b0042393ce56a8mr9480168qtx.37.1701033303342; 
 Sun, 26 Nov 2023 13:15:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGvOe1/VcODkUu33j/9j5dbJoi16WUGuqQQy1j3aYZEMCOFUmi43jYGiMI7L4+bD3DEsgAlRyl8uU3g9zCAnrU=
X-Received: by 2002:a05:622a:4d1:b0:423:93ce:56a8 with SMTP id
 q17-20020a05622a04d100b0042393ce56a8mr9480140qtx.37.1701033303037; Sun, 26
 Nov 2023 13:15:03 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 26 Nov 2023 22:15:02 +0100
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20231029042712.520010-10-cristian.ciocaltea@collabora.com>
References: <20231029042712.520010-1-cristian.ciocaltea@collabora.com>
 <20231029042712.520010-10-cristian.ciocaltea@collabora.com>
Mime-Version: 1.0
Date: Sun, 26 Nov 2023 22:15:02 +0100
Message-ID: <CAJM55Z-1ibownJG-pEuUx5VvPfnuV0+kT-6Fo3VnVs2YycNEEg@mail.gmail.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Emil Renner Berthing <kernel@esmil.dk>, Samin Guo <samin.guo@starfivetech.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 kernel@collabora.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 09/12] riscv: dts: starfive: jh7100:
 Add sysmain and gmac DT nodes
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

Cristian Ciocaltea wrote:
> Provide the sysmain and gmac DT nodes supporting the DWMAC found on the
> StarFive JH7100 SoC.
>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  arch/riscv/boot/dts/starfive/jh7100.dtsi | 36 ++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/starfive/jh7100.dtsi b/arch/riscv/boot/dts/starfive/jh7100.dtsi
> index a8a5bb00b0d8..e8228e96d350 100644
> --- a/arch/riscv/boot/dts/starfive/jh7100.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7100.dtsi
> @@ -179,6 +179,37 @@ plic: interrupt-controller@c000000 {
>  			riscv,ndev = <133>;
>  		};
>
> +		gmac: ethernet@10020000 {
> +			compatible = "starfive,jh7100-dwmac", "snps,dwmac";
> +			reg = <0x0 0x10020000 0x0 0x10000>;
> +			clocks = <&clkgen JH7100_CLK_GMAC_ROOT_DIV>,
> +				 <&clkgen JH7100_CLK_GMAC_AHB>,
> +				 <&clkgen JH7100_CLK_GMAC_PTP_REF>,
> +				 <&clkgen JH7100_CLK_GMAC_TX_INV>,
> +				 <&clkgen JH7100_CLK_GMAC_GTX>;
> +			clock-names = "stmmaceth", "pclk", "ptp_ref", "tx", "gtx";
> +			resets = <&rstgen JH7100_RSTN_GMAC_AHB>;
> +			reset-names = "ahb";
> +			interrupts = <6>, <7>;
> +			interrupt-names = "macirq", "eth_wake_irq";
> +			max-frame-size = <9000>;
> +			snps,multicast-filter-bins = <32>;
> +			snps,perfect-filter-entries = <128>;
> +			starfive,syscon = <&sysmain 0x70 0>;
> +			rx-fifo-depth = <32768>;
> +			tx-fifo-depth = <16384>;
> +			snps,axi-config = <&stmmac_axi_setup>;
> +			snps,fixed-burst;
> +			snps,force_thresh_dma_mode;
> +			status = "disabled";
> +
> +			stmmac_axi_setup: stmmac-axi-config {
> +				snps,wr_osr_lmt = <0xf>;
> +				snps,rd_osr_lmt = <0xf>;

As I also noted on the JH7110 patches these are not addresses or offsets but
limits eg. counting things, which makes a lot more sense in decimal for most
humans. But here you've changed them back to 0xf, why?

> +				snps,blen = <256 128 64 32 0 0 0>;
> +			};
> +		};
> +
>  		clkgen: clock-controller@11800000 {
>  			compatible = "starfive,jh7100-clkgen";
>  			reg = <0x0 0x11800000 0x0 0x10000>;
> @@ -193,6 +224,11 @@ rstgen: reset-controller@11840000 {
>  			#reset-cells = <1>;
>  		};
>
> +		sysmain: syscon@11850000 {
> +			compatible = "starfive,jh7100-sysmain", "syscon";
> +			reg = <0x0 0x11850000 0x0 0x10000>;
> +		};
> +
>  		i2c0: i2c@118b0000 {
>  			compatible = "snps,designware-i2c";
>  			reg = <0x0 0x118b0000 0x0 0x10000>;
> --
> 2.42.0
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
