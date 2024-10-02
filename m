Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2390098E33D
	for <lists+linux-stm32@lfdr.de>; Wed,  2 Oct 2024 20:57:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C1807C78022;
	Wed,  2 Oct 2024 18:57:41 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ABE39C78020
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  2 Oct 2024 18:57:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 557275C2CF4;
 Wed,  2 Oct 2024 18:57:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B17FFC4CEC2;
 Wed,  2 Oct 2024 18:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727895453;
 bh=Xnt1YJ9ju2/c4oQh0I6rkxuPSnWHunzH7etL6wWGiEY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=OD1zve4J2QIDIDeQIaTA8HqEPY5TNpx32L/PNj8P26kTLmdAVPACDDz+H07kY6EoD
 KyKzYpBn1URCLUM7Z/zBH/uxpK8RbeS6Bc1bumz2/q6w1Gh6Z+B/V3q5jx4P9ikK0A
 vPOQZBk7CC1ERa4BjHohRH0NPQttAlmevlx+RrWFWTRMkrYnQoSSVFfMvpB4rnaoTh
 55b3HJ/Y9zeoZ6+bo1lbHO5IWq6F4ftsThNiosTIiaXZkmBPM4RRQR2J4p3QjdjL1/
 qkzcg0iyxYHrwzjvBIwHc4pJEf5og4I7SP7ysCDd6yVGAbTqyFzLl+DJywHMPyQfp5
 D3NKcykGjIKlg==
Date: Wed, 2 Oct 2024 11:57:32 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Serge Semin <fancer.lancer@gmail.com>
Message-ID: <20241002115732.00c05c63@kernel.org>
In-Reply-To: <tb2o2dhxcg7lykl743no3zkkjnqwuce56ls5ihrwreowigivwv@2mol7uc2qvto>
References: <20240930110205.44278-1-minda.chen@starfivetech.com>
 <20241002065801.595db51a@kernel.org>
 <tb2o2dhxcg7lykl743no3zkkjnqwuce56ls5ihrwreowigivwv@2mol7uc2qvto>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Minda Chen <minda.chen@starfivetech.com>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Paolo Abeni <pabeni@redhat.com>, "David S
 . Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH net-next v2] net: stmmac: dwmac4: Add ip
 payload error statistics
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

On Wed, 2 Oct 2024 21:35:30 +0300 Serge Semin wrote:
> It almost word-by-word matches to what is defined for the
> ERDES4_IP_PAYLOAD_ERR flag (part of the Extended RDES4 descriptor
> field) in DW GMAC v3.x HW-manual for which the
> stmmac_stats::ip_payload_err field has been added in the first place.
> Note the name of the flag in the descriptor matches to what is declared in
> the stmmac_stats structure.

I misread the ERDES4_IP_PAYLOAD_ERR as a Tx flag, somehow. All good
then.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
