Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FBD0CD2C3F
	for <lists+linux-stm32@lfdr.de>; Sat, 20 Dec 2025 10:34:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 324CCC8F26A;
	Sat, 20 Dec 2025 09:34:28 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2492BC87EDE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 20 Dec 2025 09:34:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0FEBF6001A;
 Sat, 20 Dec 2025 09:34:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94BCBC4CEF5;
 Sat, 20 Dec 2025 09:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1766223265;
 bh=eIyfjlT66Z7KZMioqTIcLRoNnJpoh8HRfoh4oqlm0qQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YnQt/gUrcZGskZZpV/DTEu6HW8WyedgO/EqRvoeRonOWfQsBHETo9w+wxcT6dTnl/
 85oKA7QtUYAb7Pwk5OAcifycQ8Un28CYwE/NWF0IQNBSuWJD69ZGhHKp2kWvffg0io
 ZqlmDXZTavHZ4yVTPPoQz5IhFNyrbjTwc0g2TZGlz5m9P4jITtkclkuQJyS7dVZVhE
 qbW4IAhsu35ysHSJf95hYvzee7Zle/RO2saQNwhaa0Fuq40CHZsu/2+TUiqjazqLH9
 WwCqoSKEMcKzZOUaqa6ZvrHZ55aLpHWZJAiAXf2G0ik2Xr21qz5/gI+vw89X1ENRXC
 PZ+q2+Ohx3wtQ==
Date: Sat, 20 Dec 2025 10:34:21 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>
Message-ID: <20251220-sociable-bald-partridge-7a67ab@quoll>
References: <20251219-stm32-mp2x-dcmipp-csi-power-domain-v1-0-a6edb2aa8154@foss.st.com>
 <20251219-stm32-mp2x-dcmipp-csi-power-domain-v1-4-a6edb2aa8154@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251219-stm32-mp2x-dcmipp-csi-power-domain-v1-4-a6edb2aa8154@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Hugues Fruchet <hugues.fruchet@foss.st.com>,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 4/6] dt-bindings: media: st: dcmipp: add
 'power-domains' property
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

On Fri, Dec 19, 2025 at 04:58:06PM +0100, Alain Volmat wrote:
> STM32 DCMIPP may be in a power domain which is the case for the
> STM32MP2x based boards.
> Allow a single 'power-domains' entry for STM32 DCMIPP.
> 
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> ---
>  Documentation/devicetree/bindings/media/st,stm32-dcmipp.yaml | 3 +++
>  1 file changed, 3 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
