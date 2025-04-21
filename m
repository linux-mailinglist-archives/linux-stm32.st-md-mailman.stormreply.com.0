Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5F6A95398
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Apr 2025 17:35:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 45A7CC7802F;
	Mon, 21 Apr 2025 15:35:50 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 680E0C7802E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Apr 2025 15:35:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 4AD63A4BD30;
 Mon, 21 Apr 2025 15:30:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8701DC4CEE4;
 Mon, 21 Apr 2025 15:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745249746;
 bh=CNcB+iCvJ2cwygcDuB+sL6/PpkRT2R0AC4Opt0P+wZY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=luyQ7B4ugsLZEkcEvRDvCYtKngIAPUNJ3ra/MclmXQCfCzUyYWSiOx+Dy26TaflBc
 wsJbDTLGaU+Tih4pdNOvoUFF1sRnUfymDhBzTz2hS2mQ05xXnBWsQLhRvtkrniFiYG
 1yN/i3lPVIvGF7sJ99p93/M/3sleWsqjYVnEehNgK8PtUgccpm2TIWs0l79w717x1L
 zmV2/fVl8itCllUUupT9VAegHm7JqlECG0Ko6gIA8wli9C2LBTar+dL4y2Jby1yBia
 Ha6aBTGC5rDWpd6NKC96Jth35B3XYN7sJdEfrlq0LVDo1mOO0nEho2gR9dyyEgebk0
 x9LI8aM3xSj0g==
Date: Mon, 21 Apr 2025 10:35:44 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <174524973711.2547826.10808274774618846859.robh@kernel.org>
References: <20250417151623.121109-1-daniel.lezcano@linaro.org>
 <20250417151623.121109-2-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250417151623.121109-2-daniel.lezcano@linaro.org>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, S32@nxp.com,
 linux-stm32@st-md-mailman.stormreply.com, Larisa.Grigore@nxp.com,
 linux-kernel@vger.kernel.org, krzysztof.kozlowski@linaro.org,
 tglx@linutronix.de, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 thomas.fossati@linaro.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 ghennadi.procopciuc@nxp.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v5 1/2] dt-bindings: timer: Add NXP System
	Timer Module
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


On Thu, 17 Apr 2025 17:16:18 +0200, Daniel Lezcano wrote:
> Add the System Timer Module description found on the NXP s32 platform
> and the compatible for the s32g2 variant.
> 
> Cc: Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
> Cc: Thomas Fossati <thomas.fossati@linaro.org>
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> ---
>  .../bindings/timer/nxp,s32g2-stm.yaml         | 64 +++++++++++++++++++
>  1 file changed, 64 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/timer/nxp,s32g2-stm.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
