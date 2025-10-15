Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B14CBDDF9F
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Oct 2025 12:27:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 327FEC5661C;
	Wed, 15 Oct 2025 10:27:53 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DEB6FC36B36
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Oct 2025 10:27:51 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 212A7C09F84;
 Wed, 15 Oct 2025 10:27:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 329BB606F9;
 Wed, 15 Oct 2025 10:27:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 56F12102F22C9; 
 Wed, 15 Oct 2025 12:27:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1760524070; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=LNu33L8ch36XV1cxGKgfSp3VX2drrLW9N8Hj5z/i8aw=;
 b=mrzSQhafXforNEw0F6kYH3MNXoL/dVHRTdiC2HIEhVwsAJ+CGjuKjlRoQ0ks59MMKitynJ
 lIZtyI9CYYmfNiciyApCb+qZyprauasRMJ9n8bFCDY8JKgH0i0ohcqhMHFe2GVN43CWtqQ
 h4wtx3/ioG62e9D5c+y4B+gJeDa3NbOnnRsrcvWYvb1gwL0fjAu3SE6YDod/NmmdzGCaaT
 HbHro0ZpyGy2LDJ1iytiHhO5kwGBfUe2wwEcGxhabSxX4utJNxQWMokrfJKeH+8AB+lLId
 YbL1o5EevDqCCSbOWpip8PDXdsQOAsLy2IvtzGcjEjfKiDVvpCIpxTB2kA+S7A==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 =?UTF-8?q?K=C3=B6ry=20Maincent?= <kory.maincent@bootlin.com>
Date: Wed, 15 Oct 2025 12:27:20 +0200
Message-ID: <20251015102725.1297985-1-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 0/3] net: stmmac: Add support for
	coarse timestamping
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

This is another attempt to support the fine vs coarse timestamping modes
in stmmac.

This mode allows trading off PTP clock frequency adjustment precision
versus timestamping precision.

In coarse mode, we lose the ability to fine-tune the PTP clock
frequency, but get better timestamping precision instead. This is
especially useful when acting as a PTP Grand Master, where the PTP clock
in sync'd to a high-precision GPS clock through PPS inputs.

This has been submitted before as a dedicated ioctl() back in 2020 [1].
Since then, we now have a better representation of timestamp providers
with a dedicated qualifier (approx vs precise).

This series attempts to map these new qualifiers to stmmac's
timestamping modes, see patch 2 for details.

The main drawback IMO is that the qualifiers don't map very well to our
timestamping modes, as the "approx" qualifier actually maps to stmmac's
"coars" mode, but we actually gain in timestamping precision (while
losing frequency precision).

Patch 1 is prep work for the stmmac driver,
Patch 2 adds the mode adjustment. Most of the plumbing to compute addend
values and sub-second increment is already there in the driver.

Patch 3 makes sure our NDO for timestamping provider reconfiguration is
called upon changing the qualifier.

Let me kow what you think of this approach,

Maxime

[1] : https://lore.kernel.org/netdev/20200514102808.31163-1-olivier.dautricourt@orolia.com/

Maxime Chevallier (3):
  net: stmmac: Move subsecond increment configuration in dedicated
    helper
  net: stmmac: Allow supporting coarse adjustment mode
  net: ethtool: tsconfig: Re-configure hwtstamp upon provider change

 .../ethernet/stmicro/stmmac/stmmac_ethtool.c  |  2 +
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 62 +++++++++++++------
 net/ethtool/tsconfig.c                        |  2 +-
 3 files changed, 45 insertions(+), 21 deletions(-)

-- 
2.49.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
