Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B04C72696C
	for <lists+linux-stm32@lfdr.de>; Wed,  7 Jun 2023 21:05:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E38A4C6A5E7;
	Wed,  7 Jun 2023 19:05:25 +0000 (UTC)
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com
 [209.85.166.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B312BC65E70
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Jun 2023 19:05:24 +0000 (UTC)
Received: by mail-il1-f173.google.com with SMTP id
 e9e14a558f8ab-33b921e4e8fso6087455ab.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 07 Jun 2023 12:05:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686164723; x=1688756723;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=figfwtvOwiBf/xUpTgDHOe/+/jU9SkWfSgFbF/zJYLM=;
 b=j0vnJJ1A0O7KvsIQSnciVFdWjiGpMoc6NFvDO/2o+6nCI8u+GaOwi2at1850sQb+oS
 EHNArC7gNfwdcq8IGXVG4rjNNlIEpCqq57UMUGE2u410z34bOV1fhavItO5Qm9N2TA+q
 ordZwEsyMKm5w559vMroJGCEopgnDRpakYBFYya52leqIItM/WwW6RBl40ffO9AOVJHY
 WoYZFTBCKxN01/dnjcmT2WytAjaSYsmm+NefybZrQHhi7AhFy7ac3QhIDnDkbx3/i2PA
 dzIkogjoJ+w7y0adE7IKm2wY0RaiAMm8lUAVD5HtPv5shCjN99167vXpGHX6LOP2dIcd
 GpOA==
X-Gm-Message-State: AC+VfDyF87AmwCz35UN84DgrAr3XOdqw2lLDgXplsIeO9TBuZNAgYXXy
 Vwu6y6o9McoWsw7X6xC/JA==
X-Google-Smtp-Source: ACHHUZ4xcqktIrvSensylRmtZw8kuAdpLj5SvxnY4MXQFmF5N/oMep/sLguTKrjxJpwtErgjNBzItw==
X-Received: by 2002:a92:db48:0:b0:32b:75bc:cda2 with SMTP id
 w8-20020a92db48000000b0032b75bccda2mr4888663ilq.22.1686164723349; 
 Wed, 07 Jun 2023 12:05:23 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id
 p8-20020a92d488000000b003383276d260sm3807794ilg.40.2023.06.07.12.05.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jun 2023 12:05:22 -0700 (PDT)
Received: (nullmailer pid 3779658 invoked by uid 1000);
 Wed, 07 Jun 2023 19:05:20 -0000
Date: Wed, 7 Jun 2023 13:05:20 -0600
From: Rob Herring <robh@kernel.org>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <168616471902.3779570.15724807223592608191.robh@kernel.org>
References: <20230510184305.v2.1.I417093ddcea282be479f10a37147d1935a9050b7@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230510184305.v2.1.I417093ddcea282be479f10a37147d1935a9050b7@changeid>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 gabriel.fernandez@foss.st.com, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] dt-bindings: rcc: stm32: Sync with
 u-boot copy for STM32MP13 SoC
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


On Wed, 10 May 2023 18:51:40 +0200, Patrick Delaunay wrote:
> Minor cosmetic change, aligned with files in U-Boot:
> - change obsolete SPDX id : GPL-2.0+ and use the same license
>   GPL-2.0-only for the 2 files
> - use correct mail address gabriel.fernandez@foss.st.com
> - remove extra space
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
> Changes in v2:
> - Change title "Fix STM32MP13 include file"
> - Use the same license for the 2 files GPL-2.0-only as recommended
>   to avoid check-patch issue on next
> 
>  include/dt-bindings/clock/stm32mp13-clks.h   | 6 +++---
>  include/dt-bindings/reset/stm32mp13-resets.h | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
