Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 29CC01C4679
	for <lists+linux-stm32@lfdr.de>; Mon,  4 May 2020 20:57:44 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C8A7BC36B25;
	Mon,  4 May 2020 18:57:43 +0000 (UTC)
Received: from shards.monkeyblade.net (shards.monkeyblade.net [23.128.96.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E8F67C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 May 2020 18:57:41 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 2B69711F5F61A;
 Mon,  4 May 2020 11:57:39 -0700 (PDT)
Date: Mon, 04 May 2020 11:57:38 -0700 (PDT)
Message-Id: <20200504.115738.1197878174801820355.davem@davemloft.net>
To: colin.king@canonical.com
From: David Miller <davem@davemloft.net>
In-Reply-To: <20200501141016.290699-1-colin.king@canonical.com>
References: <20200501141016.290699-1-colin.king@canonical.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Mon, 04 May 2020 11:57:39 -0700 (PDT)
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 peppe.cavallaro@st.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: gmac5+: fix potential
 integer overflow on 32 bit multiply
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

From: Colin King <colin.king@canonical.com>
Date: Fri,  1 May 2020 15:10:16 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> The multiplication of cfg->ctr[1] by 1000000000 is performed using a
> 32 bit multiplication (since cfg->ctr[1] is a u32) and this can lead
> to a potential overflow. Fix this by making the constant a ULL to
> ensure a 64 bit multiply occurs.
> 
> Fixes: 504723af0d85 ("net: stmmac: Add basic EST support for GMAC5+")
> Addresses-Coverity: ("Unintentional integer overflow")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
