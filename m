Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 555E490ACA9
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Jun 2024 13:13:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 03188C6B45B;
	Mon, 17 Jun 2024 11:13:06 +0000 (UTC)
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 41B1DC69067
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2024 11:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1718622778;
 bh=/L6WYMxSMfjTIoWr9t9k/aRtdxtiTotpKJC0bwZmths=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=TWun6Tz0mrFyu0Doh3GSFs5086lVufoWIuFjkxiKsPZHUQOo5/kxB2MOvTdkHoK4M
 l4YUhTOvHS6iKdIwIxJr+SYFYE4R3tSubri3gpAKeg6QauwUwxk8RGrhWTgKsJRkga
 WmuEAq1gxUD4FXTikNClu2mpX/GqqqZR9v0VNhWXWVooGlwaZSnITzWYVtrWMAdY/Q
 Gc1Sy3KP5c8iVAVzEodL3ey7mM4zKdz2E7c0MAl9n4oWfGTO9aciNFSPuXhlGTSJ4A
 mnRmhAVp0wQ90eRATO9s4OC6Pw0gg5PJ3Gn/yeXaoaNP+Ktue2EHgnAsiuTtPDUH6E
 goMQ1PX6AMUzA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 42DB93780480;
 Mon, 17 Jun 2024 11:12:55 +0000 (UTC)
Message-ID: <33aac6a0-7bdf-48d3-bf79-0f3bf60394f2@collabora.com>
Date: Mon, 17 Jun 2024 13:12:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Guillaume La Roque <glaroque@baylibre.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Anson Huang <Anson.Huang@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Amit Kucheria <amitk@kernel.org>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Heiko Stuebner <heiko@sntech.de>, Biju Das <biju.das.jz@bp.renesas.com>,
 Orson Zhai <orsonzhai@gmail.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Pascal Paillet <p.paillet@foss.st.com>, Keerthy <j-keerthy@ti.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 zhanghongchen <zhanghongchen@loongson.cn>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>
References: <20240614-dt-bindings-thermal-allof-v1-0-30b25a6ae24e@linaro.org>
 <20240614-dt-bindings-thermal-allof-v1-21-30b25a6ae24e@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240614-dt-bindings-thermal-allof-v1-21-30b25a6ae24e@linaro.org>
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Florian Fainelli <f.fainelli@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, imx@lists.linux.dev,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 21/22] dt-bindings: thermal: simplify few
	bindings
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

Il 14/06/24 11:46, Krzysztof Kozlowski ha scritto:
> Simplify few bindings which already reference thermal-sensor.yaml schema
> by dropping unneeded requiring of '#thermal-sensor-cells' and dropping
> assigned-clocks properties (core schema allows it if 'clocks' are
> there).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
