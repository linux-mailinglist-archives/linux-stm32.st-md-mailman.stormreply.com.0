Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CCFC294C32F
	for <lists+linux-stm32@lfdr.de>; Thu,  8 Aug 2024 19:00:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 76C93C7801D;
	Thu,  8 Aug 2024 17:00:33 +0000 (UTC)
Received: from sender4-op-o14.zoho.com (sender4-op-o14.zoho.com
 [136.143.188.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B0933C78002
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Aug 2024 17:00:25 +0000 (UTC)
Delivered-To: kernel@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1723136400; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=iufzSaCy1styaAcA1ACND9zvtAK5h50zw+7d/AHF1uHdSCZQh8419xBPItU0tFxPsWuGYGA8154598/0uXsGBVvo/nBp+wAF3EQUcUhArz94Vnj0ehA7Zv5EoZrE+74Twkhsc8rHS7owT8tSbYPE+FmG9hAAGir+qXcZ0mOvK0k=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1723136400;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=nrb729petfY91nzUq0Q3CuuVyGhgg3PoYngbWZak+YA=; 
 b=oC5ki124tlmSTkczfqJDK0kfBeQ/ZpiYha40PYgfxXguZZpRteU3vUazp5ehtdKx0NkkzTaFJ+VrAEDpsqVjUuvuYRsAF+un+3BCwd1qcVaRqIYE0jxZmOJiinXWTZZ3MvcdhTT/dL4eUB5Y4z2YdM29ryI5hLqHokUIEoW5iMM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
 dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1723136400; 
 s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com; 
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=nrb729petfY91nzUq0Q3CuuVyGhgg3PoYngbWZak+YA=;
 b=TGazH7mrbZN/WSe2rKBwGJxBtwoy5NfjHrohQ/WRP0ibmbtLkBtaOLgKZx340r2F
 JTftASJFEMHwKLhJoc+j7ENSzlfIYl8pSju3gZLCuahwQnHYx59vvnv3TW9/3LgKdqW
 KxQrG+kabjyKqtK2wwWoPEB/vEaEkiLcW4UDizUQ=
Received: by mx.zohomail.com with SMTPS id 1723136398929189.99879437516017;
 Thu, 8 Aug 2024 09:59:58 -0700 (PDT)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Date: Thu,  8 Aug 2024 13:00:16 -0400
Message-ID: <20240808170113.82775-1-detlev.casanova@collabora.com>
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
Subject: [Linux-stm32] [PATCH v2 0/2] Add GMAC support for rk3576
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

Changes since v1:
- Add binding in net/snps,dwmac.yaml too

David Wu (1):
  ethernet: stmmac: dwmac-rk: Add GMAC support for RK3576

Detlev Casanova (1):
  dt-bindings: net: Add support for rk3576 dwmac

 .../bindings/net/rockchip-dwmac.yaml          |   2 +
 .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
 .../net/ethernet/stmicro/stmmac/dwmac-rk.c    | 156 ++++++++++++++++++
 3 files changed, 159 insertions(+)

-- 
2.46.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
