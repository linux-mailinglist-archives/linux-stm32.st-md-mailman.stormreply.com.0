Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B16A33DB7AD
	for <lists+linux-stm32@lfdr.de>; Fri, 30 Jul 2021 13:23:35 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 44FE9C57B6F;
	Fri, 30 Jul 2021 11:23:35 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 82D92C57182
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Jul 2021 11:23:34 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4AAD46101C;
 Fri, 30 Jul 2021 11:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627644212;
 bh=O27IE+j7gHANW5VvwQ6r5nimd3mK5l0+qZ9rz7zKp0Y=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=WL/FCkoQfXtFdweNoHI9CHLptD1KLWh1LPC5z608DSxenZcveWw42QGq9p/HHQbgX
 lr+mxuO7twKTj4zC1hc5uiiH5ZuOVbnQ8UY91FLDDTlY0fhKz1AUqWB2JjAVSybc1X
 8QIv6g1B5on3g3+G37B7dMYGrFA3S6LlzJvsPFaaWZyiN4lz8xmPq2SJQpUJMncq4Z
 TwBAThKbleWKHASj76/12ga57EYVk5YZa7BQ8utlcezRVUf/oPku13EUGC7+goYF97
 oZvE/f60FtPSAwfokMLq1ymv8O9kg7utsyZvagUySSoKNhSPLmnX/dKfooEEYPQOvQ
 15XPSV4dhrKXA==
Date: Fri, 30 Jul 2021 04:23:31 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Hao Chen <chenhaoa@uniontech.com>
Message-ID: <20210730042331.03fafba1@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <6015f3a3-1e6e-5242-bc2b-32d3b077d0e8@uniontech.com>
References: <20210722015433.8563-1-chenhaoa@uniontech.com>
 <6015f3a3-1e6e-5242-bc2b-32d3b077d0e8@uniontech.com>
MIME-Version: 1.0
Cc: qiangqing.zhang@nxp.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux@armlinux.org.uk,
 alexandre.torgue@foss.st.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 peppe.cavallaro@st.com, davem@davemloft.net, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [net,
	v7] net: stmmac: fix 'ethtool -P' return -EBUSY
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

On Fri, 30 Jul 2021 17:49:31 +0800 Hao Chen wrote:
> There was no email or reply for a week. Can this patch be accepted?

Looks like v7 didn't make it into patchwork, these are your submissions
which did register:

https://patchwork.kernel.org/project/netdevbpf/list/?submitter=197871&state=*

Please resend.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
