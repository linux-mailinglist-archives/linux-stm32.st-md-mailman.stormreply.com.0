Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B08095CF1A
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Aug 2024 16:12:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 86809C7129D;
	Fri, 23 Aug 2024 14:12:30 +0000 (UTC)
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0E4A9C71287
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Aug 2024 14:12:22 +0000 (UTC)
Delivered-To: kernel@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1724422312; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=CrToZ2LTI//Gtte2hJPQcZ5QDN3uDirJqmj6R94r4N99Rbo4pAcHJ6JNdarmMzkEBpZSaLOFNlq/oDGKAg5gN+qfHGE6GEM+YUFWn8xcca65Cf2glLacy4w6ntuR8tof5ZtEPftnF+E8nrsAQUdmGRdd+eP3plHpLgnxRUEk7I8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1724422312;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=lNp4RfIxi4nUXP7c0Aub3ROaeoojv7EDzsSfORBjjkE=; 
 b=kbuhsOTJ3xVK/tDGbTBlwkX0UY7Mpu8vkInysRClwom94FqXCu4HH10B1eLl66Zmfa5q3S3FD1evCvg+7Al53IfPtVT0FmikSPANKwRaMHDKdxBik8YMuPwYhwxEC66EgheFyBIeV7B7CcsIFEo/bEPGFCdQTf53XjmGnIxqDB8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
 dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1724422312; 
 s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com; 
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=lNp4RfIxi4nUXP7c0Aub3ROaeoojv7EDzsSfORBjjkE=;
 b=j16wgxcSJxUO1zGqi/UroUioB6/Ww52ql5liESPdnZOVqwk/aSTsYxSFeoCFmyXz
 uN0O/2Ecu09IUH3arc/q0HKIHzbK3g3bVe7mXFdhPF9TH4cpaFsp0+UJprejLqRdEBH
 oMXB7agPk6YwuXuePWrRV2JFeGJQWCfBWWnMVAbo=
Received: by mx.zohomail.com with SMTPS id 1724422310105193.1328447504353;
 Fri, 23 Aug 2024 07:11:50 -0700 (PDT)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Date: Fri, 23 Aug 2024 10:11:12 -0400
Message-ID: <20240823141318.51201-1-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-ZohoMailClient: External
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 kernel@collabora.com, Heiko Stuebner <heiko@sntech.de>,
 devicetree@vger.kernel.org, netdev@vger.kernel.org,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-rockchip@lists.infradead.org,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 David Wu <david.wu@rock-chips.com>, Jakub Kicinski <kuba@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 0/3] Add GMAC support for rk3576
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

Add the necessary constants and functions to support the GMAC devices on
the rk3576.

Changes since v2:
- Fix typos in RK3576_GMAC_CLK_SELET_*
- Also fix typo for RK3588_GMAC_CLK_SELET_*

Changes since v1:
- Add binding in net/snps,dwmac.yaml too

Detlev.

David Wu (1):
  ethernet: stmmac: dwmac-rk: Add GMAC support for RK3576

Detlev Casanova (2):
  ethernet: stmmac: dwmac-rk: Fix typo for RK3588 code
  dt-bindings: net: Add support for rk3576 dwmac

 .../bindings/net/rockchip-dwmac.yaml          |   2 +
 .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
 .../net/ethernet/stmicro/stmmac/dwmac-rk.c    | 164 +++++++++++++++++-
 3 files changed, 163 insertions(+), 4 deletions(-)

-- 
2.46.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
