Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A42D3BDDFA2
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Oct 2025 12:27:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5B6F6C56620;
	Wed, 15 Oct 2025 10:27:57 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 80725C36B38
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Oct 2025 10:27:56 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 2EF5FC09FAE;
 Wed, 15 Oct 2025 10:27:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 4B668606F9;
 Wed, 15 Oct 2025 10:27:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5353E102F22CB; 
 Wed, 15 Oct 2025 12:27:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1760524075; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=DFHqEMv9Ms4KjKDEGNbMoEMnbx63tPMi8GTPSWp0mEA=;
 b=g/kJj2pldVwGsy3HTNK+CfxIaQftqhqjjPw9zXYU7nMDWyzmW9QuV9lGgRhbQO745GWzzz
 pWddzTodIjPOw5dtDadZu863Ejlyvx/sfeVsxSZkRreC3TwJEe7Lo92aV0zAKzp7ub5oNl
 70slry/Hx0VxdpsfVFbvBcQvx2RXvZSCy32iS4Qa39W+8v3lWln52rDqeAK8/gG29onnZf
 +Ddqcj65+/QEr39etjg54TqlsftV88y14o+F4j9HRfuMpW5JDCPskaTNN8QyQ7NkkXIAYc
 2S+hgyfpWSWbz7W5wWrndlltWfjWVRehPYBuDq3714Yn6xbWuuyC86RZonrpXA==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 =?UTF-8?q?K=C3=B6ry=20Maincent?= <kory.maincent@bootlin.com>
Date: Wed, 15 Oct 2025 12:27:22 +0200
Message-ID: <20251015102725.1297985-3-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251015102725.1297985-1-maxime.chevallier@bootlin.com>
References: <20251015102725.1297985-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 2/3] net: stmmac: Allow supporting
	coarse adjustment mode
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

The DWMAC1000 supports 2 timestamping configurations to configure how
frequency adjustments are made to the ptp_clock, as well as the reported
timestamp values.

There was a previous attempt at upstreaming support for configuring this
mode by Olivier Dautricourt and Julien Beraud a few years back [1]

In a nutshell, the timestamping can be either set in fine mode or in
coarse mode.

In fine mode, which is the default, we use the overflow of an accumulator to
trigger frequency adjustments, but by doing so we lose precision on the
timetamps that are produced by the timestamping unit. The main drawback
is that the sub-second increment value, used to generate timestamps, can't be
set to lower than (2 / ptp_clock_freq).

The "fine" qualification comes from the frequent frequency adjustments we are
able to do, which is perfect for a PTP follower usecase.

In Coarse mode, we don't do frequency adjustments based on an
accumulator overflow. We can therefore have very fine subsecond
increment values, allowing for better timestamping precision. However
this mode works best when the ptp clock frequency is adjusted based on
an external signal, such as a PPS input produced by a GPS clock. This
mode is therefore perfect for a Grand-master usecase.

We therefore attempt to map these 2 modes with the newly introduced
hwtimestamp qualifiers (precise and approx).

Precise mode is mapped to stmmac fine mode, and is the expected default,
suitable for all cases and perfect for follower mode

Approx mode is mapped to coarse mode, suitable for Grand-master.

Changing between these modes is done using ethtool :

 - Fine mode

   ethtool --set-hwtimestamp-cfg eth0 index 0 qualifier precise

 - Coarse mode

   ethtool --set-hwtimestamp-cfg eth0 index 0 qualifier approx

[1] : https://lore.kernel.org/netdev/20200514102808.31163-1-olivier.dautricourt@orolia.com/

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 .../net/ethernet/stmicro/stmmac/stmmac_ethtool.c   |  2 ++
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  | 14 ++++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
index 39fa1ec92f82..0594acbc0ead 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
@@ -1192,6 +1192,8 @@ static void stmmac_get_mm_stats(struct net_device *ndev,
 static const struct ethtool_ops stmmac_ethtool_ops = {
 	.supported_coalesce_params = ETHTOOL_COALESCE_USECS |
 				     ETHTOOL_COALESCE_MAX_FRAMES,
+	.supported_hwtstamp_qualifiers = BIT(HWTSTAMP_PROVIDER_QUALIFIER_PRECISE) |
+					 BIT(HWTSTAMP_PROVIDER_QUALIFIER_APPROX),
 	.get_drvinfo = stmmac_ethtool_getdrvinfo,
 	.get_msglevel = stmmac_ethtool_getmsglevel,
 	.set_msglevel = stmmac_ethtool_setmsglevel,
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 3f79b61d64b9..4859aba10aa3 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -675,6 +675,14 @@ static int stmmac_hwtstamp_set(struct net_device *dev,
 
 	priv->systime_flags = STMMAC_HWTS_ACTIVE;
 
+	/* This is the "coarse" mode, where we get lower frequency adjustment
+	 * precision, but better timestamping precision. This is useful when
+	 * acting as a grand-master, as we usually sync with a hgh-previcision
+	 * clock through PPS input. We default to "fine" mode.
+	 */
+	if (config->qualifier == HWTSTAMP_PROVIDER_QUALIFIER_APPROX)
+		priv->systime_flags &= ~PTP_TCR_TSCFUPDT;
+
 	if (priv->hwts_tx_en || priv->hwts_rx_en) {
 		priv->systime_flags |= tstamp_all | ptp_v2 |
 				       ptp_over_ethernet | ptp_over_ipv6_udp |
@@ -684,6 +692,12 @@ static int stmmac_hwtstamp_set(struct net_device *dev,
 
 	stmmac_config_hw_tstamping(priv, priv->ptpaddr, priv->systime_flags);
 
+	/* Switching between coarse/fine mode also requires updating the
+	 * subsecond increment
+	 */
+	if (priv->plat->clk_ptp_rate)
+		stmmac_update_subsecond_increment(priv);
+
 	priv->tstamp_config = *config;
 
 	return 0;
-- 
2.49.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
