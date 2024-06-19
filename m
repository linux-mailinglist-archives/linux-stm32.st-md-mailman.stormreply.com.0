Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DE34C90EFBD
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Jun 2024 16:09:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8D2F8C6B460;
	Wed, 19 Jun 2024 14:09:38 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 650D9C5E2D0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jun 2024 14:09:35 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 70A4D8840C;
 Wed, 19 Jun 2024 16:09:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1718806175;
 bh=FklmdbX8PxAWjM+hAVWkGY9xVy4t8YexQAod/4anuzY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=K9SDPmSXR6lH3+uuJICz1jM8APdvo1J+hV1qbRZujPEmUU61+sxeBRxPDPQqaUVvR
 jxbgiVJObEOqH9Q8xfdU/SZ8lbY14kkptIJn/DVRfI19H/8IB902WCd+d9Tg7B6aDd
 6adLfPZ2qUkr4Mo8UF3RXL+ExPmNqobCWqrsPqSNxcG7CD/hsDEvbyLhqGUDF7f3YR
 lgbjQqKMTaxotqjCJz2iI8F+k67OYuJwjQZ7SwbkZ09qOyLqq2iJhCGVUfANsx/8B/
 j0fNDolddJC2e4Ddgz1SaS1VoUlmf1qB+YMyNM4n1CYPBewvBDdq890YgQswK8tEcN
 kVY+0t34KGKlQ==
Message-ID: <c9581fd1-67da-4840-bd79-bf58f1c9fc34@denx.de>
Date: Wed, 19 Jun 2024 15:45:40 +0200
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
References: <20240619125815.358207-1-christophe.roullier@foss.st.com>
 <20240619125815.358207-4-christophe.roullier@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20240619125815.358207-4-christophe.roullier@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 3/3] arm64: dts: st: enable Ethernet2
 on stm32mp257f-ev1 board
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

On 6/19/24 2:58 PM, Christophe Roullier wrote:
> ETHERNET2 instance is connected to Realtek PHY in RGMII mode
> Ethernet is SNSP IP with GMAC5 version.
> 
> Signed-off-by: Christophe Roullier <christophe.roullier@foss.st.com>

Reviewed-by: Marek Vasut <marex@denx.de>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
