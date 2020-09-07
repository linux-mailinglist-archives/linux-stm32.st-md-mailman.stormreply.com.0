Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 45AFB2605BA
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Sep 2020 22:38:47 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E7FFFC3FAE2;
	Mon,  7 Sep 2020 20:38:46 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2530EC36B33
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Sep 2020 20:38:46 +0000 (UTC)
Received: from kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com (unknown
 [163.114.132.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2174021556;
 Mon,  7 Sep 2020 20:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599511124;
 bh=CQ2rh3UwBAj+NLRlOiFRdPT2kD9jlx5l+PaStBfsA0A=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=RfxVjjIrzFib8T0Z9FhjEKtsLm0Eq4R8jD2XMofu79VCZKIi63SprE71AOmM9fnfF
 BmQrO9WQ6kJGBdRJ8Z7KSIqymjVoprp2SG1amAK5AuFiH6hzWctTlU84UaUUboblfR
 wJ27mrCoRIPoX37YYDSRqHc9pbr5nMKfWo+APmSg=
Date: Mon, 7 Sep 2020 13:38:42 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Zhang Changzhong <zhangchangzhong@huawei.com>
Message-ID: <20200907133842.762cb362@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <1599482814-42552-1-git-send-email-zhangchangzhong@huawei.com>
References: <1599482814-42552-1-git-send-email-zhangchangzhong@huawei.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, s.hauer@pengutronix.de,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, peppe.cavallaro@st.com,
 shawnguo@kernel.org, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next] net: ethernet: dwmac: remove
 redundant null check before clk_disable_unprepare()
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

On Mon, 7 Sep 2020 20:46:54 +0800 Zhang Changzhong wrote:
> Because clk_prepare_enable() and clk_disable_unprepare() already checked
> NULL clock parameter, so the additional checks are unnecessary, just
> remove them.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zhang Changzhong <zhangchangzhong@huawei.com>

Applied.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
