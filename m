Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF707709A7
	for <lists+linux-stm32@lfdr.de>; Fri,  4 Aug 2023 22:24:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3CA23C6B469;
	Fri,  4 Aug 2023 20:24:09 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6FA99C6B466
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Aug 2023 20:24:07 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 45F1C61EC4;
 Fri,  4 Aug 2023 20:24:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4F6CC433C8;
 Fri,  4 Aug 2023 20:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691180645;
 bh=MN8Ir5pH3svELvRVWkYhOhFDhYH6jPowbfYlT+skAZU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Z+rNfBjRljT7BMNl9BeMpg8gSzG3afyNJqmBduhCOJwxMpuy34xi6jV8JJMzBm9LU
 R0ipkW8j6NebYUUIKABm+F/z6K0oen0SxgruY7Ggn1D/WcCxxk8qoywCH8ohaFAdJ+
 UfW/osKhfAAvFuX29JvqaaPXfDXbyDbc+hMdXiQ/SbEsKHnFNNtHtJrbtR5aGShTxK
 0GjSFGj3zrZGbh2tyQWFITLE+BziTFWKWpmTYNPeSmX275VbB7yOaCueqqXmFEv5F9
 Tp8tbkuX7WkILnMpu3iDdkIY5f1A8RLOPIH9wbhU5FBT5O3/yFRFWlH4ukVsMx/uIi
 NjJLtQ7lN6RSg==
Date: Fri, 4 Aug 2023 13:24:03 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Richard Cochran <richardcochran@gmail.com>
Message-ID: <20230804132403.4d9209de@kernel.org>
In-Reply-To: <20230719-stmmac_correct_mac_delay-v3-0-61e63427735e@pengutronix.de>
References: <20230719-stmmac_correct_mac_delay-v3-0-61e63427735e@pengutronix.de>
MIME-Version: 1.0
Cc: Johannes Zink <j.zink@pengutronix.de>, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de, netdev@vger.kernel.org,
 Kurt Kanzenbach <kurt@linutronix.de>, linux-stm32@st-md-mailman.stormreply.com,
 Russell King <linux@armlinux.org.uk>, kernel test robot <lkp@intel.com>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 patchwork-jzi@pengutronix.de
Subject: Re: [Linux-stm32] [PATCH v3 0/2] net: stmmac: correct MAC
	propagation delay
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

On Tue, 01 Aug 2023 17:44:28 +0200 Johannes Zink wrote:
> ---

Richard? Sure would be nice to have an official ack from you on this
one so I don't have to revert it again ;)
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
