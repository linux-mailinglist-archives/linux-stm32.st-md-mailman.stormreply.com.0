Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A3CB234E8
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Aug 2025 20:45:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E0C51C3F93D;
	Tue, 12 Aug 2025 18:45:10 +0000 (UTC)
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7E51DC3F93C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Aug 2025 18:45:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net A42CD40AD9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
 t=1755024307; bh=A+TJa+1YAL3xL4DQkHf32bWqzxeCnDN+wkm0l10neeQ=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=jM8TtxRyOctibvek6JqZctFVAABA7VURS2ihCWUfF47+Qb3GDZwrh1qs8QiaRWi3l
 KhF8LjFwA7Vxgcpju8bmUR79KQdqVHBRdOm/DP2zL5+dNg5HP8CPtNsDL9q9xXT5c1
 BYLuNjP0yrZ9apv536rH0/ZCgwX8QEpzkwQUK0dODsVbwxGPAH4/vOmf80L33qa+rU
 0qIOU2WiwQreeFzTkIiG5xUa8NrmmosMi/1SH2pdyQwzNQ4tvLgQCrA3tYCLEPOEbB
 pwu52N0ltFMDCP6rOMzYJHFRikgSYX8FBd0KJ9kEQNVBKiXzIFS5lO/Rnc/pOOnU1O
 jyxtMhrOEpQ9w==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id A42CD40AD9;
 Tue, 12 Aug 2025 18:45:07 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Akshaykumar Gunari <akshaygunari@gmail.com>, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com
In-Reply-To: <20250807145119.2214-1-akshaygunari@gmail.com>
References: <20250807145119.2214-1-akshaygunari@gmail.com>
Date: Tue, 12 Aug 2025 12:45:06 -0600
Message-ID: <87v7mse5vx.fsf@trenco.lwn.net>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, Akshaykumar Gunari <akshaygunari@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH RESEND] docs: arm: stm32: fix typo
	"busses" -> "buses"
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

Akshaykumar Gunari <akshaygunari@gmail.com> writes:

> Fix the spelling of "busses" to the preferred form "buses" in STM32 ARM
> architecture documentation.
>
> Signed-off-by: Akshaykumar Gunari <akshaygunari@gmail.com>
> ---
>  Documentation/arch/arm/stm32/stm32f746-overview.rst  | 2 +-
>  Documentation/arch/arm/stm32/stm32f769-overview.rst  | 2 +-
>  Documentation/arch/arm/stm32/stm32h743-overview.rst  | 2 +-
>  Documentation/arch/arm/stm32/stm32h750-overview.rst  | 2 +-
>  Documentation/arch/arm/stm32/stm32mp13-overview.rst  | 2 +-
>  Documentation/arch/arm/stm32/stm32mp151-overview.rst | 2 +-
>  6 files changed, 6 insertions(+), 6 deletions(-)

Applied, thanks.

jon
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
