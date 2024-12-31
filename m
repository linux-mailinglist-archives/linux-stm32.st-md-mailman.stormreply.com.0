Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF089FEC02
	for <lists+linux-stm32@lfdr.de>; Tue, 31 Dec 2024 02:03:58 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 776EBC6DD9F;
	Tue, 31 Dec 2024 01:03:58 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 579C5C6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Dec 2024 01:03:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id A33BDA40EDA;
 Tue, 31 Dec 2024 01:02:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68679C4CED0;
 Tue, 31 Dec 2024 01:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1735607029;
 bh=SLxVkcGz5+P4J5d9OZXZNHaIHpMJMKM6U+t5J5uXOlU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hzlu31/jwQayZ+6h16cV9QCGnBLyML0qXHeAdr0dzUvQWfXyMYdfJtupRRqI4tfQS
 yGcmMtJcRKXM9M8sCZzjsOQawmQ4GXWYxSHU1a1GyCqmlmK4sLKd127Aq1fB//2iT2
 RQDiO85C43tqGgMdndYJ/07ypdYuL5Nwiq+31P2sGvzd20lZZzXddyoA0FBHMiinBX
 cmaH/FPHNNO1I9m35mZM+yCh15/DeZqfdLXGOlqHLLfdC9JtazvU78caF7+QU7nqjn
 r91WIQFDeAUL+ozLoT7oe68FW9Mzt5F4Xjl10hRTl522swAEsucTZvNRA5c5fBiEi2
 RJMqASaIdbSwA==
Date: Mon, 30 Dec 2024 19:03:48 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Joey Lu <a0987203069@gmail.com>
Message-ID: <173560702701.2856960.545232938075412224.robh@kernel.org>
References: <20241218114442.137884-1-a0987203069@gmail.com>
 <20241218114442.137884-2-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241218114442.137884-2-a0987203069@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, yclu4@nuvoton.com,
 linux-stm32@st-md-mailman.stormreply.com, davem@davemloft.net,
 netdev@vger.kernel.org, openbmc@lists.ozlabs.org, ychuang3@nuvoton.com,
 linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch, edumazet@google.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, peppe.cavallaro@st.com,
 schung@nuvoton.com, kuba@kernel.org, krzk+dt@kernel.org, pabeni@redhat.com,
 richardcochran@gmail.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v5 1/3] dt-bindings: net: nuvoton: Add
 schema for Nuvoton MA35 family GMAC
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


On Wed, 18 Dec 2024 19:44:40 +0800, Joey Lu wrote:
> Create initial schema for Nuvoton MA35 family Gigabit MAC.
> 
> Signed-off-by: Joey Lu <a0987203069@gmail.com>
> ---
>  .../bindings/net/nuvoton,ma35d1-dwmac.yaml    | 126 ++++++++++++++++++
>  .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
>  2 files changed, 127 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
