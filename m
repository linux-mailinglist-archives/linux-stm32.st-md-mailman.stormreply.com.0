Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C1C8D4152
	for <lists+linux-stm32@lfdr.de>; Thu, 30 May 2024 00:23:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B75CBC6C855;
	Wed, 29 May 2024 22:23:20 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 17368C6B47E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 May 2024 22:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=uGvpQdBFGjqnF5UcddF90STvJk8sX0++vCBA18/qFiw=; b=nBaWoMTjeT2uOJX7wWCdsD6b5q
 0N9Yde366Xg60HoG8UEE0ULWGrtMNm1wVl+FW/I9m5fcT/tEHwLmQ4Kv5sH7g22QEfAw/J7B8ywp/
 MXjjsD5bqqNIkny4rfbSZfp6ymH+Q+C6jIOGcTc1hswAP2N8sVCye0AZL6aSxNXUABOk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1sCRh6-00GIUe-U8; Thu, 30 May 2024 00:22:52 +0200
Date: Thu, 30 May 2024 00:22:52 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Andrew Halaney <ahalaney@redhat.com>
Message-ID: <d8ad4e59-5725-4a7d-a2ad-ce5d92553525@lunn.ch>
References: <20240529-configure_ethernet_host_dma_width-v1-1-3f2707851adf@quicinc.com>
 <7w5bibuejmd5kg3ssozaql4urews26kpj57zvsaoq2pva3vrlo@agfxwq5i65pc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7w5bibuejmd5kg3ssozaql4urews26kpj57zvsaoq2pva3vrlo@agfxwq5i65pc>
Cc: linux-kernel@vger.kernel.org,
 Jochen Henneberg <jh@henneberg-systemdesign.com>,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Vinod Koul <vkoul@kernel.org>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Sagar Cheluvegowda <quic_scheluve@quicinc.com>,
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

On Wed, May 29, 2024 at 03:50:28PM -0500, Andrew Halaney wrote:
> $Subject should be have [PATCH net] since this targets the net tree:
> 
> https://docs.kernel.org/process/maintainer-netdev.html
> 
> On Wed, May 29, 2024 at 11:39:04AM GMT, Sagar Cheluvegowda wrote:
> > Fixes: 070246e4674b ("net: stmmac: Fix for mismatched host/device DMA address width")
> > Signed-off-by: Sagar Cheluvegowda <quic_scheluve@quicinc.com>

> Also, I think the Fixes: here would be for adding support for this SoC
> in the driver, not what's listed? Might make more sense after you have a
> proper body though.

This is a tricky one. 

Fixes: 070246e4674b ("net: stmmac: Fix for mismatched host/device DMA
address width") is when support for different DMA address widths was
added. This fix cannot easily be back ported past that.

070246e4674b first appears in v6.3-rc4.

dwmac-qcom-ethqos.c first appears in v5.1-rc1. However, Qualcomm did
not start hacking on it until v6.7-rc6. It is unclear to me without a
deep dive when Qualcomm actually started using this driver.

We might actually be looking at this the wrong way, and should in fact
be looking at when a DT patch was added that made use of the driver,
not the driver itself. If it was not used, it cannot be broken....

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
