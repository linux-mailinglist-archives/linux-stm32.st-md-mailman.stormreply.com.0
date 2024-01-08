Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C472826701
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Jan 2024 02:02:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E57DDC6B476;
	Mon,  8 Jan 2024 01:02:32 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4A91BC6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Jan 2024 01:02:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id C3E91CE0C4D;
 Mon,  8 Jan 2024 01:02:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6A26C433C8;
 Mon,  8 Jan 2024 01:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1704675747;
 bh=1V/lcv+qg9gmbaccW5Zgh47dmTCwqWDyrX9MwgtQ/FQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=a7zs7eQ4dqqNKdzuA066xvCidEqdqjigWvs47CVk//uZYqOUfkgX0zhrU0k1qF+/M
 iqWtJiR8/TrIJA72oIjl/GBk3gkfhhMRXLcct8Q9rzULucRKRKq1Q968JOzCIgUiPc
 9Ho7B33Ga2HkGNFAfOXnzo13Q72CrfOT9lCXq8U3JsLUyki/PtnDnwvDsjvRq2FoJf
 EQhEz3R8FAkj9S1iF3qEijWXMQkOY5V476dHlI+qUjBdAXcTtTZWVezDXqxzNXD5K1
 hQtRBmBFz78MWQkLHzn+S+7JZcYSKGOITsFbYY6DIDWRStl+HiprUbSCETjXdf9Ufo
 KHDJCHNhumIYQ==
Date: Sun, 7 Jan 2024 17:02:25 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Serge Semin <fancer.lancer@gmail.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>
Message-ID: <20240107170225.43c82226@kernel.org>
In-Reply-To: <px2f336zjgibl43utjnnljzjweypu5jxovhgthc4xruidvpl3q@yobulxczk7vh>
References: <20240105070925.2948871-1-leong.ching.swee@intel.com>
 <170464562363.18664.8264531122295136817.git-patchwork-notify@kernel.org>
 <2df9fe3e-7971-4aa2-89a9-0e085b3b00d7@linaro.org>
 <px2f336zjgibl43utjnnljzjweypu5jxovhgthc4xruidvpl3q@yobulxczk7vh>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Leong Ching Swee <leong.ching.swee@intel.com>, edumazet@google.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 patchwork-bot+netdevbpf@kernel.org, peppe.cavallaro@st.com,
 netdev@vger.kernel.org, pabeni@redhat.com,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 0/4] net: stmmac: Enable Per
 DMA Channel interrupt
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

On Mon, 8 Jan 2024 00:24:24 +0300 Serge Semin wrote:
> > Please wait for DT bindings review a bit more than one working day (I
> > don't count Saturday and Sunday, because we all have some life...).  
> 
> +1. 

Sorry about that, reverting.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
