Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC27809DF0
	for <lists+linux-stm32@lfdr.de>; Fri,  8 Dec 2023 09:14:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BA609C65E4F;
	Fri,  8 Dec 2023 08:14:13 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 16F47C03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Dec 2023 08:14:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9B305240006;
 Fri,  8 Dec 2023 08:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1702023251;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pNpi/zPSL34A2AILSCeVZYzKaahG4aVQbHxXFOHl7us=;
 b=NPzuoQm6kvXR/VoPhuUdv5yNuJM0Vve3pRFYfIM9SThj/jhXGhqq0IDkkRv2loRg/gUDD0
 FQ68ceCavrKcAlS55WZELcguty0dSsStu+4D+/5EbBnWgmMrnLtwbBdRF5ZzFrv0GY6Cgq
 wHeA1r/5LPGre48RbaZH6s+iJoFP209UeZJ1eBCfKFjREC2wU8+hFRrEZP71JWacsRYm/6
 TeWbEOmDu4BPfLJxbyaB9RWcKsGktVGmz5rV1IpnS09YNN+T4+r4sDu3VNU7STgvYgel9D
 i4uVk9ui9qJ1I2UylkvZZxj4zoDabACcKWwZfN9nWspkHZcpSNQ6hlj2cWC9WQ==
Date: Fri, 8 Dec 2023 09:14:08 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Jiangfeng Ma <Jiangfeng.Ma@synopsys.com>
Message-ID: <20231208091408.071680db@device.home>
In-Reply-To: <SA0PR12MB44138E48A245378CF54D2F9ED98AA@SA0PR12MB4413.namprd12.prod.outlook.com>
References: <SA0PR12MB44138E48A245378CF54D2F9ED98AA@SA0PR12MB4413.namprd12.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: maxime.chevallier@bootlin.com
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Johannes Zink <j.zink@pengutronix.de>,
 Jochen Henneberg <jh@henneberg-systemdesign.com>,
 Simon Horman <horms@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 "open list:STMMAC ETHERNET DRIVER" <netdev@vger.kernel.org>,
 James Li <James.Li1@synopsys.com>, open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>, Eric Dumazet <edumazet@google.com>,
 Shenwei Wang <shenwei.wang@nxp.com>,
 Martin McKenny <Martin.McKenny@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "Russell
 King  \(Oracle" <rmk+kernel@armlinux.org.uk>,
 "David S. Miller" <davem@davemloft.net>, "moderated list:ARM/STM32
 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
 Andrew Halaney <ahalaney@redhat.com>
Subject: Re: [Linux-stm32] [PATCH] net:stmmac:stmmac_platform:Add snps,
 xpcs devicetree parsing
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

Hello,

On Fri, 8 Dec 2023 07:02:19 +0000
Jiangfeng Ma <Jiangfeng.Ma@synopsys.com> wrote:

> In order to setup xpcs, has_xpcs must be set to a non-zero value.
> Add new optional devicetree properties representing this.
> 
> If has_xpcs is set to true, then xpcs_an_inband should preferably be
> consistent with it, Otherwise, some errors may occur when starting
> the network, For example, the phy interface that xpcs already supports,
> but link up fails.

Can you elaborate on why you need this, and on which platform
especially ? Usually drivers for the various stmmac variants know if
they have XPCS or not, or can guess it based on some info such as the
configured PHY mode (dwmac-intel).

Besides that, there are a few issues with your submission. If DT is the
way to go (and I don't say it is), you would also need to update the
bindings to document that property.

> The types of has_xpcs and xpcs_an_inband are unsigned int,
> and generally used as flags. So it may be more reasonable to set them to
> bool type. This can also be confirmed from the type of @ovr_an_inband.

And this part would go into a separate patch.

Thanks,

Maxime
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
