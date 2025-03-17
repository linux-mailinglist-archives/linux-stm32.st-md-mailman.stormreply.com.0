Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC0FA66298
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Mar 2025 00:24:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 48462C78018;
	Mon, 17 Mar 2025 23:24:37 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4EBE8C6B47E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Mar 2025 23:24:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E410D5C56FC;
 Mon, 17 Mar 2025 23:22:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10BCFC4CEE3;
 Mon, 17 Mar 2025 23:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742253873;
 bh=dAk2U2sfsY/rQm35ORj2bH3tfDkpp80tHYe3UuarDzo=;
 h=From:To:Cc:Subject:Date:From;
 b=UvtpHlFd7BCNHE3YfWJqiblOSdto+WgtykkwcB5yaLUQxWHRh3Xiw80Cp8w8d5Msx
 FFr+jZOyukEILitdGNJqFgr7Akf2sbzRCSwutbSKwqCLE/TLxP1YwCcQX61mU12yU+
 anl/tDQo8B04nwZh63C/43oUZcUYhs+mkpMJX6cLUuVTWH5WLDo8uIsQwCgJRYRpcA
 3RXjBC8EpAGH905+D3kNsYSYNF118fZztstodISmyBdKzpjZwhnsqaf18xcQK+boBO
 y/Gl/3moxquEw1v5KfhZtV5f9l7lpTtnGEVgLD/J4fBgbBmybNVD0xDVit+ffDVhpO
 z97gDIL4yPVqQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Saravana Kannan <saravanak@google.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Mon, 17 Mar 2025 18:24:20 -0500
Message-ID: <20250317232426.952188-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/3] of: Common "memory-region" parsing
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

While there's a common function to parse "memory-region" properties for
DMA pool regions, there's not anything for driver private regions. As a
result, drivers have resorted to parsing "memory-region" properties
themselves repeating the same pattern over and over. To fix this, this
series adds 2 functions to handle those cases:
of_reserved_mem_region_to_resource() and of_reserved_mem_region_count().

I've converted the whole tree, but just including remoteproc here as
it has the most cases. I intend to apply the first 2 patches for 6.15
so the driver conversions can be applied for 6.16.

A git tree with all the drivers converted is here[1].

[1] git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt/memory-region

Rob Herring (Arm) (3):
  of: reserved_mem: Add functions to parse "memory-region"
  of: Simplify of_dma_set_restricted_buffer() to use
    of_for_each_phandle()
  remoteproc: Use of_reserved_mem_region_* functions for "memory-region"

 drivers/of/device.c                       | 34 ++++------
 drivers/of/of_reserved_mem.c              | 77 +++++++++++++++++++++++
 drivers/remoteproc/imx_dsp_rproc.c        | 44 +++++--------
 drivers/remoteproc/imx_rproc.c            | 65 ++++++++-----------
 drivers/remoteproc/qcom_q6v5_adsp.c       | 24 +++----
 drivers/remoteproc/qcom_q6v5_mss.c        | 60 ++++++------------
 drivers/remoteproc/qcom_q6v5_pas.c        | 69 ++++++++------------
 drivers/remoteproc/qcom_q6v5_wcss.c       | 25 +++-----
 drivers/remoteproc/qcom_wcnss.c           | 23 +++----
 drivers/remoteproc/rcar_rproc.c           | 36 +++++------
 drivers/remoteproc/st_remoteproc.c        | 39 +++++-------
 drivers/remoteproc/stm32_rproc.c          | 42 ++++++-------
 drivers/remoteproc/ti_k3_dsp_remoteproc.c | 28 ++++-----
 drivers/remoteproc/ti_k3_m4_remoteproc.c  | 28 ++++-----
 drivers/remoteproc/ti_k3_r5_remoteproc.c  | 28 ++++-----
 drivers/remoteproc/xlnx_r5_remoteproc.c   | 49 +++++----------
 include/linux/of_reserved_mem.h           | 26 ++++++++
 17 files changed, 329 insertions(+), 368 deletions(-)

--
2.47.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
