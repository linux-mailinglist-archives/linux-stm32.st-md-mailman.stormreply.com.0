Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC5A50BD24
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Apr 2022 18:31:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F0EEAC6049A;
	Fri, 22 Apr 2022 16:31:28 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7B56DC60492
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Apr 2022 16:31:27 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 5D9918393B;
 Fri, 22 Apr 2022 18:31:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1650645087;
 bh=npaA7nQE0jiwRUKroXrJtuWWNquvHEJSFhCg7Tme/2Y=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=zrlOZLsbRDI4hjjBYxdokgfqY7vrd31TzSkQK0sh/ftx4qc6//bihFJ6WBk3cjL9m
 HtgZ6UqBhwTItSo05TdG99cpBKc93gYhPJoRALfIDMQcbwxSiOtxq5TxQMNHGVSVEP
 W0b0tknx/zfSyUY8CU67xGojcmDoUgpeHfX2LOUdPBcsB0VLQv5QETRDS68+uhUgX6
 rote6I1R+GJbe2e9fqT+U+ADgshslQ4pHPxjYJWAeiHKJCqbD2AiPEUtzLBwo0fmuT
 tYGvD3CZEnJ3fcRJ6noXNyN1zpbjy4gz3CgN5OaZL2sdkEjmG+FCcHGyLtd1feB7XV
 O49zIhZNbcCKg==
Message-ID: <dd48a7b5-ce08-5fb2-8236-8802ac91d827@denx.de>
Date: Fri, 22 Apr 2022 18:31:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: Alexandre Torgue <alexandre.torgue@foss.st.com>, arnd@arndb.de,
 robh+dt@kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 soc@kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
References: <20220422150952.20587-1-alexandre.torgue@foss.st.com>
 <20220422150952.20587-3-alexandre.torgue@foss.st.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20220422150952.20587-3-alexandre.torgue@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Cc: etienne.carriere@st.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/8] dt-bindings: clock: stm32mp1:
 describes clocks if "st, stm32mp1-rcc-secure"
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
> In case of "st,stm32mp1-rcc-secure" (stm32mp1 clock driver with RCC
> security support hardened), "clocks" and "clock-names" describe oscillators
> and are required.
> 
> Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
> 
> diff --git a/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml b/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml
> index 7a251264582d..bb0e0b92e907 100644
> --- a/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml
> @@ -58,14 +58,8 @@ properties:
>             - st,stm32mp1-rcc-secure
>             - st,stm32mp1-rcc
>         - const: syscon
> -
> -  clocks:
> -    description:
> -      Specifies the external RX clock for ethernet MAC.
> -    maxItems: 1
> -
> -  clock-names:
> -    const: ETH_RX_CLK/ETH_REF_CLK
> +  clocks: true
> +  clock-names: true

It looks like this should rather be a property than a compatible string 
-- the compatible string is used by the OS to determine which hardware 
is represented by a node, but here it is the same hardware in either 
case, "st,stm32mp1-rcc" and "st,stm32mp1-rcc-secure", it is still the 
same STM32MP1 RCC block, just configured differently by some bootloader 
stage.

So why not just add one-liner property of the RCC block like ?
st,rcc-in-secure-configuration
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
