Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BF53CC3FB62
	for <lists+linux-stm32@lfdr.de>; Fri, 07 Nov 2025 12:22:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7C08DC5F1FF;
	Fri,  7 Nov 2025 11:22:23 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5B9D0C36B12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Nov 2025 11:22:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A00EC4450E;
 Fri,  7 Nov 2025 11:22:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45321C4CEF7;
 Fri,  7 Nov 2025 11:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762514540;
 bh=WqJuyrothph0jJUBiuUUbS1FvhvPkDqkS2NhaeN0xV0=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=rImSqDdr0csAuwceoiZMORIrJXnobUCP+yoqx199IwW4RPtIeHWgGg8yhQ45V/D7R
 HxCBJlEMisUSTZWQ74AkbgFanp3OacerkO8+FsunvIN8Qv1PJjoKvEhbkIBisz2yNh
 fHEnA2G6Z+rnjMkyoYcahxv0PRsrM8NiFmSYDw5XFjOljLa3mMJnwZAikRLma8aHey
 0V3PWYoagJTX1nuIdJ2Oom+6PchZMhCgWc6c354u4h/wXc/BosroSeZA0hazMf3txS
 iSFPT4TBGUlSnwuvzF4pqevVMyluivzg/6sz2Tim0ZSb22VBqsrJyyImM6xekisJtj
 QhXJiXhB/cEDw==
Date: Fri, 07 Nov 2025 05:22:18 -0600
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <20251107-qcom-sa8255p-emac-v5-1-01d3e3aaf388@linaro.org>
References: <20251107-qcom-sa8255p-emac-v5-0-01d3e3aaf388@linaro.org>
 <20251107-qcom-sa8255p-emac-v5-1-01d3e3aaf388@linaro.org>
Message-Id: <176251453854.1709481.17350672291824662534.robh@kernel.org>
Cc: imx@lists.linux.dev, s32@nxp.com, Emil Renner Berthing <kernel@esmil.dk>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Drew Fustini <fustini@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Swathi K S <swathi.ks@samsung.com>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Eric Dumazet <edumazet@google.com>, Guo Ren <guoren@kernel.org>,
 Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
 Zhi Li <lizhi2@eswincomputing.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Shawn Guo <shawnguo@kernel.org>,
 linux-riscv@lists.infradead.org, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 Inochi Amaoto <inochiama@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
 Shuang Liang <liangshuang@eswincomputing.com>,
 Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>,
 Chen Wang <unicorn_wang@outlook.com>, Magnus Damm <magnus.damm@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-rockchip@lists.infradead.org,
 Jose Abreu <joabreu@synopsys.com>, Clark Wang <xiaoning.wang@nxp.com>,
 Linux Team <linux-imx@nxp.com>, Samin Guo <samin.guo@starfivetech.com>,
 Shangjuan Wei <weishangjuan@eswincomputing.com>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>,
 Jan Petrous <jan.petrous@oss.nxp.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Maxime Ripard <mripard@kernel.org>, Minda Chen <minda.chen@starfivetech.com>,
 "G. Jaya Kumaran" <vineetha.g.jaya.kumaran@intel.com>, sophgo@lists.linux.dev,
 Jakub Kicinski <kuba@kernel.org>, linux-amlogic@lists.infradead.org,
 Drew Fustini <dfustini@tenstorrent.com>, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, Paolo Abeni <pabeni@redhat.com>,
 Keguang Zhang <keguang.zhang@gmail.com>, netdev@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Heiko Stuebner <heiko@sntech.de>, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Vinod Koul <vkoul@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 David Wu <david.wu@rock-chips.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthew Gerlach <matthew.gerlach@altera.com>,
 "David S. Miller" <davem@davemloft.net>, Fu Wei <wefu@redhat.com>
Subject: Re: [Linux-stm32] [PATCH v5 1/8] dt-bindings: net: qcom: document
 the ethqos device for SCMI-based systems
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


On Fri, 07 Nov 2025 11:29:51 +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Describe the firmware-managed variant of the QCom DesignWare MAC. As the
> properties here differ a lot from the HLOS-managed variant, lets put it
> in a separate file. Since we need to update the maximum number of power
> domains, let's update existing bindings referencing the top-level
> snps,dwmac.yaml and limit their maxItems for power-domains to 1.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  .../bindings/net/allwinner,sun7i-a20-gmac.yaml     |  3 +
>  .../bindings/net/altr,socfpga-stmmac.yaml          |  3 +
>  .../bindings/net/amlogic,meson-dwmac.yaml          |  3 +
>  .../devicetree/bindings/net/eswin,eic7700-eth.yaml |  3 +
>  .../devicetree/bindings/net/intel,dwmac-plat.yaml  |  3 +
>  .../bindings/net/loongson,ls1b-gmac.yaml           |  3 +
>  .../bindings/net/loongson,ls1c-emac.yaml           |  3 +
>  .../devicetree/bindings/net/nxp,dwmac-imx.yaml     |  3 +
>  .../devicetree/bindings/net/nxp,lpc1850-dwmac.yaml |  3 +
>  .../devicetree/bindings/net/nxp,s32-dwmac.yaml     |  3 +
>  .../devicetree/bindings/net/qcom,ethqos.yaml       |  3 +
>  .../bindings/net/qcom,sa8255p-ethqos.yaml          | 98 ++++++++++++++++++++++
>  .../devicetree/bindings/net/renesas,rzn1-gmac.yaml |  3 +
>  .../bindings/net/renesas,rzv2h-gbeth.yaml          |  3 +
>  .../devicetree/bindings/net/rockchip-dwmac.yaml    |  3 +
>  .../devicetree/bindings/net/snps,dwmac.yaml        |  5 +-
>  .../bindings/net/sophgo,cv1800b-dwmac.yaml         |  3 +
>  .../bindings/net/sophgo,sg2044-dwmac.yaml          |  3 +
>  .../bindings/net/starfive,jh7110-dwmac.yaml        |  3 +
>  .../devicetree/bindings/net/stm32-dwmac.yaml       |  3 +
>  .../devicetree/bindings/net/tesla,fsd-ethqos.yaml  |  3 +
>  .../devicetree/bindings/net/thead,th1520-gmac.yaml |  3 +
>  .../bindings/net/toshiba,visconti-dwmac.yaml       |  3 +
>  MAINTAINERS                                        |  1 +
>  24 files changed, 166 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/qcom,sa8255p-ethqos.yaml: $id: Cannot determine base path from $id, relative path/filename doesn't match actual path or filename
 	 $id: http://devicetree.org/schemas/net/qcom,ethqos-scmi.yaml
 	file: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/qcom,sa8255p-ethqos.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20251107-qcom-sa8255p-emac-v5-1-01d3e3aaf388@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
