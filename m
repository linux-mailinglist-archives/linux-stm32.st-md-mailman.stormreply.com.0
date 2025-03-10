Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EEF8A5A5F2
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Mar 2025 22:16:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 167EDC7803D;
	Mon, 10 Mar 2025 21:16:38 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CB92FC7802E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Mar 2025 21:16:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D3C1D5C03E4;
 Mon, 10 Mar 2025 21:14:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19C95C4CEE5;
 Mon, 10 Mar 2025 21:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741641395;
 bh=xhhTO52C/8fG7MDjEfxhWhAUsEKxrB+SaqXmnB/oZGQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KB1ErfGMXqL3eUvY/h60CuKtdRdDzpKgAEjSXuOVZQgYXaX7PjmtRr+7t+hvS6tGy
 ytMrx41oPxfH3/0bph5XHgZy28tQ6Iyar2WI4JMjngSuQq9nge7too/D5Lq3Nezlm0
 Ev2cu/gKGiY2ajzu5pUo2A/BRY0gQIWXwKyphw6qT7z7sSreM3Suncat5jtP4rMt+a
 8Zhi1XgPM3G/xx5GvP1PkwRGVoj8YRnX972OzIo+R+3PskdAyDEgUJqqcOBrRdx7la
 7no62gUzvph6vkxPCn7Ai5G55Ys2afIwQ35/d85v/cKcR4Vdd40oLznc/OHhu45KPE
 1Tw6Rt5PmnBPQ==
Date: Mon, 10 Mar 2025 16:16:33 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Message-ID: <174164139310.903652.6069254912704107254.robh@kernel.org>
References: <20250309003301.1152228-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250309003301.1152228-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: imx@lists.linux.dev, Heiko Stuebner <heiko@sntech.de>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Eric Dumazet <edumazet@google.com>, Biao Huang <biao.huang@mediatek.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 linux-rockchip@lists.infradead.org, Clark Wang <xiaoning.wang@nxp.com>,
 Linux Team <linux-imx@nxp.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 linux-mediatek@lists.infradead.org,
 "G. Jaya Kumaran" <vineetha.g.jaya.kumaran@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 David Wu <david.wu@rock-chips.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next] dt-bindings: net: Define
 interrupt constraints for DWMAC vendor bindings
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


On Sun, 09 Mar 2025 00:33:01 +0000, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> The `snps,dwmac.yaml` binding currently sets `maxItems: 3` for the
> `interrupts` and `interrupt-names` properties, but vendor bindings
> selecting `snps,dwmac.yaml` do not impose these limits.
> 
> Define constraints for `interrupts` and `interrupt-names` properties in
> various DWMAC vendor bindings to ensure proper validation and consistency.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> Hi All,
> 
> Based on recent patch [0] which increases the interrupts to 11
> and adds `additionalItems: true` its good to have constraints
> to validate the schema. Ive made the changes based on the DT
> binding doc and the users. Ive ran dt binding checks to ensure
> the constraints are valid. Please let me know if you'd like me
> to split this patch or if any of the constraints are incorrect,
> as I don't have documentation for all of these platforms.
> 
> https://lore.kernel.org/all/20250308200921.1089980-2-prabhakar.mahadev-lad.rj@bp.renesas.com/
> 
> Cheers, Prabhakar
> ---
>  .../devicetree/bindings/net/amlogic,meson-dwmac.yaml   |  6 ++++++
>  .../devicetree/bindings/net/intel,dwmac-plat.yaml      |  6 ++++++
>  .../devicetree/bindings/net/mediatek-dwmac.yaml        |  6 ++++++
>  .../devicetree/bindings/net/nxp,dwmac-imx.yaml         |  8 ++++++++
>  .../devicetree/bindings/net/rockchip-dwmac.yaml        | 10 ++++++++++
>  Documentation/devicetree/bindings/net/stm32-dwmac.yaml | 10 ++++++++++
>  .../bindings/net/toshiba,visconti-dwmac.yaml           |  6 ++++++
>  7 files changed, 52 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
