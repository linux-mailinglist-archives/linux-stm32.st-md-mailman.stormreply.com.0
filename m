Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 300CB7DCF5D
	for <lists+linux-stm32@lfdr.de>; Tue, 31 Oct 2023 15:41:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D6668C6B44B;
	Tue, 31 Oct 2023 14:41:10 +0000 (UTC)
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A6B47C6B444
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Oct 2023 14:41:09 +0000 (UTC)
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 9256D4081E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Oct 2023 14:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1698763264;
 bh=bM2sMwP6Emxus/eSEbKlChfhnru0P5WYRen9BWIIMG8=;
 h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=NOz0lvxecB7kKXh3NwjYyBKCZC7UlCqzGidNnm9e68tFO8eHspRD3O7b/yvZ2/eJC
 xN7MLwJfnL9dNZLcNb6iO/BsMddcbu179cVRJSEH0IpEPhwf6wUjJtx41Vnsl90GIO
 sr9GwyEPC3JorjBp64zJvAdrJNSY1eForYUbSd8rZduZnof+USlNvCb6YGPsWjV/Ys
 wZVFn2OPZFRwstIPdgz+F+w/jD/8Lwlw3Gr3xsXryjk9wNXFwKjVe83Zwp0LUWbDpH
 3aQzhcnjqYUPhIEtcivbC7gmfSSGLNr/gvQe834vrW7jAhgGw1ErrNVbRpDNjBLf6N
 GTvfIu9J57R1w==
Received: by mail-oo1-f72.google.com with SMTP id
 006d021491bc7-581d755f1afso7228807eaf.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Oct 2023 07:41:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698763257; x=1699368057;
 h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bM2sMwP6Emxus/eSEbKlChfhnru0P5WYRen9BWIIMG8=;
 b=DZPyFkcp2pUhNjI8v9FXbiwxjnNQ8Y9WCAUAz0OD8hz13zBRIw+J2ouhdfKzaCwty8
 mnKmyju412dB6f+xPFS2U/5YPs8I51o7J5PpFuoawwhijJ3jElWzQc8ouEeWAh/TbWnW
 fVJlzj2o2lboSpy68nSi30ttO7Yi4Vi5AE7LikaFyX06oCGnerowMG/F27LdwZQSIBbb
 lAD6gmiinCIi+mud1mPJUF4G6oVPAvYihfDEQ5RbU/7nzkv5xDX79R3TIJr8pt0Ns6/V
 Dm161hs8DgUE0pwqugHvqlGCjCpNvbps3YU0ZBmvMYQPCLiHyJDPFpUawsYqW4wOSRNi
 S/aQ==
X-Gm-Message-State: AOJu0Yxr32BeycmdKpKULb1zIAO9C7LHc+ltl/fjrGhQClFumaZ0SKvZ
 +DRaQyLqMRmL10HZ/M9AW1YjVOHyJftNRB1XPJIxr0HrQ063Ux5GJzvHU96/OaFzzZ0EcOAZUWY
 J3aEXXAA4G/Y48cdDnKjPOrQgH1XekAfscbXW0ZWaVu0dA5HnriKVruZj8lKEKnELtvMkW6ULwQ
 ==
X-Received: by 2002:a05:6870:1b16:b0:1ef:d51b:5f50 with SMTP id
 hl22-20020a0568701b1600b001efd51b5f50mr7603599oab.22.1698763257488; 
 Tue, 31 Oct 2023 07:40:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFANyRAH1nXo4IUkrqN1HKuYxzfESQEmdy7ahALAdU7wdendE3vJG+CITZSdHBFI/mTHqrjKI5/+mlEUc3+Ggo=
X-Received: by 2002:a05:6870:1b16:b0:1ef:d51b:5f50 with SMTP id
 hl22-20020a0568701b1600b001efd51b5f50mr7603564oab.22.1698763257269; Tue, 31
 Oct 2023 07:40:57 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 31 Oct 2023 07:40:56 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20231029042712.520010-9-cristian.ciocaltea@collabora.com>
References: <20231029042712.520010-1-cristian.ciocaltea@collabora.com>
 <20231029042712.520010-9-cristian.ciocaltea@collabora.com>
Mime-Version: 1.0
Date: Tue, 31 Oct 2023 07:40:56 -0700
Message-ID: <CAJM55Z_2hdsvw8gdYLs2kZbRrH6xcM6+xCZn8BCf5zsWYyhY3w@mail.gmail.com>
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
Cc: devicetree@vger.kernel.org,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, kernel@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 08/12] riscv: dts: starfive: Add pool
 for coherent DMA memory on JH7100 boards
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
> From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
>
> The StarFive JH7100 SoC has non-coherent device DMAs, but most drivers
> expect to be able to allocate coherent memory for DMA descriptors and
> such. However on the JH7100 DDR memory appears twice in the physical
> memory map, once cached and once uncached:
>
>   0x00_8000_0000 - 0x08_7fff_ffff : Off chip DDR memory, cached
>   0x10_0000_0000 - 0x17_ffff_ffff : Off chip DDR memory, uncached
>
> To use this uncached region we create a global DMA memory pool there and
> reserve the corresponding area in the cached region.
>
> However the uncached region is fully above the 32bit address limit, so add
> a dma-ranges map so the DMA address used for peripherals is still in the
> regular cached region below the limit.

Adding these nodes to the device tree won't actually do anything without
enabling CONFIG_DMA_GLOBAL_POOL as is done here:

https://github.com/esmil/linux/commit/e14ad9ff67fd51dcc76415d4cc7f3a30ffcba379

>
> Link: https://github.com/starfive-tech/JH7100_Docs/blob/main/JH7100%20Data%20Sheet%20V01.01.04-EN%20(4-21-2021).pdf
> Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  .../boot/dts/starfive/jh7100-common.dtsi      | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/starfive/jh7100-common.dtsi b/arch/riscv/boot/dts/starfive/jh7100-common.dtsi
> index b93ce351a90f..504c73f01f14 100644
> --- a/arch/riscv/boot/dts/starfive/jh7100-common.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7100-common.dtsi
> @@ -39,6 +39,30 @@ led-ack {
>  			label = "ack";
>  		};
>  	};
> +
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		dma-reserved {
> +			reg = <0x0 0xfa000000 0x0 0x1000000>;
> +			no-map;
> +		};
> +
> +		linux,dma {
> +			compatible = "shared-dma-pool";
> +			reg = <0x10 0x7a000000 0x0 0x1000000>;
> +			no-map;
> +			linux,dma-default;
> +		};
> +	};
> +
> +	soc {
> +		dma-ranges = <0x00 0x80000000 0x00 0x80000000 0x00 0x7a000000>,
> +			     <0x00 0xfa000000 0x10 0x7a000000 0x00 0x01000000>,
> +			     <0x00 0xfb000000 0x00 0xfb000000 0x07 0x85000000>;
> +	};
>  };
>
>  &gpio {
> --
> 2.42.0
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
