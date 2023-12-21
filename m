Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0632881C0A5
	for <lists+linux-stm32@lfdr.de>; Thu, 21 Dec 2023 23:01:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BFE8BC6B477;
	Thu, 21 Dec 2023 22:01:17 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DCF4AC6B46B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Dec 2023 22:01:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 8AEDAB821CD;
 Thu, 21 Dec 2023 22:01:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83B2EC433C8;
 Thu, 21 Dec 2023 22:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1703196075;
 bh=Mu966ENzqAzL5zVpXkX0okIrHoGjPvhJ8rqTFtXNsxY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=S2O8QXVKb3ZUGIFC0OpGxRRynfGqmj+gp7FTRV7NaqGkWM4IE05+Gqd4cUFQEQYL4
 wG8CTj9V0h17GQd4DGWTQ/ID88OjucDGd4K+yDcA/dII3YbqJZwo8/WEGbw+0/BCww
 uvzyeWwpnjNf8BE09DbyfTe4eatwQUCKS88qqoFVuq4Fb0xHA3dCIj/qvA6T9heVw1
 XMReR5iaSQzexSnB5wS2XhpBfBxtK/INvsJIBmzcaV4NgQ/FFgNRrpnmVxI9gmQ0P9
 68dzeUi++eubqSxVn0qTA5U4n6uBSTfo0lld+kP5+b9rRlCVwpuJxK42akZsycfsTr
 Hh/bbpwOTtWRw==
Received: (nullmailer pid 166032 invoked by uid 1000);
 Thu, 21 Dec 2023 22:01:11 -0000
Date: Thu, 21 Dec 2023 16:01:11 -0600
From: Rob Herring <robh@kernel.org>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Message-ID: <170319607084.165973.14576693798188042387.robh@kernel.org>
References: <20231212152356.345703-1-gatien.chevallier@foss.st.com>
 <20231212152356.345703-7-gatien.chevallier@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231212152356.345703-7-gatien.chevallier@foss.st.com>
Cc: ulf.hansson@linaro.org, linux-iio@vger.kernel.org, catalin.marinas@arm.com,
 edumazet@google.com, Oleksii_Moisieiev@epam.com,
 krzysztof.kozlowski+dt@linaro.org, linux-phy@lists.infradead.org,
 Frank Rowand <frowand.list@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, peng.fan@oss.nxp.com,
 lars@metafoo.de, herbert@gondor.apana.org.au, hugues.fruchet@foss.st.com,
 lee@kernel.org, linux-serial@vger.kernel.org, kuba@kernel.org,
 pabeni@redhat.com, wg@grandegger.com, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, conor+dt@kernel.org, will@kernel.org,
 richardcochran@gmail.com, andi.shyti@kernel.org, mkl@pengutronix.de,
 mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, arnd@kernel.org,
 rcsekar@samsung.com, netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, vkoul@kernel.org, robh+dt@kernel.org,
 linux-crypto@vger.kernel.org, gregkh@linuxfoundation.org,
 dmaengine@vger.kernel.org, alsa-devel@alsa-project.org, davem@davemloft.net,
 jic23@kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v8 06/13] of: property: fw_devlink: Add
 support for "access-controller"
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


On Tue, 12 Dec 2023 16:23:49 +0100, Gatien Chevallier wrote:
> Allows tracking dependencies between devices and their access
> controller.
> 
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> ---
> 
> Changes in V6:
>     	- Renamed access-controller to access-controllers
> 
> Changes in V5:
> 	- Rename feature-domain* to access-control*
> 
> Patch not present in V1
> 
>  drivers/of/property.c | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
