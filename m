Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB9277976C
	for <lists+linux-stm32@lfdr.de>; Fri, 11 Aug 2023 21:00:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3703CC6B474;
	Fri, 11 Aug 2023 19:00:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 902BDC6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Aug 2023 19:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691780441; x=1723316441;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wtEhmMOeJDkVUYiG8gBXOCWEqswA0gnZypTeZtKMdYQ=;
 b=D6la6wZ0Js91usY4RG+kmLHIKY6SCvisSUxyZy0m/de9CUw7f90DwhTp
 6hEl33MiWf4MXOF5HkMH4QSqsUCA818LtJE41NDzG6x4TjRYzuqA8GD+z
 TG+8+A6nYx3oQ4NWrW7sNU6QKdici7e3MCunTPhFS6aBf5KZZrTq973xJ
 QaaU1VrnhVGkopcBy17/Ttj/qq7dwh98GYzJThVwbDw+hbbC5DzL7ZlR6
 QBoLDJflDkx3vF46dsCmDr92VeOniP8ZnHu5HaevRyRIjOEp+CBNBAVIV
 86IYfoUA9jd4lnXbp0ZPeZslAe1HZBWAyNWmOnIcyJIDEhAdGP0EybLE3 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="402718789"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; d="scan'208";a="402718789"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2023 12:00:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="802768017"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; d="scan'208";a="802768017"
Received: from pglc00052.png.intel.com ([10.221.207.72])
 by fmsmga004.fm.intel.com with ESMTP; 11 Aug 2023 12:00:35 -0700
From: Rohan G Thomas <rohan.g.thomas@intel.com>
To: "David S . Miller" <davem@davemloft.net>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Date: Sat, 12 Aug 2023 03:00:30 +0800
Message-Id: <20230811190032.13391-1-rohan.g.thomas@intel.com>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <20230810150328.19704-1-rohan.g.thomas@intel.com>
References: <20230810150328.19704-1-rohan.g.thomas@intel.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, Rohan G Thomas <rohan.g.thomas@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH net-next v2 0/2] Tx coe sw fallback for
	unsupported queues
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

Hi,
Some DWMAC IPs support tx coe only for a few initial tx queues,
starting from tx queue 0. This patchset adds support for tx coe sw
fallback for those queues that don't support tx coe. Also, add binding
for snps,tx-queues-with-coe property.

changelog v2:
* Reformed binding description.
* Minor grammatical corrections in comments and commit messages.

Rohan G Thomas (2):
  dt-bindings: net: snps,dwmac: Tx queues with coe
  net: stmmac: Tx coe sw fallback

 .../devicetree/bindings/net/snps,dwmac.yaml   |  3 +++
 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  2 ++
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 19 +++++++++++++++++++
 .../ethernet/stmicro/stmmac/stmmac_platform.c |  4 ++++
 include/linux/stmmac.h                        |  1 +
 5 files changed, 29 insertions(+)

-- 
2.19.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
