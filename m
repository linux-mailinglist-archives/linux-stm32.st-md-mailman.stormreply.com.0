Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B12815B5F
	for <lists+linux-stm32@lfdr.de>; Sat, 16 Dec 2023 20:38:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D99ECC6DD6B;
	Sat, 16 Dec 2023 19:38:56 +0000 (UTC)
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B1CEEC6DD67
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 16 Dec 2023 19:38:55 +0000 (UTC)
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 155D53F2B4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 16 Dec 2023 19:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1702755535;
 bh=2c7dacoDuG5K0tl+4E3IQI93Dvy5OouinIjtAewN7Os=;
 h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=e44+90stt3l/ScDqFCt0bG6NKsJ/Mnf+Qs0a7LWfGhTtdRmu9YGpDJolyJM3eGWXo
 rOxrY3DDdfuQAvS1nLovn7rvG1rAMVzOxjAQZU+c0hx/T4BtYt0jbVhtdtMnFr8dqM
 x0wLuYK/sRWNlKG/GoHcnrDde5ssJOy0br3+r/RTtTWilHxhRvbmZ1u7ksKz80DAAe
 4cNKdTvknaVdPmg2jo8O8vvDAzKX3qwm3lRVCRUGyLYJs2mdWGRsZSkL18F+pZCBdt
 xt/wSVBGSPEMHxCTMQL61lkX4GcdlAwnOv/+aUnx1wzjfjW7Noq1VwmrL5INZCoqEi
 uiiCOMDE0NSlQ==
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4258a2540ceso29057141cf.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 16 Dec 2023 11:38:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702755534; x=1703360334;
 h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2c7dacoDuG5K0tl+4E3IQI93Dvy5OouinIjtAewN7Os=;
 b=bXMmQv6OSnKK1KVt9DKO0aTvjAO1NH9UQFUkH135lv0x56Q6wWImI2NptYhgmwlE0Q
 8+F0tfvnQQbk9MwnucXj96cTzS+amSZKCwyICoj/ZzPA5F17fVi8Nk59fD4GMsPuL1o2
 CbLtGup/whkIgZzMWgD1OFX5eCDVMqwJ0qilO/vwv9SdnqE8Sr6lGJTfLgyhcoFeAuXc
 29MRi015gtzTyQxTGRC2qEdNbxNsiSS7lk1F7IIklYlnvhj10Y7RsJ3mkR+aAxm8CkKc
 arRnEMvSGVecRYUq0sOHDpSBRFkgijSPG6di146zBI5n+Zvd28cAlzNTsn6j0E8CpI0F
 dgaw==
X-Gm-Message-State: AOJu0YyMMyBfdzei+H/Y5HvORUGLvhndbE6KjqWQg1YXXcWKFeXoc2Af
 yMWmR4h12TB9b0ciJf+6QUut7auY5MuJ07MHxdXo8a7j05wSHawtEdVBkfKpfHdfP9scDHq9V5k
 kVjd3ZV5rrlZ0sdviD0NY/7WpmBr46IwgrLp1/S/L1ocK77405jZb0D7CPFpQUi8G5lPK98s/cQ
 ==
X-Received: by 2002:a05:622a:1c8:b0:425:4043:18bd with SMTP id
 t8-20020a05622a01c800b00425404318bdmr20333359qtw.112.1702755534015; 
 Sat, 16 Dec 2023 11:38:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFkdKr9ZA1ECc64gwyj30qjy4snj5vZUkODgrjSVIiFsMAP3aqvVWnQrSXJixVzRgLW2ZfvbY5zJh4SCWF268k=
X-Received: by 2002:a05:622a:1c8:b0:425:4043:18bd with SMTP id
 t8-20020a05622a01c800b00425404318bdmr20333325qtw.112.1702755533644; Sat, 16
 Dec 2023 11:38:53 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 16 Dec 2023 11:38:53 -0800
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20231215204050.2296404-6-cristian.ciocaltea@collabora.com>
References: <20231215204050.2296404-1-cristian.ciocaltea@collabora.com>
 <20231215204050.2296404-6-cristian.ciocaltea@collabora.com>
Mime-Version: 1.0
Date: Sat, 16 Dec 2023 11:38:53 -0800
Message-ID: <CAJM55Z-bg0EGPaLHtxcu2AzqN59zfuiT0eE7oCShrx7dG_QK1g@mail.gmail.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Emil Renner Berthing <kernel@esmil.dk>, Samin Guo <samin.guo@starfivetech.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Hal Feng <hal.feng@starfivetech.com>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: devicetree@vger.kernel.org,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
 kernel@collabora.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 5/9] riscv: dts: starfive:
 jh7100-common: Setup pinmux and enable gmac
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
> Add pinmux configuration for DWMAC found on the JH7100 based boards and
> enable the related DT node, providing a basic PHY configuration.
>
> Co-developed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  .../boot/dts/starfive/jh7100-common.dtsi      | 85 +++++++++++++++++++
>  1 file changed, 85 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/starfive/jh7100-common.dtsi b/arch/riscv/boot/dts/starfive/jh7100-common.dtsi
> index 42fb61c36068..5cafe8f5c2e7 100644
> --- a/arch/riscv/boot/dts/starfive/jh7100-common.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7100-common.dtsi
> @@ -72,7 +72,92 @@ wifi_pwrseq: wifi-pwrseq {
>  	};
>  };
>
> +&gmac {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&gmac_pins>;
> +	phy-mode = "rgmii-id";
> +	phy-handle = <&phy>;

I'm not sure if it's a generic policy or not, but I don't really like adding a
reference to a non-existant node here. I'd move this property to the board
files where the phy node is actually defined.

/Emil
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
