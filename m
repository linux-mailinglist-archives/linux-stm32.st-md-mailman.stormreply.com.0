Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F14E250BCFB
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Apr 2022 18:28:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A5148C6049A;
	Fri, 22 Apr 2022 16:28:16 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 29405C6047D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Apr 2022 16:28:15 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id E06CA83C24;
 Fri, 22 Apr 2022 18:28:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1650644894;
 bh=INwp8oMerWYi06Suz1qgAIuvZ6S1fWPnARFOxZDAW5U=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=lXrPzegpTOHhGqTOXMfhlLGnd9fPJA03I8KrBtP9ipktmhdw6M9lRIFiFKJBX/2yW
 9zANnG9L9YM3apNusdIrEvKspBYODpzSN4gvPo2oqqolmD+617vCW6MBDwaNFrSoIk
 Rh/LqLtO4a1d0qfC81ilwrL80tPPElbU2GaTsiH4aoR3UgTAZbj8E5gb7RRqTorftj
 JaNWd3AwCFTtFHcgMmhdNEQxgMYRhfzhOOGT5zG27SjUcxr+1Rbg8ZwhOQQ8lQK3ZU
 5RCBolRIbUMsJs2NO1Au84vjFHVECt6RHJiZb5cXXP+34gDHOU3bbARXvVZ7Sd+FRS
 KQM633/QrXYGw==
Message-ID: <7d365d28-66ac-93d4-72b5-87d0b36ba017@denx.de>
Date: Fri, 22 Apr 2022 18:28:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: Alexandre Torgue <alexandre.torgue@foss.st.com>, arnd@arndb.de,
 robh+dt@kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 soc@kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
References: <20220422150952.20587-1-alexandre.torgue@foss.st.com>
 <20220422150952.20587-2-alexandre.torgue@foss.st.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20220422150952.20587-2-alexandre.torgue@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Cc: etienne.carriere@st.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/8] dt-bindings: rcc: Add optional
 external ethernet RX clock properties
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

On 4/22/22 17:09, Alexandre Torgue wrote:
> From: Marek Vasut <marex@denx.de>
> 
> Describe optional external ethernet RX clock in the DT binding
> to fix dtbs_check warnings like:
> 
> arch/arm/boot/dts/stm32mp153c-dhcom-drc02.dt.yaml: rcc@50000000: 'assigned-clock-parents', 'assigned-clock-rates', 'assigned-clocks', 'clock-names', 'clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> To: devicetree@vger.kernel.org
> Acked-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> 
> diff --git a/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml b/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml
> index a0ae4867ed27..7a251264582d 100644
> --- a/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml
> @@ -59,6 +59,14 @@ properties:
>             - st,stm32mp1-rcc
>         - const: syscon
>   
> +  clocks:
> +    description:
> +      Specifies the external RX clock for ethernet MAC.
> +    maxItems: 1
> +
> +  clock-names:
> +    const: ETH_RX_CLK/ETH_REF_CLK
> +
>     reg:
>       maxItems: 1
>   

Should this patch be part of this series, maybe this was re-sent by 
accident ?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
