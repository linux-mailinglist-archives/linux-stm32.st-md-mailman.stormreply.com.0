Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D820BAE912C
	for <lists+linux-stm32@lfdr.de>; Thu, 26 Jun 2025 00:39:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CD5FEC30883;
	Wed, 25 Jun 2025 22:39:36 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0FFD5C3087A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Jun 2025 22:39:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 2824CA52CB8;
 Wed, 25 Jun 2025 22:39:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58653C4CEEA;
 Wed, 25 Jun 2025 22:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750891174;
 bh=GcuNJbTYdXYziN1YijGv29rtLzd+WmmzNrw+qRJrnng=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=TwrYSOnLz0kbxjQHL1jipsW+C8ZqtaxWWos0jTM4FqG5a/w6Hl6q4ot2W7fQN8+ZV
 hbXJd64nBJxA/NdDa/ti7ABo4pZEzL5uF1f8i9qiHb1UvB0Im/jjpV5BTbr0Xn1wg2
 YQQhT19yiVYqUe696FQT2MB9cW9Fo97IBmu5nkx6kyikCMazXups6s7SL+iMvAGgAy
 POwfLjZuAqEEAcsWDXK1v96Ywz+cUxra82OuzDP/8Tnw8toATwVBVCtx2apBEX+7y2
 mg1n32yAUjd3KpvwrsplLZZk8UQ1YwJ8BW6IdNxnfbi9ttRDQjQNFrV1xvvshT/2X3
 sJSvhOZDNu4Qw==
Date: Wed, 25 Jun 2025 15:39:33 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: EricChan <chenchuangyu@xiaomi.com>
Message-ID: <20250625153933.7757fde3@kernel.org>
In-Reply-To: <20250625025134.97056-1-chenchuangyu@xiaomi.com>
References: <20250625025134.97056-1-chenchuangyu@xiaomi.com>
MIME-Version: 1.0
Cc: Feiyang Chen <chenfeiyang@loongson.cn>, Yanteng Si <si.yanteng@linux.dev>,
 xiaojianfeng <xiaojianfeng1@xiaomi.com>, netdev@vger.kernel.org,
 Yinggang Gu <guyinggang@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
 Serge Semin <fancer.lancer@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, xiongliang <xiongliang@xiaomi.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: Fix interrupt handling for
 level-triggered mode in DWC_XGMAC2
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

On Wed, 25 Jun 2025 10:51:34 +0800 EricChan wrote:
> According to the Synopsys Controller IP XGMAC-10G Ethernet MAC Databook
> v3.30a (section 2.7.2), when the INTM bit in the DMA_Mode register is set
> to 2, the sbd_perch_tx_intr_o[] and sbd_perch_rx_intr_o[] signals operate
> in level-triggered mode. However, in this configuration, the DMA does not
> assert the XGMAC_NIS status bit for Rx or Tx interrupt events.
> 
> This creates a functional regression where the condition
> if (likely(intr_status & XGMAC_NIS)) in dwxgmac2_dma_interrupt() will
> never evaluate to true, preventing proper interrupt handling for
> level-triggered mode. The hardware specification explicitly states that
> "The DMA does not assert the NIS status bit for the Rx or Tx interrupt
> events" (Synopsys DWC_XGMAC2 Databook v3.30a, sec. 2.7.2).
> 
> The fix ensures correct handling of both edge and level-triggered
> interrupts while maintaining backward compatibility with existing
> configurations.

Could you please add a Fixes tag pointing to the commit in which 
the problem was introduced?

If the device you're working with is publicly available it may
also be worth mentioning what it is in the commit message.
Or at least mentioning whether you tested this on real HW,
or in simulation, or not at all.
-- 
pw-bot: cr
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
