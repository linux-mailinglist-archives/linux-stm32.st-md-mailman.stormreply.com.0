Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 173C544D73C
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Nov 2021 14:30:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D0382C5EC72;
	Thu, 11 Nov 2021 13:30:27 +0000 (UTC)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1A078C5EC70
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Nov 2021 13:30:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 2763C1F45C19
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1636637426; bh=Q3uCANzvE9+cRG6QMf3K+KvzdaN3OYug4xiZOrBZ+iM=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=rZzbQShwGj5gN7VirvGPcA6smFvOgJNJVxSZ/0tDPh9PcbO0sUcLPRcA7VYW4ImPS
 GhLtFxP2CKI2VHngQb15P/IdUO5b8lYSRD6m1vWcP7BI2axvDlU6Bu70t6OXMKGhR6
 7Ej4t7rl/haFWR2eEkl+oaO+836qD68UZNwafVYWKv4m3jpPTjEQe6mzpTPg9hs3sH
 sWb/3CorRa2b3Nako7IelthlBb+c632oUym8PYVP5MpuP+rAtIu+NBVz1aw3YzKcRq
 Pjz2+f4d3JzMSewpQvqJ0le+NkCaTlWURLnD0Of3JHjhH1pXrcc8eoEBI9xNiCobNs
 79pcEOuCWX4HA==
To: Biao Huang <biao.huang@mediatek.com>, davem@davemloft.net,
 Jakub Kicinski <kuba@kernel.org>, Rob Herring <robh+dt@kernel.org>
References: <20211111071214.21027-1-biao.huang@mediatek.com>
 <20211111071214.21027-5-biao.huang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <4214b222-6c43-3132-bcfe-07c43d29f5f9@collabora.com>
Date: Thu, 11 Nov 2021 14:30:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211111071214.21027-5-biao.huang@mediatek.com>
Content-Language: en-US
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 netdev@vger.kernel.org, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-kernel@vger.kernel.org, Jose Abreu <joabreu@synopsys.com>,
 linux-mediatek@lists.infradead.org, macpaul.lin@mediatek.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 4/5] dt-bindings: net: dwmac: Convert
 mediatek-dwmac to DT schema
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Il 11/11/21 08:12, Biao Huang ha scritto:
> Convert mediatek-dwmac to DT schema, and delete old mediatek-dwmac.txt.
> 
> Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> ---
>   .../bindings/net/mediatek-dwmac.txt           |  91 --------
>   .../bindings/net/mediatek-dwmac.yaml          | 211 ++++++++++++++++++
>   2 files changed, 211 insertions(+), 91 deletions(-)
>   delete mode 100644 Documentation/devicetree/bindings/net/mediatek-dwmac.txt
>   create mode 100644 Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
> 

Thanks for the DT schema conversion!

Anyway, you should split this in two commits: in the first one, you convert the
txt documentation to schema, as it is... and in the second one, you add mt8195
bindings.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
