Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF22D27E5A
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Jan 2026 20:01:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 793AFC8F28A;
	Thu, 15 Jan 2026 19:01:15 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 93679C8F285
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jan 2026 19:01:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9A5EA60130;
 Thu, 15 Jan 2026 19:01:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AD8AC116D0;
 Thu, 15 Jan 2026 19:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768503673;
 bh=kbDE4I87P0BVWxV+dNPffz+z+PAooAzag8YpvFHu/SE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SzQdeiORsmFVr3W2xywsEeCDLaLp7l83NC37XK+pawV9POmYfLWH7j3bTeU0/Foav
 vh3KegliIHHQqPQC4/HVSBz9oh44YoXok+Zq8VSDfurZS/7WO/zx/S/I1GSiUUctIO
 6flNjhHYBt2Fb1Z5VBbO3NHHw7hWix2ub+kbz85TC1pU9NwMAMj3c0bB9hzwGVMtLD
 Ql2MWpIaeLI0OfoVyaGtefaA1v6Z7yBh2QUZKJiDVJ5aJuHVV5ySbhy5v6F/3ren1G
 tXmVmDAkFmN1ucJGeMP611PUCSSQbtOiFLkca+AlQmh1q4SqNzELMGaW799fr/2ik+
 NgIMAR8w1heHA==
Date: Thu, 15 Jan 2026 13:01:12 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Message-ID: <176850367158.1015177.14103390194697312038.robh@kernel.org>
References: <20260114-debug_bus-v2-0-5475c7841569@foss.st.com>
 <20260114-debug_bus-v2-2-5475c7841569@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260114-debug_bus-v2-2-5475c7841569@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 =?iso-8859-1?Q?Cl=E9ment?= Le Goffic <legoffic.clement@gmail.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, linux-kernel@vger.kernel.org,
 Linus Walleij <linusw@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-gpio@vger.kernel.org, Leo Yan <leo.yan@linux.dev>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, coresight@lists.linaro.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, James Clark <james.clark@linaro.org>,
 jens.wiklander@linaro.org, linux-arm-kernel@lists.infradead.org,
 Mike Leach <mike.leach@linaro.org>
Subject: Re: [Linux-stm32] [PATCH v2 02/11] dt-bindings: pinctrl: document
 access-controllers property for stm32 HDP
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


On Wed, 14 Jan 2026 11:29:16 +0100, Gatien Chevallier wrote:
> HDP being functional depends on the debug configuration on the platform
> that can be checked using the access-controllers property, document it.
> 
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/st,stm32-hdp.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
