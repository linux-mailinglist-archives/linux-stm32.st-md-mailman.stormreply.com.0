Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D19C646E072
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Dec 2021 02:51:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8FCB7C5F1EA;
	Thu,  9 Dec 2021 01:51:50 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4FDBBC5F1E7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Dec 2021 01:51:49 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id F2421CE2331;
 Thu,  9 Dec 2021 01:51:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75921C00446;
 Thu,  9 Dec 2021 01:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639014704;
 bh=5T0ucDpr39HCf8PypsCLt5HtRmXScmsEPR83rW4e950=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=RYzHYbDzTs3jYNk+W5eTmiXbOhiozCA41/Erv8HRyDqrnhFPKC9OEd4iZWnpYJUNO
 pS5lFHtiuHzaxlMwk/1CQfsb6etPcxjqmpqZWs1VXWXxSFncbYzNqaMAiTj+oyVo2k
 i/Ou7QVxMlbBC7bhxogc21fbJr/e8QJcuoS30iz/+wD0XbJwo9LL6EnGVtd2p0GEzj
 6hLKL27k+MshR0bsUZjU8orNwQ3rmfrqqw4DFSSBW+Ies3IKq4aIW5qBPf+kVKiGTW
 W2Jj5UjhNGScILNtxukzyKWA0mBs4OUvTPkNzYK+nTD5R8Sg8yaCnEJcGccy1ECuC9
 j+uHFjmarYwHA==
Date: Wed, 8 Dec 2021 17:51:42 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Biao Huang <biao.huang@mediatek.com>
Message-ID: <20211208175142.1b63afea@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <39aa23e1a48bc36a631b3074af2abfd5d1e2256d.camel@mediatek.com>
References: <20211208054716.603-1-biao.huang@mediatek.com>
 <20211208054716.603-6-biao.huang@mediatek.com>
 <20211208063820.264df62d@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <39aa23e1a48bc36a631b3074af2abfd5d1e2256d.camel@mediatek.com>
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

On Thu, 9 Dec 2021 09:48:25 +0800 Biao Huang wrote:
> Sorry for some typo in previous reply, fix it here.
> 
> All these warning lines share a similar semantics:
> delay_val |= FIELD_PREP(xxx, !!val);
> 
> and, should come from the expansion of FIELD_PREP in
> include/linux/bitfiled.h:
> 
>   FIELD _PREP --> __BF_FILED_CHECK --> "~((_mask) >> __bf_shf(_mask)) &
> (_val) : 0,"
> 
> ===============================================================
> __BF_FILED_CHECK {
> ...
>   BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?           \
>                    ~((_mask) >> __bf_shf(_mask)) & (_val) : 0, \
>                    _pfx "value too large for the field"); \ ...
> ===============================================================
> 
> Should I fix it by converting
>   delay_val |= FIELD_PREP(ETH_DLY_TXC_ENABLE, !!mac_delay->tx_delay);
> to
>   en_val = !!mac_delay->tx_delay;
>   delay_val |= FIELD_PREP(ETH_DLY_TXC_ENABLE, en_val);
> 
> or other suggestions for these warnings?

I see, thanks for explaining. The code is fine, we can simply ignore
this warning IMHO.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
