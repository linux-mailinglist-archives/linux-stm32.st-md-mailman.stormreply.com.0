Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A32DF88F032
	for <lists+linux-stm32@lfdr.de>; Wed, 27 Mar 2024 21:34:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 694D9C6DD96;
	Wed, 27 Mar 2024 20:34:52 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7C057C6DD93
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Mar 2024 20:34:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 610936168D;
 Wed, 27 Mar 2024 20:34:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 715A3C433F1;
 Wed, 27 Mar 2024 20:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711571690;
 bh=pKWcFje0siVhJjbTaTMsms5pCrvdPMtxOJIML+RXQSM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=P7L/nt160fnk7miw88fq0azo3Io+V1Ovj3mvJYo/gwVBkJm0VzmXg5xfEKOAqfhKw
 5VGhhm4uz17CxTrwNn+1nYRgpwKaXKVkep9UjTvmGHVWxxKz/qlR7hxvq0QXS6HJ28
 9DJwf4UwqIiZqAAKfb8dpfXcesViXw4DMYZTtUCj2miIw/BweVV8XbRjy0wN8NdbQV
 ENuwIGodp4qX2AqJ6fNnpRksE0+ekCl73XxG6u+vbIxLj3LMlkDbR3kPXNmX7AQu1E
 euYDdJ00mQWcTB3uXc31ZOL+RvafZ138wzQ3KeXSF1f7kZtJw/r/FHpMP4mPZHqYC5
 wYv75FWLLUPJA==
Date: Wed, 27 Mar 2024 21:34:46 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <ygjktie5isba7fzarq4agm6gh363ysm36czhfmvwlwozcs2fkn@c7z32o2lrldz>
References: <20240326-module-owner-amba-v1-0-4517b091385b@linaro.org>
 <20240326-module-owner-amba-v1-14-4517b091385b@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240326-module-owner-amba-v1-14-4517b091385b@linaro.org>
Cc: kvm@vger.kernel.org,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-i2c@vger.kernel.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Herbert Xu <herbert@gondor.apana.org.au>, Russell King <linux@armlinux.org.uk>,
 linux-input@vger.kernel.org, Mike Leach <mike.leach@linaro.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, coresight@lists.linaro.org,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Olivia Mackall <olivia@selenic.com>, Michal Simek <michal.simek@amd.com>,
 linux-arm-kernel@lists.infradead.org,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, linux-crypto@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, dmaengine@vger.kernel.org,
 James Clark <james.clark@arm.com>
Subject: Re: [Linux-stm32] [PATCH 14/19] i2c: nomadik: drop owner assignment
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

Hi Krzysztof,

On Tue, Mar 26, 2024 at 09:23:44PM +0100, Krzysztof Kozlowski wrote:
> Amba bus core already sets owner, so driver does not need to.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Andi Shyti <andi.shyti@kernel.org>

Andi
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
