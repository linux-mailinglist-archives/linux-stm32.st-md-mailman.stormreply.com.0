Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5308B3C30
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Apr 2024 18:00:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A6DF4C71293;
	Fri, 26 Apr 2024 16:00:53 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 71789C7128B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Apr 2024 16:00:53 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id F101F885A2;
 Fri, 26 Apr 2024 18:00:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1714147253;
 bh=KntFSRKKJlXDI5nElDgSk47qflI7G4WWVDhKzJ36saw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=OlxJiBA4JqiSkPep5+//Fab0HwkAzF4JpRmBY7MmnztFaBs1CPhfiiJg0ggs186tS
 FUPEmouTIVHsld25mVu1cdwPn6C0rqtoPLMk+EYPLrP4ynWAXJuYgAsk7V+AS8/p/O
 lQzAOvhn6cmgSjN1NDjb3KFLd27GSD7fp54cDaBx7GfSLF3d7/W5Bthlr66buqjQKX
 AtWFuDl14vhYxmjFdnSsEa/4q0BwZp/MfnRAlMtMwF0Hjm35xnePRM2FnAKfRiUvnz
 SLFwOy2aphZnlwRhiXWW5PtwXL/WXKdqAWyqe/bx5cR8CBugtQGiJb3WDHRm3kGsYN
 FZuYqDTShKRjA==
Message-ID: <5b8b52cf-bd43-40c0-962a-c6936637b7de@denx.de>
Date: Fri, 26 Apr 2024 17:40:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Christophe Roullier <christophe.roullier@foss.st.com>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Richard Cochran <richardcochran@gmail.com>, Jose Abreu
 <joabreu@synopsys.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
References: <20240426125707.585269-1-christophe.roullier@foss.st.com>
 <20240426125707.585269-7-christophe.roullier@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20240426125707.585269-7-christophe.roullier@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 06/11] net: stmmac: dwmac-stm32: clean
 the way to manage wol irqwake
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 4/26/24 2:57 PM, Christophe Roullier wrote:
> On STM32 platforms it is no longer needed to use a dedicated wakeup to
> wake up system from CStop.

This really needs more clarification.

Why was the code needed before ? Maybe because it was used by some of 
the older STM32F4/F7/H7 SoCs ? Is it still needed by those SoCs ? Will 
this patch break those older SoCs ?

> This patch removes the dedicated wake up usage
> and clean the way to register the wake up irq.

[...]
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
