Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8709F0730
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Dec 2024 10:05:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ECEF6C7801A;
	Fri, 13 Dec 2024 09:05:37 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5860CC78006
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Dec 2024 09:05:31 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6F8BC1BF207;
 Fri, 13 Dec 2024 09:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1734080730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=oMe35rpj3pGiRrVthFbN55YWzxRRPpFse7Y8Q5/jxqg=;
 b=JaL5zOhbshsW8+n7cBu7ZUVx3aRCCpSTvbQZkydzCq2K1aFWd/DAM0B9WvMnCmRxwWlzGW
 uh2MRn9ref2MKLQqurotEa+QH2KCG+Uu3eeuFttjFgrLvhOSfRYp4beZ3wkVG9KWiE9NIZ
 73L81hYlOmS9UKYb//0LcyZ6EduS9mtv2kf+3+s2/2+LbYUHiO2GLu6cmIwsjw9ssYfUyI
 /dyp7lG2YK4dY+tpc4C93baFrIL1659QYlw3DbtAFYSp+jL4wC2tSs9S2yFSMGHCedJJ4Z
 o+y/qRFHwI9MmTf5GG8OpMs5Ld8NIXSXeVrHy2QuH5xTykTMUwbRHlP+pRNkCA==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Fri, 13 Dec 2024 10:05:23 +0100
Message-ID: <20241213090526.71516-1-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-GND-Sasl: maxime.chevallier@bootlin.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 0/2] net: stmmac: dwmac-socfpga:
	Allow using 1000BaseX
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

This short series enables 1000BaseX support in dwmac-socfpga. The support
for this mode is coming from the Lync PCS, however some internal
configuration is also needed in dwmac-socfpga as well.

Patch 1 makes so that we enable the "sgmii_adapter" when using 1000BaseX
as well. The name is a bit misleading for that field, as this is merely
a GMII serializer, the 1000BaseX vs SGMII differences are handled in the
Lynx PCS.

Patch 2 makes so that both 1000BaseX and SGMII are set in the phylink
supported_interfaces. The supported_interfaces are populated by what's
set in DT, which isn't enough for SFP use-cases as the interface mode
will change based on the inserted module, thus failing the validation of
the new interface if it's not the one specified in DT.

When XPCS is used, the interfaces list if populated by asking XPCS for
its supported interfaces. I considered using the same kind of approach
(asking Lynx for the supported modes), but dwmac-socfpga would be the
sole user for that, and this would also need modifying Lynx so that the
driver would maintain different sets of capabilities depending on how
it's integrated (it only supports SGMII/1000BaseX in dwmac-socfpga, but
other modes are supported on other devices that use Lynx).

I've chosen to "just" populate the interfaces in .pcs_init() from
stmmac, which is called before phylink_create() so we should be good in
that regard.

Thanks,

Maxime

Maxime Chevallier (2):
  net: stmmac: dwmac-socfpga: Add support for 1000BaseX
  net: stmmac: dwmac-socfpga: Set interface modes from Lynx PCS as
    supported

 .../ethernet/stmicro/stmmac/dwmac-socfpga.c   | 20 +++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

-- 
2.47.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
