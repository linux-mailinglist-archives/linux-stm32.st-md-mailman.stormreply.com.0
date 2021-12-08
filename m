Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6B146D5E4
	for <lists+linux-stm32@lfdr.de>; Wed,  8 Dec 2021 15:38:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0F5F9C5F1E8;
	Wed,  8 Dec 2021 14:38:28 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F32E2C5F1E1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Dec 2021 14:38:26 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 63F05CE2047;
 Wed,  8 Dec 2021 14:38:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B87CC00446;
 Wed,  8 Dec 2021 14:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638974302;
 bh=yXfh7LEnE2SBFeZnbDCRhoa2fYrDl431va9ASGoK3xc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ePG6a3u+RKIuDqJvkYwSIhSrvLzAwk4R95Pz004tE+MKwsjneRc5qYZ1ctrybVWOx
 8OvzKebSMPv5AfTSRecr9VYHmJ5hom8mKWPiK9FnmH7VfkC4ixVpbOGT5skIyoPUbQ
 6X/FaLA+Cj3RbknoaO8q1u8ejxdobhWnoj77nH8Z2V2cJmdT6K+LG0ZHWjiJDUakDu
 jDXyyJ1/5leDAVknYJWaR288T5WP0UUwWDa5HNTtHk7VyVQRNVdBZHgBBxOL/J+t8F
 j3oPmxrCA9IppRlr3Yrc5DOkm9tmQJvJY0GHT6+MYvjbAnyRUIzxrM798ub7keO9rN
 Jxz4n1SQ5XnZQ==
Date: Wed, 8 Dec 2021 06:38:20 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Biao Huang <biao.huang@mediatek.com>
Message-ID: <20211208063820.264df62d@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20211208054716.603-6-biao.huang@mediatek.com>
References: <20211208054716.603-1-biao.huang@mediatek.com>
 <20211208054716.603-6-biao.huang@mediatek.com>
MIME-Version: 1.0
Cc: Jose Abreu <joabreu@synopsys.com>, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-kernel@vger.kernel.org,
 dkirjanov@suse.de, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, macpaul.lin@mediatek.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Subject: Re: [Linux-stm32] [PATCH net-next v7 5/6] stmmac: dwmac-mediatek:
 add support for mt8195
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

On Wed, 8 Dec 2021 13:47:15 +0800 Biao Huang wrote:
> Add Ethernet support for MediaTek SoCs from the mt8195 family.
> 
> Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

sparse reports whole bunch of warnings like this:

drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c:213:30: warning: dubious: x & !y
drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c:217:30: warning: dubious: x & !y
drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c:228:38: warning: dubious: x & !y
drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c:232:38: warning: dubious: x & !y
drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c:247:46: warning: dubious: x & !y
drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c:255:46: warning: dubious: x & !y
drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c:273:30: warning: dubious: x & !y
drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c:277:30: warning: dubious: x & !y
drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c:375:30: warning: dubious: x & !y
drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c:379:30: warning: dubious: x & !y
drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c:390:43: warning: dubious: x & !y
drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c:397:43: warning: dubious: x & !y
drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c:415:46: warning: dubious: x & !y
drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c:426:46: warning: dubious: x & !y
drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c:439:35: warning: dubious: x & !y
drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c:443:30: warning: dubious: x & !y

Any idea on where these come from?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
