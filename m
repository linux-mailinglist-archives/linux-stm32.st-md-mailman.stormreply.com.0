Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0137BA11
	for <lists+linux-stm32@lfdr.de>; Wed, 31 Jul 2019 09:01:19 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 36071C35E01;
	Wed, 31 Jul 2019 07:01:19 +0000 (UTC)
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1F9F1C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jul 2019 17:36:56 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id j6so10240021ioa.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jul 2019 10:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lixom-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0rwxjGQ0F8+7/JgSl5zAGXkF4+sYHbKb6y6qDK+alhg=;
 b=gkX79G8WWxMhmbnVBy82sigtuXRk0mxE6VY3CsMNdf5hT4coRD9fU36W4Q45ae3vKn
 wWiCeYclztjJMcNPuwJtWCVG4w6TRVOiefRLI7sW7m+4X8Or3HAISRpS0F4oNbdy9oYQ
 AIqiKw111Uuzr4T+4G4vo3v1PwrqoUXL1mTzRgiEGcS6op7+kjA18WWMkn36Svh140cn
 Iw2AlgNooDknvK7v+YyuAuKw8zJvOjF0a7tS1crKGFwDMPNxyipry5MFiPZcbmYnwaOh
 az9phnFnGdZqn4tu1h4e+btID5+QINSV9vYgtYM4voOzIEjcPkWQk4l9IsX24ROaHtt0
 2R+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0rwxjGQ0F8+7/JgSl5zAGXkF4+sYHbKb6y6qDK+alhg=;
 b=UtDdAWsJpaUEeMqX5O4enlVACWe3k6QeO14otV6eILryePpD0rtECy41mA4YGhNVfA
 ebd/y+XSjhS3QAhRjGGpYFzKTxRqi4kPHX5QjB9m9kk2xT+c9JmxsOz8s55xHwkYh+yX
 oNgp9UDfQo3zkSLyhoOiGeMr+hPlVYlT5cUeI+82cA4CkPJaiGEWmOcu++oq2tmPWgsO
 OTy7xYtnAw/qbqOlJFb0RSnskpVG1NRhOu57cIZg+tlTNYoicRcSmkARkjyR56JI23Sl
 JXON7avTnZ9fIojR/FKIBlT+qkH7FBESzs3F8MYtFfn1HPJD1rVcDKBFFqevYk9arEtT
 tsow==
X-Gm-Message-State: APjAAAWdOTkpKQzfmmyoptJKMVS5vvyMkj1a5HzBD/av8vw978V5NHtK
 Rd/7jr9G1Fu6RLDohCoqvgek15qI25PG8AFQ2H4=
X-Google-Smtp-Source: APXvYqyXcQAC/AoZ3rJhI5Ac31OagN0p/mkM1JieiGm/GnkuFYYiAYIVYKqyvOPcCeHt0rAKPHGJW51Y1rGcRrDR2PE=
X-Received: by 2002:a5d:915a:: with SMTP id
 y26mr108937727ioq.207.1564508214873; 
 Tue, 30 Jul 2019 10:36:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190729135505.15394-1-patrice.chotard@st.com>
In-Reply-To: <20190729135505.15394-1-patrice.chotard@st.com>
From: Olof Johansson <olof@lixom.net>
Date: Tue, 30 Jul 2019 19:36:43 +0200
Message-ID: <CAOesGMg-3xt2qjjZ569pUE+d6tn7nz264AN9ARkBT_Ej4TFC2A@mail.gmail.com>
To: Patrice CHOTARD <patrice.chotard@st.com>
X-Mailman-Approved-At: Wed, 31 Jul 2019 07:01:17 +0000
Cc: Arnd Bergmann <arnd@arndb.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Russell King <linux@armlinux.org.uk>, linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] ARM: multi_v7_defconfig: Enable SPI_STM32_QSPI
	support
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

Hi Patrice,

If you cc soc@kernel.org on patches you want us to apply, you'll get
them automatically tracked by patchwork.


-Olof

On Mon, Jul 29, 2019 at 3:55 PM <patrice.chotard@st.com> wrote:
>
> From: Patrice Chotard <patrice.chotard@st.com>
>
> Enable support for QSPI block on STM32 SoCs.
>
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
> ---
>  arch/arm/configs/multi_v7_defconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
> index 6a40bc2ef271..78d1d93298af 100644
> --- a/arch/arm/configs/multi_v7_defconfig
> +++ b/arch/arm/configs/multi_v7_defconfig
> @@ -403,6 +403,7 @@ CONFIG_SPI_SH_MSIOF=m
>  CONFIG_SPI_SH_HSPI=y
>  CONFIG_SPI_SIRF=y
>  CONFIG_SPI_STM32=m
> +CONFIG_SPI_STM32_QSPI=m
>  CONFIG_SPI_SUN4I=y
>  CONFIG_SPI_SUN6I=y
>  CONFIG_SPI_TEGRA114=y
> --
> 2.17.1
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
