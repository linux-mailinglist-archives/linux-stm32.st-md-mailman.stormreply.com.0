Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E2DED8178A6
	for <lists+linux-stm32@lfdr.de>; Mon, 18 Dec 2023 18:28:06 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 859C3C6DD70;
	Mon, 18 Dec 2023 17:28:06 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 75985C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Dec 2023 16:23:17 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AAF2B1C000F;
 Mon, 18 Dec 2023 16:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1702916597;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=zAEs7W5BJdH6/zjSmegRrvrb82LpsDg5zlUYcijXjOc=;
 b=eanC8c+7R5g0+7Ngr4tE6l+5Ch6wDBHCAs7+WP8jSaGfxj2bbKcsV7kAI0FIE49LK2jdA7
 E49bqvJs6EA/cSu85otAKm5zXWNFqRrv+PckBRFhLWRMPRKoVyFoxC2Lu5VhoaGbdp3nFL
 lzBhJbhxuOVta0HFgjmo8g8zHDWQ7ksZGqPpxdBd7Ynvxqp3ODo7oQklDvruUECRoXStLT
 QhoWbTPq0p79G6kKqG65eJer673lisH/fHxj7GntFd7TnMxrzNkgrpTlVGMG8TtHJbTixO
 77i7FJom1jahZQjmEyPO4ZrGLjC/ijPOJUoKB2xtaZvrN/FbNiMEbbmzNpEjcg==
From: Romain Gantois <romain.gantois@bootlin.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>
Date: Mon, 18 Dec 2023 17:23:22 +0100
Message-ID: <20231218162326.173127-1-romain.gantois@bootlin.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-GND-Sasl: romain.gantois@bootlin.com
X-Mailman-Approved-At: Mon, 18 Dec 2023 17:28:04 +0000
Cc: Richard Tresidder <rtresidd@electromag.com.au>,
 Pascal EBERHARD <pascal.eberhard@se.com>,
 Romain Gantois <romain.gantois@bootlin.com>, netdev@vger.kernel.org,
 Sylvain Girard <sylvain.girard@se.com>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net 0/1] Prevent DSA tags from breaking COE
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

This is a bugfix for an issue that was recently brought up in two
reports:

https://lore.kernel.org/netdev/c57283ed-6b9b-b0e6-ee12-5655c1c54495@bootlin.com/
https://lore.kernel.org/netdev/e5c6c75f-2dfa-4e50-a1fb-6bf4cdb617c2@electromag.com.au/

The Checksum Offloading Engine of some stmmac cores (e.g. DWMAC1000)
computes an incorrect checksum when presented with DSA-tagged packets. This
causes all TCP/UDP transfers to break when the stmmac device is connected
to the CPU port of a DSA switch.

The main change introduced by this series is a new stmmac dma feature that
stmmac_mac_link_up() can check to detect cores that have DSA-incompatible
COEs. If the flag is set and the netdevice uses DSA, stmmac_xmit() will
complete checksumming in software instead of offloading it.

I've run some iperf3 tests and the TX hotpath performance doesn't seem
to be degraded by the field added to dma_features.

Best Regards,

Romain

Romain Gantois (1):
  net: stmmac: Prevent DSA tags from breaking COE

 drivers/net/ethernet/stmicro/stmmac/common.h     |  1 +
 .../net/ethernet/stmicro/stmmac/dwmac1000_dma.c  |  1 +
 .../net/ethernet/stmicro/stmmac/stmmac_main.c    | 16 +++++++++++++++-
 3 files changed, 17 insertions(+), 1 deletion(-)

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
