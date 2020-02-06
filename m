Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B54B0154507
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Feb 2020 14:36:04 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5DA5DC36B0B;
	Thu,  6 Feb 2020 13:36:04 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7FDACC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Feb 2020 13:36:02 +0000 (UTC)
Received: from localhost (unknown [122.178.198.215])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 330B22082E;
 Thu,  6 Feb 2020 13:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1580996161;
 bh=KQ1zNlhQGY64IHdB8I6m2LzafLRqPGfU8AX+YoBdzQg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kJBPHTJYzmbvrcRG634TwPmCRb2rG0lb2roFVEyErmRYAkCTzhIau1RYoal97rzba
 n/QItxXcTNTsnRDzk1f8fEi7JAAGN3moK1meFBhESojb+HexZiMJ2XjAiPd42H8pLi
 RmZzEcv7pEmtwCNcV4PfEZObyh/EXotjJCHKKoCk=
Date: Thu, 6 Feb 2020 19:05:54 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Dejin Zheng <zhengdejin5@gmail.com>
Message-ID: <20200206133554.GO2618@vkoul-mobl>
References: <20200206132147.22874-1-zhengdejin5@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200206132147.22874-1-zhengdejin5@gmail.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, peppe.cavallaro@st.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: fix a possible endless loop
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

On 06-02-20, 21:21, Dejin Zheng wrote:
> It forgot to reduce the value of the variable retry in a while loop
> in the ethqos_configure() function. It may cause an endless loop and
> without timeout.

Thanks for the fix.

Acked-by: Vinod Koul <vkoul@kernel.org>

We should add:
Fixes: a7c30e62d4b8 ("net: stmmac: Add driver for Qualcomm ethqos")

Also, I think this should be CCed stable

-- 
~Vinod
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
