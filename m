Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5759F992E55
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Oct 2024 16:08:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 04CDDC7128A;
	Mon,  7 Oct 2024 14:08:42 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A9F00C71287
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Oct 2024 14:08:38 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id DC1D888D25;
 Mon,  7 Oct 2024 16:08:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1728310117;
 bh=k0RGQ4a+fyExLgkPRtc1Mu++azcL+u8A2VeZz0bllTE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=KAtGW40EpkCgtUeOQ/i0ajt2U+XnSDbBf5Y2mnt++nrxmseacif1+14StVXjffw+i
 BrgA/aUDHnTUlYxuyiK008bmZG3Xtl8OqGirXwh9Wq16nzfUPrfUBjhzXFXZdF1vgW
 sxQ0G1KsbobFt4Y4lwRYkw0upGCGoiWj2lyW/0mlagFXAmRClB584pmusgMfjW/iOz
 xi3eOaIJhsiQEiWdF2UG27HHjtv3Znd/17EYChZKIsjByqhTYxZ1oHyetTTwqk5Wiu
 6Fk7lqH5SsE7qKYd/esThqEcgMgoETe5cM2GkKB2G4J45/mS+6hkQvS/MHbD1z8Daa
 /QYun9jDQl6IQ==
Message-ID: <869fe073-c20f-4611-ae84-8268a890a12c@denx.de>
Date: Mon, 7 Oct 2024 15:55:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Gatien Chevallier <gatien.chevallier@foss.st.com>,
 Olivia Mackall <olivia@selenic.com>, Herbert Xu
 <herbert@gondor.apana.org.au>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20241007132721.168428-1-gatien.chevallier@foss.st.com>
 <20241007132721.168428-5-gatien.chevallier@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20241007132721.168428-5-gatien.chevallier@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: devicetree@vger.kernel.org, Yang Yingliang <yangyingliang@huawei.com>,
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 4/4] arm64: dts: st: add RNG node on
	stm32mp251
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

On 10/7/24 3:27 PM, Gatien Chevallier wrote:
> Update the device-tree stm32mp251.dtsi by adding the Random Number
> Generator(RNG) node.
> 
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> ---
>   arch/arm64/boot/dts/st/stm32mp251.dtsi | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
> index 1167cf63d7e8..40b96353a803 100644
> --- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
> +++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
> @@ -493,6 +493,16 @@ uart8: serial@40380000 {
>   				status = "disabled";
>   			};
>   
> +			rng: rng@42020000 {
> +				compatible = "st,stm32mp25-rng";
> +				reg = <0x42020000 0x400>;
> +				clocks = <&clk_rcbsec>, <&rcc CK_BUS_RNG>;
> +				clock-names = "rng_clk", "rng_hclk";
> +				resets = <&rcc RNG_R>;
> +				access-controllers = <&rifsc 92>;
It would be good if someone finally sorted the access-controllers 
property in all the MP2 nodes alphabetically ; that's separate 
patch/series though.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
