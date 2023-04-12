Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DEAFD6DF977
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Apr 2023 17:14:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7F2D6C69063;
	Wed, 12 Apr 2023 15:14:08 +0000 (UTC)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com
 [209.85.167.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 766FBC62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Apr 2023 15:14:07 +0000 (UTC)
Received: by mail-oi1-f177.google.com with SMTP id bm45so2209942oib.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Apr 2023 08:14:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681312446; x=1683904446;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rLO2+mslMgJt7oEF3zMGiAxK8M13LsE3IAK5PmmHYrE=;
 b=7KIx+vUv5d2ino0J06WAJ+GCuZgXCn6XQkAV+JjsIKtSa32G66Qa/VX0qMOJyT1ZXO
 6JDr8nP4GorMfmMhCl6UokWflIMR9zfyfFub60X47GhC1rghF1samJBGrBl8MJATRi/a
 1KZfesesZzgPex59qdpVm43ncJYVKzArJG2D7C8gELcTYkk8Mn3K5GGH/8PS13BhqVbD
 HDxL94Av7dYb8NxeTNnKHm2fkc8QDcIBcFdknFNQ38KcReSaq+XDMwKt6ZztmlQ91Guf
 vO530DJfGuKOj9HyhroU86NC33yk9W1qTAP9HqKxifwHliwX/joR0wAycEhkrpvRSNVO
 dxVw==
X-Gm-Message-State: AAQBX9djWvv6lIFocMdBHAsn3v38Ns8rbDsN9WAmzR0azFwJl8SeiMpQ
 w35Z5fpIgY8W2NOvwgQtEw==
X-Google-Smtp-Source: AKy350Z/1Wya1b06p9v1jxp3a5/8Dsk/0yLxaZGXg6Xk+G947KmvJd2M/mU6HaijGWztsLvxUWZp1w==
X-Received: by 2002:aca:d743:0:b0:386:9720:77da with SMTP id
 o64-20020acad743000000b00386972077damr6060729oig.26.1681312445919; 
 Wed, 12 Apr 2023 08:14:05 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 en12-20020a056808394c00b003898ebb8be0sm6699276oib.48.2023.04.12.08.14.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 08:14:05 -0700 (PDT)
Received: (nullmailer pid 2446977 invoked by uid 1000);
 Wed, 12 Apr 2023 15:14:04 -0000
Date: Wed, 12 Apr 2023 10:14:04 -0500
From: Rob Herring <robh@kernel.org>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20230412151404.GA2372294-robh@kernel.org>
References: <20230407201526.1.I417093ddcea282be479f10a37147d1935a9050b7@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230407201526.1.I417093ddcea282be479f10a37147d1935a9050b7@changeid>
Cc: devicetree@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
 gabriel.fernandez@foss.st.com, linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: rcc: stm32: Fix STM32MP13
	include file
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

On Fri, Apr 07, 2023 at 08:15:33PM +0200, Patrick Delaunay wrote:
> Minor cosmetic change, aligned with files in U-Boot:
> - change obsolete SPDX id : GPL-2.0+
> - use correct address gabriel.fernandez@foss.st.com
> - remove extra space

Make the subject reflect the purpose: 'Sync with u-boot copy'

> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  include/dt-bindings/clock/stm32mp13-clks.h   | 6 +++---
>  include/dt-bindings/reset/stm32mp13-resets.h | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/include/dt-bindings/clock/stm32mp13-clks.h b/include/dt-bindings/clock/stm32mp13-clks.h
> index 02befd25edce..da4cb7567430 100644
> --- a/include/dt-bindings/clock/stm32mp13-clks.h
> +++ b/include/dt-bindings/clock/stm32mp13-clks.h
> @@ -1,7 +1,7 @@
> -/* SPDX-License-Identifier: GPL-2.0+ or BSD-3-Clause */
> +/* SPDX-License-Identifier: GPL-2.0-or-later or BSD-3-Clause */
>  /*
>   * Copyright (C) STMicroelectronics 2020 - All Rights Reserved
> - * Author: Gabriel Fernandez <gabriel.fernandez@st.com> for STMicroelectronics.
> + * Author: Gabriel Fernandez <gabriel.fernandez@foss.st.com> for STMicroelectronics.
>   */
>  
>  #ifndef _DT_BINDINGS_STM32MP13_CLKS_H_
> @@ -64,7 +64,7 @@
>  #define CK_MCO1		38
>  #define CK_MCO2		39
>  
> -/*  IP clocks */
> +/* IP clocks */
>  #define SYSCFG		40
>  #define VREF		41
>  #define DTS		42
> diff --git a/include/dt-bindings/reset/stm32mp13-resets.h b/include/dt-bindings/reset/stm32mp13-resets.h
> index 934864e90da6..1b83a01de8f0 100644
> --- a/include/dt-bindings/reset/stm32mp13-resets.h
> +++ b/include/dt-bindings/reset/stm32mp13-resets.h
> @@ -1,7 +1,7 @@
> -/* SPDX-License-Identifier: GPL-2.0 or BSD-3-Clause */
> +/* SPDX-License-Identifier: GPL-2.0-or-later or BSD-3-Clause */

Really, the Linux copy came first, so you should use its license. Your 
company's lawyers are good with GPLv3 and then v4?

>  /*
>   * Copyright (C) STMicroelectronics 2018 - All Rights Reserved
> - * Author: Gabriel Fernandez <gabriel.fernandez@st.com> for STMicroelectronics.
> + * Author: Gabriel Fernandez <gabriel.fernandez@foss.st.com> for STMicroelectronics.
>   */
>  
>  #ifndef _DT_BINDINGS_STM32MP13_RESET_H_
> -- 
> 2.25.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
