Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 118C4358E75
	for <lists+linux-stm32@lfdr.de>; Thu,  8 Apr 2021 22:32:29 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BD04AC5718B;
	Thu,  8 Apr 2021 20:32:28 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7A846C32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Apr 2021 20:32:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DF08B61107;
 Thu,  8 Apr 2021 20:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617913945;
 bh=r/TliBj87OK5d0dvwRvK54NmXGBgkuP3VxVDsB2j2hk=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=sg3WRQQNRPflMxOGauF0vRTsMko9CgHv9E51u6krunKojXXajdofsefHsQXXy9VQj
 sTTXxFqxpOuuGOELj2BGvPsXSgPfTukrNpaM91zye7kY52poFq+TZgr4kgMjBMFGCG
 zDic8qqWtSdjqWvaZV6pgyv8jVvJLNEBxwAoK1bX2Spv5lJHvz67LD3OKwVGKq1Qxr
 9Qd27k79Q0YQT+hZDSiivCP14sSthkIX3OoVGaq86gd6089kRah70L/Zx2jorqUxMx
 rLViG5gqKbB2kejFJjFD7D1peWyOC1Gq4MQjtDSSpHO1xEYWPSCbcs90HUbKthzovc
 j5Cg3SoCc5PMQ==
MIME-Version: 1.0
In-Reply-To: <20210408185731.135511-1-marex@denx.de>
References: <20210408185731.135511-1-marex@denx.de>
From: Stephen Boyd <sboyd@kernel.org>
To: Marek Vasut <marex@denx.de>, linux-arm-kernel@lists.infradead.org
Date: Thu, 08 Apr 2021 13:32:23 -0700
Message-ID: <161791394374.3790633.266453595355045932@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Cc: Marek Vasut <marex@denx.de>, linux-stm32@st-md-mailman.stormreply.com,
 linux-clk@vger.kernel.org, Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Christophe Roullier <christophe.roullier@foss.st.com>
Subject: Re: [Linux-stm32] [PATCH 0/7] ARM: dts: stm32: clk: Switch ETHRX
	clock parent from ETHCK_K to MCO2 on DHCOM SoM
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

Quoting Marek Vasut (2021-04-08 11:57:24)
> The implementation of ETH_RX_CLK/ETH_REF_CLK handling on STM32MP1 currently
> does not permit selecting the RX clock input from SoC pad, the RX clock are
> hard-wired to eth_clk_fb. This cover letter describes multiple unsuccessful
> attempts at solving this problem and a proposed partial solution.

Please use <sboyd@kernel.org> for clk patches, or run get_maintainer.pl
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
