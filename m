Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B46BEA458E9
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Feb 2025 09:52:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5CD31C7A830;
	Wed, 26 Feb 2025 08:52:17 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 435A6C7A82F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Feb 2025 08:52:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id AE42961290;
 Wed, 26 Feb 2025 08:52:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33C50C4CED6;
 Wed, 26 Feb 2025 08:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740559934;
 bh=u8k8xkGSvhfumPla5cLuAM1wtrrO9kw4b4n1qMmxcCY=;
 h=From:To:Cc:Subject:Date:From;
 b=InbfX1ymiwGRRXfIM2HIgSzuEvpsr2TD33DQR5OF4niI33b2i21t11TqLm7YpGrEL
 1p7La3xwQ2KiSlnf1tfOWALWS9XL0uP8RT8jKAh7pKSQSIwM2K/RXB7+bNalyG9V1O
 JArbg9GEEg6U6zyEoLJfZOTxvayYKZmeG/bf5ZUQuFeAUAPC9mg8RCD706lGjqWFeb
 GSr6j0jsM6neFbNz0V/8SsXCb+WRz8kb4rH3hf+Y64yu2q7dkzwjXGiVkaVZjui9lJ
 pMEalQNm3asNM5ulpwslW+K/Fb0v3RsU/EUAMxyR+vAhoCTrCTk6MDynk7WpvXKqSW
 Nvzybh344ZoJA==
From: Philipp Stanner <phasta@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Huacai Chen <chenhuacai@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
 Yinggang Gu <guyinggang@loongson.cn>,
 Feiyang Chen <chenfeiyang@loongson.cn>,
 Philipp Stanner <pstanner@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Qing Zhang <zhangqing@loongson.cn>
Date: Wed, 26 Feb 2025 09:52:04 +0100
Message-ID: <20250226085208.97891-1-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Cc: Philipp Stanner <phasta@kernel.org>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH net-next v4 0/4] stmmac: Several PCI-related
	improvements
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

Changes in v4:
  - Add missing full stop. (Yanteng)
  - Move forgotten unused-variable-removes to the appropriate places.
  - Add applicable RB / TB tags

Changes in v3:
  - Several formatting nits (Paolo)
  - Split up patch into a patch series (Yanteng)

Philipp Stanner (4):
  stmmac: loongson: Pass correct arg to PCI function
  stmmac: loongson: Remove surplus loop
  stmmac: Remove pcim_* functions for driver detach
  stmmac: Replace deprecated PCI functions

 .../ethernet/stmicro/stmmac/dwmac-loongson.c  | 31 ++++++-------------
 .../net/ethernet/stmicro/stmmac/stmmac_pci.c  | 26 +++++-----------
 2 files changed, 16 insertions(+), 41 deletions(-)

-- 
2.48.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
