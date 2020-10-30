Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 701782A0BF3
	for <lists+linux-stm32@lfdr.de>; Fri, 30 Oct 2020 17:58:46 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3292CC3FADF;
	Fri, 30 Oct 2020 16:58:46 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C008BC3FADA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Oct 2020 16:58:43 +0000 (UTC)
Received: from kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net (unknown
 [163.114.132.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9088320756;
 Fri, 30 Oct 2020 16:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604077122;
 bh=NQHYM8GVLTc+Q27yNaiylvcsHI8eawqNkhk71989hxU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=xTLlkjIx4w09PWulJixzUroOxf9p9t7uJZJoFEYSFSwnio/kgEvB1ISxtBfQ1XhQO
 CRonLlZtssrPFgKEqQDY0FuLA2qFvQfABK9owZaFrp0BCvur10RUbShdg33TeWq6Jt
 2NvO1IKjbZJwiA1TSwxzMSnux5FGzrLMgp9HcKps=
Date: Fri, 30 Oct 2020 09:58:40 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <20201030095840.5e999a1b@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
In-Reply-To: <20201029185011.4749-1-m.szyprowski@samsung.com>
References: <CGME20201029185023eucas1p21872d74eeb62643a3ff364af7cf2c6eb@eucas1p2.samsung.com>
 <20201029185011.4749-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 netdev@vger.kernel.org, "David S . Miller" <davem@davemloft.net>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: Fix channel lock
	initialization
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

On Thu, 29 Oct 2020 19:50:11 +0100 Marek Szyprowski wrote:
> Commit 0366f7e06a6b ("net: stmmac: add ethtool support for get/set
> channels") refactored channel initialization, but during that operation,
> the spinlock initialization got lost. Fix this. This fixes the following
> lockdep warning:
 
> Fixes: 0366f7e06a6b ("net: stmmac: add ethtool support for get/set channels")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

Applied to net, thanks!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
