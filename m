Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A4984076D
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Jan 2024 14:51:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 429F7C6A613;
	Mon, 29 Jan 2024 13:51:40 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 288EFC6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Jan 2024 13:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=Z98X2Dv/gFHdwMZq84R2/WmZ935wMrTZ5Sxl3bVWePg=; b=aO8TH4ySmVxbUrRdjSZ0f0FdgQ
 pEXvay/NZkuMzYUZavwBXpyGeUiJ5/N2MTudAeouPgZUWOcecoT3PbxsiF1vmLb5d4etqBCOMwKeD
 hCeyOQWs0cS8LW2Xmt1S/V3WH3mWmjOf10iZbDwgMiODZ81LqZIa8ZBvq9d85lnNgYVQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1rUS2o-006NrQ-EG; Mon, 29 Jan 2024 14:51:26 +0100
Date: Mon, 29 Jan 2024 14:51:26 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Clark Wang <xiaoning.wang@nxp.com>
Message-ID: <f11b9162-2b77-413b-8158-ee46c1602bd3@lunn.ch>
References: <20240126024433.2928223-1-xiaoning.wang@nxp.com>
 <20240126024433.2928223-2-xiaoning.wang@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240126024433.2928223-2-xiaoning.wang@nxp.com>
Cc: linux-kernel@vger.kernel.org, kernel@pengutronix.de, festevam@gmail.com,
 s.hauer@pengutronix.de, linux-stm32@st-md-mailman.stormreply.com,
 edumazet@google.com, joabreu@synopsys.com, linux-imx@nxp.com,
 mcoquelin.stm32@gmail.com, netdev@vger.kernel.org, kuba@kernel.org,
 pabeni@redhat.com, shawnguo@kernel.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: dwmac-imx: add clock input
 support in RMII mode
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

On Fri, Jan 26, 2024 at 10:44:33AM +0800, Clark Wang wrote:
> In RMII mode, the default setting is using the 50MHz reference clock
> from SoC. The ref_clk pin is output.
> If users want to use external or PHY to provide the 50MHz ref clock,
> it needs to config the GPR register.
> So, add the code to config GPR register to support the clock input.

Hi Clark

You have this threaded to the previous email. That previous email is a
fix, where are this is development of a new feature. So please don't
thread them. Please take a read of:

https://www.kernel.org/doc/html/latest/process/maintainer-netdev.html

You need different Subject lines to indicate which tree these patches
should be applied to.

> 
> Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
> Reviewed-by: Wei Fang <wei.fang@nxp.com>

Signed-of-by comes last.


    Andrew

---
pw-bot: cr
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
