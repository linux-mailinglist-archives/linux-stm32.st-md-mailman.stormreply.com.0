Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C794789FA4
	for <lists+linux-stm32@lfdr.de>; Sun, 27 Aug 2023 15:53:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AFAADC6B44D;
	Sun, 27 Aug 2023 13:53:49 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 12DA2C65E58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 27 Aug 2023 13:53:48 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id ACA1460EE2;
 Sun, 27 Aug 2023 13:53:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D13B4C433C8;
 Sun, 27 Aug 2023 13:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693144426;
 bh=b1kK7Dz94GVdmWTD3uMOP5lr20LHYQ/HNK30s5G1xWQ=;
 h=From:To:Cc:Subject:Date:From;
 b=J7iqqsoca1RQhX0MDlxFMt+CDy/1lz+AquUHzDkG8IjDA7/IUiQ+dLIRLojeSJLQn
 ol+t6JDZCxG/qv2FmBSgvEFb63SnAfBzz0wkbBB8/xQbWAJOdM8AmlIAvkhaJY0DiB
 wectLoOwvHfQv7+WW7JdtXe2359iT/u7akjCo5OuyokykABNFRZ7sTL5VvE7rkKbPx
 W3G8onw2trcD1gIKfUlIRoEJBmnDSY9RmCdjjbhz/EwMX29Jc9G9hOOpFaczq8EwRC
 3Cf1UGifzwWeurywMHocRK7zWD8i0mQJRGAhg0NzYLUgcTE2RPyHTr/zLiPdu4l4SF
 TJn9NFL2l6+7Q==
From: Jisheng Zhang <jszhang@kernel.org>
To: Emil Renner Berthing <kernel@esmil.dk>,
 Samin Guo <samin.guo@starfivetech.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Sun, 27 Aug 2023 21:41:48 +0800
Message-Id: <20230827134150.2918-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH net-next 0/2] net: stmmac: dwmac-starfive:
	some improvements
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

This series is to improve the dwmac-starfive driver by correcting
error handling and removing unnecessary clk_get_rate().

Jisheng Zhang (2):
  net: stmmac: dwmac-starfive: improve error handling during probe
  net: stmmac: dwmac-starfive: remove unnecessary clk_get_rate()

 .../ethernet/stmicro/stmmac/dwmac-starfive.c  | 38 +++++++++++--------
 1 file changed, 22 insertions(+), 16 deletions(-)

-- 
2.40.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
