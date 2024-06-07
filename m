Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6415790022F
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Jun 2024 13:31:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0A4C6C7129F;
	Fri,  7 Jun 2024 11:31:27 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 00C28C69067
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Jun 2024 11:31:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 71268CE1C93;
 Fri,  7 Jun 2024 11:31:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DD8CC2BBFC;
 Fri,  7 Jun 2024 11:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717759876;
 bh=Nkzv4hcPPvps22qWpC47FSwYdykZx12iKlrS0Wd94wA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cQSQfIhVy92SkTaaGnvSgGOmaOrGPEO9ebOslY3tPDyGu2jF1GTJI9arb4XK29his
 0BLTfM2LZthM3JHTsdnQHQt0Z4GQiN7MUermB1jSdlNyTlO1ebFCHNF2nXBVU7sbDs
 N9dCpUgXtuB9ixdap7wO+KFbjkfX+Fe6eWjl+w1HdJ7rrbqG6mvqzpIHR+sxpLYEBy
 h7g2mVnP6NnWsT3CayAWQbJNEjj4VeA41bOhubBCrmLD+Op1b9G/fVnN4BqtzwWJmv
 zYcpo16xMyADhz6EMSN1zwreNy5aX1bROtpuyJXMk6eS6rivF7GgpBMYO/OFEV4fJP
 Bj9egWQZQQb8g==
Date: Fri, 7 Jun 2024 12:31:11 +0100
From: Simon Horman <horms@kernel.org>
To: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
Message-ID: <20240607113111.GA27689@kernel.org>
References: <20240605-configure_ethernet_host_dma_width-v2-1-4cc34edfa388@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240605-configure_ethernet_host_dma_width-v2-1-4cc34edfa388@quicinc.com>
Cc: Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org,
 Jochen Henneberg <jh@henneberg-systemdesign.com>,
 Eric Dumazet <edumazet@google.com>, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Vinod Koul <vkoul@kernel.org>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Andrew Halaney <ahalaney@redhat.com>
Subject: Re: [Linux-stm32] [PATCH net v2] net: stmmac: dwmac-qcom-ethqos:
 Configure host DMA width
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

On Wed, Jun 05, 2024 at 11:57:18AM -0700, Sagar Cheluvegowda wrote:
> Commit 070246e4674b ("net: stmmac: Fix for mismatched host/device DMA
> address width") added support in the stmmac driver for platform drivers
> to indicate the host DMA width, but left it up to authors of the
> specific platforms to indicate if their width differed from the addr64
> register read from the MAC itself.
> 
> Qualcomm's EMAC4 integration supports only up to 36 bit width (as
> opposed to the addr64 register indicating 40 bit width). Let's indicate
> that in the platform driver to avoid a scenario where the driver will
> allocate descriptors of size that is supported by the CPU which in our
> case is 36 bit, but as the addr64 register is still capable of 40 bits
> the device will use two descriptors as one address.
> 
> Fixes: 8c4d92e82d50 ("net: stmmac: dwmac-qcom-ethqos: add support for emac4 on sa8775p platforms")
> Signed-off-by: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
> ---
> Changes in v2:
> Fix commit message to include a commit body
> Replace the proper fixes tag
> Remove the change-Id
> - Link to v1: https://lore.kernel.org/r/20240529-configure_ethernet_host_dma_width-v1-1-3f2707851adf@quicinc.com

Thanks,

this change looks good to me - the usage of dma_addr_width is in line with
my understanding of how it is intended to be used.

And, AFAICS, the changes in v2 address the review of v1.

Reviewed-by: Simon Horman <horms@kernel.org>

...
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
