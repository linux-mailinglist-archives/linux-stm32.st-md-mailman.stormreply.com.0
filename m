Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB10821F76
	for <lists+linux-stm32@lfdr.de>; Tue,  2 Jan 2024 17:27:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 80B76C6DD69;
	Tue,  2 Jan 2024 16:27:14 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 61BF6C03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Jan 2024 16:27:13 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 19E3FFF803;
 Tue,  2 Jan 2024 16:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1704212833;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=gLgXTYLMRFh5L6uQq7gtyiAMhfzlrw+4m0P+XM+V4bE=;
 b=iIhsfSozLrvkaMJkCwKo+qGR96+mrWY+qLGfFxmQsvyAV3MS8+ME+dgePuIgqtfwxRNXvA
 Y5VqYfI2kRbxuteas5TfOpA4dXnVfz6vVIMVRaYzFotx8QUB0L+ZZ79+weBuN+BWNmsMEZ
 XCl4l2SqR3l4dEM/qqkLM4kSlp5rLP8/UH464lN7Qu9N1gZwEKKbZA6kCKu61S8Lq/bQ9W
 fCUUo7Z0RbpdIhsZlvjr0AtWLYg7O/MZLHyc/Owz6EvN7LFo670izzNzsMV/GVwDcWryCz
 FiUfbLjpqAVDRCzUNg+mF1S2MLjWPKbgGyNOm04SvuAh4A/rlkZWceMmOSyEkQ==
From: Romain Gantois <romain.gantois@bootlin.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>
Date: Tue,  2 Jan 2024 17:27:14 +0100
Message-ID: <20240102162718.268271-1-romain.gantois@bootlin.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-GND-Sasl: romain.gantois@bootlin.com
Cc: Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>,
 Pascal EBERHARD <pascal.eberhard@se.com>,
 Romain Gantois <romain.gantois@bootlin.com>, netdev@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>,
 Sylvain Girard <sylvain.girard@se.com>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Richard Tresidder <rtresidd@electromag.com.au>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net v2 0/1] Prevent DSA tags from breaking COE
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

This is the second version of my proposed fix for the stmmac checksum
offloading issue that has recently been reported.

significant changes in v2:
- replaced the stmmac_link_up-based fix with an ethertype check in the TX
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

measured degradation on TX: -670 pps (-2.9%) on RX: -485 pps (-1.7%)
original performances on TX: 22kpps on RX: 27kpps

The performance hit on the RX path can be partly explained by the fact that
the stmmac driver doesn't set CHECKSUM_UNNECESSARY anymore.

The slightly higher TX degradation is harder to explain but I should note
that the external PHYs used in my setup have been causing performance
issues on TX, which could be affecting the results.

Best Regards,

Romain

Romain Gantois (1):
  net: stmmac: Prevent DSA tags from breaking COE on stmmac

 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 21 ++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
