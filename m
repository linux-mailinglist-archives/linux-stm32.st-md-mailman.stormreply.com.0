Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B27DDAD509E
	for <lists+linux-stm32@lfdr.de>; Wed, 11 Jun 2025 11:54:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 080EDC36B12;
	Wed, 11 Jun 2025 09:54:28 +0000 (UTC)
Received: from mail.mleia.com (mleia.com [178.79.152.223])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 634FBC36B11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Jun 2025 09:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
 t=1749635665; bh=ZELWje44IQXg+aqRqhMjZlzmAPP8bdbQVZYOFJq3M9g=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Jxt6xsAgMAOUb4jl76i3Cw/ob+3g27CDrEJ11UaNWweARmh3pASKr9vGVkS92IFac
 YPXA6hqSgGV5dnyifiEPzFxSuWmHwqtnnBorcndP4VXu30erdJBfP8YrJ46WtqkT2C
 ZB5SXynEGjYF90uyMsBkLTP7/K9tKTjfvpNQc65M4ZFGcmOJyetoZJbQyfgMTcccnC
 ovv/hF2800vFjHZenrXZ9Ib3Cs3634CyeipOu5H15sVoNWHX/j8qicu106Z5ZeHvjj
 l5CXC3vkbBXv/RUgPw6tOFDOWz5MZGDnaCREKgxUUUqRvZgLkdcVlwdN1MIjOJGq3p
 fGRPXfFbZHprg==
Received: from mail.mleia.com (localhost [127.0.0.1])
 by mail.mleia.com (Postfix) with ESMTP id 964313C153A;
 Wed, 11 Jun 2025 09:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
 t=1749635665; bh=ZELWje44IQXg+aqRqhMjZlzmAPP8bdbQVZYOFJq3M9g=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Jxt6xsAgMAOUb4jl76i3Cw/ob+3g27CDrEJ11UaNWweARmh3pASKr9vGVkS92IFac
 YPXA6hqSgGV5dnyifiEPzFxSuWmHwqtnnBorcndP4VXu30erdJBfP8YrJ46WtqkT2C
 ZB5SXynEGjYF90uyMsBkLTP7/K9tKTjfvpNQc65M4ZFGcmOJyetoZJbQyfgMTcccnC
 ovv/hF2800vFjHZenrXZ9Ib3Cs3634CyeipOu5H15sVoNWHX/j8qicu106Z5ZeHvjj
 l5CXC3vkbBXv/RUgPw6tOFDOWz5MZGDnaCREKgxUUUqRvZgLkdcVlwdN1MIjOJGq3p
 fGRPXfFbZHprg==
Message-ID: <2ae6aa29-ea42-4fdf-a0ae-8cd088c88786@mleia.com>
Date: Wed, 11 Jun 2025 12:54:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: ru-RU
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>,
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>,
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>,
 Jesper Nilsson <jesper.nilsson@axis.com>,
 Lars Persson <lars.persson@axis.com>, Damien Le Moal <dlemoal@kernel.org>,
 Michal Simek <michal.simek@amd.com>, Emil Renner Berthing <kernel@esmil.dk>,
 Jianlong Huang <jianlong.huang@starfivetech.com>,
 Hal Feng <hal.feng@starfivetech.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Manivannan Sadhasivam <mani@kernel.org>
References: <20250611-pinctrl-const-desc-v2-0-b11c1d650384@linaro.org>
 <20250611-pinctrl-const-desc-v2-16-b11c1d650384@linaro.org>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <20250611-pinctrl-const-desc-v2-16-b11c1d650384@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20250611_095425_660571_DE75DF41 
X-CRM114-Status: UNSURE (   7.40  )
X-CRM114-Notice: Please train this message. 
Cc: linux-rtc@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 patches@opensource.cirrus.com, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@axis.com,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 16/17] pinctrl: Constify static
	'pinctrl_desc'
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 6/11/25 09:13, Krzysztof Kozlowski wrote:
> The local static 'struct pinctrl_desc' is not modified, so can be made
> const for code safety.
> 
> Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
> Acked-by: Jesper Nilsson <jesper.nilsson@axis.com>
> Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   drivers/pinctrl/berlin/berlin.c                    | 2 +-
>   drivers/pinctrl/cirrus/pinctrl-cs42l43.c           | 2 +-
>   drivers/pinctrl/mediatek/pinctrl-airoha.c          | 2 +-
>   drivers/pinctrl/pinctrl-artpec6.c                  | 2 +-
>   drivers/pinctrl/pinctrl-bm1880.c                   | 2 +-
>   drivers/pinctrl/pinctrl-k210.c                     | 2 +-
>   drivers/pinctrl/pinctrl-lpc18xx.c                  | 2 +-

Acked-by: Vladimir Zapolskiy <vz@mleia.com>

>   drivers/pinctrl/pinctrl-mlxbf3.c                   | 2 +-
>   drivers/pinctrl/pinctrl-tb10x.c                    | 2 +-
>   drivers/pinctrl/pinctrl-zynq.c                     | 2 +-
>   drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c | 2 +-
>   11 files changed, 11 insertions(+), 11 deletions(-)
> 

--
Best wishes,
Vladimir
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
