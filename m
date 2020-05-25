Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B92741E1022
	for <lists+linux-stm32@lfdr.de>; Mon, 25 May 2020 16:11:01 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7043FC36B24;
	Mon, 25 May 2020 14:11:01 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 330B1C36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 May 2020 14:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=I0JcXOa65pxt0xeOn7XZQNU2idxhZWDbbjFj+EaaSWo=; b=XIC82vWt8QdxYgP2GkmVIy9T3l
 veUjidrRo4BVKiloackNjz5i742888MBHPsFodv7WcoggCkk5k1IYqD4yRz4hS6/3ANYgLCepIpUD
 V2Qo1sDTJ7rq7vCI/bvLRvYvkkwI7BbRKpXjTFTXTdn4P9BIKpUPpDfHt9F7GsbN/4G4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.93)
 (envelope-from <andrew@lunn.ch>)
 id 1jdDoW-003C8t-15; Mon, 25 May 2020 16:10:48 +0200
Date: Mon, 25 May 2020 16:10:48 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Fugang Duan <fugang.duan@nxp.com>
Message-ID: <20200525141048.GF752669@lunn.ch>
References: <1590394945-5571-1-git-send-email-fugang.duan@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1590394945-5571-1-git-send-email-fugang.duan@nxp.com>
Cc: p.zabel@pengutronix.de, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, peppe.cavallaro@st.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] stmmac: platform: add "snps,
 dwmac-5.10a" IP compatible string
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

On Mon, May 25, 2020 at 04:22:25PM +0800, Fugang Duan wrote:
> Add "snps,dwmac-5.10a" compatible string for 5.10a version that can
> avoid to define some plat data in glue layer.

Documentation/devicetree/bindings/net/snps,dwmac.yaml ?

      Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
