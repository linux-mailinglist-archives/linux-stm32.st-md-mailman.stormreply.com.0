Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 58CB599F385
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Oct 2024 18:58:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0B2E8C78031;
	Tue, 15 Oct 2024 16:58:48 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 24C7AC78030
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Oct 2024 16:58:41 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id D921B8878A;
 Tue, 15 Oct 2024 18:58:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1729011520;
 bh=K2rDPHJqBMt/WLM3Dj0iejD1QKspAJKoayxohvdB8FM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=vw4aGWK3A2fWfTFM6QPqVRm2XOjBgqiPTw5zmQxzmTjBZyz1Iev9Hx0WvLMjQoi9C
 /btRp9gXFpuqyuHLiMCtFB8KUZgIkYXl2scjlUI3n9cwDfAh9n6XfnlNaNFPnPVHMp
 DX8MAEgNqf3nsu6a966oB0Ixj/U6MKiK664AT4pDO8bHvr0Ttbf6JQqtsTkNKGK2ol
 6RFRYkaP/p6hC2iQUbdxjaiZ4YqTjmfgENXpeX/u+awnd5C9XCaZOctUhQ8vCHwTGx
 hElHB/CAbqBnqZ3EDcL3h/bicmyeoQdCMMEISWYc/cNGva8KIFfCgIYVHl/OJTApfJ
 e5JbQj+4qsF1g==
Message-ID: <b9dc693a-3e85-4118-b792-806f07bc3e07@denx.de>
Date: Tue, 15 Oct 2024 18:57:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Gatien Chevallier <gatien.chevallier@foss.st.com>,
 Olivia Mackall <olivia@selenic.com>, Herbert Xu
 <herbert@gondor.apana.org.au>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>
References: <20241015-rng-mp25-v2-v3-0-87630d73e5eb@foss.st.com>
 <20241015-rng-mp25-v2-v3-2-87630d73e5eb@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20241015-rng-mp25-v2-v3-2-87630d73e5eb@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v3 2/4] hwrng: stm32 - implement support
 for STM32MP25x platforms
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

On 10/15/24 6:48 PM, Gatien Chevallier wrote:
> Implement the support for STM32MP25x platforms. On this platform, a
> security clock is shared between some hardware blocks. For the RNG,
> it is the RNG kernel clock. Therefore, the gate is no more shared
> between the RNG bus and kernel clocks as on STM32MP1x platforms and
> the bus clock has to be managed on its own.
> 
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
Reviewed-by: Marek Vasut <marex@denx.de>

Thanks !
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
