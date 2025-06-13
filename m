Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B5CAD88D3
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Jun 2025 12:08:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 922DEC36B35;
	Fri, 13 Jun 2025 10:08:30 +0000 (UTC)
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8A4ADC36B31
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Jun 2025 10:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1749809308;
 bh=s4XVAtXusftoKHAg337hEJV0678SCfgl4e9tbX5giyo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=kD6LEarEzpWs4xLCDq8R3pAuynqJ4ZeqL34E45wr5koEtk0OLXpj99IXiZOPcwdQb
 p5Iq05L9iBR7ggI0J3pXeWkLfxIzC3OBARgVEp3jK9TAr7ALCYeI+ySY9dPlZghRWd
 Ds1PASLejz3jlgX4r4PjG++FYlwy8Rc8gu87Mn+GzZ600aDAYXtVO74+/IlhFnWIk9
 Hv+q+thA08ckoQ1i+NLj6LtKv1PkVv0h2O7VdtYvDkBvbwpwpjDynfZcaz8HA01UMZ
 HDx/hbVFOzgW4uB7GNYiYaXRC4ZeSjf1z4oyAriMshNGBeBv5R1piYPogkUgCzKZ70
 JMEyPwRHQDWzQ==
Received: from [192.168.1.90] (unknown [212.93.144.165])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 914CA17E0C18;
 Fri, 13 Jun 2025 12:08:26 +0200 (CEST)
Message-ID: <5a1b4a52-2d6e-4270-82ac-494afe5c6556@collabora.com>
Date: Fri, 13 Jun 2025 13:08:22 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Yury Norov <yury.norov@gmail.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Jaehoon Chung <jh80.chung@samsung.com>, Ulf Hansson
 <ulf.hansson@linaro.org>, Heiko Stuebner <heiko@sntech.de>,
 Shreeya Patel <shreeya.patel@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Sandy Huang
 <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Shawn Lin <shawn.lin@rock-chips.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Qin Jian <qinjian@cqplus1.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
References: <20250612-byeword-update-v1-0-f4afb8f6313f@collabora.com>
 <20250612-byeword-update-v1-10-f4afb8f6313f@collabora.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20250612-byeword-update-v1-10-f4afb8f6313f@collabora.com>
Cc: linux-pm@vger.kernel.org, netdev@vger.kernel.org, llvm@lists.linux.dev,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-phy@lists.infradead.org, kernel@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 10/20] drm/rockchip: dw_hdmi_qp: switch to
 HWORD_UPDATE macro
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

On 6/12/25 9:56 PM, Nicolas Frattaroli wrote:
> The era of hand-rolled HIWORD_UPDATE macros is over, at least for those
> drivers that use constant masks.
> 
> Replace this driver's HIWORD_UPDATE with the HWORD_UPDATE from
> bitfield.h. While at it, disambiguate the write GRF write to SOC_CON7 by
> splitting the definition into the individual bitflags. This is done
> because HWORD_UPDATE shifts the value for us according to the mask, so
> writing the mask to itself to enable two bits is no longer something
> that can be done. It should also not be done, because it hides the true
> meaning of those two individual bit flags.
> 
> HDMI output with this patch has been tested on both RK3588 and RK3576.
> On the former, with both present HDMI connectors.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

This looks good and works fine on Radxa ROCK 5B (RK3588).  Will also
verify on RK3576 as soon as I get a board (expected next week).

Reviewed-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Tested-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
