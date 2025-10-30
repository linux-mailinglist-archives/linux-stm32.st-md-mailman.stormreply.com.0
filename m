Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD0EC21C19
	for <lists+linux-stm32@lfdr.de>; Thu, 30 Oct 2025 19:25:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 25CBAC62D8F;
	Thu, 30 Oct 2025 18:25:09 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A7DEFC62D8A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Oct 2025 18:25:08 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 914C64E41401;
 Thu, 30 Oct 2025 18:25:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 4CC2860331;
 Thu, 30 Oct 2025 18:25:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3921E1180980D; Thu, 30 Oct 2025 19:24:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1761848706; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=vSJU4peJj+Pvauv54hPV1/HslESIG4pVWkh58D4A9/c=;
 b=LcageyWgxYbyW3qRtqSBLny73lhZbVIesEoOXkAHs9iHO4lt9kUO+hc8vkIVeSDm2+HfJR
 MTQVRE4RK4fZ21SKCaahaDk6klLPcHTvysUYvkt5e+TRD037gCtRJeX66i8jEyKeoTjb/P
 DXr0jNMudu8Wp3sONhj/2AssyTKgoSyIDhCOIewXG3CFjxIWnkNHtCSc1uvfpJuHLmSmcB
 +9fQ2ZD1z+dqc+C6UjelZIb8UpEYFppAshc6Oy9nc6MlW942USNH/leAu8scetsDiPr32A
 fxfOGrjcqwCnS7yDylZpacXVgzkHa/ddaRi0gyVEr8QKVm/fCphs9RnrLdsHyA==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 =?UTF-8?q?K=C3=B6ry=20Maincent?= <kory.maincent@bootlin.com>
Date: Thu, 30 Oct 2025 19:24:53 +0100
Message-ID: <20251030182454.182406-1-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Cc: Vadim Fedorenko <vadim.fedorenko@linux.dev>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next] net: stmmac: rename devlink
	parameter ts_coarse into phc_coarse_adj
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

The devlink param "ts_coarse" doesn't indicate that we get coarse
timestamps, but rather that the PHC clock adjusments are coarse as the
frequency won't be continuously adjusted. Adjust the devlink parameter
name to reflect that.

The Coarse terminlogy comes from the dwmac register naming, update the
documentation to better explain what the parameter is about.

With this change, the parameter can now be adjusted using:
  devlink dev param set <dev> name phc_coarse_adj value true cmode runtime

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 Documentation/networking/devlink/stmmac.rst   | 21 +++++++++++++------
 .../net/ethernet/stmicro/stmmac/stmmac_main.c |  2 +-
 2 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/Documentation/networking/devlink/stmmac.rst b/Documentation/networking/devlink/stmmac.rst
index e8e33d1c7baf..47e3ff10bc08 100644
--- a/Documentation/networking/devlink/stmmac.rst
+++ b/Documentation/networking/devlink/stmmac.rst
@@ -19,13 +19,22 @@ The ``stmmac`` driver implements the following driver-specific parameters.
      - Type
      - Mode
      - Description
-   * - ``ts_coarse``
+   * - ``phc_coarse_adj``
      - Boolean
      - runtime
-     - Enable the Coarse timestamping mode. In Coarse mode, the ptp clock is
-       expected to be updated through an external PPS input, but the subsecond
-       increment used for timestamping is set to 1/ptp_clock_rate. In Fine mode
-       (i.e. Coarse mode == false), the ptp clock frequency is adjusted more
-       frequently, but the subsecond increment is set to 2/ptp_clock_rate.
+     - Enable the Coarse timestamping mode, as defined in the DWMAC TRM.
+       A detailed explanation of this timestamping mode can be found in the
+       Socfpga Functionnal Description [1].
+
+       In Coarse mode, the ptp clock is expected to be fed by a high-precision
+       clock that is externally adjusted, and the subsecond increment used for
+       timestamping is set to 1/ptp_clock_rate.
+
+       In Fine mode (i.e. Coarse mode == false), the ptp clock frequency is
+       continuously adjusted, but the subsecond increment is set to
+       2/ptp_clock_rate.
+
        Coarse mode is suitable for PTP Grand Master operation. If unsure, leave
        the parameter to False.
+
+       [1] https://www.intel.com/content/www/us/en/docs/programmable/683126/21-2/functional-description-of-the-emac.html
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index ba4eeba14baa..618d1b8dc2f0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -7446,7 +7446,7 @@ static int stmmac_dl_ts_coarse_get(struct devlink *dl, u32 id,
 }
 
 static const struct devlink_param stmmac_devlink_params[] = {
-	DEVLINK_PARAM_DRIVER(STMMAC_DEVLINK_PARAM_ID_TS_COARSE, "ts_coarse",
+	DEVLINK_PARAM_DRIVER(STMMAC_DEVLINK_PARAM_ID_TS_COARSE, "phc_coarse_adj",
 			     DEVLINK_PARAM_TYPE_BOOL,
 			     BIT(DEVLINK_PARAM_CMODE_RUNTIME),
 			     stmmac_dl_ts_coarse_get,
-- 
2.49.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
