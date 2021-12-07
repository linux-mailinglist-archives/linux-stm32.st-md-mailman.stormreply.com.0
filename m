Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3D046BE11
	for <lists+linux-stm32@lfdr.de>; Tue,  7 Dec 2021 15:46:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A24B0C5F1E8;
	Tue,  7 Dec 2021 14:46:30 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3BDA3C57183
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Dec 2021 14:46:29 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BDF90B817BB;
 Tue,  7 Dec 2021 14:46:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5D30C341C8;
 Tue,  7 Dec 2021 14:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638888388;
 bh=/HDJF3gWZSfW6o+OZuu99jpPVn8cK4i2nf6FoOUbTxM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=EeusCp48Gk375XhLK6HOShNAaNpMwlDhUQp7iOCwJIgCPcXVI5mENIdcbolrKwDYk
 9fE79z0n9kC5vVZKp+zf+iDOwuNpvj1cktBeNQw+fyZxjDksmWKFDXI5N9rAr2NGpy
 za+5qz+/5ejxtvP3teSw4pDtMFH8xng4Q7eO0ziFXwHZtB9oYZMTCZq7fCMIeEyieo
 Wvf9W+UD06uCq12MtQXzr/M6XPJS7DY+DUBYZm2NiVlwW4xVou8VbJNXxWjMeoZvSd
 DzUp1G2/WTqd15GTDwK/vX/23ak+3UjdopLvGFYJ+Y/Tt4n3bA9E1hGMG2b+IZwFcE
 /WDS9J+blHjtw==
Date: Tue, 7 Dec 2021 06:46:27 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Biao Huang <biao.huang@mediatek.com>
Message-ID: <20211207064627.5623f3bf@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20211207064345.2c6427a1@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
References: <20211207015505.16746-1-biao.huang@mediatek.com>
 <20211207064345.2c6427a1@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
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

On Tue, 7 Dec 2021 06:43:45 -0800 Jakub Kicinski wrote:
> On Tue, 7 Dec 2021 09:54:58 +0800 Biao Huang wrote:
> > Changes in v5:
> > 1. remove useless inclusion in dwmac-mediatek.c as Angelo's comments.
> > 2. add acked-by in "net-next: stmmac: dwmac-mediatek: add support for
> >    mt8195" patch  
> 
> Which tree is this series based on? It doesn't seem to apply to
> net-next. Also the net-next in the subjects is misplaced. If the series
> is supposed to be merged to net-next the subject should be like:
> 
> [PATCH net-next v5 1/7] stmmac: dwmac-mediatek: add platform level clocks management
> 
> You can use --subject-prefix="PATCH net-next v6" in git-format-patch to
> add the prefix.

FWIW patch 6 is the one with the conflict: "arm64: dts: mt8195: add
ethernet device node"
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
