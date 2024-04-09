Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3BD89D88A
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Apr 2024 13:53:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C92CEC7128A;
	Tue,  9 Apr 2024 11:53:08 +0000 (UTC)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 11F4CC6C841
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Apr 2024 11:53:06 +0000 (UTC)
Received: from [192.168.68.112]
 (ppp118-210-182-70.adl-adc-lon-bras34.tpg.internode.on.net [118.210.182.70])
 by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 6D6E72012B;
 Tue,  9 Apr 2024 19:53:01 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=codeconstruct.com.au; s=2022a; t=1712663583;
 bh=uFtB/lSFtsJF9yk9iDLSRuCwagX/ZJnnVfsrEr8ZsXU=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References;
 b=NTPcbofBd9m/9hOn+Z9Bbo9pjqBPAKGNnyTT2yNWOmCgmIADn5G3XCAFCJPIRF0EZ
 wn3wJbQ2YDXaggC3yhum2A2+giKMYEreMFZ3IQ+EVaw38aecyEs4RVQU77UWpU0433
 kP+VfZQ6pmC7XW6Li7H4vFIM0uUQo4mfNRi+M5e6wkdqFInWncdaMCwDAE4350u379
 J29QgMlWXGnOgaNgRot38jEKMSleP8E7quRZUxvMe8W0yvq0jNmkAioSicj5FHWzo5
 FQ9Qh9QojP2CJJKGlV0YDTMzuIBb/t7BTpQ2LwTs6Sc1ZHS5ShlxlFAzPltO94hZpX
 lCVopsqSOhjJg==
Message-ID: <4adaae76f71c0f1f84ae10de68ce9837f1057463.camel@codeconstruct.com.au>
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Vladimir
 Zapolskiy <vz@mleia.com>, Joel Stanley <joel@jms.id.au>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Tue, 09 Apr 2024 21:23:00 +0930
In-Reply-To: <20240408-rtc_dtschema-v1-5-c447542fc362@gmail.com>
References: <20240408-rtc_dtschema-v1-0-c447542fc362@gmail.com>
 <20240408-rtc_dtschema-v1-5-c447542fc362@gmail.com>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 5/9] dt-bindings: rtc: rtc-aspeed: move to
	trivial-rtc
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

On Mon, 2024-04-08 at 17:53 +0200, Javier Carrasco wrote:
> The RTCs documented in this binding require a compatible, a reg
> and a single interrupt, which make them suitable for a direct
> conversion into trivial-rtc.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>

Thanks,

Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
