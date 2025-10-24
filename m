Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B0FC7C049E1
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Oct 2025 09:07:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A236EC5F1C2;
	Fri, 24 Oct 2025 07:07:41 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 08800C5EC7F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Oct 2025 07:07:38 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 81B2FC0C41B;
 Fri, 24 Oct 2025 07:07:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 47E5160703;
 Fri, 24 Oct 2025 07:07:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 04012102F247E; 
 Fri, 24 Oct 2025 09:07:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1761289657; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=u7DpE+oTDsmY9vOfVzLTFJGa7kcYvBVKQHh8iIY9BgE=;
 b=Y6h9b4sgm0ErZAY1zT16Ddploj6AH9IjTzMSk1AmziZtMqj5HUH0GMq/IYTmjFZc1ZmRSY
 ja31HDlO4852i38mcagx27mP/GEFv/0Yk8d1MXR8lk703cMWR4Gscwngc39zroGx/l2gQs
 Jsi5FcL5hosjtr8sF9yOU4UR/loVx4y+Ln4Clj3wwktxdVDPABEVuao2e/Hyy3yiJF8Oz8
 7YxQNSmbjK7uD6J2WHdjeX0jxsH9JG3HVUNfPWdE7XmBwB6rrJf+O3BmVLgHOiYnwwaF1q
 WMqQmNDla5fBXh0KoUfo0Eilb49R41MtqzzIVKpI24kxXPrp2jGJ29HNVsDmbw==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 =?UTF-8?q?K=C3=B6ry=20Maincent?= <kory.maincent@bootlin.com>
Date: Fri, 24 Oct 2025 09:07:16 +0200
Message-ID: <20251024070720.71174-1-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Cc: Vadim Fedorenko <vadim.fedorenko@linux.dev>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 0/2] net: stmmac: Add support for
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

This is V2 for coarse timetamping support in stmmac. This version uses a
dedicated devlink param "ts_coarse" to control this mode.

This doesn't conflict with Russell's cleanup of hwif.

Maxime

[1] : https://lore.kernel.org/netdev/20200514102808.31163-1-olivier.dautricourt@orolia.com/

Changes in V2:
 - Use devlink intead of tsconfig
 - Rebase on top of Russell's rework of has_xxx flags

V1: https://lore.kernel.org/netdev/20251015102725.1297985-1-maxime.chevallier@bootlin.com/

Maxime Chevallier (2):
  net: stmmac: Move subsecond increment configuration in dedicated
    helper
  net: stmmac: Add a devlink attribute to control timestamping mode

 Documentation/networking/devlink/index.rst    |   1 +
 Documentation/networking/devlink/stmmac.rst   |  31 ++++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |   1 +
 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |   3 +
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 163 +++++++++++++++---
 5 files changed, 176 insertions(+), 23 deletions(-)
 create mode 100644 Documentation/networking/devlink/stmmac.rst

-- 
2.49.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
