Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB9B8A2660
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Apr 2024 08:21:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7E122C6DD66;
	Fri, 12 Apr 2024 06:21:59 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 889C6C69067
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Apr 2024 06:21:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id F2D03CE3180;
 Fri, 12 Apr 2024 06:21:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17F23C2BBFC;
 Fri, 12 Apr 2024 06:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712902916;
 bh=EB0K1UYoXpbb/oyBemibvLoZc40JGLrpFaRORwNFFUA=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=uiNb6p15zFuDethSow2qeOXwb/YWAkR2w0U0jfRJYk7hJK/NjnGMpDgEvYMJyTXXE
 AkVaZDKWHQ6QLrXYNhY0xreVHmL8PuGcsfM1AWbcji4HkCT9zDTA8BQR4RzehK09aR
 CEQ51glnyZULOSjfyE6io2tFLqfDe+wtPwNAOOsHjeT8VjNI8FDozoV1uw2wABX2A4
 uPVVavraGMr/hTB0ycKPFwpJWdzUV+SyvDgtMyaZG9iiUwvQKl3Bgs1aHxcGdZv2IP
 LpVE9vVRMbY4iyjkbO3KpeEmiJYBl2E/1TrZ3XH1uOr+tH54xlh+8aywwTO0tNxscV
 MsyhyvZu9Bavg==
Message-ID: <75d2aa0022d334d17c5ecf51f0e7684f.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240411092453.243633-3-gabriel.fernandez@foss.st.com>
References: <20240411092453.243633-1-gabriel.fernandez@foss.st.com>
 <20240411092453.243633-3-gabriel.fernandez@foss.st.com>
From: Stephen Boyd <sboyd@kernel.org>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>
Date: Thu, 11 Apr 2024 23:21:53 -0700
User-Agent: alot/0.10
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v11 2/4] dt-bindings: clocks: stm32mp25:
	add description of all parents
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

Quoting gabriel.fernandez@foss.st.com (2024-04-11 02:24:51)
> From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> 
> RCC driver uses '.index' to define all parent clocks instead '.names'
> because the use of a name to define a parent clock is prohibited.
> This is ABI change, but the RCC driver has not yet merged, unlike all
> others drivers besides Linux.
> 
> Fixes: b5be49db3d47 ("dt-bindings: stm32: add clocks and reset binding for stm32mp25 platform")
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Applied to clk-next
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
