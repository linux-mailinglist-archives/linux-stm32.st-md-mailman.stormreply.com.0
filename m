Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA797C71C4
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Oct 2023 17:44:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 69A7BC6A5EA;
	Thu, 12 Oct 2023 15:44:31 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 282F6C65E56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Oct 2023 15:44:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DC02261E45;
 Thu, 12 Oct 2023 15:44:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E2CAC433C9;
 Thu, 12 Oct 2023 15:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1697125468;
 bh=GICrSG2Yr7cyuandvlnQB4wtkQU/ONqfvxNpkn64C6c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=urSiZTDhcxBtHJPTvqtBC4cbLtC9OIQZFQf/8DnE7ETAiwuqDBbUXRQuEm41SaASc
 QIW6lXY9WRyLn50Pu+zz9QzE+yC+dw5RwAzE4LdRW9RHA+84bytQo5AbqNAJyDSkzP
 CoH1XRfilCg0doAuE8Yd4JdRbcCsQ6KRsIbJHkX/MKZPafuH6b8f7LPWmztVh3X9z5
 9Cyy+vzf8G5cPYYhDnnTFtZW5uHUt4Yolt7eqNWMfq6bNdAE9ciEgZlRXCYiakemly
 aPm3MhhdFqCQhK/TM4FNWQimBRHYFA5UoIuBnHCjbN9RkeL8lluk7L1aDOjP0oeLbx
 KpcJdVuuX7PMA==
Date: Thu, 12 Oct 2023 17:44:22 +0200
From: Simon Horman <horms@kernel.org>
To: Johannes Zink <j.zink@pengutronix.de>
Message-ID: <20231012154422.GE1178137@kernel.org>
References: <20231010172415.552748-1-j.zink@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231010172415.552748-1-j.zink@pengutronix.de>
Cc: linux-kernel@vger.kernel.org, kernel@pengutronix.de, netdev@vger.kernel.org,
 richardcochran@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 edumazet@google.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, patchwork-jzi@pengutronix.de
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: fix typo in comment
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

On Tue, Oct 10, 2023 at 07:24:15PM +0200, Johannes Zink wrote:
> This is just a trivial fix for a typo in a comment, no functional
> changes.
> 
> Signed-off-by: Johannes Zink <j.zink@pengutronix.de>

Thanks,

I checked and codespell doesn't flag any other spelling errors in this file.

Reviewed-by: Simon Horman <horms@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
