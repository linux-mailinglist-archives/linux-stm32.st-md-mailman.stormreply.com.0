Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9088583E279
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Jan 2024 20:27:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4807CC6DD70;
	Fri, 26 Jan 2024 19:27:51 +0000 (UTC)
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C423BC6DD6F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Jan 2024 19:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1706297269;
 bh=NW9/Y1sMfKulS8DYavETlMP6KBNa2HphYFT4fmqYhiQ=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=xXcRyGxDv0Xqsfg6pHpA2QSKTxLhBF71dFtSwBxKkRD8WdBl+q42Mf+z8zNhPnrkX
 xdkwzX62vOt84LBzrWfOeuzAhL7S9sseI8UAQgkpEK4KLkBrSgD944tYNZ4RkWuh/c
 Y7VDLOVx+50q7qhGZ5jmgnKrO0/L5htnhq+3umjBlAZ70LYGpEebSnXGhQqsVRa23B
 FmjXach9aOc1ngY4CPsVGyHYZ5Gczki6wZaTL48GzWbbSJBEXCB5fUGE5pzTWuci1p
 L1EDNz+kWeoFwe5z3ft24OjFNxWe9+guyNdJuA7Rk/QJsKySv+Xnt9rljpcL7XWq5S
 2UD7pnP/iZjHw==
Received: from [100.115.223.179] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id E22ED3780022;
 Fri, 26 Jan 2024 19:27:47 +0000 (UTC)
Message-ID: <920e764c-4fa3-4298-bb49-d31416fc3dd6@collabora.com>
Date: Fri, 26 Jan 2024 21:27:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
 Samin Guo <samin.guo@starfivetech.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Andrew Lunn <andrew@lunn.ch>,
 Jacob Keller <jacob.e.keller@intel.com>
References: <20240126191319.1209821-1-cristian.ciocaltea@collabora.com>
In-Reply-To: <20240126191319.1209821-1-cristian.ciocaltea@collabora.com>
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 0/2] StarFive DWMAC support for JH7100
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

Please ignore this and use the RESEND version [1], as the binding patch 
was not correctly updated with the latest tags.

Sorry for the noise,
Cristian

[1] https://lore.kernel.org/lkml/20240126192128.1210579-1-cristian.ciocaltea@collabora.com/

On 1/26/24 21:13, Cristian Ciocaltea wrote:
> This is just a subset of the initial patch series [1] adding networking
> support for StarFive JH7100 SoC.
> 
> [1]: https://lore.kernel.org/lkml/20231218214451.2345691-1-cristian.ciocaltea@collabora.com/
> 
> Changes in v4:
>  - Rebased series onto next-20240125
>  - Added R-b tag from Rob in PATCH 1
>  - v3:
>    https://lore.kernel.org/lkml/20231222101001.2541758-1-cristian.ciocaltea@collabora.com/
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
