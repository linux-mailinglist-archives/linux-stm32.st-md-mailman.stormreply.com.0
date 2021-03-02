Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9088132A612
	for <lists+linux-stm32@lfdr.de>; Tue,  2 Mar 2021 17:32:30 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4BEA7C56638;
	Tue,  2 Mar 2021 16:32:30 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 199FAC36B24
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Mar 2021 16:32:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id F1B5D64F38;
 Tue,  2 Mar 2021 16:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614702746;
 bh=yumA0cahWTD9QKsYQGmd5EnWtZ0ZFFVwv1aA4Z0Bb98=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nJ19DVR55kPfbyXMcsrz/03FRzp0jmKIAnxQ9RGA4YhpkPNZpPaiu0Jai15qoliiD
 vTxy9f9LM2sDIOafwlRf+rfe4RhR4Xx5PRwVhnT/4SAci94zznNl8mN+17/UHYFVlh
 4gOFlMdTdx6wPcjh17NCIATGiswdGHvK2TKbOAqYpL4MPuf01zd+egP86vQX06jTDc
 zKmveU+OGTV1jOCJa71o35jBGe4liaYgTgNpFt3zUuwFFptOSKhOoS420onTPSnM1X
 nQMIK7czeNZJ2BiUHSHLmOyXurTqzHnFCide8lW9bLbOn+57Ad3eaHiYSvXTjMV0yp
 s1R7rrYcH2/+A==
Date: Tue, 2 Mar 2021 22:02:21 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <YD5olWDZ50sLVn7w@vkoul-mobl>
References: <20210224144222.23762-1-daniel.lezcano@linaro.org>
 <20210224144222.23762-9-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210224144222.23762-9-daniel.lezcano@linaro.org>
Cc: Etienne Carriere <etienne.carriere@st.com>,
 Amelie Delaunay <amelie.delaunay@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, rafael@kernel.org,
 linux-kernel@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, andriy.shevchenko@linux.intel.com,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v2 9/9] phy/drivers/stm32: Use HZ macros
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

On 24-02-21, 15:42, Daniel Lezcano wrote:
> HZ unit conversion macros are available in units.h, use them and
> remove the duplicate definition.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> ---
>  drivers/phy/st/phy-stm32-usbphyc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/st/phy-stm32-usbphyc.c b/drivers/phy/st/phy-stm32-usbphyc.c
> index a54317e96c41..02dd12bb4692 100644
> --- a/drivers/phy/st/phy-stm32-usbphyc.c
> +++ b/drivers/phy/st/phy-stm32-usbphyc.c
> @@ -14,6 +14,7 @@
>  #include <linux/of_platform.h>
>  #include <linux/phy/phy.h>
>  #include <linux/reset.h>
> +#include <linux/units.h>
>  
>  #define STM32_USBPHYC_PLL	0x0
>  #define STM32_USBPHYC_MISC	0x8
> @@ -48,7 +49,6 @@ static const char * const supplies_names[] = {
>  #define PLL_FVCO_MHZ		2880
>  #define PLL_INFF_MIN_RATE_HZ	19200000
>  #define PLL_INFF_MAX_RATE_HZ	38400000
> -#define HZ_PER_MHZ		1000000L

I dont see this in units.h, can you send this once it is merged upstream

-- 
~Vinod
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
