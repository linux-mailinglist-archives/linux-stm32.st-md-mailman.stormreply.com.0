Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B72310D6D3
	for <lists+linux-stm32@lfdr.de>; Fri, 29 Nov 2019 15:20:36 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D55FBC36B0B;
	Fri, 29 Nov 2019 14:20:35 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C0B94C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 29 Nov 2019 14:20:34 +0000 (UTC)
Received: from mail-qt1-f169.google.com ([209.85.160.169]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MK3FW-1iN0pw0UJy-00LTOf for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 29 Nov 2019 15:20:34 +0100
Received: by mail-qt1-f169.google.com with SMTP id r20so32565485qtp.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 29 Nov 2019 06:20:33 -0800 (PST)
X-Gm-Message-State: APjAAAV1EpjTpvmSeUhJkCL0Dsn9V2W2jDxK6vAEYOWe7h+K+G8pSVua
 d0msfxZdcJK4a8K9eL3aH7o+YFcQPQQodTkg2OY=
X-Google-Smtp-Source: APXvYqzuj1g3/GU3W0Lff3sjm4Lv42/6ORZFJ6s5TNnb+zf08goAKPnWFeOteSaiZYTfp9N207PDOibr4xIs9S0H9Os=
X-Received: by 2002:ac8:27ab:: with SMTP id w40mr923393qtw.18.1575037232961;
 Fri, 29 Nov 2019 06:20:32 -0800 (PST)
MIME-Version: 1.0
References: <20191120144109.25321-1-alexandre.torgue@st.com>
 <20191120144109.25321-6-alexandre.torgue@st.com>
In-Reply-To: <20191120144109.25321-6-alexandre.torgue@st.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 29 Nov 2019 15:20:17 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2Bg9KwfEqEE3_NUHxVv=svFGuj--Tnq-w-xFg63cfqAA@mail.gmail.com>
Message-ID: <CAK8P3a2Bg9KwfEqEE3_NUHxVv=svFGuj--Tnq-w-xFg63cfqAA@mail.gmail.com>
To: Alexandre Torgue <alexandre.torgue@st.com>
X-Provags-ID: V03:K1:zi5A21S36ccWyHe/HkmzhLnVCqI9Rz/nftEaVXiDxldxTq31eX7
 IZ/yF85KxU6+A5VML3/E4HKDxDG8orFbdDNi8YtrDpWz2EdfehshGgOtNF0lVn+yhJsqlaC
 zXr5Llkv+8pW2pu1KuC4AHQQUOipCoPWlbjsMT15xRpHrQTJkBGBrph7sxpJ9g4UlD6jjEq
 NRoQ/F6k+M2qKbaeB2Y7A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:tbqu1gK0X30=:09Df/qbbWcYdKSfCYHw5J4
 qFySlzKgMBVnW5iI+SmW7KzzSx53P9x485A8tbc+7CJHeZ1g2dLpM7GYU58ixOoOJhT4Cakhu
 zIEKYJbENQk5KfCYJvaQzdDK55N2To5KxC1UY4ApvES7cAs0qSA0dGqYo/w/Wlh7Ls+OyyNBK
 /Vuu2m4ojwFS6lhwWx6p2zFZM4bJDD7TvOXqmSwecZTzLlAUjtG7AYwl8FBhLzFij7kiGTZWp
 ydCoKWYgqw4R/nUJvQUtMkKGoC15A5qGqvO1IUQPPUSrou9Iw7jr4QKzN7wzf+XUFR27Ex8/g
 LW5Bue6V3VqZp4HLbDn4TvTF7uVhcBx1PI2fPyIKpDrKyswzg29GjV26zpijMHvDI2EBdMiTS
 uXEfcCXHG7Y7+FjUBWT9PqBYk8ivb5Q+kFcq9J4O0U3mujDey/KAQnZ6j3ZBeQDdfVh/n4Qk2
 A6CnDcqUtH3UMA1kb8JrxWqe06TiSltVRPEU1RuqeAD3qLK0aU1YOQunF6pz1XCd93Lrl9u2k
 yTq1wrQkK3mkVZvGN1wrqx0qx4olg34rbrB3rg0M0Xe6+RCGEFkpVKyaYVrOaE/br9O+YNhQP
 ssrdoV31O+xIDXxRyeggrA516KzTrtrG8oM6tK6hqArpPPTcbH7/jnvKjPwEUVV4bMaO5Cgzh
 wm3fdbiRzoZXJOO087/pdVWeS6WWYzTKW9ixBAYhd/+eEiI1P3ModtN4ducotBfucDRRm/PGD
 xjDJyh1LrkIwFHN4z4QAmGRcQFaFRfWborBHXSaNk7fKcGNMAvINJMvAoVv1q0OeBfkLAASfV
 28+uApFHeKYrWaL0rxEDO6jXWxQDPBOI5jZOgSWOKMqKZ8PxNzS/eon3QfmkM2dgWKR4l40s2
 ZE1XaT0ShwCrPuDgRuZg==
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 5/6] ARM: dts: stm32: Adapt STM32MP157 DK
 boards to stm32 DT diversity
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

On Wed, Nov 20, 2019 at 3:41 PM Alexandre Torgue
<alexandre.torgue@st.com> wrote:
>
> To handle STM32MP15 SOCs diversity, some updates have to been done.
> This commit mainly adapt dk1 board to include the correct package and the
> correct SOC version. A new file has been created to factorize common parts.
>
> Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>
>
> diff --git a/arch/arm/boot/dts/stm32mp157a-dk1.dts b/arch/arm/boot/dts/stm32mp157a-dk1.dts
> index 3f869bd67082..1292ac3b6890 100644
> --- a/arch/arm/boot/dts/stm32mp157a-dk1.dts
> +++ b/arch/arm/boot/dts/stm32mp157a-dk1.dts
>         model = "STMicroelectronics STM32MP157A-DK1 Discovery Board";
>         compatible = "st,stm32mp157a-dk1", "st,stm32mp157";
> -
> -       aliases {
> -               ethernet0 = &ethernet0;
> -               serial0 = &uart4;
> -       };
> -
> -       chosen {
> -               stdout-path = "serial0:115200n8";
> -       };
> -

As a rule, I would leave aliases and chosen nodes in the .dts file and not
move them into a shared .dtsi, since they tend to be board specific.

(even if that may not be the case in this particular file)

      Arnd
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
