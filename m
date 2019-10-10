Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F3BE9D341E
	for <lists+linux-stm32@lfdr.de>; Fri, 11 Oct 2019 01:01:22 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AC200C36B0C;
	Thu, 10 Oct 2019 23:01:22 +0000 (UTC)
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
 [209.85.160.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 61127C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Oct 2019 23:01:21 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id u22so11131017qtq.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Oct 2019 16:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=netronome-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :organization:mime-version:content-transfer-encoding;
 bh=hKb1hJiJoZr7sDzi9awmt+z6YG7rgK/yyFTSM1pIHvc=;
 b=rBl0cx6+eIElwhvMYT30TfWDTrbVzMZqR9vc1u08+8UkgRFWwsWJItiHPlbIz75bbO
 yjErSPaO+d+mOXOukCkpOiBJnqGmHKu50/Uyz9FW/epJCtKe8478nPgRPB6CcvAY1a1I
 Ceuu7vL7cH8gJEFTgdiOM8xNWMPqzJ4hpm14bppd6CQU3FROOOIgnoJhKh5GJ4rvJ7G7
 trLU5f3s1a3fEC2JtQtzqks393lZwdH9IdblrWwCQZ01vQ7JRdlrHsiigbRxkJSzRSvm
 +LnPGfJbwjrZh5kS1fHLpLjgKlFwoFNpuGaKfGkNdVIg8LEUr2UFHovhiakkDrFMacbh
 yd9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=hKb1hJiJoZr7sDzi9awmt+z6YG7rgK/yyFTSM1pIHvc=;
 b=oekoBWl1v/O7uFggS1EzPbFRzL4+3oz2DsJJfXo961KWi2GPppG9rBBB6WVU4GDaVz
 JmcF2xkal0v5Qj1UUK3oTYlquuy2gv5wpB1dbuJl+d+XAJTYCP6F4aopD8VVnHV5mEcf
 ThGIdSomUgJsWbblAUvow3c4gW7HTAt5sqHpUhfpu5X/RDmi9diD4S5DV3igQS/Ony06
 0gzyZ0gNDoKUH/ei1QTaW3qbSL9QuHWRVPPesLoyyMEKUQN7w5wRteMnTcCHuuxWUhqo
 b/ijm3osec5AypKRBdP6kbGDlLcMJ/3cDhZ6M26Z2bMeYcO1H8o6mKnVY/SLQar8PmhW
 fIbA==
X-Gm-Message-State: APjAAAWKMDgs6KBRanqPC3daJ9c33Hbd/eJJukN1PNwFPGpHyN5Oq6T5
 27yECvCIAPI6PFrN5sYSMsTJhQ==
X-Google-Smtp-Source: APXvYqzlvVcUTrNNKzaif/kXN8GZwkAMecaGfYJIaGrr9Y2IjFLnQDpHQHTA/hY/Sd8K4BincCEN3w==
X-Received: by 2002:a0c:f8cd:: with SMTP id h13mr12808457qvo.53.1570748480202; 
 Thu, 10 Oct 2019 16:01:20 -0700 (PDT)
Received: from cakuba.netronome.com ([66.60.152.14])
 by smtp.gmail.com with ESMTPSA id 64sm3058098qkk.63.2019.10.10.16.01.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2019 16:01:20 -0700 (PDT)
Date: Thu, 10 Oct 2019 16:01:03 -0700
From: Jakub Kicinski <jakub.kicinski@netronome.com>
To: Biao Huang <biao.huang@mediatek.com>
Message-ID: <20191010160103.63c3c0ed@cakuba.netronome.com>
In-Reply-To: <20191009085649.6736-1-biao.huang@mediatek.com>
References: <20191009085649.6736-1-biao.huang@mediatek.com>
Organization: Netronome Systems, Ltd.
MIME-Version: 1.0
Cc: andrew@lunn.ch, jianguo.zhang@mediatek.com, boon.leong.ong@intel.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, yt.shen@mediatek.com,
 Jose Abreu <joabreu@synopsys.com>, linux-mediatek@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: disable/enable ptp_ref_clk
 in suspend/resume flow
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

On Wed, 9 Oct 2019 16:56:49 +0800, Biao Huang wrote:
> disable ptp_ref_clk in suspend flow, and enable it in resume flow.
> 
> Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index c7c9e5f162e6..b592aeecc3dd 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -4469,6 +4469,8 @@ int stmmac_suspend(struct device *dev)
>  		stmmac_mac_set(priv, priv->ioaddr, false);
>  		pinctrl_pm_select_sleep_state(priv->device);
>  		/* Disable clock in case of PWM is off */
> +		if (priv->plat->clk_ptp_ref)
> +			clk_disable_unprepare(priv->plat->clk_ptp_ref);

I don't know much embedded, but it seems like this should perhaps just
be clk_disable() without the unprepare? stmmac_hw_teardown() is called
when driver is removed so it needs to unprepare as well.

Please feel free to explain to me why this needs to be
clk_disable_unprepare(), as I said - not an expert.

Also - if this is a bug fix and you'd like to have it backported to
older releases you need to add a Fixes tag.

Thanks!

>  		clk_disable(priv->plat->pclk);
>  		clk_disable(priv->plat->stmmac_clk);
>  	}
> @@ -4535,6 +4537,8 @@ int stmmac_resume(struct device *dev)
>  		/* enable the clk previously disabled */
>  		clk_enable(priv->plat->stmmac_clk);
>  		clk_enable(priv->plat->pclk);
> +		if (priv->plat->clk_ptp_ref)
> +			clk_prepare_enable(priv->plat->clk_ptp_ref);
>  		/* reset the phy so that it's ready */
>  		if (priv->mii)
>  			stmmac_mdio_reset(priv->mii);

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
