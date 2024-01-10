Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F3232829B4B
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Jan 2024 14:33:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9DBC7C6A61D;
	Wed, 10 Jan 2024 13:33:21 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 272EFC6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Jan 2024 13:33:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id AF126B81CEB;
 Wed, 10 Jan 2024 13:33:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C86F2C43390;
 Wed, 10 Jan 2024 13:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1704893599;
 bh=80gsdR23OIMDUmaGo86P6z0jlYyc+cs3tLIj2ceqAEY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rRuYHojvCugPDSpoU3P//lFkFdXY7opAArZFaL3Zr9788k4aYSZsFPf2j58BZ6NVB
 8kfOX5BlyQhSGyb0Ex3PCsjO7JNNPISfURp+Q/m90qMQLtREQsOJ4zFs9NU9vN9RXm
 Ps5dHXUm6XVlmQPKIfHqKlV1UCO2BN1sJQ7za+TZ0CD44Gyl+naHv5UNjowsr+m24Q
 t3ElTGyl2alBm0DQrO9a6o5YuUIonf+a7ZUCikcqj8tp1tf7bJZDDY4QixVJ8JLUsh
 2MHHbAiZC5kU4HiGyvKKxjVeRk99e/rooBTJ07I9SHRLvyjjYP03++6fIyDJuZPsDz
 trHs22lyGlWDw==
Date: Wed, 10 Jan 2024 13:33:13 +0000
From: Simon Horman <horms@kernel.org>
To: Sneh Shah <quic_snehshah@quicinc.com>
Message-ID: <20240110133313.GA9296@kernel.org>
References: <20240109144729.26102-1-quic_snehshah@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240109144729.26102-1-quic_snehshah@quicinc.com>
Cc: kernel@quicinc.com, linux-kernel@vger.kernel.org,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Vinod Koul <vkoul@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-msm@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Andrew Halaney <ahalaney@redhat.com>
Subject: Re: [Linux-stm32] [PATCH net v3] net: stmmac: Fix ethool link
 settings ops for integrated PCS
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

On Tue, Jan 09, 2024 at 08:17:29PM +0530, Sneh Shah wrote:
> Currently get/set_link_ksettings ethtool ops are dependent on PCS.
> When PCS is integrated, it will not have separate link config.
> Bypass configuring and checking PCS for integrated PCS.
> 
> Fixes: aa571b6275fb ("net: stmmac: add new switch to struct plat_stmmacenet_data")
> Tested-by: Andrew Halaney <ahalaney@redhat.com> # sa8775p-ride
> Signed-off-by: Sneh Shah <quic_snehshah@quicinc.com>

Reviewed-by: Simon Horman <horms@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
