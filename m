Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4868D2688
	for <lists+linux-stm32@lfdr.de>; Tue, 28 May 2024 22:51:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C00B1C6B47E;
	Tue, 28 May 2024 20:51:50 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A89D5C640E5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 May 2024 20:51:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 1771CCE16AA;
 Tue, 28 May 2024 20:51:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21F89C3277B;
 Tue, 28 May 2024 20:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716929500;
 bh=KZGpRLvaGzf5eRf8gE84byFFzEexl2hoAhLMuVopf/E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=e1QMPQjcETWRPrTbsNK9M1kGgrJWF5yoAOtFYkq8d0Kz6qzlSszf5ANtnbA0e0Wb4
 BUnP/7ns7f9lUu+3MJNpc0RkqfFS3mzfsbvDyzZG5unXDIzx7odlqK/vqrIocX845X
 yhSNfEF4u6Dcwep1Q9yKEFqmf0pbjQbFFLIrkBShF/rP/Iy3fM14PqlPER5XMIY3Uc
 NrDHhTUrAJ0lsRNWvDvLz6RZTZfzOHvvy4w3i0/SgMe8UJUlFnW+EeDCq0Ppo3jDiv
 /6uMYFLzqhr5i55BN44xu41syeiY55QjfH+PsZRWVOoo6vMraL+dFiOEAfsE2iKP/w
 gaiARhU5SPtIQ==
Date: Tue, 28 May 2024 15:51:39 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Message-ID: <171692949668.1975521.10425255267930932407.robh@kernel.org>
References: <20240523154208.2457864-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240523154208.2457864-1-robh@kernel.org>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: arm: stm32: st,
 mlahb: Drop spurious "reg" property from example
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


On Thu, 23 May 2024 10:42:07 -0500, Rob Herring (Arm) wrote:
> "reg" is not documented nor used for st,mlahb, so drop it from the
> example to fix the warning:
> 
> Documentation/devicetree/bindings/arm/stm32/st,mlahb.example.dtb: ahb@38000000: Unevaluated properties are not allowed ('reg' was unexpected)
>         from schema $id: http://devicetree.org/schemas/arm/stm32/st,mlahb.yaml#
> 
> Since "reg" is dropped, the unit-address must be as well.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/arm/stm32/st,mlahb.yaml | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 

Applied, thanks!

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
