Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 85917AB9B48
	for <lists+linux-stm32@lfdr.de>; Fri, 16 May 2025 13:42:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 31304C7A83A;
	Fri, 16 May 2025 11:42:42 +0000 (UTC)
Received: from zg8tmty1ljiyny4xntuumtyw.icoremail.net
 (zg8tmty1ljiyny4xntuumtyw.icoremail.net [165.227.155.160])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 362C3C78037
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 May 2025 01:09:21 +0000 (UTC)
Received: from E0005182DT.eswin.cn (unknown [10.12.97.162])
 by app2 (Coremail) with SMTP id TQJkCgDXaJImkCZoiJh8AA--.40410S2;
 Fri, 16 May 2025 09:08:58 +0800 (CST)
From: weishangjuan@eswincomputing.com
To: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, richardcochran@gmail.com, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 p.zabel@pengutronix.de, yong.liang.choong@linux.intel.com,
 rmk+kernel@armlinux.org.uk, jszhang@kernel.org, inochiama@gmail.com,
 jan.petrous@oss.nxp.com, dfustini@tenstorrent.com, 0x1207@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Date: Fri, 16 May 2025 09:08:48 +0800
Message-ID: <20250516010849.784-1-weishangjuan@eswincomputing.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
X-CM-TRANSID: TQJkCgDXaJImkCZoiJh8AA--.40410S2
X-Coremail-Antispam: 1UD129KBjvdXoWrur1rAr1kXr1kKw4DXw1fWFg_yoWkGwb_Cr
 1xZr95Ja1UXF4jvayjkrs7uryq9F4DJrySkFZ8AFWYv3sFqrWDGF95ArykZF1UGr4rJF9x
 Wryft34Iyw12gjkaLaAFLSUrUUUU1b8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbHkYjsxI4VWkCwAYFVCjjxCrM7AC8VAFwI0_Wr0E3s1l1xkIjI8I
 6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
 8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0
 cI8IcVCY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwV
 C2z280aVCY1x0267AKxVW0oVCq3wAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAa
 Y2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ec7
 CjxVAajcxG14v26r1j6r4UMcIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_
 Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8c
 xan2IY04v7M4kE6xkIj40Ew7xC0wCY1x0262kKe7AKxVWrXVW3AwCY02Avz4vE-syl42xK
 82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGw
 C20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48J
 MIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMI
 IF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E
 87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvj4Rz6wtUUUUU
X-CM-SenderInfo: pzhl2xxdqjy31dq6v25zlqu0xpsx3x1qjou0bp/
X-Mailman-Approved-At: Fri, 16 May 2025 11:42:40 +0000
Cc: ningyu@eswincomputing.com, lizhi2@eswincomputing.com,
 Shangjuan Wei <weishangjuan@eswincomputing.com>, linmin@eswincomputing.com
Subject: [Linux-stm32] [PATCH v1 0/2] Add driver support for Eswin eic7700
	SoC ethernet controller
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

From: Shangjuan Wei <weishangjuan@eswincomputing.com>

  Introduce a driver for the Eswin eic7700 series SoC ethernet controller,
  adding support for the ethernet functionality in the Linux kernel. The
  driver provides basic functionality to manage and control the ethernet
  signals for the eic7700 series chips, which are part of the Eswin SoC family.

  Supported chips:
    Eswin eic7700 series SoC.

  Test:
    I tested this patch on the Sifive HiFive Premier P550 (which uses the EIC7700 SoC),
    including system boot and ethernet.

Shangjuan Wei (2):
  ethernet: eswin: Document for eic7700 SoC
  ethernet: eswin: Add eic7700 ethernet driver

 .../bindings/net/eswin,eic7700-eth.yaml       | 142 +++++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 +
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-eic7700.c   | 521 ++++++++++++++++++
 4 files changed, 675 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c

-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
