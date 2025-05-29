Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E240AC751F
	for <lists+linux-stm32@lfdr.de>; Thu, 29 May 2025 02:39:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ABF6AC35E3F;
	Thu, 29 May 2025 00:39:19 +0000 (UTC)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6188AC35E3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 May 2025 00:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=codeconstruct.com.au; s=2022a; t=1748479155;
 bh=ny8UrZV+yDW12ChrpSJinfCzQgq9Rotc7NxMtarbZ9w=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References;
 b=lhVxSlw1XDyalKK+FYY9gimu5uKVHJnqaeDIt0HjfhB9x7uQWy4SQI/TGIY1Wadbb
 OBr8B5u5921nStK7WPkz8zc4MGzv2ocjjcgGlJ5cdSLqKRB3yuwNNZFghEaoqXOuCU
 XGaz4hQH9WJDhXlF8jAqHQVlbLn9J2xItnpaLWAaOSf8uRWGcOYpJzwJ/z8Yza+HV2
 WSRl6+BECuvxv7ZqlPnd0zrRetMjz80rmuwva0+xhB1ZJ6+J3uQ3VeB2RJYY7yrZD8
 LjDNdWRt2mnVqiGXOpycjhV17I3sk9KD2OTyKXx3l5mPgsYmNZWnz+Ux5vXkgut4Mj
 cMaTpUDMxrqLQ==
Received: from [192.168.68.112] (unknown [180.150.112.166])
 by mail.codeconstruct.com.au (Postfix) with ESMTPSA id DE6426449F;
 Thu, 29 May 2025 08:39:07 +0800 (AWST)
Message-ID: <af3edc0a454eecbe52608e0bc16d82b99be6bad7.camel@codeconstruct.com.au>
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Linus Walleij
 <linus.walleij@linaro.org>, Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Joel Stanley <joel@jms.id.au>,
 Avi Fishman <avifishman70@gmail.com>,  Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>,
 Jonathan =?ISO-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
 =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>,  Broadcom internal
 kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Geert
 Uytterhoeven <geert+renesas@glider.be>, David Rhodes
 <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, Lorenzo Bianconi
 <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, Jesper Nilsson
 <jesper.nilsson@axis.com>, Lars Persson <lars.persson@axis.com>, Manivannan
 Sadhasivam <manivannan.sadhasivam@linaro.org>, Damien Le Moal
 <dlemoal@kernel.org>,  Vladimir Zapolskiy <vz@mleia.com>, Michal Simek
 <michal.simek@amd.com>, Emil Renner Berthing <kernel@esmil.dk>, Jianlong
 Huang <jianlong.huang@starfivetech.com>, Hal Feng
 <hal.feng@starfivetech.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Thu, 29 May 2025 10:09:06 +0930
In-Reply-To: <20250528-pinctrl-const-desc-v1-5-76fe97899945@linaro.org>
References: <20250528-pinctrl-const-desc-v1-0-76fe97899945@linaro.org>
 <20250528-pinctrl-const-desc-v1-5-76fe97899945@linaro.org>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
Cc: linux-rtc@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 patches@opensource.cirrus.com, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@axis.com,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 05/17] pinctrl: aspeed: Constify static
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Wed, 2025-05-28 at 12:41 +0200, Krzysztof Kozlowski wrote:
> The local static 'struct pinctrl_desc' is not modified, so can be made
> const for code safety.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
