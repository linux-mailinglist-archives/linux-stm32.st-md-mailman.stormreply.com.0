Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9527E4BC55D
	for <lists+linux-stm32@lfdr.de>; Sat, 19 Feb 2022 05:35:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4406CC60474;
	Sat, 19 Feb 2022 04:35:54 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F1AEEC23E53
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 19 Feb 2022 04:35:52 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AFBC660A50;
 Sat, 19 Feb 2022 04:35:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FF7CC004E1;
 Sat, 19 Feb 2022 04:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645245351;
 bh=IeWTVUw3cMvHQkGPhLRHMJ35VI5lMc00iLivS7XE+9M=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=bhyRV+LliKKjWJeEsdhJs7AlsaesTxOFSoexe23KlRB3bP5sQhmj4xbkEzGXH5W6L
 UwKitGFpuGBagb4aTbdrVftcZZv1VGr8dFgm0OZgAULJ8370bEBuTMPCpSsKsbXdUU
 rxZaRZaW+DjM5lzyOMPFme89IKL9+1MrmzTdJ4wDQ7x2vDzytN5826W9t8VioziJXN
 nAJ02JJFSfKNFemgzTaszHC7Zg/p0axARctuzGqfKVnr/vtTBpyUf45AKXWpuuk+iX
 S7gk2qyBGAozkO8egbj3It/q4a3D86BLLVfAJmOKMpq2PaN9YRu5SWvIjYRtjz5wXQ
 AJbAVmoAsUvlw==
Date: Fri, 18 Feb 2022 20:35:49 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Vincent Whitchurch <vincent.whitchurch@axis.com>
Message-ID: <20220218203549.43e0fa9b@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20220218102303.GA21458@axis.com>
References: <20220217145527.2696444-1-vincent.whitchurch@axis.com>
 <20220217203604.39e318d0@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <20220218102303.GA21458@axis.com>
MIME-Version: 1.0
Cc: "          <linux-arm-kernel@lists.infradead.org>, "@stm-ict-prod-mailman-01.stormreply.prv,
	linux-kernel@vger.kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@st.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>, kernel <kernel@axis.com>,
	Lars Persson <Lars.Persson@axis.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	"linux-stm32@st-md-mailman.stormreply.com\"          <linux-stm32@st-md-mailman.stormreply.com>,  " linux-arm-kernel@lists.infradead."org," Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	"David  S. Miller" <davem@davemloft.net>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: Enable NAPI before
	interrupts go live
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

On Fri, 18 Feb 2022 11:23:03 +0100 Vincent Whitchurch wrote:
> New patch below, it works for me (though I don't have hardware with
> working suspend/resume support).  I will send it out as a v2 if there
> are no objections.  Thanks.

LGTM, thanks!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
