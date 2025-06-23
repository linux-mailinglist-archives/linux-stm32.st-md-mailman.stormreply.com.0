Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A84BAE4CAA
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Jun 2025 20:19:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 459FFC32E8D;
	Mon, 23 Jun 2025 18:19:17 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8AFEAC36B2F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Jun 2025 18:19:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5310F5C6233;
 Mon, 23 Jun 2025 18:16:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBBBAC4CEEA;
 Mon, 23 Jun 2025 18:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750702754;
 bh=LEHYRu3/7xSfEv3Cjj1c9lr1mtyqcmzcegD0em3dLe0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=qUkiFHzDWHjmj+7AaeUsqTx6LaoZuR658XBb6spCB6SxnOCXkpftc+SibmM3wglN+
 QN2XhAOqBZxJE6F4qsbq9+fd695vXIOL691rtVcf9UkUBHzoTly0p6N5rg71Qz88h4
 Ul4Epjty0Hq3du+mSGXA4mApwXSfxSufhbtjuOESEtGKjBdO6qSMrahI59kiBCIjNa
 iwpti94HrJG6ghCZnwwNiImkK+sca5EuZuo1//Qj7bQQnZaAH0zRyYhjxAYOdbrlY+
 QsNODuefyMv6hG0dz8X7ChbSzexhNTCQzEIxy7k+iRKynQCR7yug/AgTWRgRz+6LbW
 LAtAyNtVP0L0Q==
Date: Mon, 23 Jun 2025 11:19:13 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Message-ID: <20250623111913.1b387b90@kernel.org>
In-Reply-To: <20250613225844.43148-1-matthew.gerlach@altera.com>
References: <20250613225844.43148-1-matthew.gerlach@altera.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 richardcochran@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 Mun Yew Tham <mun.yew.tham@altera.com>, andrew+netdev@lunn.ch,
 edumazet@google.com, linux-arm-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, pabeni@redhat.com,
 Matthew Gerlach <matthew.gerlach@altera.com>, davem@davemloft.net,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v6] dt-bindings: net: Convert
 socfpga-dwmac bindings to yaml
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

On Fri, 13 Jun 2025 15:58:44 -0700 Matthew Gerlach wrote:
> Convert the bindings for socfpga-dwmac to yaml. Since the original
> text contained descriptions for two separate nodes, two separate
> yaml files were created.

Hi DT Maintainers! Thanks for reviewing the IPQ5018 bindings!
In case my pings are helpful, this is the next oldest patch in netdev
queue. The v4 seem to have gotten some feedback:
https://lore.kernel.org/all/20250609163725.6075-1-matthew.gerlach@altera.com/
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
