Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A1AA998C9
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Apr 2025 21:42:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E633BC7802F;
	Wed, 23 Apr 2025 19:42:43 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 33BDEC69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Apr 2025 19:42:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E03806844A;
 Wed, 23 Apr 2025 19:42:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90C7BC4CEE2;
 Wed, 23 Apr 2025 19:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745437361;
 bh=TnT5WVpQCYGJKh3P2I4Fm1o0/+22/GE4VkIuIPQ7b/4=;
 h=From:Subject:Date:To:Cc:From;
 b=mrU11t9mU7Qy/iG/bmQPjQWMfW+P79ei4JW5vf9T6v2w9PFz26kb4XMK+F1i8AjjS
 OekTGSki2lbGXRsIvoWBCAadZprzmI8TkRvJP7iEDr6xj2K1vBmbi5iKx6JBo4Ximo
 SWhzfvXnCkFBftDegHOUviYnUM31Ea9xJUibEzIf5NwFkZQSB4fBBQq7Qn9QLFIHsp
 TyILjCOmie9q2AH/VImwHdouqGW3nJNL5PN/GLLSIZFbBirJsJqLvvWbmvJXpSgb44
 vWBemGESoirKHJnA1GeZ1r/7IExHwiBFFN0aUQrjG7l9DbO2cFXsqehsFa3jfjUxqJ
 Jx6dxjUaY00Rw==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Wed, 23 Apr 2025 14:42:12 -0500
Message-Id: <20250423-dt-memory-region-v2-v2-0-2fbd6ebd3c88@kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJRCCWgC/x2MQQ5AMBAAvyJ7tglLHXxFHKoWe2jJVoQ0/q5xn
 GRmEkRW4Qh9kUD5kih7yEBlAW6zYWWUOTNQRaZqqcH5RM9+1weV1yzjRWhpqo2z1rmugVweyov
 c/3UY3/cDrwxX8WUAAAA=
X-Change-ID: 20250423-dt-memory-region-v2-a2b15caacc63
To: Saravana Kannan <saravanak@google.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, 
 Chen-Yu Tsai <wens@kernel.org>
X-Mailer: b4 0.15-dev
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Daniel Baluta <daniel.baluta@nxp.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 0/4] of: Common "memory-region" parsing
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
it has the most cases. I intend to apply the first 3 patches for 6.16
so the driver conversions can be applied for 6.17.

A git tree with all the drivers converted is here[1].

v2:
- Fix of_dma_set_restricted_buffer() to maintain behavior on warning msg
- Export devm_ioremap_resource_wc()
- Rework handling of resource name to drop unit-address from name as it 
  was before.
- Link to v1: 
  https://lore.kernel.org/all/20250317232426.952188-1-robh@kernel.org

[1] git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt/memory-region

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
Rob Herring (Arm) (4):
      of: reserved_mem: Add functions to parse "memory-region"
      of: Simplify of_dma_set_restricted_buffer() to use of_for_each_phandle()
      devres: Export devm_ioremap_resource_wc()
      remoteproc: Use of_reserved_mem_region_* functions for "memory-region"

 drivers/of/device.c                       | 31 +++++-------
 drivers/of/of_reserved_mem.c              | 80 +++++++++++++++++++++++++++++++
 drivers/remoteproc/imx_dsp_rproc.c        | 45 +++++++----------
 drivers/remoteproc/imx_rproc.c            | 68 +++++++++++---------------
 drivers/remoteproc/qcom_q6v5_adsp.c       | 24 ++++------
 drivers/remoteproc/qcom_q6v5_mss.c        | 60 ++++++++---------------
 drivers/remoteproc/qcom_q6v5_pas.c        | 69 ++++++++++----------------
 drivers/remoteproc/qcom_q6v5_wcss.c       | 25 ++++------
 drivers/remoteproc/qcom_wcnss.c           | 23 ++++-----
 drivers/remoteproc/rcar_rproc.c           | 36 ++++++--------
 drivers/remoteproc/st_remoteproc.c        | 41 ++++++++--------
 drivers/remoteproc/stm32_rproc.c          | 44 ++++++++---------
 drivers/remoteproc/ti_k3_dsp_remoteproc.c | 28 +++++------
 drivers/remoteproc/ti_k3_m4_remoteproc.c  | 28 +++++------
 drivers/remoteproc/ti_k3_r5_remoteproc.c  | 28 +++++------
 drivers/remoteproc/xlnx_r5_remoteproc.c   | 51 ++++++++------------
 include/linux/of_reserved_mem.h           | 26 ++++++++++
 lib/devres.c                              |  1 +
 18 files changed, 339 insertions(+), 369 deletions(-)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250423-dt-memory-region-v2-a2b15caacc63

Best regards,
-- 
Rob Herring (Arm) <robh@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
