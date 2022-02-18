Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 41BA34BB0CA
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Feb 2022 05:36:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E1CA4C5F1FA;
	Fri, 18 Feb 2022 04:36:09 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1A5B8C5F1F2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Feb 2022 04:36:08 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8DCC9B82402;
 Fri, 18 Feb 2022 04:36:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7555C340E9;
 Fri, 18 Feb 2022 04:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645158966;
 bh=+l51Or4meOwBjDYBCyGfvqc9xDIc92UbsEMYwevC4GU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=bhzOeCh+qbxrFrS19HvOwc/3b5/uRJOVdjviXbed4BOboHQCLykNMNnIm11/UEp4g
 JfsuFeZueOuuzgsZNacwAn/W1Gstm7Y76s3i1EL35oXAvOVDCN7YWGfzD9aGnwFOCF
 DG423bQqmu99o5m0uZAQ1ZSQ93J/O5Z6LAtamCBaDYHWlWfY6vb3vekbBtvY6/jzWM
 1F6AsTOW3+nKFc50Ca8WJ8Ev09pRSR0CBdLaqt71RXftx/snsyVLKDxcq5KBBumKPo
 nvtk6CjyGzGgNiQem+gpeVaXFSq/rXZMjM3xCiz6mizVn6rCUXwVJipEioOiGsm/o+
 A0TKo2ruBhcSg==
Date: Thu, 17 Feb 2022 20:36:04 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Vincent Whitchurch <vincent.whitchurch@axis.com>
Message-ID: <20220217203604.39e318d0@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20220217145527.2696444-1-vincent.whitchurch@axis.com>
References: <20220217145527.2696444-1-vincent.whitchurch@axis.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@st.com>, netdev@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>,
 kernel@axis.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Lars Persson <larper@axis.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David
 S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: Enable NAPI before
	interrupts go live
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

On Thu, 17 Feb 2022 15:55:26 +0100 Vincent Whitchurch wrote:
> From: Lars Persson <larper@axis.com>
> 
> The stmmac_open function has a race window between enabling the RX
> path and its interrupt to the point where napi_enabled is called.
> 
> A chatty network with plenty of broadcast/multicast traffic has the
> potential to completely fill the RX ring before the interrupt handler
> is installed. In this scenario the single interrupt taken will find
> napi disabled and the RX ring will not be processed. No further RX
> interrupt will be delivered because the ring is full.
> 
> The RX stall could eventually clear because the TX path will trigger a
> DMA interrupt once the tx_coal_frames threshold is reached and then
> NAPI becomes scheduled.

LGTM, although now the ndo_open and ndo_stop paths are not symmetrical.
Is there no way to mask the IRQs so that they don't fire immediately?
More common flow (IMO) would be:
 - request irq
 - mask irq
 - populate rings
 - start dma
 - enable napi
 - unmask irq
Other than the difference in flow between open/stop there may also be
some unpleasantness around restarting tx queues twice with the patch
as is.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
