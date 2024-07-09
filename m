Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C8992C016
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Jul 2024 18:30:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 156AFC6DD66;
	Tue,  9 Jul 2024 16:30:51 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 03C18C5E2CD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Jul 2024 16:30:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 9935DCE12BD;
 Tue,  9 Jul 2024 16:30:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A9B5C3277B;
 Tue,  9 Jul 2024 16:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1720542640;
 bh=UKvAsz1g4fnOhjjLhryynx4MnRPSHIJ84qICpjwLHE0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OcDj//x71lzAXPBTyD2LF+AFXbTXO0eT0YRpKj7V0MLPCfbQ5jVnxu1Ek9cOWy+Qf
 scFvukXODhmmZvouxZBh3vRGgHJZFG6ETDbCGpRJfyzeA/VretAxeLqqZqUndnnJnP
 NI6mfm+vRk8IOo1eMYd9bA+pxAirZBWjBZvsD3HsebwLXQzJwxxmThSqkwAckO7/aw
 ZO+ziOXinTvU9mmCIbgZSCGrHXIrTBYgWRvmlnaQ+ssu+OIFcxS3BvP5lEzkFrLA3Y
 u3Sx+1gdmw43NUajbpSF6Iho9R/KboZyP67DQvWKbGC5iJo/JbwI/Pxd1l83z6rBE8
 tL1xrH3JshPNA==
Date: Tue, 9 Jul 2024 10:30:39 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Valentin Caron <valentin.caron@foss.st.com>
Message-ID: <172054263823.3749406.8767907445542011155.robh@kernel.org>
References: <20240708153434.416287-1-valentin.caron@foss.st.com>
 <20240708153434.416287-2-valentin.caron@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240708153434.416287-2-valentin.caron@foss.st.com>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/2] dt-bindings: rtc: stm32: introduce
 new st, stm32mp25-rtc compatible
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


On Mon, 08 Jul 2024 17:34:33 +0200, Valentin Caron wrote:
> Introduce new st,stm32mp25-rtc compatible. It is based on st,stm32mp1-rtc.
> 
> Difference is that stm32mp25 soc implements a triple protection on RTC
> registers:
> - Secure bit based protection
> - Privileged context based protection
> - Compartment ID filtering based protection
> This driver will now check theses configurations before probing to avoid
> exceptions and fake reads on register.
> 
> Link: https://www.st.com/resource/en/reference_manual/rm0457-stm32mp25xx-advanced-armbased-3264bit-mpus-stmicroelectronics.pdf#page=4081
> Signed-off-by: Valentin Caron <valentin.caron@foss.st.com>
> ---
>  Documentation/devicetree/bindings/rtc/st,stm32-rtc.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
