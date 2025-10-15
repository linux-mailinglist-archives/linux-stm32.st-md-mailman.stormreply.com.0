Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E71BDDFA5
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Oct 2025 12:28:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7B66BC5661F;
	Wed, 15 Oct 2025 10:28:00 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 01243C5661E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Oct 2025 10:27:59 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id C0F601A13C1;
 Wed, 15 Oct 2025 10:27:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 9971F606FA;
 Wed, 15 Oct 2025 10:27:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 40124102F22B6; 
 Wed, 15 Oct 2025 12:27:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1760524077; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=8qGWfDBGHqSPGWJIrWnQN9/sHI+wC3nVrrOc3hb1m0A=;
 b=24j3kz+TZBypam4eIYin2oaU8ga44Eb8szSPoPzfttkiNc1sKGA141nc2k50UTsxeDCz81
 79OVEr6ivEuhso/lXvKdjzzQ26imcDA2VyVIFWJc7F5D2/OhaicI1qtW9P5HfMgb7XZx9/
 6tmoA7teAreB/HUcPLDy2IWD47ahrhuKETwxrZtaw4rh8Uho4/T0UkkGbRKsCYCs7KZtjJ
 O01MsgiqKnVANuvlhNENUlQBbfdTWGFRptTcmI5+JeR1AkNZQLqyh8jOWxnVBYyzwRMAib
 X80psGjtblFuZ1kLqAzVUcKXSpFpTxHqZOm8EvV3jLhRgNFMjDzhgQGe/O2fKA==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 =?UTF-8?q?K=C3=B6ry=20Maincent?= <kory.maincent@bootlin.com>
Date: Wed, 15 Oct 2025 12:27:23 +0200
Message-ID: <20251015102725.1297985-4-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251015102725.1297985-1-maxime.chevallier@bootlin.com>
References: <20251015102725.1297985-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 3/3] net: ethtool: tsconfig:
	Re-configure hwtstamp upon provider change
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

When a hwprov timestamping source is changed, but without updating the
timestamping parameters, we may want to reconfigure the timestamping
source to enable the new provider.

This is especially important if the same HW unit implements 2 providers,
a precise and an approx one. In this case, we need to make sure we call
the hwtstamp_set operation for the newly selected provider.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 net/ethtool/tsconfig.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/ethtool/tsconfig.c b/net/ethtool/tsconfig.c
index 169b413b31fc..e8333452926d 100644
--- a/net/ethtool/tsconfig.c
+++ b/net/ethtool/tsconfig.c
@@ -416,7 +416,7 @@ static int ethnl_set_tsconfig(struct ethnl_req_info *req_base,
 			kfree_rcu(__hwprov, rcu_head);
 	}
 
-	if (config_mod) {
+	if (config_mod || hwprov_mod) {
 		ret = dev_set_hwtstamp_phylib(dev, &hwtst_config,
 					      info->extack);
 		if (ret < 0)
-- 
2.49.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
