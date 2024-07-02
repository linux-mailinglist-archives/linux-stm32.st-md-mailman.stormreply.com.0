Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C5FAD91ED98
	for <lists+linux-stm32@lfdr.de>; Tue,  2 Jul 2024 06:04:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7AF73C6DD9E;
	Tue,  2 Jul 2024 04:04:37 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6635CC6C820
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Jul 2024 04:04:30 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 106C688709;
 Tue,  2 Jul 2024 06:04:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1719893069;
 bh=5l+txb3Dnuz4QsOchPdwezW23KBAkdyYaoeSLye0aI8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=gdYjL0u37lbWodeIcSL9Fgh43Tb+lsDHX4N4aoEplueyCP3MM1S8sMgW7I9E0RjM8
 wvU84e5tdfgOobgXVdSWfVlltkzXePtL3MkqLpdpYL78nlhAMLPLv1Sr2OzR2pvV7g
 JRPs+VOdfBwufRYjMPdPZZi6m5gSEdyMiVzhkmUrIr1iZYlRx+Z/Mw66tLWFwpn/PZ
 tsPp+TzQN5v+usSIowW2QL21fQiBQsIGlmhb4zNEgEPCeRAOkN+IvMF5ZrgAFxgev3
 bdz6/dSBSJaDqwmXe7MrdWPKlbEMyAfZODtu8unYw0tBlRvZQtpzX3M1PXq2q+MfBd
 T4y/TBkVZ6pMQ==
Message-ID: <cc492f1a-c2f5-438e-a28a-7900cde6f073@denx.de>
Date: Tue, 2 Jul 2024 04:43:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Rob Herring (Arm)" <robh@kernel.org>
References: <20240629171100.20285-1-marex@denx.de>
 <171985715690.313627.4404278514791505125.robh@kernel.org>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <171985715690.313627.4404278514791505125.robh@kernel.org>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 kernel@dh-electronics.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: Add ethernet MAC nvmem
 cells to DH STM32MP13xx DHCOR DHSBC board
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

On 7/1/24 8:10 PM, Rob Herring (Arm) wrote:
> 
> On Sat, 29 Jun 2024 19:10:30 +0200, Marek Vasut wrote:
>> Describe ethernet MAC address nvmem cells in DH STM32MP13xx DHCOR DHSBC
>> board DT. The MAC address can be fused in BSEC OTP fuses and used to set
>> up MAC address for both ethernet MACs on this board.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> ---
>> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
>> Cc: Christophe Roullier <christophe.roullier@foss.st.com>
>> Cc: Conor Dooley <conor+dt@kernel.org>
>> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
>> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
>> Cc: Rob Herring <robh@kernel.org>
>> Cc: devicetree@vger.kernel.org
>> Cc: kernel@dh-electronics.com
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-stm32@st-md-mailman.stormreply.com
>> ---
>>   arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dts | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
> 
> 
> My bot found new DTB warnings on the .dts files added or changed in this
> series.
> 
> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> are fixed by another series. Ultimately, it is up to the platform
> maintainer whether these warnings are acceptable or not. No need to reply
> unless the platform maintainer has comments.
> 
> If you already ran DT checks and didn't see these error(s), then
> make sure dt-schema is up to date:
> 
>    pip3 install dtschema --upgrade
> 
> 
> New warnings running 'make CHECK_DTBS=y st/stm32mp135f-dhcor-dhsbc.dtb' for 20240629171100.20285-1-marex@denx.de:
> 
> arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dtb: ethernet@5800a000: Unevaluated properties are not allowed ('interrupt-names', 'interrupts-extended', 'mdio', 'nvmem-cell-names', 'nvmem-cells', 'phy-handle', 'phy-mode', 'snps,axi-config', 'snps,mixed-burst', 'snps,pbl', 'snps,tso', 'stmmac-axi-config' were unexpected)
> 	from schema $id: http://devicetree.org/schemas/net/stm32-dwmac.yaml#
> arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dtb: ethernet@5800e000: Unevaluated properties are not allowed ('interrupt-names', 'interrupts-extended', 'mdio', 'nvmem-cell-names', 'nvmem-cells', 'phy-handle', 'phy-mode', 'snps,axi-config', 'snps,mixed-burst', 'snps,pbl', 'snps,tso', 'stmmac-axi-config' were unexpected)
> 	from schema $id: http://devicetree.org/schemas/net/stm32-dwmac.yaml#

I can't seem to be able to reproduce it locally , even with 
dtschema/master updated right now .

Looking at the bindings, net/stm32-dwmac.yaml does have allof-ref to 
snps,dwmac.yaml which has allof-ref to ethernet-controller.yaml , which 
does list the nvmem-cells/nvmem-cell-names properties .

What am I missing here ?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
