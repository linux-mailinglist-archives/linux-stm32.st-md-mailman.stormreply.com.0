Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B98930A09
	for <lists+linux-stm32@lfdr.de>; Sun, 14 Jul 2024 15:15:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BB45BC6C841;
	Sun, 14 Jul 2024 13:15:31 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DE4E3C6C820
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 14 Jul 2024 13:15:30 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-52ea3e499b1so3937966e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 14 Jul 2024 06:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720962930; x=1721567730;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=KiCM4Oh0wwP2VREwcugnR/BGE8YEV2FgEAMfKAudQZU=;
 b=Oujq3ThOjaKhZ6YuvMo0YJMyPO2W5Xs7vEHagCZyjF9sYWho17B0t/WrlLtaSc1Ea+
 i08R5+XgONRVhbVLwOmKHqXgtWikxQ47+GugUnpw0OujhR1CgApkUcDXTFZxbo/obCCq
 d7ZPXEgBfaFhpz/S06c7doKLtf9zen2uDVirIfBmUqY/AVrLADTO4ZHk4w9+ISgxksf/
 z1nCiRtdEiRDwGgh7cs8UKpruvviyTHda9J+z23v54VIwQLOVobUtamMjao5dhZv6SJL
 xaVYAinGpdhjuMx++2j3B8CcIArLTGvjSwmJlgGNcgcZnqyGV2gewy+LcOjhF3cz0Ngf
 tXlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720962930; x=1721567730;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KiCM4Oh0wwP2VREwcugnR/BGE8YEV2FgEAMfKAudQZU=;
 b=D05UrUoz7Wwb/F7hVXWPPsaz6WORke3DnAdZDYG16qjBM5KYoxDcQFgdzBgEgXvadK
 I2zYOBZPChw2mkEjOzXe/0RsxadGpZPnLg3iuo4wcD/y+52BKfK/KeB1bfNKV33ytLWA
 QFI0rQbgRvUlUceaUrz2jH9TYk0HEfBbKSImucHPTpkR1nkYHVg9GE2QrEIMzscZIXVr
 aS++Srq+iUHVF0o1dilcsWGAD+S17H2wFO723gGPBQbkNHyObamq9r8bG/89PpBkilqx
 ebNNPW3xYVYaafpaeS8ntMrqL345hRkyyX9Ww2DTjjmHFoUPDS4qUGidko1nbFa1Cq38
 Zh5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJQYoyp4aI9RGzVsw607Tp9rCNKOgebMsPhEqQrT8kDT5jUka9IQ16jGQuvH2olppCqbr6mDyFWkq/CODQXF3ejlOwBT/1Lw1kVOkSqKdsPDOgGUXHkCEk
X-Gm-Message-State: AOJu0YwPNFgfe3OwyqJE+xSQUT9e8HwWd0/GJxO88Cte1vvSsipLBMMI
 IH7GH+28SAVgohzWTKn214Rdth9a+W1pFPEZyl2KtFk3yEpf5P0/
X-Google-Smtp-Source: AGHT+IEwsZANI92FHt4sUnfLljzN4WZnd499R+at6I3cz5xxru5RwfBlwsIV4f5R+2ItBy99UrvDKg==
X-Received: by 2002:ac2:42d8:0:b0:52b:b327:9c1c with SMTP id
 2adb3069b0e04-52eb99d59e8mr9045576e87.62.1720962927807; 
 Sun, 14 Jul 2024 06:15:27 -0700 (PDT)
Received: from mobilestation (pppoe77-82-205-78.kamchatka.ru. [77.82.205.78])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ed24f38absm467456e87.79.2024.07.14.06.15.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Jul 2024 06:15:27 -0700 (PDT)
Date: Sun, 14 Jul 2024 16:15:09 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Drew Fustini <drew@pdp7.com>
Message-ID: <w3ex6eu3fhv4rmb67hm5ktwkehefw25gmemtqsjjfaa76z7v6t@vmfzungbincv>
References: <20240713-thead-dwmac-v1-0-81f04480cd31@tenstorrent.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240713-thead-dwmac-v1-0-81f04480cd31@tenstorrent.com>
Cc: Eric Dumazet <edumazet@google.com>, Guo Ren <guoren@kernel.org>,
 Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 "David S. Miller" <davem@davemloft.net>, Fu Wei <wefu@redhat.com>
Subject: Re: [Linux-stm32] [PATCH RFC net-next 0/4] Add the dwmac driver
 support for T-HEAD TH1520 SoC.
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

Hi Drew

On Sat, Jul 13, 2024 at 03:35:09PM -0700, Drew Fustini wrote:
> I am marking this as an RFC since it has been almost a year since the
> previous series and Jisheng has handed it off to me. There was
> discussion about the syscon for the APB registers in Jisheng's v2. I've
> gone a different route and switched to adding a second memory region to
> the gmac node:
> 
>   dwmac: DesignWare GMAC IP core registers
>     apb: GMAC APB registers
> 
> This patch depends my clock controller series:
> 
>  [PATCH v3 0/7] clk: thead: Add support for TH1520 AP_SUBSYS clock controller
>  https://lore.kernel.org/linux-riscv/20240711-th1520-clk-v3-0-6ff17bb318fb@tenstorrent.com/
> 
> and the pinctrl series from Emil:
> 
>  [PATCH v2 0/8] Add T-Head TH1520 SoC pin control
>  https://lore.kernel.org/linux-riscv/20240103132852.298964-1-emil.renner.berthing@canonical.com
> 
> I have a branch with this series and the dependencies on top of 6.10-rc7:
>  https://github.com/pdp7/linux/tree/b4/thead-dwmac
> 
> Changes since Jisheng v2:
>  - remove thead,gmacapb that references syscon for APB registers
>  - add a second memory region to gmac nodes for the APB registers
>  - Link: https://lore.kernel.org/all/20230827091710.1483-1-jszhang@kernel.org/

I see the vast majority of the v2 comments left ignored:
compatible-string, Tx/Rx common clock handle, clock delays, etc.
Please take a closer look at v2 discussions and make sure the notes
were implemented or send a reasonable response why it wasn't done.

-Serge(y)

> 
> Changes since Jisheng v1:
>  - rebase on the lastest net-next
>  - collect Reviewed-by tag
>  - address Krzysztof's comment of the dt binding
>  - fix "div is not initialised" issue pointed out by Simon
>  - Link: https://lore.kernel.org/all/20230820120213.2054-1-jszhang@kernel.org/
> 
> ---
> Emil Renner Berthing (1):
>       riscv: dts: thead: Add TH1520 ethernet nodes
> 
> Jisheng Zhang (3):
>       dt-bindings: net: snps,dwmac: allow dwmac-3.70a to set pbl properties
>       dt-bindings: net: add T-HEAD dwmac support
>       net: stmmac: add glue layer for T-HEAD TH1520 SoC
> 
>  .../devicetree/bindings/net/snps,dwmac.yaml        |   2 +
>  .../devicetree/bindings/net/thead,dwmac.yaml       |  81 ++++++
>  MAINTAINERS                                        |   2 +
>  arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts |  89 ++++++
>  .../boot/dts/thead/th1520-lichee-module-4a.dtsi    | 131 +++++++++
>  arch/riscv/boot/dts/thead/th1520.dtsi              |  55 +++-
>  drivers/net/ethernet/stmicro/stmmac/Kconfig        |  11 +
>  drivers/net/ethernet/stmicro/stmmac/Makefile       |   1 +
>  drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c  | 300 +++++++++++++++++++++
>  9 files changed, 670 insertions(+), 2 deletions(-)
> ---
> base-commit: 568c4e4b646777f3373f383cc38864a3cd91bbb7
> change-id: 20240712-thead-dwmac-1d44c472bbd5
> 
> Best regards,
> -- 
> Drew Fustini <dfustini@tenstorrent.com>
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
