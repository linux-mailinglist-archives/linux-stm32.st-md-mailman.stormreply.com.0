Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GHP1ATv9q2mgiwEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sat, 07 Mar 2026 11:26:03 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9696122B060
	for <lists+linux-stm32@lfdr.de>; Sat, 07 Mar 2026 11:26:02 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 36244C8F290;
	Sat,  7 Mar 2026 10:26:02 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9B4F6C8F26E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  7 Mar 2026 10:26:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D9AEA60018;
 Sat,  7 Mar 2026 10:25:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02DAFC19422;
 Sat,  7 Mar 2026 10:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772879158;
 bh=gK0pRUM/Slfh1oiPmyu3lYsDR18Y7TIzAYUu4D4ldj0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=j0Cac6S7TyQb+E6Y2hSbXhG5N5uDfVrssvtttU324wBvcszTcCtHvLTTG6vhZAYq7
 wskyH5zr18JuTUiOMKGCzxZJNC30mVQa9uzgNH+81iLrwuTOS7AF+F1rg+Qcw90+J4
 Hup3d6KGjEoFHVj4LT2aRD+9kmz3xe5CPxlWzaTUcLe+k82X84Bj76ifbo8W1lksUv
 nSTMoq1tSEPXIuSTcFIfIHv5bK2Xol6mUMEI2LMojWPdFCTWxH27UDeFaF40KZilXu
 Et7B4BVoQTlXRPP6S6sInBPHaCZQhjZcsKbaAYTa3jYkRERSa3gTQIQbkmerjXe7ml
 UpoHRIhMOPjCw==
Date: Sat, 7 Mar 2026 11:25:56 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Message-ID: <20260307-boisterous-tuscan-rat-1eb9bb@quoll>
References: <20260306-qcom-sa8255p-emac-v7-0-d6a3013094b7@oss.qualcomm.com>
 <20260306-qcom-sa8255p-emac-v7-1-d6a3013094b7@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260306-qcom-sa8255p-emac-v7-1-d6a3013094b7@oss.qualcomm.com>
Cc: Drew Fustini <fustini@kernel.org>, s32@nxp.com,
 Heiko Stuebner <heiko@sntech.de>, Geert Uytterhoeven <geert+renesas@glider.be>,
 imx@lists.linux.dev, Frank Li <Frank.Li@nxp.com>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Swathi K S <swathi.ks@samsung.com>, Eric Dumazet <edumazet@google.com>,
 netdev@vger.kernel.org, Guo Ren <guoren@kernel.org>,
 Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
 linux-amlogic@lists.infradead.org, Shawn Guo <shawnguo@kernel.org>,
 linux-riscv@lists.infradead.org, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Rob Herring <robh@kernel.org>, Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
 Shuang Liang <liangshuang@eswincomputing.com>,
 Samuel Holland <samuel@sholland.org>, sophgo@lists.linux.dev,
 Kevin Hilman <khilman@baylibre.com>, Chen Wang <unicorn_wang@outlook.com>,
 Bartosz Golaszewski <brgl@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-rockchip@lists.infradead.org,
 Jose Abreu <joabreu@synopsys.com>, Clark Wang <xiaoning.wang@nxp.com>,
 Linux Team <linux-imx@nxp.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Konrad Dybcio <konradybcio@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Samin Guo <samin.guo@starfivetech.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>,
 David Wu <david.wu@rock-chips.com>, Jan Petrous <jan.petrous@oss.nxp.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Maxime Ripard <mripard@kernel.org>, Minda Chen <minda.chen@starfivetech.com>,
 Drew Fustini <dfustini@tenstorrent.com>,
 "G. Jaya Kumaran" <vineetha.g.jaya.kumaran@intel.com>,
 Shangjuan Wei <weishangjuan@eswincomputing.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Chen-Yu Tsai <wens@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-sunxi@lists.linux.dev,
 linux-mips@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Keguang Zhang <keguang.zhang@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Zhi Li <lizhi2@eswincomputing.com>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Inochi Amaoto <inochiama@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthew Gerlach <matthew.gerlach@altera.com>,
 "David S. Miller" <davem@davemloft.net>, Fu Wei <wefu@redhat.com>
Subject: Re: [Linux-stm32] [PATCH net-next v7 1/7] dt-bindings: net: qcom:
 document the ethqos device for SCMI-based systems
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
X-Rspamd-Queue-Id: 9696122B060
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.29 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bartosz.golaszewski@oss.qualcomm.com,m:fustini@kernel.org,m:s32@nxp.com,m:heiko@sntech.de,m:geert+renesas@glider.be,m:imx@lists.linux.dev,m:Frank.Li@nxp.com,m:christophe.roullier@foss.st.com,m:swathi.ks@samsung.com,m:edumazet@google.com,m:netdev@vger.kernel.org,m:guoren@kernel.org,m:nobuhiro.iwamatsu.x90@mail.toshiba,m:linux-amlogic@lists.infradead.org,m:shawnguo@kernel.org,m:linux-riscv@lists.infradead.org,m:festevam@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:jbrunet@baylibre.com,m:bartosz.golaszewski@linaro.org,m:robh@kernel.org,m:mohd.anwar@oss.qualcomm.com,m:liangshuang@eswincomputing.com,m:samuel@sholland.org,m:sophgo@lists.linux.dev,m:khilman@baylibre.com,m:unicorn_wang@outlook.com,m:brgl@kernel.org,m:magnus.damm@gmail.com,m:jernej.skrabec@gmail.com,m:linux-rockchip@lists.infradead.org,m:joabreu@synopsys.com,m:xiaoning.wang@nxp.com,m:linux-imx@nxp.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:konradybcio@kernel.org,m:s.hauer@pengutronix.de,m
 :devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:kernel@esmil.dk,m:kernel@pengutronix.de,m:samin.guo@starfivetech.com,m:martin.blumenstingl@googlemail.com,m:linux-arm-msm@vger.kernel.org,m:richardcochran@gmail.com,m:david.wu@rock-chips.com,m:jan.petrous@oss.nxp.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:mripard@kernel.org,m:minda.chen@starfivetech.com,m:dfustini@tenstorrent.com,m:vineetha.g.jaya.kumaran@intel.com,m:weishangjuan@eswincomputing.com,m:peppe.cavallaro@st.com,m:wens@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:neil.armstrong@linaro.org,m:linux-sunxi@lists.linux.dev,m:linux-mips@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:keguang.zhang@gmail.com,m:andersson@kernel.org,m:romain.gantois@bootlin.com,m:lizhi2@eswincomputing.com,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:andrew+netdev@lunn.ch,m:vkoul@kernel.org,m:mcoquelin.stm32@gmail.com,m:inochiama@gmail.com,m:krzk+dt@kernel.org,m:matthew.gerlach@altera.com,m:davem@daveml
 oft.net,m:wefu@redhat.com,m:geert@glider.be,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	RCPT_COUNT_GT_50(0.00)[75];
	NEURAL_HAM(-0.00)[-0.755];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,nxp.com,sntech.de,glider.be,lists.linux.dev,foss.st.com,samsung.com,google.com,vger.kernel.org,mail.toshiba,lists.infradead.org,gmail.com,st-md-mailman.stormreply.com,baylibre.com,linaro.org,oss.qualcomm.com,eswincomputing.com,sholland.org,outlook.com,synopsys.com,redhat.com,pengutronix.de,esmil.dk,starfivetech.com,googlemail.com,rock-chips.com,oss.nxp.com,bp.renesas.com,tenstorrent.com,intel.com,st.com,bootlin.com,lunn.ch,altera.com,davemloft.net];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,renesas,dt,netdev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,linaro.org:email,stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Action: no action

On Fri, Mar 06, 2026 at 04:46:39PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Describe the firmware-managed variant of the QCom DesignWare MAC. As the
> properties here differ a lot from the HLOS-managed variant, lets put it
> in a separate file. Since we need to update the maximum number of power
> domains, let's update existing bindings referencing the top-level
> snps,dwmac.yaml and limit their maxItems for power-domains to 1.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Reviewed-by: Romain Gantois <romain.gantois@bootlin.com> # For RZ/N1

Can we drop half-baked reviews? Reviewing only that piece is not even
possible, because it makes no sense outside of main change context. IOW,
it's pointless review of nothing, if you do not actually review the main
change impacting RZ/N1.

Also submitting patches do not really allow to apply reviewer's
statement of oversight to inly part of the patch.

It's called Ack then. Use proper tags if one does not actually review
the patch.

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
