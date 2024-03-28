Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D7988F69C
	for <lists+linux-stm32@lfdr.de>; Thu, 28 Mar 2024 05:48:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1F223C6DD96;
	Thu, 28 Mar 2024 04:48:38 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3EAD9C6DD93
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 Mar 2024 04:48:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C356161697;
 Thu, 28 Mar 2024 04:48:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C99BC433F1;
 Thu, 28 Mar 2024 04:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711601315;
 bh=T1+Gn5e4VYEjFqV/RLqe57MQwZkWZMCO+i28LSmTCW0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YkeMPOjIXWWx66EEl/dw0rNG/pxCy0i2H6SKrLNgoHOTLnvRuHArUpUExtQQcxBy7
 GoYS2XE0k7HVR67XM+JALCmFCPWDM7kmahzkHEIEzwRWOhV2/MI5a37sv4y3VFjkTi
 TINQn5piO9369A/w84ydBXXtculBdHx708tFlIHfPEdpWfUmaJtvuetN1xQ+oS0V8f
 PdjK3vLjs6nX8iVtVJQgEZEhxhgFDkUnBf0z6aggyXKH5v4RQHthb2EQwGlfvZ6jyI
 1iNpnDpFFrB57jtVL5ByZwDhDNMLC31zg//72Qnyi+jvVIKWolcJ5xUB6b3q9xhztg
 fsDMAbPM2UPJA==
Date: Thu, 28 Mar 2024 10:18:30 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <ZgT2nj1FmvZPTLdi@matsya>
References: <20240326-module-owner-amba-v1-0-4517b091385b@linaro.org>
 <20240326-module-owner-amba-v1-16-4517b091385b@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240326-module-owner-amba-v1-16-4517b091385b@linaro.org>
Cc: kvm@vger.kernel.org,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-i2c@vger.kernel.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Herbert Xu <herbert@gondor.apana.org.au>, Russell King <linux@armlinux.org.uk>,
 linux-input@vger.kernel.org, Mike Leach <mike.leach@linaro.org>,
 Andi Shyti <andi.shyti@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 coresight@lists.linaro.org, Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Olivia Mackall <olivia@selenic.com>, Michal Simek <michal.simek@amd.com>,
 linux-arm-kernel@lists.infradead.org,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 dmaengine@vger.kernel.org, James Clark <james.clark@arm.com>
Subject: Re: [Linux-stm32] [PATCH 16/19] dmaengine: pl330: drop owner
	assignment
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

On 26-03-24, 21:23, Krzysztof Kozlowski wrote:
> Amba bus core already sets owner, so driver does not need to.

Acked-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
