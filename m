Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 966208B267A
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Apr 2024 18:30:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 45F83C71292;
	Thu, 25 Apr 2024 16:30:42 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ED77EC71290
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Apr 2024 16:30:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 839E1CE19B1;
 Thu, 25 Apr 2024 16:30:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FFADC113CC;
 Thu, 25 Apr 2024 16:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1714062637;
 bh=o6qnkohJ43I0c9dUSdw3e1QtuR0Qmn9fqg4+khVlmGU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jHCB1LyzEL+j8iFGW5mQoqMy1mB1Uv50bhBymZOdc1h+qVy3ZCZe/494SBd2S1fj/
 OHbyMfU6/0D9dOG4YWHpFE/YcC1ckg+qNP1mvehERsCl4sfzKGv72r1+P3qZB62M70
 Jy5LZoZZ2BLzcVor9re17KnYDOVwyfMcUsYKvy9dBuq/yLNCihv5OWGWp8qfN4FiJi
 WfNS+53EGZrcPHi4G1E5qdqXyJDqcVKETUnmsr3we7x0gBZ8x83FlDqjJkXCiKPSJd
 dpuDmBiRVV3j53YaKEUYfcWmviAAL1RIV2IhIgpvumhO90gvGitPGCgu1DS7srJJwf
 g7evSH24HCbAw==
Date: Thu, 25 Apr 2024 11:30:35 -0500
From: Rob Herring <robh@kernel.org>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20240425163035.GA2783061-robh@kernel.org>
References: <20240425074835.760134-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240425074835.760134-1-patrick.delaunay@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Pascal Paillet <p.paillet@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 0/3] ARM: st: use a correct pwr compatible
	for stm32mp15
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

On Thu, Apr 25, 2024 at 09:48:31AM +0200, Patrick Delaunay wrote:
> 
> This patchset removes the unexpected comma in the PWR compatible
> "st,stm32mp1,pwr-reg" and uses a new compatible "st,stm32mp1-pwr-reg"
> in STM3MP15 device trees.

Why? I don't see any warnings from this. Yes, we wouldn't new cases 
following this pattern, but I don't think it is worth maintaining 
support for both strings. We're stuck with it. And the only way to 
maintain forward compatibility is:

compatible = "st,stm32mp1-pwr-reg", "st,stm32mp1,pwr-reg";

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
