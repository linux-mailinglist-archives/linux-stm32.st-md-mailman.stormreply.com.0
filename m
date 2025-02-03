Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9FFA2665D
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Feb 2025 23:06:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CDD18C78034;
	Mon,  3 Feb 2025 22:06:21 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1E536C7802B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Feb 2025 22:06:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E82685C5D5D;
 Mon,  3 Feb 2025 22:05:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACF91C4CED2;
 Mon,  3 Feb 2025 22:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738620372;
 bh=yzyPuuX2I9mlAd8wRAXfCiQT5z1CNGqnwskd/rkgtMo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=DPdXEuIw9QSyalNNyNjvv0XnpXXT0IqYas4P/nhGlrVRWsP4nTb8KYoNaYGYSxUsl
 TeL7MI6sihNDnf2Az3fWZOkz28xm/43DHoKN/1xukR5ZkJ1QYiOGo9UodinK8o9Q4m
 mHgWYffCmXMrWCzQyxGA4qBgvsA6XA+r+Zsny+GIfc8HqrgIVjTJn5eifr0L66cOmJ
 dIG0GjgKiFTV7dwqSU+U93IwBfmT9VmtAfw9b6rfQCGPEw2WyzxXxKS5h4Shq5EKFp
 1BMIih6q+UVPnT/QekmCcjKzgjVwixFXRmZ9WQurhZKSMuEWd4oJhUa8DVATYeVRBs
 M0XTJmnfkqffg==
Date: Mon, 3 Feb 2025 14:06:10 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Joey Lu <a0987203069@gmail.com>
Message-ID: <20250203140610.4a0bbad4@kernel.org>
In-Reply-To: <20250203054200.21977-1-a0987203069@gmail.com>
References: <20250203054200.21977-1-a0987203069@gmail.com>
MIME-Version: 1.0
Cc: robh@kernel.org, conor+dt@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, devicetree@vger.kernel.org,
 openbmc@lists.ozlabs.org, netdev@vger.kernel.org, richardcochran@gmail.com,
 ychuang3@nuvoton.com, linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch,
 edumazet@google.com, joabreu@synopsys.com,
 linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
 schung@nuvoton.com, peppe.cavallaro@st.com, krzk+dt@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, yclu4@nuvoton.com
Subject: Re: [Linux-stm32] [PATCH net-next v8 0/3] Add support for Nuvoton
	MA35D1 GMAC
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

On Mon,  3 Feb 2025 13:41:57 +0800 Joey Lu wrote:
> This patch series is submitted to add GMAC support for Nuvoton MA35D1
> SoC platform. This work involves implementing a GMAC driver glue layer
> based on Synopsys DWMAC driver framework to leverage MA35D1's dual GMAC
> interface capabilities.

The tree is open when we say that it's open, you posted this 9 hours
before the announcement:

https://lore.kernel.org/all/20250203065423.03f4cec4@kernel.org/

Sorry but keeping this in the queue would be unfair to people who
follow the rules.
-- 
pw-bot: defer
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
