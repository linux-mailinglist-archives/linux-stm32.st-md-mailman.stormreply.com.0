Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA932C4838
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Nov 2020 20:26:33 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 88D39C5662F;
	Wed, 25 Nov 2020 19:26:33 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 010B9C36B36
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Nov 2020 19:26:30 +0000 (UTC)
Received: from kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com (unknown
 [163.114.132.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9EA07206D9;
 Wed, 25 Nov 2020 19:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606332389;
 bh=y5G7G9tqQU0nNNYbyoVzJ6yqFdXX1xV0mpcHxeV68Ac=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=qnwv5kbxfR1G+CdcN52GwSplgjaPdm0fTc0l/8FM7uScdg4VvXnX4IWjOwV62BfVq
 NmbOGw0+P4rP+f+KtS7LX7YaJ5ikwX06YLbUF/9KTpjdhs4WftBY0yOJbXRHF4KVCY
 uw3BxXCNOSLzcEzAkzGMYELJkR7cypSjjVLbWGTM=
Date: Wed, 25 Nov 2020 11:26:27 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Antonio Borneo <antonio.borneo@st.com>
Message-ID: <20201125112627.113c3c0b@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20201124223729.886992-1-antonio.borneo@st.com>
References: <42960ede-9355-1277-9a6f-4eac3c22365c@pengutronix.de>
 <20201124223729.886992-1-antonio.borneo@st.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: fix incorrect merge of patch
	upstream
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

On Tue, 24 Nov 2020 23:37:29 +0100 Antonio Borneo wrote:
> Commit 757926247836 ("net: stmmac: add flexible PPS to dwmac
> 4.10a") was intended to modify the struct dwmac410_ops, but it got
> somehow badly merged and modified the struct dwmac4_ops.
> 
> Revert the modification in struct dwmac4_ops and re-apply it
> properly in struct dwmac410_ops.
> 
> Fixes: 757926247836 ("net: stmmac: add flexible PPS to dwmac 4.10a")
> Cc: stable@vger.kernel.org # v5.6+
> Signed-off-by: Antonio Borneo <antonio.borneo@st.com>
> Reported-by: Ahmad Fatoum <a.fatoum@pengutronix.de>

Applied, and queued for 5.9 (all other 5.5+ branches are EOL by now).

Thanks!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
