Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD92B2BAF6
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Aug 2025 09:42:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 80A81C3F945;
	Tue, 19 Aug 2025 07:42:26 +0000 (UTC)
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 20DCAC3F93A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Aug 2025 14:58:54 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4c5G7b537qz9t7s;
 Mon, 18 Aug 2025 16:58:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1755529131;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=It6WsGpfjWI4leoXs05vkzx9/2tYzuPt+sPubFhfa+0=;
 b=ZohjIzNQt2wCVmQYGFKOP73CFbd6Ia0/eaGon8+3QyJWF1qEjO3Ww3UY5k/frrG/RiYlHC
 Gr/S+lyczLT2Knd0qczhXn2tzrfObKvXItL8eQzz7O9RPyaQPSIUX7KqRjmRAiS8+ojZVD
 ZoWeeH3G1LHZgkLl4EMyUwrAnIXGI7B7xOJovQFn/i87Jqfbt2iUsSGfvI3M/CKVSe7Xbn
 TntQ2bHdqBtkddu2hZyQh9+9v0E5mC2zqzqyc1zXrro52VjACsNYWZdaQ6tlahOzvvTLJQ
 dJsvfcKTHPaAo5ex3L0T6ZMJjiunz6u30bzxbdbIfeZeyGk72zL0/3jinC4YeA==
Message-ID: <d1510b98-5094-4eec-b81b-55d0ba3e1b4a@mailbox.org>
Date: Mon, 18 Aug 2025 16:58:47 +0200
MIME-Version: 1.0
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@dh-electronics.com
References: <20250818143730.244379-2-krzysztof.kozlowski@linaro.org>
 <388e6f81-383b-4b39-9b75-8d2cdbf95d37@mailbox.org>
 <259e72c0-b69a-42d4-aec5-ad8a6e03d416@kernel.org>
 <651df530-797a-45e1-b199-917deda33222@kernel.org>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <651df530-797a-45e1-b199-917deda33222@kernel.org>
X-MBO-RS-META: 6nsdwhcsnfm3nimas3f6jx49wjpdyxzm
X-MBO-RS-ID: e1973190b65b1be2432
X-Mailman-Approved-At: Tue, 19 Aug 2025 07:42:25 +0000
Subject: Re: [Linux-stm32] [PATCH] arm: dts: stm32: Drop redundant
	status=okay
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

On 8/18/25 4:56 PM, Krzysztof Kozlowski wrote:
> On 18/08/2025 16:51, Krzysztof Kozlowski wrote:
>> On 18/08/2025 16:45, Marek Vasut wrote:
>>> On 8/18/25 4:37 PM, Krzysztof Kozlowski wrote:
>>>> Device nodes are enabled by default, so remove confusing or duplicated
>>>> enabling of few nodes.  No practical impact, verified with dtx_diff.
>>> I assume the "no practical impact" means DTs are identical before/after
>>> this patch ? If yes,
>>
>>
>> No, DTS cannot be identical in this case because one had status, new one
>> does not have. Practical impact means... visible impact in practice. How
>> to say it more clearly?
> To illustrate: this is "no practical impact":
> 
> 
> --- dts-old/st/stm32mp157c-dhcom-picoitx.dtb
> +++ dts-new/st/stm32mp157c-dhcom-picoitx.dtb
> @@ -691,14 +691,12 @@
>   					interrupt-controller;
>   					interrupts-extended = <0x49 0x00
>   					reg = <0x33>;
> -					status = "okay";
Sorry, yes, this ^ is what I meant and obviously wrote too fast and too 
inaccurately. My RB still stands. Thanks
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
