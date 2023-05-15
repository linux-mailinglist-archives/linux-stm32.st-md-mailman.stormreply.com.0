Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7113B703826
	for <lists+linux-stm32@lfdr.de>; Mon, 15 May 2023 19:27:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 194B7C6A613;
	Mon, 15 May 2023 17:27:49 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 63DD0C6A603
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 May 2023 17:27:47 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-1aad5245632so93143825ad.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 May 2023 10:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684171666; x=1686763666;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=HV5hzOslSr/FLxQgkUOdAb0ubgv7oB3Gzqp0pqYMQsc=;
 b=X/eq65FBsDIPDo2Wfb1iwHSoJisHGVKTWyP2n3KTfJga69cQVWysciK1ZDjhlavC7r
 KF0RmdnEOogoZKah/bR6k20VbeKpwafYM9t8+/0zY0xRXIduYg5yKbZ9E6spflp3waIe
 GHVj0DHBIfvPtm7rnej1OBje66kBLGnnF/lbmDHV3A0dDQxPl5+hmVEmPpmEDv9w3OHh
 UdmxdlwCJkaUDXTY0670ar+7CIlGLDPLlRePUFxclSKX/9evlhDEUmIW0nfA20CB5udq
 MKNhHPmvJbbF59DU9avkZkGi6z+FgiUYleHpVpaKex3BexNZMM6HvJcuYogUEAzL7LUs
 da0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684171666; x=1686763666;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HV5hzOslSr/FLxQgkUOdAb0ubgv7oB3Gzqp0pqYMQsc=;
 b=QRHmJGxbhpr8QJtT8DFvxSsn20G/swHj+9LPXmeCjb6C/1cXVg120yAfUOLTYd/NiY
 q3j7Jsg+JU40dzxIF9Kos+vlr1ja3vIxv4E7j7WaDNrcwtmu3TLCs7boLeivhWjloPfR
 dDFAWGMZclnWHMzoq/GQo9SRLFbkPepplWk0V7yi9e03hY0MBt801xcy091f0CB3NbEZ
 aL+4ENUzf7QfHPi87rYhEqgTVs+6E0gXEhYnicybVhgye6teoafuI2Hy6oyjjVDPDzUp
 a2x1/DYlJHv5qk1l4AcBOXewORl31LXsDEx696EnXiqNX/tx7FTfFetrYF+iu4PQXg1R
 nY6g==
X-Gm-Message-State: AC+VfDyLxgSf/VSIudjZvnIzWDrMEN+Tzj0mEx46k2dJpuDU30kKmNUl
 e7ARlraARqjisGRohPt4OKcM2A==
X-Google-Smtp-Source: ACHHUZ7MrWABVtEdp/AF7fMlIN83m73eYhwUr7xcWs5Y2Ma+gMOWf1rxaW/Y38x6qhqzqMOLcvdB2A==
X-Received: by 2002:a17:902:a516:b0:1ab:1355:1a45 with SMTP id
 s22-20020a170902a51600b001ab13551a45mr32579411plq.30.1684171665794; 
 Mon, 15 May 2023 10:27:45 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:d401:af78:6aa0:cf61])
 by smtp.gmail.com with ESMTPSA id
 d1-20020a170902aa8100b001aafb802efbsm13847316plr.12.2023.05.15.10.27.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 10:27:45 -0700 (PDT)
Date: Mon, 15 May 2023 11:27:43 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <ZGJrj9Vu2H9NZdlH@p14s>
References: <20230512093926.661509-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230512093926.661509-1-arnaud.pouliquen@foss.st.com>
Cc: devicetree@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 0/4] stm32mp15: update remoteproc to
 support SCMI Device tree
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

On Fri, May 12, 2023 at 11:39:22AM +0200, Arnaud Pouliquen wrote:
> Update vs V2[1]:
> ---------------
> - update yaml to remove label in examples
> - fix error management for  devm_reset_control_get_optional(dev, "hold_boot")
> - rebased on commit ac9a78681b92 ("Linux 6.4-rc1")
> 
> [1]https://lore.kernel.org/lkml/20230504094641.870378-1-arnaud.pouliquen@foss.st.com/T/
> 
> 
> Description:
> -----------
> This series updates the stm32_rproc driver and associated DT node to
> support device tree configuration with and without SCMI server. 
> The impact is mainly on the MCU hold boot management.
> 
> Three configurations have to be supported:
> 
> 1) Configuration without OP-TEE SCMI (legacy): Trusted context not activated
> - The MCU reset is controlled through the Linux RCC reset driver.
> - The MCU HOLD BOOT is controlled through The RCC sysconf.
> 
> 2) Configuration with SCMI server: Trusted context activated
> - The MCU reset is controlled through the SCMI reset service.
> - The MCU HOLD BOOT is no more controlled through a SMC call service but
>   through the SCMI reset service.
> 
> 3) Configuration with OP-TEE SMC call (deprecated): Trusted context activated
> - The MCU reset is controlled through the Linux RCC reset driver.
> - The MCU HOLD BOOT is controlled through The SMC call.
> 
> In consequence this series:
> - adds the use of the SCMI reset service to manage the MCU hold boot,
> - determines the configuration to use depending on the presence of the
>   "reset-names" property
>   if ( "reset-names" property contains "hold_boot")
>   then use reset_control services
>   else use regmap access based on "st,syscfg-holdboot" property.
> - set the DT st,syscfg-tz property as deprecated
> 
> Arnaud Pouliquen (4):
>   dt-bindings: remoteproc: st,stm32-rproc: Rework reset declarations
>   remoteproc: stm32: Allow hold boot management by the SCMI reset
>     controller
>   ARM: dts: stm32: Update reset declarations
>   ARM: dts: stm32: fix m4_rproc references to use SCMI
> 
>  .../bindings/remoteproc/st,stm32-rproc.yaml   | 44 +++++++++--
>  arch/arm/boot/dts/stm32mp151.dtsi             |  2 +-
>  arch/arm/boot/dts/stm32mp157a-dk1-scmi.dts    |  6 +-
>  arch/arm/boot/dts/stm32mp157c-dk2-scmi.dts    |  6 +-
>  arch/arm/boot/dts/stm32mp157c-ed1-scmi.dts    |  6 +-
>  arch/arm/boot/dts/stm32mp157c-ev1-scmi.dts    |  6 +-
>  drivers/remoteproc/stm32_rproc.c              | 76 ++++++++++++++-----
>  7 files changed, 111 insertions(+), 35 deletions(-)
> 

I have applied patch 1 and 2.  Unless Alexandre wants to proceed differently,
patches 3 and 4 should go through his tree.

Thanks,
Mathieu

> -- 
> 2.25.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
