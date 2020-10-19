Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B175C292F56
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Oct 2020 22:25:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 72337C424B8;
	Mon, 19 Oct 2020 20:25:30 +0000 (UTC)
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 24C3CC3FAE0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Oct 2020 20:25:27 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id j7so1380330oie.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Oct 2020 13:25:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2eJvh+OiDExYcnw0fjD4IRdxMtw5g7kaSI+P1n3wmsQ=;
 b=m+RIhj0Zo3ZDo/ewohOlMiePrlzMB5Vr0c9S8dcgJ8wWZyMoiOj7/N+tohUD0ehOFx
 MtvAllp/oaRU0nXD9NJUt1651ewkniPtZEhdb3YhHF6Th7BBuLQ2pceAV+navynvM2hD
 3Z2gDfzMrtotqJylEhNQ82HjPu7dpKSFDZ8rIyPHC5ffwADImOt9WsCMv1Dff2XKUDNm
 IA+7MwLnj0bAgrQnB3VjiVo/rM1+N7K3SOXNyjmmVpovtfBu5BxM5GVbrLJC02exOdV5
 w74lknPgmiMPvcOiN9dHhfpdm4Hiy34wuguWdp/YNbEo9NGu+Mb/PMYGXyhv0VzUGu1g
 0bAQ==
X-Gm-Message-State: AOAM533LcEOqmhvy9IWNSUUbnm13OtpVrXLp1koOXT+A76j01WJYrdXR
 mXnJujoOvzRB7uGGfVmXLw==
X-Google-Smtp-Source: ABdhPJztogXjATiDScTQzUAmCLK5ItkQoRw7qffd7jiZfUIT0HmuWhenym77skh/v47Cj3OLzspmqQ==
X-Received: by 2002:aca:5058:: with SMTP id e85mr799620oib.79.1603139126431;
 Mon, 19 Oct 2020 13:25:26 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id p10sm225896oig.37.2020.10.19.13.25.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2020 13:25:25 -0700 (PDT)
Received: (nullmailer pid 3547145 invoked by uid 1000);
 Mon, 19 Oct 2020 20:25:19 -0000
Date: Mon, 19 Oct 2020 15:25:19 -0500
From: Rob Herring <robh@kernel.org>
To: Olivier Moysan <olivier.moysan@st.com>
Message-ID: <20201019202519.GA3541912@bogus>
References: <20201014123531.6991-1-olivier.moysan@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201014123531.6991-1-olivier.moysan@st.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/1] ASoC: dt-bindings: stm32: convert
 audio dfsdm to json-schema
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

On Wed, Oct 14, 2020 at 02:35:31PM +0200, Olivier Moysan wrote:
> Convert the STM32 DFSDM audio bindings to DT schema format
> using json-schema.
> 
> Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
> ---
>  .../bindings/sound/st,stm32-adfsdm.txt        | 63 -------------------
>  .../bindings/sound/st,stm32-adfsdm.yaml       | 42 +++++++++++++
>  2 files changed, 42 insertions(+), 63 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/st,stm32-adfsdm.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/st,stm32-adfsdm.yaml

This is almost already documented in 
Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml. You 
should either make that complete or reference this.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
