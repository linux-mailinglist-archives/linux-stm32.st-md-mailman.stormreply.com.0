Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F059298F6C
	for <lists+linux-stm32@lfdr.de>; Mon, 26 Oct 2020 15:34:28 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3772DC36B37;
	Mon, 26 Oct 2020 14:34:28 +0000 (UTC)
Received: from mail-oo1-f67.google.com (mail-oo1-f67.google.com
 [209.85.161.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D9D64C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Oct 2020 14:34:26 +0000 (UTC)
Received: by mail-oo1-f67.google.com with SMTP id c10so2347991oon.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Oct 2020 07:34:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YJe0fLSQoNV5qYO4yyIlYdA+m7aYQXXQ7220k06Xnlg=;
 b=dR4iO/RH+owyjkQfVifoHpiZUiJC5Ktd+spG+8hnxV34B7uFyCQnv+g0VxhLX6LEN/
 UpkUIXciWeyng7ejKKO3OEKR72udIcq0webKAnGcFirmJDEeYWIoh4dEyWYxwUXaJ9n+
 HUpbvKv3Vcxvfo9zAmmT0pvrnqDlYKu6XPrZ6p1P09sd0pLD/h5uOebQEE9h/BaP3JM4
 5RhGJ6hFggzNqWk5K28dJTRiJWzSuHWqTIm9PXscRklZqHuVszsL2gcX9PT0RyiADHUy
 0nknIalUP5/y8246V/lMdYvjHrrqzavVSaIZED8RR5Fn12yb7rItidH13KM++M4NpbLx
 OQCg==
X-Gm-Message-State: AOAM532AJKWQOyNyHoy3uCNDkmgS0O9f0rhNkKAxIhZIQ5XlU99dHzYe
 kaijva6Hk3OBCs5jl9CyOw==
X-Google-Smtp-Source: ABdhPJzOzRdziG3eUhJyZY+fC+o+9/Ohme3aRAN88WQMguo4FqGdzYCyXFjHSK0uXu5EcU8Jcmx8gQ==
X-Received: by 2002:a4a:b28b:: with SMTP id k11mr14177359ooo.54.1603722865532; 
 Mon, 26 Oct 2020 07:34:25 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id k51sm3633362otc.46.2020.10.26.07.34.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2020 07:34:24 -0700 (PDT)
Received: (nullmailer pid 118055 invoked by uid 1000);
 Mon, 26 Oct 2020 14:34:23 -0000
Date: Mon, 26 Oct 2020 09:34:23 -0500
From: Rob Herring <robh@kernel.org>
To: Olivier Moysan <olivier.moysan@st.com>
Message-ID: <20201026143423.GA118005@bogus>
References: <20201020155709.2621-1-olivier.moysan@st.com>
 <20201020155709.2621-3-olivier.moysan@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201020155709.2621-3-olivier.moysan@st.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 tiwai@suse.com, perex@perex.cz, broonie@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 2/2] dt-bindings: stm32: dfsdm: remove
 stm32-adfsdm.txt binding
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

On Tue, 20 Oct 2020 17:57:09 +0200, Olivier Moysan wrote:
> Device tree audio configuration for STM32 DFSDM is already
> covered in the following binding:
> Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml
> Remove stm32-adfsdm.txt obsolete binding.
> 
> Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
> ---
>  .../bindings/sound/st,stm32-adfsdm.txt        | 63 -------------------
>  1 file changed, 63 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/st,stm32-adfsdm.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
