Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 45CAE33E065
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Mar 2021 22:21:18 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F3AE2C57B79;
	Tue, 16 Mar 2021 21:21:17 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5438EC57B77
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Mar 2021 21:21:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 584DB64FA6;
 Tue, 16 Mar 2021 21:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615929674;
 bh=su/a4cJXKkStHlw0Xv6RaaQR/ej+nELTe/a2v5ZVifY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ls+CiT1rDuu0/020yQNXMyP2EEGdd9tNmW+kVHPmWtJ+PknQ6RpzBiJLaN9fGZlF5
 SsBWH/k4HVb5+FzKdDe2t7Ts9xj6H3AD+MvDRZ9U4pgiNYHjkdIeUsRx0zTvSW4vb9
 czxtJsbfrwJVmmgL4qHh9R4Ykn9jadnw16nflBaRsNnrkz2sXh9J5hh2VUySY8AlOp
 oPBF7HIPB7sxJrie0K88Y2byZzXwXNrIuPvm0FIVOX/gbCh1+p6oFdGUmbnCm6q7sB
 klqBhD8p4rMRS9uoOAiz30GzIEdjKZiD6v/cN2f6NwOS8o6HFxEwWZNHCOQj9J6rX3
 tcpWNiprO/D5Q==
Date: Tue, 16 Mar 2021 14:21:13 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Voon Weifeng <weifeng.voon@intel.com>
Message-ID: <20210316142113.40fd721f@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20210316121823.18659-3-weifeng.voon@intel.com>
References: <20210316121823.18659-1-weifeng.voon@intel.com>
 <20210316121823.18659-3-weifeng.voon@intel.com>
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, Alexandre Torgue <alexandre.torgue@st.com>,
 Wong Vee Khee <vee.khee.wong@intel.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [RESEND v1 net-next 2/5] net: stmmac: make
 stmmac_interrupt() function more friendly to MSI
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

On Tue, 16 Mar 2021 20:18:20 +0800 Voon Weifeng wrote:
> +	if (unlikely(!dev)) {
> +		netdev_err(priv->dev, "%s: invalid dev pointer\n", __func__);
> +		return IRQ_NONE;
> +	}

Where did this check come from? Please avoid defensive programming 
in the kernel unless you can point out how the condition can arise
legitimately.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
