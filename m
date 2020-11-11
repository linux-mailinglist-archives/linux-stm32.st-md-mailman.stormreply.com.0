Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CC4EF2AFB9D
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Nov 2020 00:15:48 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8DE33C3FAE2;
	Wed, 11 Nov 2020 23:15:48 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DF606C36B36
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Nov 2020 23:15:45 +0000 (UTC)
Received: from kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com (unknown
 [163.114.132.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EF5B720797;
 Wed, 11 Nov 2020 23:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605136544;
 bh=BsryHKz3dVxK2sBEfXD2LfC5W276gDYqCQDz8imsdS0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=bZOBzJf7ulaTmNfU8C4zP9exUVyaxz1AzeaDx7ywfgMz8C0uigyiwwMLY23x1hme0
 +sDAq6cLhG00Msc1SSLgguG6y5ZbNluc1o3aKotR7yEAVx4LDxh4e0jR8YuTC+58+S
 ID4KS6X1Rea3PE8uKEF6V3AbK8P9diX8nNZrgTE8=
Date: Wed, 11 Nov 2020 15:15:42 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
Message-ID: <20201111151542.4b9addde@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20201109160440.3a736ee3@xhacker.debian>
References: <20201109160440.3a736ee3@xhacker.debian>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, "David S.
 Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: dwc-qos: Change the
 dwc_eth_dwmac_data's .probe prototype
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

On Mon, 9 Nov 2020 16:05:14 +0800 Jisheng Zhang wrote:
> The return pointer of dwc_eth_dwmac_data's .probe isn't used, and
> "probe" usually return int, so change the prototype to follow standard
> way. Secondly, it can simplify the tegra_eqos_probe() code.
> 
> Signed-off-by: Jisheng Zhang <Jisheng.Zhang@synaptics.com>

Applied, thanks!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
