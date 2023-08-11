Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C8921778BB2
	for <lists+linux-stm32@lfdr.de>; Fri, 11 Aug 2023 12:16:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 674C3C6B468;
	Fri, 11 Aug 2023 10:16:50 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 90839C6B443
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Aug 2023 10:16:48 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2727460FF5;
 Fri, 11 Aug 2023 10:16:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C666C433C7;
 Fri, 11 Aug 2023 10:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1691749006;
 bh=p0874zC3P/4HkNA+wVRJkLg0l75K8zpw30iVncdc3hA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZnbEJxBBvvyRVrrgqaUgZZHjXTQaaVvRcmnG+Kw6tY0jW8JMLnEntCAan1/Jv/IwK
 7S2gJZ1TdIKGrRy6ZexEARpp7JOigKWp2EyHIPnSQm30nHkGgawvRoW4h7JlKMa6bW
 B9VZPDYj7V1mJVZxUoasRspo2Tk97FQH9M1olZHQ=
Date: Fri, 11 Aug 2023 12:16:44 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Message-ID: <2023081117-sprout-cruncher-862c@gregkh>
References: <20230811100731.108145-1-gatien.chevallier@foss.st.com>
 <20230811100731.108145-2-gatien.chevallier@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230811100731.108145-2-gatien.chevallier@foss.st.com>
Cc: ulf.hansson@linaro.org, linux-iio@vger.kernel.org, catalin.marinas@arm.com,
 edumazet@google.com, Oleksii_Moisieiev@epam.com,
 krzysztof.kozlowski+dt@linaro.org, linux-phy@lists.infradead.org,
 will@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 peng.fan@oss.nxp.com, herbert@gondor.apana.org.au,
 Frank Rowand <frowand.list@gmail.com>, hugues.fruchet@foss.st.com,
 lee@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org,
 andi.shyti@kernel.org, alsa-devel@alsa-project.org, richardcochran@gmail.com,
 robh+dt@kernel.org, linux-serial@vger.kernel.org, mchehab@kernel.org,
 linux-arm-kernel@lists.infradead.org, arnd@kernel.org, netdev@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, vkoul@kernel.org,
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org, davem@davemloft.net,
 jic23@kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [Linux-stm32] [IGNORE][PATCH v4 01/11] dt-bindings: Document
 common device controller bindings
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

On Fri, Aug 11, 2023 at 12:07:21PM +0200, Gatien Chevallier wrote:
> From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
> 
> Introducing of the common device controller bindings for the controller
> provider and consumer devices. Those bindings are intended to allow
> divided system on chip into multiple domains, that can be used to
> configure hardware permissions.
> 
> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> [Gatien: Fix typos and YAML error]
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> ---
> 
> Changes in V4: 
> 	Corrected typos and YAML errors	

Why are we supposed to ignore the first patch in this series, but pay
attention to the 10 after this that depend on it?

totally confused,

greg k-h
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
