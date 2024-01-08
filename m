Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EB820826C62
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Jan 2024 12:17:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9A0F0C6DD63;
	Mon,  8 Jan 2024 11:17:40 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 51818C6DD62
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Jan 2024 11:17:39 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B00FC1C000B;
 Mon,  8 Jan 2024 11:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1704712658;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=7I2Vg9cUj4SvXF6ssTUHeSIDyNKVnzDq5gb0XlbO0wI=;
 b=KnAbGiWw9QTmYqDUk+jRD5ZMXKtYcSoEBQY+d0a1HEcAgl8cEx279kLCT7pXca+7nNbHIK
 Rw8MzE/+6/9j2bSgGhaxAcd3QeulF7k4eXybBUrhYe+L0uekPOdLEFMhk6RSGlhiVBOKp9
 59s6rrWGjS50MnqMC+ZtnW3iGfAknp9cAu8ua/hQRKZbyhzSbwdnbaCbwzz8Tx2iGr4Yp2
 RFZ7qqtWWDzYd96NEuocP8mgCRMKFx0GHCguWRipXm936MHPfQLlsPZpLBmMpSqvkIO7k1
 RTO74t9zDb+H9o5Q7AipAn8Wu2Szn26ksjfO5TRtISKV5gDQKEobd1nKvx2X2g==
From: Romain Gantois <romain.gantois@bootlin.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>
Date: Mon,  8 Jan 2024 12:17:44 +0100
Message-ID: <20240108111747.73872-1-romain.gantois@bootlin.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-GND-Sasl: romain.gantois@bootlin.com
Cc: Vladimir Oltean <olteanv@gmail.com>,
 Richard Tresidder <rtresidd@electromag.com.au>,
 Pascal EBERHARD <pascal.eberhard@se.com>,
 Romain Gantois <romain.gantois@bootlin.com>, netdev@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>,
 Sylvain Girard <sylvain.girard@se.com>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net v3 0/1] Prevent DSA tags from breaking COE
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

Hello everyone,

This is the third version of my proposed fix for the stmmac checksum
offloading issue that has recently been reported.

significant changes in v3:
- Use __vlan_get_protocol to make sure that 8021Q-encapsulated
  traffic is checked correctly.

significant changes in v2:
- Replaced the stmmac_link_up-based fix with an ethertype check in the TX
  and RX hotpaths.

The Checksum Offloading Engine of some stmmac cores (e.g. DWMAC1000)
computes an incorrect checksum when presented with DSA-tagged packets. This
causes all TCP/UDP transfers to break when the stmmac device is connected
to the CPU port of a DSA switch.

I ran some tests using different tagging protocols with DSA_LOOP, and all
of the protocols that set a custom ethertype field in the MAC header caused
the checksum offload engine to ignore the tagged packets. On TX, this
caused packets to egress with incorrect checksums. On RX, these packets
were similarly ignored by the COE, yet the stmmac driver set
CHECKSUM_UNNECESSARY, wrongly assuming that their checksums had been
verified in hardware.

Version 2 of this patch series fixes this issue by checking ethertype
fields in both the TX and RX hotpaths of the stmmac driver. On TX, if a
non-IP ethertype is detected, the packet is checksummed in software.  On
RX, the same condition causes stmmac to avoid setting CHECKSUM_UNNECESSARY.

To measure the performance degradation to the TX/RX hotpaths, I did some
iperf3 runs with 512-byte unfragmented UDP packets.

measured degradation on TX: -466 pps (-0.2%) on RX: -338 pps (-1.2%)
original performances on TX: 22kpps on RX: 27kpps

The performance hit on the RX path can be partly explained by the fact that
the stmmac driver doesn't set CHECKSUM_UNNECESSARY anymore.

The TX performance degradation observed in v2 seems to have improved.
It's not entirely clear to me why that is.

Best Regards,

Romain

Romain Gantois (1):
  net: stmmac: Prevent DSA tags from breaking COE

 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 23 ++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
