Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CACCC38AE8
	for <lists+linux-stm32@lfdr.de>; Thu, 06 Nov 2025 02:18:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EFC0DC5F1E0;
	Thu,  6 Nov 2025 01:18:52 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1DDD2C57B68
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Nov 2025 01:18:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id BE759440FE;
 Thu,  6 Nov 2025 01:18:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BBBAC4CEF5;
 Thu,  6 Nov 2025 01:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762391929;
 bh=7t9OsvQMT3GaIT7WtbZ9AfqGl0859XgGoz1qrHm8cIw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fK+J64KVtoqMUiia8DqYAj3mLb2EbeTVQJDLNET7uSXx6xkJNbVlqhgBSgS/+esmH
 osqooD18fN/tusq3rzwdigzwNxx3K/MReAVBadPmPAXV0bUEviLLFat45a2GTiwG2u
 47nNca+FpVQG/RslwUlJneevwJGkiMhH1F8z2PXBQGw5nwGulQtJZ9dkhn9TIaapIj
 9QNVgkYqAivr2ymBGor2DjZFofAAG3LG0HtCQ5SfxGfNBd2glLNFnng/E/e4n6owDc
 mlmRLGn58XHMcAxX93bSc+rYeIM9oJd7IJxN0LLrwmraEYlnE2Gxh3AxwfnAI8qsZ2
 7QA5lyNghsK4g==
Date: Wed, 5 Nov 2025 17:18:48 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <20251105171848.550f625a@kernel.org>
In-Reply-To: <E1vGdXJ-0000000CloA-3yVc@rmk-PC.armlinux.org.uk>
References: <aQtQYlEY9crH0IKo@shell.armlinux.org.uk>
 <E1vGdXJ-0000000CloA-3yVc@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 09/11] net: stmmac: ingenic:
 simplify x2000 mac_set_mode()
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

On Wed, 05 Nov 2025 13:26:53 +0000 Russell King (Oracle) wrote:
> As per the previous commit, we have validated that the phy_intf_sel
> value is one that is permissible for this SoC, so there is no need to
> handle invalid PHY interface modes. We can also apply the other
> configuration based upon the phy_intf_sel value rather than the
> PHY interface mode.

clang sayeth:

drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c:128:13: warning: variable 'val' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
  128 |         } else if (phy_intf_sel == PHY_INTF_SEL_RGMII) {
      |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c:142:2: note: uninitialized use occurs here
  142 |         val |= FIELD_PREP(MACPHYC_PHY_INFT_MASK, phy_intf_sel);
      |         ^~~
drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c:128:9: note: remove the 'if' if its condition is always true
  128 |         } else if (phy_intf_sel == PHY_INTF_SEL_RGMII) {
      |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c:123:18: note: initialize the variable 'val' to silence this warning
  123 |         unsigned int val;
      |                         ^
      |                          = 0
-- 
pw-bot: cr
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
