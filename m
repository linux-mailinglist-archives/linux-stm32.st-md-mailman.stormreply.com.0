Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6606846C9D8
	for <lists+linux-stm32@lfdr.de>; Wed,  8 Dec 2021 02:20:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0F5E0C5F1E8;
	Wed,  8 Dec 2021 01:20:52 +0000 (UTC)
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 020A3C57183
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Dec 2021 01:20:49 +0000 (UTC)
X-UUID: 7fbad56d52224e3d8cb0af2aa1b7785d-20211208
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=8MEfUWmmn3GyKsBzKhZSTZEmNpkk6avA7qVgY8BtriE=; 
 b=bufZfLL/YW1OXhgCj+OVYknySZMrucfJ73JZdVMLJuvr6GbYOsYUVD2bzTLq9ypD4jcBb7QeISOFvLzW0Bpc+5mmfh2Jxu9+SlyxaOJAOkfY+OeQFGv4azNGjfs6ej4QwmdioYCQmiWUsLGAqO1zijOm1Fd5APfQWPlEP9EaaEg=;
X-UUID: 7fbad56d52224e3d8cb0af2aa1b7785d-20211208
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
 (envelope-from <biao.huang@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 465109991; Wed, 08 Dec 2021 09:20:45 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Wed, 8 Dec 2021 09:20:44 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 8 Dec 2021 09:20:43 +0800
Message-ID: <25e2a50392beeb3e7c7428f53fac617a5a5b30f9.camel@mediatek.com>
From: Biao Huang <biao.huang@mediatek.com>
To: Jakub Kicinski <kuba@kernel.org>
Date: Wed, 8 Dec 2021 09:20:38 +0800
In-Reply-To: <20211207064627.5623f3bf@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
References: <20211207015505.16746-1-biao.huang@mediatek.com>
 <20211207064345.2c6427a1@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <20211207064627.5623f3bf@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
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
Subject: Re: [Linux-stm32] [PATCH v5 0/7] MediaTek Ethernet Patches on MT8195
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

Dear Jakub,
	Thanks for your comments~
On Tue, 2021-12-07 at 06:46 -0800, Jakub Kicinski wrote:
> On Tue, 7 Dec 2021 06:43:45 -0800 Jakub Kicinski wrote:
> > On Tue, 7 Dec 2021 09:54:58 +0800 Biao Huang wrote:
> > > Changes in v5:
> > > 1. remove useless inclusion in dwmac-mediatek.c as Angelo's
> > > comments.
> > > 2. add acked-by in "net-next: stmmac: dwmac-mediatek: add support
> > > for
> > >    mt8195" patch  
> > 
> > Which tree is this series based on? It doesn't seem to apply to
> > net-next. Also the net-next in the subjects is misplaced. If the
> > series
> > is supposed to be merged to net-next the subject should be like:
> > 
> > [PATCH net-next v5 1/7] stmmac: dwmac-mediatek: add platform level
> > clocks management
> > 
> > You can use --subject-prefix="PATCH net-next v6" in git-format-
> > patch to
> > add the prefix.
> 
> FWIW patch 6 is the one with the conflict: "arm64: dts: mt8195: add
> ethernet device node"
I'll rebase to the latest net-next tree, and fix these issues in next
send
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
