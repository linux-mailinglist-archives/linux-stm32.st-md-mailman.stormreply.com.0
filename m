Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A4DFA8517B2
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Feb 2024 16:12:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 563A7C6C83D;
	Mon, 12 Feb 2024 15:12:21 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 42166C6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Feb 2024 15:12:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D7AB360B54;
 Mon, 12 Feb 2024 15:12:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7ABDC433C7;
 Mon, 12 Feb 2024 15:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707750738;
 bh=kkseZIm6ZlPIBsB/X53FwjKVu7CXE4Epox0B+g9MJeg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=bMTUa2QCLsbGNLWbUPbgaTt9otlhqe1tgjkWfCtjSgAvdn2wJNCrGyQsd5n9scCLw
 5Fz4N5jfe4zD520UhntjBsU5glOd4SG0eAnR77tgdKNaVuJiXXSc5daTKQV+qcXaS6
 iqKts6KvMuZhqG/VhNKOCdce5rZFzBq7j98L43f8TMfWKL5/C8Kom+3SJtj4RjqL4F
 78/+KFJg3kVxwdnAdlf/+FSYuI2vJYCvjGPwXUJZ6OmzNMdYxDIvwULQ2y+kdIKLH3
 f2q7MBT+mgjqnOh+uNFkUv+1nLo94sacS9jB4ynSJ6+s6M022SNsm0hn9tZsGMRBO9
 sJaq3VRN93+Yw==
Date: Mon, 12 Feb 2024 07:12:16 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Kurt Kanzenbach <kurt@linutronix.de>
Message-ID: <20240212071216.21e36c5c@kernel.org>
In-Reply-To: <87il2t98ri.fsf@kurt.kurt.home>
References: <20240208-stmmac_irq-v1-1-8bab236026d4@linutronix.de>
 <87il2t98ri.fsf@kurt.kurt.home>
MIME-Version: 1.0
Cc: Yannick Vignon <yannick.vignon@nxp.com>, netdev@vger.kernel.org,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: Simplify mtl IRQ
	status checking
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

On Mon, 12 Feb 2024 13:17:37 +0100 Kurt Kanzenbach wrote:
> On Thu Feb 08 2024, Kurt Kanzenbach wrote:
> > Commit 8a7cb245cf28 ("net: stmmac: Do not enable RX FIFO overflow
> > interrupts") disabled the RX FIFO overflow interrupts. However, it left the
> > status variable around, but never checks it.
> >
> > As stmmac_host_mtl_irq_status() returns only 0 now, the code can be
> > simplified.
> >
> > Signed-off-by: Kurt Kanzenbach <kurt@linutronix.de>  
> 
> why did this got marked as Changes Requested. What changes have to be
> made?

Sorry, restored!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
