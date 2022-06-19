Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D7AB9550989
	for <lists+linux-stm32@lfdr.de>; Sun, 19 Jun 2022 11:49:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5E7EDC03FC7;
	Sun, 19 Jun 2022 09:49:52 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E2358C03FC5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Jun 2022 09:49:50 +0000 (UTC)
Received: from mail-yw1-f172.google.com ([209.85.128.172]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MrxfX-1nOFsB142n-00o0yW for <linux-stm32@st-md-mailman.stormreply.com>; Sun,
 19 Jun 2022 11:49:50 +0200
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-3177f4ce3e2so52113697b3.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Jun 2022 02:49:50 -0700 (PDT)
X-Gm-Message-State: AJIora/gyZK6pleLv5b6tBA2ii2ksAGlkH1lt0UC7uAY+YY3B4MZRe6k
 pJCUN0rS+s/M1s/Ob3kERZ68rZyAuSY+Ec0uj+U=
X-Google-Smtp-Source: AGRyM1t9ul1TMDLrnODbrtmpbMg/VmZyXRzI7rCNUKvT9jPCzauqo8TpsRO1mbG6wZCDJNE0X4tcOtmgDYFJdLII69Y=
X-Received: by 2002:a0d:ca0f:0:b0:317:a2cc:aa2 with SMTP id
 m15-20020a0dca0f000000b00317a2cc0aa2mr5711993ywd.347.1655632189019; Sun, 19
 Jun 2022 02:49:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220616221554.22040-1-ansuelsmth@gmail.com>
In-Reply-To: <20220616221554.22040-1-ansuelsmth@gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sun, 19 Jun 2022 11:49:31 +0200
X-Gmail-Original-Message-ID: <CAK8P3a103rO9GV+L8cctYJcQBwGDUTVBcn3ii266R-Wa1mGDuw@mail.gmail.com>
Message-ID: <CAK8P3a103rO9GV+L8cctYJcQBwGDUTVBcn3ii266R-Wa1mGDuw@mail.gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>
X-Provags-ID: V03:K1:AeMTpJsNcQmSphNtJZyHX29GlZrJscYflW914XQJBeGLtCEG5rZ
 YSzk//1lrA6bc+JmojjPj+ZWV1qC5vpglbqSuHFLzC7FXUJWmcs02qHFdW94aEEKl7e9m5A
 a5lB7cn9KkM3lOszGRSDTv6DAwzoXTevFdedEnkhKuy2wULvsCtlKpNdUaLdq/4BHG3ym+8
 UxpgtW5EgJ/X/fZm/itPQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:b2Lpq7ONCNw=:UtLzvOt1/dbKmz5Y7MmDHX
 QblpkC1pMeeBAs3WeqALrOmnLBywA25YZ3GtvppVKfM6tacOK06XFdgU5ICL2BDqzfwt2RELa
 qCFv8cdi3m/4bIrOsSLaRYWzZggBJJqDTqvekPl/DrCfAyPY1gWEhkO/RTGREGcMswkq5ZlRv
 aznFp+uzXKR60d/O+YpgSxEZAr7WLHuxE7Mu4tnYrdYLaM2iHd59Gj1ZgmSpGX0fLeok8ru8w
 6cWDZaS6v7RSLAGMoThNQGISwNNvNBFDpL2e/1brI2jj4hM97RUVDmNqCuEbVZqZ89SBx7ssO
 4wUsc8je/f/Ho7iTVmesKo6sUGdO1D1aSFvJexoTc+wSIGqSMm4b36qowjX1jpWrWrMTWjQOg
 YSeGG4p6fIfKqDunIuKcjHPYmXI2UjXFx5yggiIzvbMwAFXYmsXENoLzH++SY1Vw5dgEgbRYB
 lzFZ7MSWn1rT5gMNb0vh7WOHAuVoFmawK+4xKQ1eAQeYTWhhrbUwrrdC4hZD1e46B+PIk51C+
 2PXlezs41yBwgiESFP71VV7e5JIFYGKNvLj4YN/bkNhX3P2WJHfSeMsnywOTLtCk8QGfUNzd+
 JcMBIw1kpElyAkVudRV2Fc8kGbt0OTLWjDxZwTeQCoonH7R/+SJ7y+g32jAGFsDvmZZUPH+ld
 dSU4bhc6ec0f+OCtVz7Oz7wDZgDvAHP3PZdNowjgDwBMT0El+DuMWswYet2ii/FWschFE2Cyo
 dNWb1AL2aadnd7lbKC9R3Extz/6zVzhcfqT3RA==
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 kernel test robot <lkp@intel.com>, Networking <netdev@vger.kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [net-next PATCH] net: ethernet: stmmac: remove
 select QCOM_SOCINFO and make it optional
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

On Fri, Jun 17, 2022 at 12:15 AM Christian Marangi <ansuelsmth@gmail.com> wrote:
>
> QCOM_SOCINFO depends on QCOM_SMEM but is not selected, this cause some
> problems with QCOM_SOCINFO getting selected with the dependency of
> QCOM_SMEM not met.
> To fix this remove the select in Kconfig and add additional info in the
> DWMAC_IPQ806X config description.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Fixes: 9ec092d2feb6 ("net: ethernet: stmmac: add missing sgmii configure for ipq806x")
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/Kconfig | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> index c4bca16dae57..31ff35174034 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
> +++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> @@ -83,7 +83,6 @@ config DWMAC_IPQ806X
>         default ARCH_QCOM
>         depends on OF && (ARCH_QCOM || COMPILE_TEST)
>         select MFD_SYSCON
> -       select QCOM_SOCINFO
>         help
>           Support for QCA IPQ806X DWMAC Ethernet.
>
> @@ -92,6 +91,9 @@ config DWMAC_IPQ806X
>           acceleration features available on this SoC. Network devices
>           will behave like standard non-accelerated ethernet interfaces.
>
> +         Select the QCOM_SOCINFO config flag to enable specific dwmac
> +         fixup based on the ipq806x SoC revision.

I think the correct way would have been to use

     depends on QCOM_SOCINFO || COMPILE_TEST

here.

        Arnd
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
