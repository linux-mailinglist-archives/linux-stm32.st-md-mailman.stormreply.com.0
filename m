Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E44CCCE806D
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Dec 2025 20:17:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9002DC57B68;
	Mon, 29 Dec 2025 19:17:53 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A04A7C57B41
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Dec 2025 19:17:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5175E438BC;
 Mon, 29 Dec 2025 19:17:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBB3EC4CEF7;
 Mon, 29 Dec 2025 19:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767035870;
 bh=zdlHc9b8U/eLbV40R8AjoSBbW+do0gV1EArSnhErV2k=;
 h=From:Subject:Date:To:Cc:From;
 b=bDD0DYKddFO9t4bNWL3dHmtzIF2wveGBSz+wSIKQYJbNBiZH9y01pSdBj+XgACWgQ
 e2QdH9VWV+ecyvZKvhl6fVdJXfWcOcnbHVoZa3wJpn2O6pNTS09aaOEfFH8O9rfGMP
 mVDh98XVeec2Xd9phjy1VdHvrB2fxxl7Mj4ubSr7qSr3HgXoXZSRo4gj/XlcbR5GdJ
 uXmeJJFzgqvy4S1QsPC0mAgwX6g0BJYbAQZk1eC89ofqJVknL6mBx7ocS7/nmfQ9sf
 ghvpd4EaCukL0S/9XindaXUyblacRVYbKcMu66CbtL4xv3+nkxB/bgUGotJ3hXZ7/o
 rtQThsQZ09ByQ==
From: Dinh Nguyen <dinguyen@kernel.org>
Date: Mon, 29 Dec 2025 13:17:17 -0600
Message-Id: <20251229-remove_ocp-v1-0-594294e04bd4@kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAL3TUmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDIyNL3aLU3Pyy1Pj85AJdExNzCzNjC8skA1MjJaCGgqLUtMwKsGHRsbW
 1AM0q3YdcAAAA
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Mamta Shukla <mamta.shukla@leica-geosystems.com>, 
 Ahmad Fatoum <a.fatoum@pengutronix.de>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1395; i=dinguyen@kernel.org;
 h=from:subject:message-id; bh=zdlHc9b8U/eLbV40R8AjoSBbW+do0gV1EArSnhErV2k=;
 b=owEBbQKS/ZANAwAKARmUBAuBoyj0AcsmYgBpUtPajPcHRktCl6d3QxwkIhZ2Lk0tQNNBHtOPl
 Q3EviyokIWJAjMEAAEKAB0WIQSgeEx6LKTlWbBUzA0ZlAQLgaMo9AUCaVLT2gAKCRAZlAQLgaMo
 9LCLD/0dyo8tDOFsr5e4FSCd3GNSLC5hPyhi3YsYZiPc8K5/kuipShDEByFZEZfLsmtCL3qJ940
 rmb+v5MOeZstGprn3+5KqWB9aUBb3khGtscPgBVVHUNxLglJKpJ0HR8RBx8fi3FkZs2XIfOcLxl
 kFhEYoq4h8wW1z0kbp+aVMghyNWyk0Yd0HXj1hGm/7d28pmlxjUFtCrxmvt6g2FsIdG0qcnZb0U
 MDIln98k0VRZKUjCKC2Gx8edz9YzqlEDQImBbsDsd9p1ZsT1+4x+ucbki3ZpdrtVANkuCFHw+q1
 ZcaHV7RHyhSlwBiP9dSGlT8GTI4n30MzhAVPJnCNuyQRr4jis6Rrruzhcqi4PkawiXw+d/68Oh+
 pBLbjOhGR6N3I4les/6kj87AF1AwnBII2JyUglCGQY4aH+unaHaH8VDbVAPa03NjahGDCiyc0eS
 OFrMhs8sdiiirc9QbfeLNPsPic7Bby8PVN6qfIhwySgnDLiiQ/TaaQJHpMmuo0ILLB1kwGv9opy
 OqYv/Yenr1apVZYhPsEe6CfOYtlodgZA2tghefVcmOLUWfJq37AoqKl+vBg9tj+3u+x7b6A6JVb
 92PuCM8HsMIucn+py1BrXnyK0bSqlNeSTohJfbZbzZWgUCgi7tQrEv8rPJmOPo8tgSu4SIoWrPa
 Pq5NyQ5Mc372zCg==
X-Developer-Key: i=dinguyen@kernel.org; a=openpgp;
 fpr=A0784C7A2CA4E559B054CC0D1994040B81A328F4
Cc: devicetree@vger.kernel.org, bsp-development.geo@leica-geosystems.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dinh Nguyen <dinguyen@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/2] net: stmmac: socfpga: support both
 stmmaceth-ocp and ahb reset names
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

The dwmac-socfpga stmmac ethernet controller supports 2 standard reset
lines, named "stmmaceth" and "stmmaceth-ocp". At the time of upstreaming
support for the platform, the "stmmaceth-ocp" name was used for the 2nd
reset name. We later realized that the "stmmaceth-ocp" reset name is
the same as the "ahb" name that is used by the standard stmmac driver.
But since the "stmmaceth-ocp" name support has already been introduced
to the wild, it cannot just be removed from the driver, thus we can
modify the driver to support both "stmmaceth-ocp" and "ahb", with the
idea that "ahb" will be used going forward.

This series add the support to call reset assert/de-assert both "abh"
and "stmmaceth-ocp" to the dwmac-socfpga platform driver, then reverts
the patch that uses the DTS "stmmaceth-ocp" reset name.

Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
Dinh Nguyen (2):
      net: stmmac: socfpga: add call to assert/deassert ahb reset line
      Revert "arm: dts: socfpga: use reset-name "stmmaceth-ocp" instead of "ahb""

 arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi | 6 +++---
 drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c  | 4 ++++
 2 files changed, 7 insertions(+), 3 deletions(-)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251229-remove_ocp-44786389b052

Best regards,
-- 
Dinh Nguyen <dinguyen@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
