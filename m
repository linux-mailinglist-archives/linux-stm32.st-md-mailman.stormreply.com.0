Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D8F75B251
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Jul 2023 17:19:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 28457C6B44D;
	Thu, 20 Jul 2023 15:19:50 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DC577C6A5E6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jul 2023 15:19:48 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BD30761B45;
 Thu, 20 Jul 2023 15:19:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C5B1C433C8;
 Thu, 20 Jul 2023 15:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689866387;
 bh=VzuQfdcXhmSoUTwM4i0KWcI991yn6l0smL1PiDgs5tI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=dwTRKEfMnIzLYa1RIKer17DnIERMlzp9u+gvqtr9ZX3/WlEQoaXy/pbLGp0vPd9iW
 9kOjlGCoAMjHtC0Zbj39/PzO0jeVY3gZwcoEvybwMo9BVzl3nFsJB+Ao74J9gLrU6T
 H2kHCHebrP/o/bo2mRz5waMdHKoHJM/wKoleBoXwBLl3TOLVpOnonEIbKI5XNuC3iS
 RC50QLDYzPV48o1iZbUEbHq696V4GJtCLosVcz3/ZLTBaj1lg53l8lmRxv+Z216RLN
 Sw442+1rCzgfOTuxBXl9R4WxvQDfBv2v/TVsuzqvMsCkiUrHm1LxDsvcftdJQKdO4c
 11NFS7RoMreiw==
Date: Thu, 20 Jul 2023 08:19:45 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Marco Felsch <m.felsch@pengutronix.de>
Message-ID: <20230720081945.5cf783f0@kernel.org>
In-Reply-To: <20230720064636.5l45ad64kwwgd2iw@pengutronix.de>
References: <20230718132049.3028341-1-m.felsch@pengutronix.de>
 <20230718132049.3028341-2-m.felsch@pengutronix.de>
 <20230719211235.1758bbc0@kernel.org>
 <20230720064636.5l45ad64kwwgd2iw@pengutronix.de>
MIME-Version: 1.0
Cc: kernel@pengutronix.de, joabreu@synopsys.com, conor+dt@kernel.org,
 mcoquelin.stm32@gmail.com, devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 edumazet@google.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 peppe.cavallaro@st.com, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 2/2] net: stmmac: add support
	for phy-supply
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

On Thu, 20 Jul 2023 08:46:36 +0200 Marco Felsch wrote:
> > Please fix and rebase because the current version does not apply to
> > net-next/main.  
> 
> Sure, I thought the changelog should be part of the commit message in
> net-dev therefore I included it.

Old rules, I think. Since started adding lore links to all patches you
can put the changelog in the cut-off section. Adding a link to the
previous revision there is highly encouraged, too!
  
There's a sample of the preferred format at:
https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#changes-requested
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
