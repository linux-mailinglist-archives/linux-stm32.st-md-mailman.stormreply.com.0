Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B2BD6A11577
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Jan 2025 00:33:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D9B9AC78032;
	Tue, 14 Jan 2025 23:33:33 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 97C4FC6C83A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jan 2025 23:33:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 867AAA419D0;
 Tue, 14 Jan 2025 23:31:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76F86C4CEDD;
 Tue, 14 Jan 2025 23:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736897605;
 bh=X5Ab8rl/ZfcDU+B6erAbyO44V+L5S9IEQcTx/ySbb7Q=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XIX+PyfhSFtenIE7nWye1MzLtmVbzVNdXg471YrFy60Hm0OUi73bqq5vfORfr2I+j
 uUxm6GLPc4/zpChx0/5vqhjH5ZqCfVCr6dIQ8effQ43V0wEg4YSb1/0o6mLobInSzF
 Ul/Qi8Y/lr4Q9DCAicCwZaQPgE9EXcByk6CUw5Wb2WlY3nUQoxNUaCWaSMILeJknXE
 LgPeRHdq4zBhSqQ1TAL004oClxzOiOPczjEHhjA4jjggK2yDnele2dQ3Sx0ik0eiGF
 ysQ3QwUTfsS+nTmpjn6I6hqnHfiiv8bcr3pYr15pLSYqTgdBkGvgTcCoqdk4hUCQDw
 9WqcsEam7uBgg==
Date: Tue, 14 Jan 2025 15:33:23 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Joey Lu <a0987203069@gmail.com>
Message-ID: <20250114153323.527d4f63@kernel.org>
In-Reply-To: <20250113055434.3377508-4-a0987203069@gmail.com>
References: <20250113055434.3377508-1-a0987203069@gmail.com>
 <20250113055434.3377508-4-a0987203069@gmail.com>
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, ychuang3@nuvoton.com, edumazet@google.com,
 schung@nuvoton.com, yclu4@nuvoton.com,
 linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 openbmc@lists.ozlabs.org, joabreu@synopsys.com, pabeni@redhat.com,
 devicetree@vger.kernel.org, conor+dt@kernel.org, richardcochran@gmail.com,
 peppe.cavallaro@st.com, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch,
 mcoquelin.stm32@gmail.com, krzk+dt@kernel.org, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next v7 3/3] net: stmmac:
 dwmac-nuvoton: Add dwmac glue for Nuvoton MA35 family
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

On Mon, 13 Jan 2025 13:54:34 +0800 Joey Lu wrote:
> +	regmap_write(bsp_priv->regmap,
> +		     macid == 0 ? NVT_REG_SYS_GMAC0MISCR : NVT_REG_SYS_GMAC1MISCR, reg);

This is a pretty long line and you do it twice, so save the address 
to a temp variable, pls

> +MODULE_LICENSE("GPL v2");

checkpatch insists:

WARNING: Prefer "GPL" over "GPL v2" - see commit bf7fbeeae6db ("module: Cure the MODULE_LICENSE "GPL" vs. "GPL v2" bogosity") 
-- 
pw-bot: cr
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
