Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C98C4E95D8
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Mar 2022 13:55:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 61EAEC5C842;
	Mon, 28 Mar 2022 11:55:04 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 45FE2C57B6F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Mar 2022 11:55:03 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id a17so16590525edm.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Mar 2022 04:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=VBA2TVvDQq46dU+vDSFsKIjMbNiJuAyL+n01cA7mLg0=;
 b=OBOwZMzgqbA4Bri1W+TQyb45lBR8NViCvJYDlk5rJZKcVaCgWCV40Bf7Mv/7s4LQTo
 o61uoNoV320FDfTmAXy0OyXXsM6xbZnily3YKTr/Pe7gWFLFh2fymA9CCUGhWiDEZlLZ
 nNwep3nx1H6RuXTTVxqC1Ux9vx68yHHOYmvP8HexVe79FWRO9Iu3fNpeAYkfW2JkM+Vt
 qrh2k9qqmA2fYydHCfMeMdCIwVVoaxO4gxjQE8JAPqhrWkQW+6YiB4qavu4HrF1R3jtl
 KNxBJkSRciGcZ0Vf/9M87/6ctraLnA19Hi8Jr/TqhQEfd0ot10wekX5HmOo9zLRLpGu/
 NhiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VBA2TVvDQq46dU+vDSFsKIjMbNiJuAyL+n01cA7mLg0=;
 b=yn/UyLqDWKF0EdcLZ09cHfa36c1lLTeO+YE4elqhnxTOV02gVpL3/UZigRybgUHhnm
 PmvLqsr3FWG78KEoPA04gMkYaaqT6RlHIv5L94eub/f03aJ8ds4rh26RpZjMTrDI64mS
 +H34utLeg5pZdXzLUfP1fKGTNObJ7QHWpyEtPCYWkJok1yu1XEgxtKvy/kApz6kFq928
 tDzVq3J9u5tPzmRrv1f1XXH0tqC5GkiSw8bpSlJrqxmkqy6+dpzAuCVrYxdXtT9drnVK
 hLhvJSHfwaK2gPL+VQ/gToD3M+f4wSxHg53W4aB8cMkiTzo6UCcKNLYyN+NFVz8wIAMl
 ocyQ==
X-Gm-Message-State: AOAM532UFmAyUmeY96TS+j5vmkQ8t63pEiErAiLgMWaCv8Xzor1cVnyp
 jo/uAtkYwDPJi9fOjN2Dgls=
X-Google-Smtp-Source: ABdhPJxl9m+FiC/OJjd+DqfT2L64nZ1Oy+3md9ABQHlV5EJnd26lo+025HjOApFZeOymI3r2eMPv3w==
X-Received: by 2002:a05:6402:1718:b0:419:564:6b62 with SMTP id
 y24-20020a056402171800b0041905646b62mr15482099edu.361.1648468502610; 
 Mon, 28 Mar 2022 04:55:02 -0700 (PDT)
Received: from Ansuel-xps.localdomain (93-42-69-170.ip85.fastwebnet.it.
 [93.42.69.170]) by smtp.gmail.com with ESMTPSA id
 nb6-20020a1709071c8600b006e02910f818sm5859904ejc.157.2022.03.28.04.55.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Mar 2022 04:55:02 -0700 (PDT)
Date: Mon, 28 Mar 2022 13:55:01 +0200
From: Ansuel Smith <ansuelsmth@gmail.com>
To: Jesper Nilsson <jesper.nilsson@axis.com>
Message-ID: <YkGiFa9DSKpsSZou@Ansuel-xps.localdomain>
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
 <20220328000915.15041-2-ansuelsmth@gmail.com>
 <20220328082858.GJ7371@axis.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220328082858.GJ7371@axis.com>
Cc: "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-realtek-soc@lists.infradead.org"
 <linux-realtek-soc@lists.infradead.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "chrome-platform@lists.linux.dev" <chrome-platform@lists.linux.dev>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 linux-arm-kernel <linux-arm-kernel@axis.com>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 "linux-sunxi@lists.linux.dev" <linux-sunxi@lists.linux.dev>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "linux-actions@lists.infradead.org" <linux-actions@lists.infradead.org>,
 "linux-unisoc@lists.infradead.org" <linux-unisoc@lists.infradead.org>,
 Rob Herring <robh+dt@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-rpi-kernel@lists.infradead.org" <linux-rpi-kernel@lists.infradead.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "kernel@dh-electronics.com" <kernel@dh-electronics.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "linux-oxnas@groups.io" <linux-oxnas@groups.io>
Subject: Re: [Linux-stm32] [RFC PATCH 1/1] ARM/arm64: categorize dts in arm
 dir and fix dependency in arm64
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

On Mon, Mar 28, 2022 at 10:28:58AM +0200, Jesper Nilsson wrote:
> Hi Ansuel,
> 
> On Mon, Mar 28, 2022 at 02:09:15AM +0200, Ansuel Smith wrote:
> > - Categorize every dts in arm directory in subdirectory
> > - Fix Makefile to address for the arm subdirectory
> > - Fix any arm64 dependency
> > [...]
> >  arch/arm/boot/dts/axix/Makefile               |    3 +
> >  .../boot/dts/{ => axix}/artpec6-devboard.dts  |    0
> >  arch/arm/boot/dts/{ => axix}/artpec6.dtsi     |    0
> 
> All ARTPEC platforms should be in a directory called "axis".
> Otherwise LGTM.
> 
> Thanks!
> 
> /^JN - Jesper Nilsson
> -- 
>                Jesper Nilsson -- jesper.nilsson@axis.com

Will do the change! Noted.

-- 
	Ansuel
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
