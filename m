Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA9F9A2285
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Oct 2024 14:39:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 31CF7C78032;
	Thu, 17 Oct 2024 12:39:52 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 88D6EC6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Oct 2024 12:39:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id BA270A43E92;
 Thu, 17 Oct 2024 12:39:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52CD5C4CEC3;
 Thu, 17 Oct 2024 12:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729168790;
 bh=2VJFmZI6FSCX02zlaODuqhA9A2jIb8f/QC1MgWo2eBE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=K9FEO4bZ/YPMz6NPT/Yl0wq7D2Rhq5tNdcb98IC0SBo6SvifgKYsOFWzv62tyDR3m
 cGGaZKshEd1UbGO6KGcyg3IevhsFNtXZS5ixEFP0WTBQxCgnANCNPTXGeU43kmJRG6
 G0DVYKpm7i4X8/S8IW1pWG3woo+ZO9ct3ldfF63nQQK3EQsd8jWfLB0k0RJweG+sy7
 1J8oN3I5NyCgl+r6ztwtG9RqnddWQv2fyWPwuBhtsdsPRxNEGzrtKbWvKh1MFA5rnL
 FU3CqhmFXAeJkwlb6jpX0Pwk6oXGOcgVC8qJIehBAP0d5gPxy5rABTOfBbx3yUc4cb
 t+K71CnFJVa9Q==
Date: Thu, 17 Oct 2024 13:39:45 +0100
From: Simon Horman <horms@kernel.org>
To: Furong Xu <0x1207@gmail.com>
Message-ID: <20241017123945.GH1697@kernel.org>
References: <cover.1728980110.git.0x1207@gmail.com>
 <ec781b526edb2efec7fcfdf03043c7d1d9b707f0.1728980110.git.0x1207@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ec781b526edb2efec7fcfdf03043c7d1d9b707f0.1728980110.git.0x1207@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 xfr@outlook.com, Jakub Kicinski <kuba@kernel.org>,
 Vladimir Oltean <olteanv@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v1 2/5] net: stmmac: Introduce
 stmmac_fpe_ops for gmac4 and xgmac
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

On Tue, Oct 15, 2024 at 05:09:23PM +0800, Furong Xu wrote:
> By moving FPE function callbacks from stmmac_ops to stmmac_fpe_ops,
> FPE implementation becomes a separate module completely, like the
> EST implementation.
> 
> Signed-off-by: Furong Xu <0x1207@gmail.com>

Reviewed-by: Simon Horman <horms@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
