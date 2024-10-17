Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A4CD49A2284
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Oct 2024 14:39:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 28688C78032;
	Thu, 17 Oct 2024 12:39:44 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 37347C6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Oct 2024 12:39:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 4B3CEA43E98;
 Thu, 17 Oct 2024 12:39:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 289DDC4CEC3;
 Thu, 17 Oct 2024 12:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729168776;
 bh=hSORhyt+r5npsU5xYPFuTfyRV44mxPLdfFMXv659EYs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vIh2Bk/65/4iHX3VqrTQxeEUOsCFVEADFVv3DpQ46Tpd4lXvW345wAks6Z94pbdrC
 0BCgSJgrTilpkLNXVy+aC5quvFBeIKMc5kly7xhmJOougC6B4vsP4KBITLDxvhCZDe
 IneHt2zwg4vpaRvwSiNjbjxTm1w96gMZmZwg+03npU7hRtODP+Hc6gnkvZ0RVgLFA1
 BXJHR4RlnMfaG0buh+v/mk9y72sLKs4vT139Umb9PIC9vNlJEf/zO2aAxuTBSvPgyh
 ndviIYzWCD6g565f1aZO+ygQhQpBTH5k4nLkRYq2ifLecID97AZ2XYObZlU9mOc0M3
 v15lLlb/Z3o+A==
Date: Thu, 17 Oct 2024 13:39:31 +0100
From: Simon Horman <horms@kernel.org>
To: Furong Xu <0x1207@gmail.com>
Message-ID: <20241017123931.GG1697@kernel.org>
References: <cover.1728980110.git.0x1207@gmail.com>
 <e4bfea2845a0f6fafb2e6db539292510b494372b.1728980110.git.0x1207@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e4bfea2845a0f6fafb2e6db539292510b494372b.1728980110.git.0x1207@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 xfr@outlook.com, Jakub Kicinski <kuba@kernel.org>,
 Vladimir Oltean <olteanv@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v1 1/5] net: stmmac: Introduce
 separate files for FPE implementation
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

On Tue, Oct 15, 2024 at 05:09:22PM +0800, Furong Xu wrote:
> By moving FPE related code info separate files, FPE implementation
> becomes a separate module initially.
> No functional change intended.
> 
> Signed-off-by: Furong Xu <0x1207@gmail.com>

Reviewed-by: Simon Horman <horms@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
