Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D1FDCAFD7C9
	for <lists+linux-stm32@lfdr.de>; Tue,  8 Jul 2025 22:02:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5FE9AC3F92F;
	Tue,  8 Jul 2025 20:02:27 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A28CEC3089F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Jul 2025 20:02:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 950BBA542F9;
 Tue,  8 Jul 2025 20:02:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07804C4CEED;
 Tue,  8 Jul 2025 20:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752004945;
 bh=CwVILos/EFGVl/HPlWBYtRO23IjPE9Xo1PtpRcBZodM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aOJePljD4+t0xDpG6/Nzl7obj7K68l/6m+/EBsX0vxIb+RhCGGQMv9edn+KtAeLJn
 KjqyXFgo59givxvTHyc3iSF1J8p8HIU9izQyZLr2DRR0WnmnWPPSHyI1zHnnvuuFXN
 qXKOPsy/qrQnozOjdp4bhfzhdUQQu4IGYN7QX4E8Mn58pnh2jbdD5l/QFgsRB3N1c8
 6B9F/yHKc+uDM29CB0mhnZxMqzT92Ez94eKpXOZ1TYUdhCH1Y/M2qPYm9qlqlW+aXX
 L1ZuXhYgQ4E012X/oKHsen6mqJdMf2VBE9n/iBvkVa3Jb9L/v0ABmqoseKW2XgTDSu
 Aw2nLGOuXAHNw==
Date: Tue, 8 Jul 2025 15:02:23 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Matthew Gerlach <matthew.gerlach@altera.com>
Message-ID: <175200494323.868123.7054361203778123218.robh@kernel.org>
References: <20250707154409.15527-1-matthew.gerlach@altera.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250707154409.15527-1-matthew.gerlach@altera.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, kuba@kernel.org,
 andrew+netdev@lunn.ch, linux-kernel@vger.kernel.org, davem@davemloft.net,
 dinguyen@kernel.org, edumazet@google.com, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, krzk+dt@kernel.org, pabeni@redhat.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: net: altr,
 socfpga-stmmac.yaml: add minItems to iommus
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


On Mon, 07 Jul 2025 08:44:09 -0700, Matthew Gerlach wrote:
> Add missing 'minItems: 1' to iommus property of the Altera SOCFPGA SoC
> implementation of the Synopsys DWMAC.
> 
> Fixes: 6d359cf464f4 ("dt-bindings: net: Convert socfpga-dwmac bindings to yaml")
> Signed-off-by: Matthew Gerlach <matthew.gerlach@altera.com>
> ---
>  Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
