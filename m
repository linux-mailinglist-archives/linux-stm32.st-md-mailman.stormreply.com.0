Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D99A392F25C
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Jul 2024 00:56:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 80E8FC6DD9D;
	Thu, 11 Jul 2024 22:56:56 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 184BAC6DD66
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Jul 2024 22:56:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E9F3A61F1B;
 Thu, 11 Jul 2024 22:56:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CB1DC116B1;
 Thu, 11 Jul 2024 22:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1720738607;
 bh=wED/ceXj3SCfyfRABZxVMDXqp+ySf1JiZO58sZxJTvY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PgIrD0ANTFLW/WvPS/Q/nCg9ViROWv8tS/RbiRZKKzbOvPTc2DERFZJIsYS/5y1ig
 ncu4PDANpIg7Cfm166EcrdSLVi3P88jWnCSZVcEo/5JZlG98SOC+OdYxdD8w9qFO8x
 1OXTq58n0B2dHgw0XKAW+mmMq2ZKcA14Zet9UL99KzLZRaPy8aouO0wUnyYVcsbsDr
 opiEFgelizNv8fnOgoS8UpHjeJzYYJaBWYDaffzYVS2Nd0wye95Xdk5Aocl1cfX4Ps
 h8OTzOjOoIGRlQezULAWjuSsYQqVzzNDGrUigniYN+5NNS1Vqo+2opMgkthv6WCwyr
 4XwrHaux5pwfQ==
Date: Thu, 11 Jul 2024 16:56:46 -0600
From: Rob Herring <robh@kernel.org>
To: Valentin Caron <valentin.caron@foss.st.com>
Message-ID: <20240711225646.GA3270567-robh@kernel.org>
References: <20240711140843.3201530-1-valentin.caron@foss.st.com>
 <20240711140843.3201530-2-valentin.caron@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240711140843.3201530-2-valentin.caron@foss.st.com>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/4] dt-bindings: rtc: stm32: describe
	pinmux nodes
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

On Thu, Jul 11, 2024 at 04:08:40PM +0200, Valentin Caron wrote:
> STM32 RTC is capable to handle 3 specific pins of the soc (out1, out2,
> out2_rmp) and to outputs 2 signals (LSCO, alarm-a).
> 
> This feature is configured thanks to pinmux nodes and pinctrl framework.
> This feature is available with compatible st,stm32mp1-rtc and
> st,stm32mp25-rtc only.
> 
> Signed-off-by: Valentin Caron <valentin.caron@foss.st.com>
> ---
>  .../devicetree/bindings/rtc/st,stm32-rtc.yaml | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/rtc/st,stm32-rtc.yaml b/Documentation/devicetree/bindings/rtc/st,stm32-rtc.yaml
> index 7a0fab721cf1..09221c2f8a0c 100644
> --- a/Documentation/devicetree/bindings/rtc/st,stm32-rtc.yaml
> +++ b/Documentation/devicetree/bindings/rtc/st,stm32-rtc.yaml
> @@ -53,6 +53,28 @@ properties:
>        override default rtc_ck parent clock phandle of the new parent clock of rtc_ck
>      maxItems: 1
>  
> +patternProperties:
> +  "^rtc-[a-z]*-[0-9]+$":

rtc--123 is valid? "*" should be "+"

Otherwise,

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
