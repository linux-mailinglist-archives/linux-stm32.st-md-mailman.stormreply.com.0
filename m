Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8262A0BBA
	for <lists+linux-stm32@lfdr.de>; Fri, 30 Oct 2020 17:51:12 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 648D1C3FADC;
	Fri, 30 Oct 2020 16:51:12 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 98448C3087A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Oct 2020 16:51:10 +0000 (UTC)
Received: from kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net (unknown
 [163.114.132.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5E03D20725;
 Fri, 30 Oct 2020 16:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604076669;
 bh=2yuS3dPoBINhat1fzUGcPGhNP/ehJNmVIZDPEmcvgH8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=cSMRkTjLBABZ/BOpIqeJA8KfpzG2hpnc2UCNTYVdm2jUbO9IsNkpP3n++pCxCiDBt
 13NSg8ToSZnt5eEtxTzm0WGGagP0+Tziainba3JUxXEVhv1HcNBJwRHb0vGPGXzNdG
 a9tZKo7/lVxYbasbsSY+FoFWr8pz10wlFSh/Ij28=
Date: Fri, 30 Oct 2020 09:51:07 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Wong Vee Khee <vee.khee.wong@intel.com>
Message-ID: <20201030095107.3cc31f3b@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
In-Reply-To: <20201029093228.1741-1-vee.khee.wong@intel.com>
References: <20201029093228.1741-1-vee.khee.wong@intel.com>
MIME-Version: 1.0
Cc: Voon Wei Feng <weifeng.voon@intel.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, "David S .
 Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net 1/1] stmmac: intel: Fix kernel panic
	on pci probe
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

On Thu, 29 Oct 2020 17:32:28 +0800 Wong Vee Khee wrote:
> The commit "stmmac: intel: Adding ref clock 1us tic for LPI cntr"
> introduced a regression which leads to the kernel panic duing loading
> of the dwmac_intel module.
> 
> Move the code block after pci resources is obtained.
> 
> Fixes: b4c5f83ae3f3 ("stmmac: intel: Adding ref clock 1us tic for LPI cntr")
> Cc: Voon Weifeng <weifeng.voon@intel.com>
> Signed-off-by: Wong Vee Khee <vee.khee.wong@intel.com>

Applied, thanks!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
