Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6067C74E3DB
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Jul 2023 04:05:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0F9A6C6B457;
	Tue, 11 Jul 2023 02:05:19 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 51D50C6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Jul 2023 02:05:17 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id F1B50865EC;
 Tue, 11 Jul 2023 04:05:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1689041116;
 bh=31PGUZax24WrOTK37t8M2dGkAy8n9G/Omujm0dET1H8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ho6d1bq1CXWSXLM8G5FeeL7cfg2sosg/d4fjH7tjFPjdBAj9GVYHOgxiBF+Bn0XiK
 Y4KPo6QwA0fqcgAeBMqZjPuh+YjSj7RfP/o1mzNJHL/ExiHeNxleYvWJYCIuzM4Xxb
 eZz5/Q6FVtUzCxckhvoMnRg04UQnnJW077T3dwVbFczeSE6QgeM1H2x3MgZAEeQ9Xa
 oej/AgtHCzNCfG7pSRAE/oUDPdIzqX60FurLqyauVbFQ9Cou6valh2cb82D2ZP/RoL
 RFO/05ph2RM4KuW2llswnRo0d0TCEJ6NRhzbFF59r2pM5mxJX85hOcsM+Oc1AVOVUh
 s38S6cxrb7NDg==
Message-ID: <42b1d80b-9cbc-16e2-73a4-ee8b67f5cb2b@denx.de>
Date: Tue, 11 Jul 2023 04:05:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: linux-arm-kernel@lists.infradead.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20230518011246.438097-1-marex@denx.de>
 <20230518011246.438097-4-marex@denx.de>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20230518011246.438097-4-marex@denx.de>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Richard Cochran <richardcochran@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, kernel@dh-electronics.com
Subject: Re: [Linux-stm32] [PATCH 4/5] ARM: dts: stm32: Add missing detach
 mailbox for DHCOR SoM
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

On 5/18/23 03:12, Marek Vasut wrote:
> Add missing "detach" mailbox to this board to permit the CPU to inform
> the remote processor on a detach. This signal allows the remote processor
> firmware to stop IPC communication and to reinitialize the resources for
> a re-attach.
> 
> Without this mailbox, detach is not possible and kernel log contains the
> following warning to, so make sure all the STM32MP15xx platform DTs are
> in sync regarding the mailboxes to fix the detach issue and the warning:
> "
> stm32-rproc 10000000.m4: mbox_request_channel_byname() could not locate channel named "detach"
> "
> 
> Fixes: 6257dfc1c412 ("ARM: dts: stm32: Add coprocessor detach mbox on stm32mp15x-dkx boards")
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Richard Cochran <richardcochran@gmail.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: kernel@dh-electronics.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> ---
>   arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi
> index 864960387e634..f0351f599a508 100644
> --- a/arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi
> +++ b/arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi
> @@ -227,8 +227,8 @@ &iwdg2 {
>   &m4_rproc {
>   	memory-region = <&retram>, <&mcuram>, <&mcuram2>, <&vdev0vring0>,
>   			<&vdev0vring1>, <&vdev0buffer>;
> -	mboxes = <&ipcc 0>, <&ipcc 1>, <&ipcc 2>;
> -	mbox-names = "vq0", "vq1", "shutdown";
> +	mboxes = <&ipcc 0>, <&ipcc 1>, <&ipcc 2>, <&ipcc 3>;
> +	mbox-names = "vq0", "vq1", "shutdown", "detach";
>   	interrupt-parent = <&exti>;
>   	interrupts = <68 1>;
>   	status = "okay";

Is anything blocking 1/5..4/5 (i.e. the duplication in each board DT) 
patches from being applied ?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
