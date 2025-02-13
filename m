Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E14A33A71
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Feb 2025 09:59:35 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B9188C78F89;
	Thu, 13 Feb 2025 08:59:34 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 118CFC78F6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Feb 2025 08:59:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id C29E4A41F62;
 Thu, 13 Feb 2025 08:57:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BEC9C4CED1;
 Thu, 13 Feb 2025 08:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739437166;
 bh=r0p8oF2o5KcUkeDQOtykeK1nddAxj6LGqMj0TRgl5jA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ViI3lAUREFpp/f9x3sPMkFSynOe0mj3ozQIXsJTK46uIC918sz+sLUgC/vW3fWzfp
 pwpy6dQFqjqv4ZKwQUucSN6JatWQYeqW6gZ+dxgT6ig0QpsC880dulVf1ubHP09+XF
 39mF8kkY+f/46pgPWBz1rorbdc8eKFsc58elem+vg9hvK3SlqGhRFxzMqhymxabWaR
 go5S7LXMaHe8fZdcTknA7fQFMJgryg/y3wnGdwoPHVbZqa+DWmJ4keEvYVrBzmodrY
 qu9lNlGXInZITWUutbzn/AHu3TfXtBEtXbKVmY1CZ3tU4EKOTs7ZP3OHJ1dBmQ5PQb
 59BYo9MfinClQ==
Date: Thu, 13 Feb 2025 09:59:22 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Amelie Delaunay <amelie.delaunay@foss.st.com>
Message-ID: <20250213-wooden-ibis-of-assurance-2b3622@krzk-bin>
References: <20250210-b4-stm32mp2_new_dts-v1-0-e8ef1e666c5e@foss.st.com>
 <20250210-b4-stm32mp2_new_dts-v1-9-e8ef1e666c5e@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250210-b4-stm32mp2_new_dts-v1-9-e8ef1e666c5e@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Richard Cochran <richardcochran@gmail.com>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Will Deacon <will@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 09/10] dt-bindings: stm32: document
	stm32mp215f-dk board
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

On Mon, Feb 10, 2025 at 04:21:03PM +0100, Amelie Delaunay wrote:
> Add new entry for stm32mp215-dk board.
> 
> Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
> ---
>  Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
