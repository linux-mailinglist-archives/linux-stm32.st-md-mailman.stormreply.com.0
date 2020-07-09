Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 304C621A91C
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Jul 2020 22:37:23 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CDD39C36B2B;
	Thu,  9 Jul 2020 20:37:22 +0000 (UTC)
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 15C64C36B29
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Jul 2020 20:37:21 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id a12so3716757ion.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 09 Jul 2020 13:37:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zYVtac9Zi8Ea45Dv/JsLDGweT3Jj92BXMb3jivMTATc=;
 b=Q0qWRoWC8ZIxPdL+MRX0elAjZJ5FWlrQuzHSLSqm3niRTP6iElDamOujCJ7DhG1yKm
 aJvQnUw4ta65bZaZ/KC9suliHTnWewkB3iS5ovSsGyxhnrKaEezmClWYQE6r5KZ/1M4P
 AFIKC6W1rLoch0z9Gu0P8j1cvN/tGoWZTcHCnuUaDvVnwro6DT9nHUv6b8FI3Oet/qhf
 HwrFNsNg3MuREEqMWBBscps85bidR+KkmY4jXUYgxViTMez2JmO8a5kPCUBlMRGjJCE9
 fJBTdG+3SVGBlN7Z6aZrhbnnVpp+rqFH93D5VPfzB7aU/wWV0sLz+dFvtwfmSLB4Mcd0
 LdWg==
X-Gm-Message-State: AOAM5325iUC7VLdwqNlRkz1tIaDBk7i1Zc+I/xpNgoOUcEXRSwk7ZrTS
 XsG/UhyMPS551Rof0WmPfQ==
X-Google-Smtp-Source: ABdhPJzQBLgQu0/F5feMhyP/ZARue5TvyvtGE6/nGRA3cx1winlPMxKdNtL0DNf3bejnqdNjMXZpcg==
X-Received: by 2002:a05:6638:e93:: with SMTP id
 p19mr56572629jas.67.1594327039832; 
 Thu, 09 Jul 2020 13:37:19 -0700 (PDT)
Received: from xps15 ([64.188.179.254])
 by smtp.gmail.com with ESMTPSA id i188sm2677380ioa.33.2020.07.09.13.37.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2020 13:37:19 -0700 (PDT)
Received: (nullmailer pid 846237 invoked by uid 1000);
 Thu, 09 Jul 2020 20:37:18 -0000
Date: Thu, 9 Jul 2020 14:37:18 -0600
From: Rob Herring <robh@kernel.org>
To: Benjamin Gaignard <benjamin.gaignard@st.com>
Message-ID: <20200709203718.GA837160@bogus>
References: <20200701130129.30961-1-benjamin.gaignard@st.com>
 <20200701130129.30961-2-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200701130129.30961-2-benjamin.gaignard@st.com>
Cc: devicetree@vger.kernel.org, vincent.guittot@linaro.org, rjw@rjwysocki.net,
 linux-kernel@vger.kernel.org, valentin.schneider@arm.com,
 mcoquelin.stm32@gmail.com, mchehab@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v7 1/3] dt-bindings: media: stm32-dcmi:
 Add DCMI min frequency property
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

On Wed, Jul 01, 2020 at 03:01:27PM +0200, Benjamin Gaignard wrote:
> Document st,stm32-dcmi-min-frequency property which is used to
> request CPUs minimum frequency when streaming frames.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
>  Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml b/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
> index 3fe778cb5cc3..05ca85a2411a 100644
> --- a/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
> +++ b/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
> @@ -44,6 +44,13 @@ properties:
>        bindings defined in
>        Documentation/devicetree/bindings/media/video-interfaces.txt.
>  
> +  st,stm32-dcmi-min-frequency:
> +    description: DCMI minimum CPUs frequency requirement (in KHz).
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +      - minimum: 0
> +      - default: 0

I think this is questionable to be in DT and if it is, it's something 
that's hardly specific to ST or this block. IIRC, we already have a way 
to specify minimum OPPs.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
