Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E418D61069C
	for <lists+linux-stm32@lfdr.de>; Fri, 28 Oct 2022 02:01:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8936FC04003;
	Fri, 28 Oct 2022 00:01:01 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D3309C03FCB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Oct 2022 00:01:00 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 103B7B8276B;
 Fri, 28 Oct 2022 00:01:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A05FDC433D6;
 Fri, 28 Oct 2022 00:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666915258;
 bh=Icxwdoywzee+I/TtVUn2rIb3m972dkwkQUEpTb0YOso=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=mTK4hKEIwJhmnZCQxmchEvd7ETRFXXZUfSC9qfU9x6wttL/rqXK7hEVRWY8XVABqO
 opd7dRath+dtHRwsQUPui4e2SfWCb2zxUsCRtw+BZtmM9YNs7JxKNREF5r9rR+yKam
 KQX72VEPFXgAOfvldRg782n8lsXd4e6qbPkEvkYoP1e8bXYVHVe7PDZsDxdLr8xcTm
 nLmWk6Awmyni4EZQczkhmpHN3oxchaqLfc02oWNTtUrZIqPiRCIL58U2RWP27au3df
 nHOwLafyh6suLfKTXm+W4tiooKl0TahELEW2MjcwS+sTvHYkxINxvKmYSl8b2tXpoC
 uuk23GjSLbBHQ==
MIME-Version: 1.0
In-Reply-To: <20221023164607.556118-1-marex@denx.de>
References: <20221023164607.556118-1-marex@denx.de>
From: Stephen Boyd <sboyd@kernel.org>
To: Marek Vasut <marex@denx.de>, linux-clk@vger.kernel.org
Date: Thu, 27 Oct 2022 17:00:56 -0700
User-Agent: alot/0.10
Message-Id: <20221028000058.A05FDC433D6@smtp.kernel.org>
Cc: Marek Vasut <marex@denx.de>, kernel test robot <lkp@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Johann Neuhauser <jneuhauser@dh-electronics.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: Re: [Linux-stm32] [PATCH] clk: stm32mp1: Staticize ethrx_src
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

Quoting Marek Vasut (2022-10-23 09:46:07)
> Make ethrx_src array static, this is local to clk-stm32mp1.c
> 
> Fixes: e9ed1ef18a37a ("clk: stm32mp1: Add parent_data to ETHRX clock")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---

Applied to clk-next
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
