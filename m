Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 70BCEBEF6BA
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Oct 2025 08:10:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C7A76C57B7F;
	Mon, 20 Oct 2025 06:10:26 +0000 (UTC)
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2E5C5C57B7E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Oct 2025 06:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 sang-engineering.com; h=from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding; s=k1; bh=v3wtCgrKpXpY06
 IA1iepJUf0jmIsp0liDp9ZApSd2Z8=; b=RcAlToUCuHt6nQyz8co6yRNGfUNVuA
 8UzaTOqAm+ZiKuYB6NvSL17xZZHja1eptPR9iXoEYQBGPdQC3sXqxoudg+VG9Gmv
 OxUSs4rwvpAAgGWj9GHbiy3mt5o3RLhYbpUAGKNgwuIxrnOf9s1PQVJFGAPWouwS
 B45m5DP9YiELKZ+xmtYQlTFsLRSEfyPp6EDndXCiaT5lRfuDe1cmcokUmxi1OUQK
 KRBi4E6z51+bIw8ljzVmThRm8I7SANs4R3Pymh4pKIU88x+vIlSE29oX8FH3V4vP
 3UB8yZtXWU+4F5Dt5qQ7k1mIgouCg4AvmpmdWAXvteCVTfOmyVNzKRew==
Received: (qmail 940898 invoked from network); 20 Oct 2025 08:10:25 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 20 Oct 2025 08:10:25 +0200
X-UD-Smtp-Session: l3s3148p1@9Ldn8JBB9LkgAwDNf0fPAEuMhp6AgTGK
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: devicetree@vger.kernel.org
Date: Mon, 20 Oct 2025 08:09:49 +0200
Message-ID: <20251020060951.30776-6-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Cc: imx@lists.linux.dev, Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Rob Herring <robh@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 linux-sunxi@lists.linux.dev, Conor Dooley <conor+dt@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Liu Ying <victor.liu@nxp.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Maxime Ripard <mripard@kernel.org>, Mark Brown <broonie@kernel.org>,
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-spi@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>
Subject: [Linux-stm32] [PATCH 0/4] dt-bindings: treewide: don't check node
	names
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

Node names are already and properly checked by the core schema. No need
to do it again.

These are all occurrences I found in linux-next as of 20251015. I did
run dt_bindings_check successfully. I haven't done a way to run
dtbs_check yet because I would need to identify the proper architecture
first, right? Is there some tool which tests all DTs of a certain
binding? At least build bot is happy, I don't know if it checks DTs as
well, though.

I'd suggest to give subsystems some time to pick these patches before
Rob applies the remaining ones?


Wolfram Sang (4):
  dt-bindings: bus: don't check node names
  dt-bindings: nvmem: don't check node names
  ASoC: dt-bindings: don't check node names
  dt-bindings: spi: don't check node names

 .../devicetree/bindings/bus/allwinner,sun8i-a23-rsb.yaml        | 2 +-
 .../devicetree/bindings/bus/fsl,imx8qxp-pixel-link-msi-bus.yaml | 2 +-
 Documentation/devicetree/bindings/bus/st,stm32-etzpc.yaml       | 2 +-
 Documentation/devicetree/bindings/bus/st,stm32mp25-rifsc.yaml   | 2 +-
 Documentation/devicetree/bindings/nvmem/st,stm32-romem.yaml     | 2 +-
 Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml       | 2 +-
 Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml      | 2 +-
 Documentation/devicetree/bindings/spi/spi-controller.yaml       | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

-- 
2.47.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
