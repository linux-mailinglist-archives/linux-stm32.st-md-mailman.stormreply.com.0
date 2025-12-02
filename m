Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 951A7C9CA8E
	for <lists+linux-stm32@lfdr.de>; Tue, 02 Dec 2025 19:36:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5E152C58D7A;
	Tue,  2 Dec 2025 18:36:18 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 92809C35E2E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Dec 2025 18:36:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 56F6C4430A;
 Tue,  2 Dec 2025 18:36:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A84B6C4CEF1;
 Tue,  2 Dec 2025 18:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764700576;
 bh=yQgqsiygSaMJpkmvOUK9aemziX5h+9PzpA/FfdGF87g=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=vBhdLZyUIJxX3qFGn+1p1zfpDXi4JrkXnRLoyId49gMS1/SXmjPkJ4Nnf57igtPaH
 I/olXQCHfoPjw5pbnNrA0Fond5qVj9DcisoZwGzX7EsvBR8Vh5gGq6Ho2AC9equBid
 LhdQXl6tKAGIM5bORYZl57dWUqhhXKRymnNSD7T7yvnMdJmX+LhWzAeq5UAeoJJpd9
 hpN7EA8ftOaRejC1KTKy4Dh9ICoj3AbTlIeReLheXhBiS6ZDoRaRPJwkVft/SvrfjX
 xQBeel4PJQezO/vuZcR276e3+jk/bKwCT8NMXWTVDTCOHRAKiQsExMuXbpjY/M2+XX
 Hn+rvqc6JI4pQ==
Date: Tue, 2 Dec 2025 10:36:14 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: 2694439648@qq.com
Message-ID: <20251202103614.6a185bf6@kernel.org>
In-Reply-To: <tencent_4A0CBC92B9B22C699AC2890E139565FCB306@qq.com>
References: <tencent_4A0CBC92B9B22C699AC2890E139565FCB306@qq.com>
MIME-Version: 1.0
Cc: hailong.fan@siengine.com, inux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 andrew+netdev@lunn.ch, edumazet@google.com, mcoquelin.stm32@gmail.com,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] net: stmmac: Modify the judgment
 condition of "tx_avail" from 1 to 2
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

On Tue,  2 Dec 2025 15:43:59 +0800 2694439648@qq.com wrote:
> -	if (unlikely(stmmac_tx_avail(priv, queue) <= (MAX_SKB_FRAGS + 1))) {
> +	if (unlikely(stmmac_tx_avail(priv, queue) <= (MAX_SKB_FRAGS + 2))) {

Also, if there isn't a comment already somewhere - it's worth
documenting what the + 2 stands for. head buffer + vlan + frags ?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
