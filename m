Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B7FFD95508C
	for <lists+linux-stm32@lfdr.de>; Fri, 16 Aug 2024 20:09:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 58CD8C7129D;
	Fri, 16 Aug 2024 18:09:42 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7C232C71290
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Aug 2024 18:09:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 0348FCE207A;
 Fri, 16 Aug 2024 18:09:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E2F8C4AF0E;
 Fri, 16 Aug 2024 18:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1723831771;
 bh=2pwdYzQ2ojaf94uUSc3VfR/126ez82e5gZxfj8e+7BA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=C4voLZmRQ5Wf7Hx+7sGeKAABNuyIbLbewF/VAV0+W+YSxA8X4e8A62Lo4Myd2tkCp
 qS4TMHCH0Bs0gG+Ra4ABe5l7fK8XozXgNK1T31AqzAJ3AYTCbD7LdXBS9SV1JvBI8o
 PWU+/tMTo2HqIV+CSEKqlm7w2NIDN+EBBRbFsG908yoOb1J4YosA7yRRM/pU+nYInN
 dFkUU4GFP4JRAO4NsgO68P8OEJgeaCd1L0ggEN+q0zYv7I8R8ygoWeiAth2rEA3hx7
 dM4yTPHqN9DD8IPgCT2iHNmU0jore++z0+JkyyXdQ47IWeq80GkFgAXMrb4MxB7SKS
 6WgQBHYw6atmg==
Date: Fri, 16 Aug 2024 11:09:28 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: ende.tan@starfivetech.com
Message-ID: <20240816110928.1a75d223@kernel.org>
In-Reply-To: <20240814092438.3129-1-ende.tan@starfivetech.com>
References: <20240814092438.3129-1-ende.tan@starfivetech.com>
MIME-Version: 1.0
Cc: andrew@lunn.ch, leyfoon.tan@starfivetech.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 edumazet@google.com, joabreu@synopsys.com, minda.chen@starfivetech.com,
 mcoquelin.stm32@gmail.com, pabeni@redhat.com, endeneer@gmail.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [net-next, v1,
 1/1] net: stmmac: Introduce set_rx_ic() for enabling RX
 interrupt-on-completion
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

On Wed, 14 Aug 2024 17:24:38 +0800 ende.tan@starfivetech.com wrote:
> From: Tan En De <ende.tan@starfivetech.com>
> 
> Currently, some set_rx_owner() callbacks set interrupt-on-completion bit
> in addition to OWN bit, without inserting a dma_wmb() barrier. This
> might cause missed interrupt if the DMA sees the OWN bit before the
> interrupt-on-completion bit is set.
> 
> Thus, let's introduce set_rx_ic() for enabling interrupt-on-completion,
> and call it before dma_wmb() and set_rx_owner() in the main driver,
> ensuring proper ordering and preventing missed interrupt.

Having multiple indirect function calls to write a single descriptor 
is really not great. Looks like it's always bit 31, can't this be coded
up as common handler which sets bit 31 in the appropriate word (word
offset specified per platform)?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
