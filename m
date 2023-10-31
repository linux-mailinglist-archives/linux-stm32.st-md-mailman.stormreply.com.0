Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E154E7DCF4E
	for <lists+linux-stm32@lfdr.de>; Tue, 31 Oct 2023 15:38:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9E776C6B44B;
	Tue, 31 Oct 2023 14:38:32 +0000 (UTC)
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 78329C6B444
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Oct 2023 14:38:31 +0000 (UTC)
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id C99203F0B5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Oct 2023 14:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1698763110;
 bh=au17QPiJsjAocXmUfByZs1Bf5AaxfhY0/xgh3nLmqCY=;
 h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=Oe0YF6yM7kajwP7wxXSZ61KuciLAh39NFQf+c++grOl8ImNOaUT3ng6OtPXcBrhsf
 TW2X5A/EWwgOMJy1zLwjviw5SWPFizL5IrkhUrpWFNy/NM+EO/4ep/uP/rbtaOPnhi
 Pe473jUsuN+dI4kn42k4SzYGVR9FFkx7KoUsECnLAvUcsMT/sH2u15aLcTTacz/TIR
 APrYO5BB7DYoXoHwUzbm5ETFd1/FcvfSp3q0dGuQNPzICfIw+eysHFia40u+Zj4MVk
 vaaZYVOAz/zEcR6S0BSi3cG1HcuMa/J+RPM/14rpryk8ScQhrFwzsodLQH7ClzDd7K
 uX9mfyjoP1XRQ==
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-66fbd3bc8ebso48820756d6.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Oct 2023 07:38:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698763109; x=1699367909;
 h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=au17QPiJsjAocXmUfByZs1Bf5AaxfhY0/xgh3nLmqCY=;
 b=m1d/dVd1hCviW0GTfqEOc0/thNQrmkQNceMZeCL0WZmrI5hHWHRVz0oCLSp1o9OpcV
 c11uOlFtqT8umH7O9KHElQlnaC7vKdsGwtXC/e+m02zz1M41P1AIzOgnHFt4i2ZJfQ3G
 LcCrBBeFGRnRgj+czn8taEVWAO4YTJXL1pBdA9Mk1jciKAShEw5EK5BbAYmCjx+S3ph0
 5bHGfWoc9yAsX0MnTfZ34/Pv1/BpGP3u1c4fx4xRB+Xs6LDvhy884a8N2W7dzGTSGXYE
 U3p62z+KYO5OL3AwKTqOd+3bgWJqZOIdnFboti1ee9qTsHXbhAJ0x9i0Cg8SacZ+bfOM
 9kPQ==
X-Gm-Message-State: AOJu0Ywx3PNruR3XfM8dv7mxE0fa9E9eanz9EhMHtLh7puurmO00F5bn
 /BTYvcJ8fYToPALIFONTMgwjrVBu4/pDUJR/g3egLKD0pw0ZiqrvUhBzTSpJ+jF4XUuH0h1d1fd
 yeecl1PTxc4J1RfU5iUabK419hESO8doHFlZef6H2DuJq+D2emtuXcgdgHXxmaaTVJiW5vHhkSQ
 ==
X-Received: by 2002:a05:622a:1009:b0:419:7623:ef6c with SMTP id
 d9-20020a05622a100900b004197623ef6cmr16897760qte.60.1698763109675; 
 Tue, 31 Oct 2023 07:38:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEManiQqpXLt0b01D3i/c6XioIV3LcDFDS3I/YsKWQWlnlDlbI16LCgriOnJiUp81AuiFuChC8BPHTNIdY05AA=
X-Received: by 2002:a05:622a:1009:b0:419:7623:ef6c with SMTP id
 d9-20020a05622a100900b004197623ef6cmr16897742qte.60.1698763109425; Tue, 31
 Oct 2023 07:38:29 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 31 Oct 2023 07:38:29 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20231029042712.520010-8-cristian.ciocaltea@collabora.com>
References: <20231029042712.520010-1-cristian.ciocaltea@collabora.com>
 <20231029042712.520010-8-cristian.ciocaltea@collabora.com>
Mime-Version: 1.0
Date: Tue, 31 Oct 2023 07:38:29 -0700
Message-ID: <CAJM55Z8D12XoRG4WGaf=PG0_yp7d_xk9EhOk7bnCKQRMok9eBA@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH v2 07/12] riscv: dts: starfive: jh7100:
	Add ccache DT node
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
> Provide a DT node for the SiFive Composable Cache controller found on
> the StarFive JH7100 SoC.
>
> Note this is also used to support non-coherent DMA, via the
> sifive,cache-ops cache flushing operations.

This property is no longer needed:
https://lore.kernel.org/linux-riscv/20231031141444.53426-1-emil.renner.berthing@canonical.com/

Also it would be nice to mention that these nodes are copied from my
visionfive patches ;)

>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  arch/riscv/boot/dts/starfive/jh7100.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/starfive/jh7100.dtsi b/arch/riscv/boot/dts/starfive/jh7100.dtsi
> index 06bb157ce111..a8a5bb00b0d8 100644
> --- a/arch/riscv/boot/dts/starfive/jh7100.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7100.dtsi
> @@ -32,6 +32,7 @@ U74_0: cpu@0 {
>  			i-tlb-sets = <1>;
>  			i-tlb-size = <32>;
>  			mmu-type = "riscv,sv39";
> +			next-level-cache = <&ccache>;
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
> @@ -60,6 +61,7 @@ U74_1: cpu@1 {
>  			i-tlb-sets = <1>;
>  			i-tlb-size = <32>;
>  			mmu-type = "riscv,sv39";
> +			next-level-cache = <&ccache>;
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
> @@ -147,6 +149,18 @@ soc {
>  		dma-noncoherent;
>  		ranges;
>
> +		ccache: cache-controller@2010000 {
> +			compatible = "starfive,jh7100-ccache", "sifive,ccache0", "cache";
> +			reg = <0x0 0x2010000 0x0 0x1000>;
> +			interrupts = <128>, <130>, <131>, <129>;
> +			cache-block-size = <64>;
> +			cache-level = <2>;
> +			cache-sets = <2048>;
> +			cache-size = <2097152>;
> +			cache-unified;
> +			sifive,cache-ops;
> +		};
> +
>  		clint: clint@2000000 {
>  			compatible = "starfive,jh7100-clint", "sifive,clint0";
>  			reg = <0x0 0x2000000 0x0 0x10000>;
> --
> 2.42.0
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
