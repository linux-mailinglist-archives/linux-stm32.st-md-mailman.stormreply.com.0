Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 84AD6298F65
	for <lists+linux-stm32@lfdr.de>; Mon, 26 Oct 2020 15:34:13 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 29B0CC36B37;
	Mon, 26 Oct 2020 14:34:13 +0000 (UTC)
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 14D66C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Oct 2020 14:34:12 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id b2so7596104ots.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Oct 2020 07:34:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Gu70+4d8Zu8/uxoB6xBSb3yW/hLHlyYk/LMJt3p6Pnk=;
 b=nET8hwrI2/CmhGgU8U5fgKG5BPJjKnrgWagH1xKpkWNzxou22oK8fofcOS3GfDus1P
 G1Ll7LBh8xjfqjcSouvy7QwlYOSvU9eRUVnbNHTzTxP0r5YHD6l2it6+rP0mguiLGMbS
 8dY7/n9TGzWomjYOmQWmyTQH8vpEKShiZSs/i8CHwvojjFOSamh0SXHf5kQMDf5gvemA
 3WqsuL4ZDqMZyKRWpKdbUoaVsfBjOIi9ZTE4fRFt+Lj7DYJLH7yQI9sxS9Z6uozHvLbj
 HTpD3dhgzjhVjIar1mU0zRAjDsk3MCRtvWvhPz8aOiMZN7oRLrq/2ynCi9IwLEmrw0kl
 RfkQ==
X-Gm-Message-State: AOAM532Z+MvOlmHMd5uc9wS/o/Czd3wsgK7JWEQS/lEuGUtGOruZ+cw7
 uKUyY5cXaeHyQzGN0H/NUA==
X-Google-Smtp-Source: ABdhPJw+O158CQSA6jqE9RrNha1lkKYpXpyDC9T1facmMZ7+/cjPi+O4C7tiVHVLFM1bBF8uzV9oKg==
X-Received: by 2002:a05:6830:1e44:: with SMTP id
 e4mr15220194otj.346.1603722850794; 
 Mon, 26 Oct 2020 07:34:10 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id e3sm3969247ooq.0.2020.10.26.07.34.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2020 07:34:10 -0700 (PDT)
Received: (nullmailer pid 117630 invoked by uid 1000);
 Mon, 26 Oct 2020 14:34:09 -0000
Date: Mon, 26 Oct 2020 09:34:09 -0500
From: Rob Herring <robh@kernel.org>
To: Olivier Moysan <olivier.moysan@st.com>
Message-ID: <20201026143409.GA117596@bogus>
References: <20201020155709.2621-1-olivier.moysan@st.com>
 <20201020155709.2621-2-olivier.moysan@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201020155709.2621-2-olivier.moysan@st.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, tiwai@suse.com, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, broonie@kernel.org, perex@perex.cz,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/2] dt-bindings: stm32: dfsdm: update
	audio properties
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

On Tue, 20 Oct 2020 17:57:08 +0200, Olivier Moysan wrote:
> - Add missing compatible property in audio node.
> - Remove obsolete "st,stm32-dfsdm-pdm" compatible.
> - Remove useless comment in adc io-channels description.
> 
> Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
> ---
>  .../devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml    | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
