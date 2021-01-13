Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 265A52F4E2D
	for <lists+linux-stm32@lfdr.de>; Wed, 13 Jan 2021 16:10:49 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D86D6C5660F;
	Wed, 13 Jan 2021 15:10:48 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 087F9C424BE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Jan 2021 15:10:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 55B202337F;
 Wed, 13 Jan 2021 15:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610550643;
 bh=49EcqNO3BNtm9SgsIEaZe12aoA3Tw/mLHvfiTqlGjXs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=etqN7VUMPx4jO+i41MW0+eU5VpDprOhFXusdoR3MrJsnkCxH44Ykn5OVU/hNixV1t
 6tSGJHAr1b9EM2+pHqwoTwfU0EYLBs3Nr5mKxxLHYb0wxJ28NbipKKpNBlpbO6gDTG
 c9BzrY1Yu1dkyPAYNcuYGfM32vU7+qsZGGMNEY4rqWjMSkuKhnO95L4D8EBv6SMiLp
 UNsHwmQLCx5khdJa2JKCwoGwl24SOuawSqLssT9UZcoarrxRkMq5QDPDZebC0BSVOj
 OzDqjVtcuencdVxTrQksJSrw+hcUcOhgKCKI9bWzCQ+BuXd2bv+rg6WP6x5J474dqC
 0Mx6ns/MHqLkg==
Date: Wed, 13 Jan 2021 20:40:33 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Amelie Delaunay <amelie.delaunay@foss.st.com>
Message-ID: <20210113151033.GU2771@vkoul-mobl>
References: <20210105090525.23164-1-amelie.delaunay@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210105090525.23164-1-amelie.delaunay@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 0/6] STM32 USBPHYC PLL management rework
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

On 05-01-21, 10:05, Amelie Delaunay wrote:
> STM32 USBPHYC controls the USB PLL. PLL requires to be powered with 1v1 and 1v8
> supplies. To ensure a good behavior of the PLL, during boot, runtime and
> suspend/resume sequences, this series reworks its management to fix regulators
> issues and improve PLL status reliability.

Applied, thanks

-- 
~Vinod
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
