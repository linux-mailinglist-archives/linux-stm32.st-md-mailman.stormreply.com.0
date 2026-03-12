Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KMI1EoS5smmYOwAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Mar 2026 14:03:00 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 33FB3272296
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Mar 2026 14:02:59 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D4454C8F28F;
	Thu, 12 Mar 2026 13:02:58 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6C47FC8F28C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Mar 2026 13:02:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 83A4460054;
 Thu, 12 Mar 2026 13:02:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AB65C4CEF7;
 Thu, 12 Mar 2026 13:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773320576;
 bh=TgSk+4s2logLCJYw1/1V/0WBGOGe8vlm4vuaxQUrDRo=;
 h=From:To:Cc:Subject:Date:From;
 b=l9mus12TCdN4ONMZHKmRMj7JZrcmLc6V/uu15lWYvKQwiyXIeEccIOyh9QWblL840
 XKM9Xj20k3BUXAaQOUbsjssa36sXddRoOn+uRISawFuV/ynuA8loLqmzVY9HKBy8Bo
 OjxdKGCE0Bfv/BXS+gzNCxBUQFPqi9bwEC9IWLa50KFU/wHaTQiY0fQ+Fnyb1zQd+j
 qMeTgvH6J3q+E9LZyxMAdMjNGGxOVx0WqEKl4wo6QB3VrnwudN4kwgt/eKKj1CqQJ5
 p7QaIEBtR82xTJJxeiMar/y7cMH4nNfKM+k8CkFlOsZ2HuDTwU4gBQ2ce0bX39jILm
 3gn4Z9eMAEnSw==
From: Niklas Cassel <cassel@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>,
 =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Siddharth Vadapalli <s-vadapalli@ti.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Richard Zhu <hongxing.zhu@nxp.com>,
 Lucas Stach <l.stach@pengutronix.de>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Minghuan Lian <minghuan.Lian@nxp.com>,
 Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>,
 Jesper Nilsson <jesper.nilsson@axis.com>,
 Jingoo Han <jingoohan1@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
 Srikanth Thokala <srikanth.thokala@intel.com>,
 Marek Vasut <marek.vasut+renesas@gmail.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Christian Bruel <christian.bruel@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Shuah Khan <shuah@kernel.org>
Date: Thu, 12 Mar 2026 14:02:28 +0100
Message-ID: <20260312130229.2282001-12-cassel@kernel.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2686; i=cassel@kernel.org;
 h=from:subject; bh=TgSk+4s2logLCJYw1/1V/0WBGOGe8vlm4vuaxQUrDRo=;
 b=owGbwMvMwCV2MsVw8cxjvkWMp9WSGDI37UzN2dLNHDzr3bFkpbmbuvLOSQax7F/j874n3+aSi
 KahfSdLRykLgxgXg6yYIovvD5f9xd3uU44r3rGBmcPKBDKEgYtTACbydSYjw1PmY1NLXJUtzn+R
 6X1joBrv12+ZfCb7h5VwRsB0F9bjFxkZVoT+ns4Zd255TqnKJrPrnfdf5v57cd3wNjOP3VTX8r9
 LGAA=
X-Developer-Key: i=cassel@kernel.org; a=openpgp;
 fpr=5ADE635C0E631CBBD5BE065A352FE6582ED9B5DA
Cc: imx@lists.linux.dev, Manikanta Maddireddy <mmaddireddy@nvidia.com>,
 linux-rockchip@lists.infradead.org, linux-pci@vger.kernel.org,
 linux-arm-kernel@axis.com, linux-renesas-soc@vger.kernel.org,
 Niklas Cassel <cassel@kernel.org>, Damien Le Moal <dlemoal@kernel.org>,
 Koichiro Den <den@valinux.co.jp>, linux-kselftest@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 00/10] PCI: endpoint: Differentiate between
	disabled and reserved BARs
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
X-Spamd-Result: default: False [5.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:mani@kernel.org,m:kwilczynski@kernel.org,m:kishon@kernel.org,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:vigneshr@ti.com,m:s-vadapalli@ti.com,m:lpieralisi@kernel.org,m:robh@kernel.org,m:bhelgaas@google.com,m:hongxing.zhu@nxp.com,m:l.stach@pengutronix.de,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:minghuan.Lian@nxp.com,m:mingkai.hu@nxp.com,m:roy.zang@nxp.com,m:jesper.nilsson@axis.com,m:jingoohan1@gmail.com,m:heiko@sntech.de,m:srikanth.thokala@intel.com,m:marek.vasut+renesas@gmail.com,m:yoshihiro.shimoda.uh@renesas.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:christian.bruel@foss.st.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:thierry.reding@gmail.com,m:jonathanh@nvidia.com,m:hayashi.kunihiko@socionext.com,m:mhiramat@kernel.org,m:shuah@kernel.org,m:imx@lists.linux.dev,m:mmaddireddy@nvidia.com,m:linux-rockchip@lists.infradead.org,m:linux-pci@vger.kernel.org,m:linux-arm-kernel@axis
 .com,m:linux-renesas-soc@vger.kernel.org,m:cassel@kernel.org,m:dlemoal@kernel.org,m:den@valinux.co.jp,m:linux-kselftest@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:linux-omap@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:marekvasut@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:mcoquelinstm32@gmail.com,m:thierryreding@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,arndb.de,linuxfoundation.org,ti.com,google.com,nxp.com,pengutronix.de,gmail.com,axis.com,sntech.de,intel.com,renesas.com,glider.be,foss.st.com,nvidia.com,socionext.com];
	FORGED_SENDER(0.00)[cassel@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCPT_COUNT_GT_50(0.00)[51];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cassel@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[kernel.org:-];
	NEURAL_HAM(-0.00)[-0.958];
	TAGGED_RCPT(0.00)[linux-stm32,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:email,stormreply.com:url]
X-Rspamd-Queue-Id: 33FB3272296
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello all,

This series was originally written in response to the patch series from
Manikanta Maddireddy that was posted here:
https://lore.kernel.org/linux-pci/291dab65-3fa6-4fc8-90a2-4ad608ca015c@nvidia.com/T/#t

Manikanta has reviewed this series and will send a small series on top of
this one.


Changes since v3:
-Modified patch 1 to simply drop BAR_RESERVED for a BAR following an
 only_64bit BAR (Manivannan).
-Added a patch from Manikanta, to make his follow-up series smaller,
 since this series touches the same lines anyway.

Link to v3:
https://lore.kernel.org/linux-pci/20260302095913.48155-11-cassel@kernel.org/


Koichiro Den (2):
  PCI: endpoint: Describe reserved subregions within BARs
  PCI: dw-rockchip: Describe RK3588 BAR4 DMA ctrl window

Manikanta Maddireddy (1):
  PCI: endpoint: Allow only_64bit on BAR_RESERVED

Niklas Cassel (7):
  PCI: endpoint: Do not mark the BAR succeeding a 64-bit BAR as
    BAR_RESERVED
  PCI: endpoint: Introduce pci_epc_bar_type BAR_DISABLED
  PCI: dwc: Replace certain BAR_RESERVED with BAR_DISABLED in glue
    drivers
  PCI: dwc: Disable BARs in common code instead of in each glue driver
  PCI: endpoint: pci-epf-test: Advertise reserved BARs
  misc: pci_endpoint_test: Give reserved BARs a distinct error code
  selftests: pci_endpoint: Skip reserved BARs

 drivers/misc/pci_endpoint_test.c              | 21 ++++++++-
 drivers/pci/controller/dwc/pci-dra7xx.c       |  4 --
 drivers/pci/controller/dwc/pci-imx6.c         | 22 +++------
 drivers/pci/controller/dwc/pci-keystone.c     | 12 +++++
 .../pci/controller/dwc/pci-layerscape-ep.c    |  6 ---
 drivers/pci/controller/dwc/pcie-artpec6.c     |  4 --
 .../pci/controller/dwc/pcie-designware-ep.c   | 24 ++++++++++
 .../pci/controller/dwc/pcie-designware-plat.c | 10 ----
 drivers/pci/controller/dwc/pcie-dw-rockchip.c | 23 ++++++----
 drivers/pci/controller/dwc/pcie-keembay.c     |  3 --
 drivers/pci/controller/dwc/pcie-qcom-ep.c     | 12 -----
 drivers/pci/controller/dwc/pcie-rcar-gen4.c   | 16 ++-----
 drivers/pci/controller/dwc/pcie-stm32-ep.c    | 10 ----
 drivers/pci/controller/dwc/pcie-tegra194.c    | 19 ++------
 drivers/pci/controller/dwc/pcie-uniphier-ep.c | 19 +-------
 drivers/pci/controller/pcie-rcar-ep.c         |  3 --
 drivers/pci/endpoint/functions/pci-epf-test.c | 24 ++++++++++
 drivers/pci/endpoint/pci-epc-core.c           |  5 +-
 include/linux/pci-epc.h                       | 46 +++++++++++++++----
 .../pci_endpoint/pci_endpoint_test.c          |  4 ++
 20 files changed, 154 insertions(+), 133 deletions(-)


base-commit: 0b74f7d72399d4c4422ed3d68ef28b3612f71e74
-- 
2.53.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
