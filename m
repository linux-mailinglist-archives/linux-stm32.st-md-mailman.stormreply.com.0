Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1593E9885B6
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Sep 2024 14:55:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A47C1C6DD72;
	Fri, 27 Sep 2024 12:55:21 +0000 (UTC)
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A93E6C6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Sep 2024 12:55:14 +0000 (UTC)
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 9CB4540AFC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Sep 2024 12:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1727441710;
 bh=sSmJYgv7I+zUFEDVZuQHO2YXTAln9N/geQIOSH+hGyE=;
 h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=tYdi8yaJg3oigcSudcyH/C+7biFMFiXJfrzRwVRoXUATofQRLBwPSjlIRt07WEK5a
 0OBPwXjn2OUXRK6j1w27L2MGYzMI+WUrw7x+6hwr9HWwcT9jDgd93PiJM0ewRCWuBe
 U6BKCJDsk8KSGjgWgb9rX/DsQATazkwR92Fnv1ZFMnoqtvwV1qIxrAKqSAfyDStU/i
 sWgMI2sJLOY5IFz6DSBZIn1MOMNNjQT78GqNzdjfBQDUQXPttPUNMRRpsojojFCtPz
 hPkcgFf1V0Mq3cRm7Pf6P80NxIkKP3D/oLOkcVtsrrTJhZ0BGD+k3uFVQlNu52UtjY
 AFN2eacTOsz2w==
Received: by mail-oa1-f71.google.com with SMTP id
 586e51a60fabf-286efde9783so1804027fac.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Sep 2024 05:55:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727441705; x=1728046505;
 h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sSmJYgv7I+zUFEDVZuQHO2YXTAln9N/geQIOSH+hGyE=;
 b=iSQi8CnzM7gWQ8wueX4H9yX+YlgjqFxGhZ/Jdo071wH9ZhHYHA+cRhJZjNVWlkTPVx
 EK1F+bhFiEHYHhHCpApDPwqeqB+wq2l5qsSzPFmcsTd3tyPitUdnpypK1krmV2lZZHyd
 cBC2roCOXKixg3dB9g2nxQ1XjysNVPopUPug3i7+xP/XsgLGHP1JSyfP9FelNXTqNHZs
 ECtrPsqBK+Wl/HPJghPz8Er8MTyTI4A94D49re+YPBpTCHyxuhyX6+h4ZuMVlbsA+hov
 /TPVDtHzbsF97RK8qTo8JH698LGZMwLOcNRbjSyOjHqp9Nhe18lcZTOf37zcyDS0cikg
 EJKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/Of53TKG09pHKeBAR9XRlwQMSCikqCjBAZhyhm+LFa/7zsvIRgpHpfqC3Y00bH45JdQqOyuMIT00VLQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwWU+hzKGPwg4Dg4t6/7Fl3xcbYn+CdHDbgSKnOdDc8NBYQbVLU
 TyNhQ8MZ0/y2wmn6NkyWjXGzX4TKvv8FfhfietWDrxi3JO6+YGZGM7sVTkckujUVeJZy2EY6XTp
 H2D0nrOsI2noOBMMPe4hSPumbaf2VIgVSEiqHbynHfymv6MzkMvDAU+skYCatRjnWbvoKm8oIF0
 VF6UicoJuFiKkCkVX4xJrN/CmTn0oB0yQjcUJwdlA+8k8387//WGt6NFP9uo3oavWFXNhy
X-Received: by 2002:a05:6871:890e:b0:27b:66ea:add7 with SMTP id
 586e51a60fabf-287109f5bb4mr2306173fac.4.1727441705661; 
 Fri, 27 Sep 2024 05:55:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFq2edOIUBYR+Xf5m9TknVcpYnAPqK6sQBsqv8AamrOSSkCMEyyDtCAwOwZQ7rY9zd/qv/ETMaRzLJy5zKgxVE=
X-Received: by 2002:a05:6871:890e:b0:27b:66ea:add7 with SMTP id
 586e51a60fabf-287109f5bb4mr2306155fac.4.1727441705340; Fri, 27 Sep 2024
 05:55:05 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 27 Sep 2024 05:55:04 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20240926-th1520-dwmac-v2-3-f34f28ad1dc9@tenstorrent.com>
References: <20240926-th1520-dwmac-v2-0-f34f28ad1dc9@tenstorrent.com>
 <20240926-th1520-dwmac-v2-3-f34f28ad1dc9@tenstorrent.com>
Mime-Version: 1.0
Date: Fri, 27 Sep 2024 05:55:04 -0700
Message-ID: <CAJM55Z-FLmpFfisNpJi8FP7o_5mwoDa7r18VXW7u7nF0V6oiRw@mail.gmail.com>
To: Drew Fustini <dfustini@tenstorrent.com>,
 "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, Jisheng Zhang <jszhang@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Drew Fustini <drew@pdp7.com>, 
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
 Conor Dooley <conor@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 3/3] riscv: dts: thead: Add TH1520
	ethernet nodes
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

Drew Fustini wrote:
> From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
>
> Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> [drew: change apb registers from syscon to second reg of gmac node]
> [drew: add phy reset delay properties for beaglev ahead]
> Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
> ---
>  arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts |  91 ++++++++++++++
>  .../boot/dts/thead/th1520-lichee-module-4a.dtsi    | 135 +++++++++++++++++++++
>  arch/riscv/boot/dts/thead/th1520.dtsi              |  50 ++++++++
>  3 files changed, 276 insertions(+)

...

> diff --git a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
> index ca84bc2039ef..d9d2e1f4dc68 100644
> --- a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
> +++ b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
> @@ -11,6 +11,11 @@ / {
>  	model = "Sipeed Lichee Module 4A";
>  	compatible = "sipeed,lichee-module-4a", "thead,th1520";
>
> +	aliases {
> +		ethernet0 = &gmac0;
> +		ethernet1 = &gmac1;
> +	};
> +
>  	memory@0 {
>  		device_type = "memory";
>  		reg = <0x0 0x00000000 0x2 0x00000000>;
> @@ -25,6 +30,16 @@ &osc_32k {
>  	clock-frequency = <32768>;
>  };
>
> +&dmac0 {
> +	status = "okay";
> +};
> +
> +&aogpio {
> +	gpio-line-names = "", "", "",
> +			  "GPIO00",
> +			  "GPIO04";
> +};
> +

These GPIO line names does not belong in this patch. They should
already be included in your other patchset adding the names for the
other lines.

/Emil
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
