Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 629EEA43E85
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Feb 2025 13:00:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1417BC78039;
	Tue, 25 Feb 2025 12:00:21 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 49BD4C7801F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Feb 2025 12:00:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 26D645C7126;
 Tue, 25 Feb 2025 11:59:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11974C4CEDD;
 Tue, 25 Feb 2025 12:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740484817;
 bh=zK/7OWHlisi7f+Mu3OhLXwcUr3ILVz4O5JpSU16Ic/w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oCgI0O+AW1ufry6XCxhLZnBkO/EIRWBB9+fpXUvOoB2Og05FcNmNF6XsmNZAITIJZ
 IthKvYlg4qNweF2PF4+CEB5YnBgjJS/x0WrBc09DkHfeuwtV8piSExb4CuzuAhqA6s
 BlqEbi3dTM4B/0g8F8qqM/UoXp9cjyDDJCyctexQV3P0AUlDQAo59UcJiR1LA92GUE
 isP9t1+26z50TFacj3QTYLD95vbEp3OrQbf6qiIIUvyM6tIb2rqWCJa5yRFZuSNQgg
 MYJpM8DrGg7spkhykh3AhAZXDbslZ3csNxTKimUk/GCojokiG9ifHBIm3B8FJ6YynK
 DnG0GCOY4d4gg==
Date: Tue, 25 Feb 2025 13:00:14 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <20250225-vague-tuscan-shark-ebec44@krzk-bin>
References: <20250224180150.3689638-1-fabrice.gasnier@foss.st.com>
 <20250224180150.3689638-8-fabrice.gasnier@foss.st.com>
 <f76a3a6c-795e-4fc8-905f-4655115ea99d@kernel.org>
 <696ac9eb-f223-4993-b288-b6c3e07f4ed7@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <696ac9eb-f223-4993-b288-b6c3e07f4ed7@foss.st.com>
Cc: robh@kernel.org, conor+dt@kernel.org, daniel.lezcano@linaro.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-iio@vger.kernel.org, catalin.marinas@arm.com, lee@kernel.org,
 linux-pwm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 ukleinek@kernel.org, linux-arm-kernel@lists.infradead.org, krzk+dt@kernel.org,
 will@kernel.org, tglx@linutronix.de, jic23@kernel.org, wbg@kernel.org
Subject: Re: [Linux-stm32] [PATCH 7/8] arm64: defconfig: enable STM32 LP
	timers drivers
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

On Tue, Feb 25, 2025 at 09:43:58AM +0100, Fabrice Gasnier wrote:
> On 2/25/25 08:48, Krzysztof Kozlowski wrote:
> > On 24/02/2025 19:01, Fabrice Gasnier wrote:
> >> Enable the STM32 timer drivers: MFD, counter, PWM and trigger as modules.
> >> Clocksource is a bool, hence set to y. These drivers can be used on
> >> STM32MP25.
> > 
> > 
> > Which upstream board? If you do not have upstream board, the defconfig
> > is pointless for us. It's not defconfig for your downstream forks.
> 
> Hi Krzysztof,
> 
> It's going to be used on stm32mp257f-dk and stm32mp257f-ev1 boards.

The defconfig commit should mention which upstream products use it.

> I can add the relevant DT for the(se) board(s) in next revision.

Does this mean there are no upstream users of this? Then this defconfig
change is no-op. We do not add enable things in defconfig just because
there is some downstream/fork using something. Defconfig is for our
(upstream) boards.

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
