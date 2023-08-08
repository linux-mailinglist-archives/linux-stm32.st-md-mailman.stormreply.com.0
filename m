Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8FE7749A7
	for <lists+linux-stm32@lfdr.de>; Tue,  8 Aug 2023 21:59:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 00DDEC6B45C;
	Tue,  8 Aug 2023 19:59:19 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8405DC6907A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Aug 2023 19:59:17 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2B0D662BE6;
 Tue,  8 Aug 2023 19:59:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8D7FC433C8;
 Tue,  8 Aug 2023 19:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691524755;
 bh=vaL2GmK6E30etgPK/7amdzCna9Tu7rMpzE4Hc5iSZ1Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eP3OhvsFV740uKM4wAelsA49oWXmvK9xYJHKORXwcTkDrSeQp+Xdqc/mvhWuQMbZg
 pu3WzPRtCxrVoaon4argOZWH/7Gf3fPWD7R1e9/pGriWEboaYGN7O87Hoc1zt5Gp42
 AawQxcbbq9OdbOM/KhVTxNnezvS1Yvj4jDQG5pHdiukdD6ciNEfVwRLAz0TtC/Eh+L
 6aChhUkEzYBezywSBFJikE0og6LXAYWNCZm/4DOCxbbLK8ZblLQcJHp7FNYjIJb1EB
 Ijsei8Gve7vDojv3odcpuWgr1J7hDyOWCJranWmKVDFGKtyoh1f8SmhsAXFWptXGt1
 vxn8Hd0urihmA==
Date: Tue, 8 Aug 2023 21:59:10 +0200
From: Simon Horman <horms@kernel.org>
To: Furong Xu <0x1207@gmail.com>
Message-ID: <ZNKejh2ukx7Fwo66@vergenet.net>
References: <20230808021906.1120889-1-0x1207@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230808021906.1120889-1-0x1207@gmail.com>
Cc: linux-kernel@vger.kernel.org, Simon Horman <horms@kernel.org>,
 Joao Pinto <jpinto@synopsys.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 xfr@outlook.com, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, rock.xu@nio.com
Subject: Re: [Linux-stm32] [PATCH net-next v2 1/1] net: stmmac: xgmac: RX
 queue routing configuration
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

On Tue, Aug 08, 2023 at 10:19:06AM +0800, Furong Xu wrote:
> Commit abe80fdc6ee6 ("net: stmmac: RX queue routing configuration")
> introduced RX queue routing to DWMAC4 core.
> This patch extend the support to XGMAC2 core.
> 
> Signed-off-by: Furong Xu <0x1207@gmail.com>
> ---
> Changes in v2:
>   - Convert the shift ops to FIELD_PREP

Thanks!

FWIIW, I think if the code moved to using FIELD_PREP then
probably the _SHIFT defined can be cropped.

Reviewed-by: Simon Horman <horms@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
