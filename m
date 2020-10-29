Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4309329F007
	for <lists+linux-stm32@lfdr.de>; Thu, 29 Oct 2020 16:34:00 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A3DB5C3FAD5;
	Thu, 29 Oct 2020 15:33:59 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8630BC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Oct 2020 15:33:58 +0000 (UTC)
Received: from kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com (unknown
 [163.114.132.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0D82320731;
 Thu, 29 Oct 2020 15:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603985636;
 bh=B0ZPfDydtjlauMNDXnh+e1cHiw7UiIy4+A/TKExZ+1E=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=JNc7cRbl3F0Vs/AievSvJbgeMx8PB5aqaUAgxRSpSspKaooWsniTDfZ/0ux4V4KpW
 yi0JzUSB32dckJquFMcok3IhW3fuw03coQbPbuZweO6t4G3IJU6+YWeAdWiTSgP2wC
 fl2Hs8DdP8MQ+rJVJTj1m3vY/oISJUy4ofajMLqE=
Date: Thu, 29 Oct 2020 08:33:54 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <20201029083354.228d5465@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20201029065016.4781-1-m.szyprowski@samsung.com>
References: <CGME20201029065029eucas1p225422e700c29e2e84e227cb14ea6de52@eucas1p2.samsung.com>
 <20201029065016.4781-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Cc: linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
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

On Thu, 29 Oct 2020 07:50:16 +0100 Marek Szyprowski wrote:
> Commit 0366f7e06a6b ("net: stmmac: add ethtool support for get/set
> channels") refactored channel initialization, but during that operation,
> the spinlock initialization got lost. Fix this. This fixes the following
> lockdep warning:

You'll need to CC netdev.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
