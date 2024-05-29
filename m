Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A8EF8D3F55
	for <lists+linux-stm32@lfdr.de>; Wed, 29 May 2024 22:04:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0C7AFC6C855;
	Wed, 29 May 2024 20:04:32 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4BB5AC6B47E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 May 2024 20:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=ji6jBdkqbxFp+OuQ43Vad4Fu8h64VsKVi9xqFhSvyYA=; b=dJioNcsQZXAchoX1u3Z0RRXz24
 IKDZp77Z4YGT1uctbu0exqw7hEpgGMUo2U4LksS6p6KiAbUwQbB3eHeJMEVWxTzdPlDZkt+Ib425y
 Jo2FDh9wzn8zWREigGcEoimGBekkEenTVCuFCOZXOY7cIyU7PTC/C82WHNEQq+Bfavpk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1sCPWj-00GI0X-GX; Wed, 29 May 2024 22:04:01 +0200
Date: Wed, 29 May 2024 22:04:01 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
Message-ID: <5044135d-5a99-4ea3-add5-08954f7a7809@lunn.ch>
References: <20240529-configure_ethernet_host_dma_width-v1-1-3f2707851adf@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240529-configure_ethernet_host_dma_width-v1-1-3f2707851adf@quicinc.com>
Cc: linux-kernel@vger.kernel.org,
 Jochen Henneberg <jh@henneberg-systemdesign.com>,
 Eric Dumazet <edumazet@google.com>, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Vinod Koul <vkoul@kernel.org>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: dwmac-qcom-ethqos: Configure
	host DMA width
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

On Wed, May 29, 2024 at 11:39:04AM -0700, Sagar Cheluvegowda wrote:
> Fixes: 070246e4674b ("net: stmmac: Fix for mismatched host/device DMA address width")
> Signed-off-by: Sagar Cheluvegowda <quic_scheluve@quicinc.com>

You need some sort of description in the commit message. How would i
know i hit this bug? What do i see as a user? You want to give a hint
to people looking at patches to know if they need this fix or
not. Also, you need to make it clear why this patch meets the stable
rules.

> ---
> Change-Id: Ifdf3490c6f0dd55afc062974c05acce42d5fb6a7

And what does this mean, in the context of mainline?

    Andrew

---
pw-bot: cr
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
