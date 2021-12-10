Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DADAA46F85F
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Dec 2021 02:20:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8C403C5F1EA;
	Fri, 10 Dec 2021 01:20:05 +0000 (UTC)
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6ADB3C5F1E7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Dec 2021 01:20:03 +0000 (UTC)
X-UUID: 9a336d24d0074c3b83b4b2734464980f-20211210
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=1ZZO+ETOhfDa+Z01cdd25TwcHTHZC47+w8uPmJpLwqs=; 
 b=iRRcQh+SEOFPdzh0m0f4Ik6IffPiuHF+IvOwARYMCtkrU79k0NSu4nXgoLxMATLkD86WvkiscbPvF0fnzF4YVk1BHk7wVgAQQV2ycESORFr5KBWvelnRlgUoEgJ9xp7P5Gj3mLpvMuXsU73YX0bMOlq0tA7yblUy/e04sgLJNgI=;
X-UUID: 9a336d24d0074c3b83b4b2734464980f-20211210
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw02.mediatek.com (envelope-from <biao.huang@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1755670767; Fri, 10 Dec 2021 09:19:56 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 10 Dec 2021 09:19:55 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 10 Dec 2021 09:19:54 +0800
Message-ID: <37f9979ef59c84525faaa66c40c094a72751c8cb.camel@mediatek.com>
From: Biao Huang <biao.huang@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Rob Herring
 <robh+dt@kernel.org>
Date: Fri, 10 Dec 2021 09:19:55 +0800
In-Reply-To: <2e8ccd43-bba0-9695-8d6d-d37e0b71fa7d@collabora.com>
References: <20211208054716.603-1-biao.huang@mediatek.com>
 <20211208054716.603-2-biao.huang@mediatek.com>
 <2e8ccd43-bba0-9695-8d6d-d37e0b71fa7d@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 netdev@vger.kernel.org, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-kernel@vger.kernel.org, dkirjanov@suse.de,
 Jose Abreu <joabreu@synopsys.com>, linux-mediatek@lists.infradead.org,
 macpaul.lin@mediatek.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v7 1/6] stmmac: dwmac-mediatek:
 add platform level clocks management
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

Dear Angelo,
	Thanks for your comments~
On Thu, 2021-12-09 at 11:51 +0100, AngeloGioacchino Del Regno wrote:
> Il 08/12/21 06:47, Biao Huang ha scritto:
> > This patch implements clks_config callback for dwmac-mediatek
> > platform,
> > which could support platform level clocks management.
> > 
> > Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> 
> Sorry, I've sent my ack on v6. Sending it on v7.
> 
> Acked-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
I'll add "acked-by" in next send.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
