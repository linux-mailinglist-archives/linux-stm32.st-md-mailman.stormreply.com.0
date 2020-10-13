Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4B428D1BA
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Oct 2020 18:06:56 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 72A56C3FAD5;
	Tue, 13 Oct 2020 16:06:56 +0000 (UTC)
Received: from mail-oo1-f66.google.com (mail-oo1-f66.google.com
 [209.85.161.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 95114C36B37
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Oct 2020 16:06:54 +0000 (UTC)
Received: by mail-oo1-f66.google.com with SMTP id w7so6340oow.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Oct 2020 09:06:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=lJvrwL/FuYX27TcA8XBAMttZyQaUzn/E6l7mrrmjFrA=;
 b=MFoINvQ4bd5p/AZkX1+ND+if8bH/M83XVyMwLymZZYiSjod3EeEJ/5kbTqcu6vFQQG
 A1yDqqymmmWDchkqCeCE/4Zvayx5FU0/14Fk3Lo6ZVrDp/tM8yUCdY3+SE6MeD3Vf1qe
 322C1UHrzuj4YgzaYZbSEriwD0EAQh84HuHwJYBSupSZrWvgCKxvz4bsucVBv/8z70q7
 l51FBBxUdtchzmgI5BpI4/hsjBR0+m3iJBDspIpXi7i/rHMh3VfVVOjAQaslRW1GhI2x
 WIuE4/S2oOM9FZzB5wspq/4Hc7l/9IMCgKNvn3wY5go6ZYQ5DDAMJ51VUnvi6nSfm9uT
 JXQg==
X-Gm-Message-State: AOAM5309slVyy3bXPUetRtRfFdBipiGHHMXbhvwoI+UDuziGdcqOAEnn
 wlV4+7sVwfZkhxX3b/s/yw==
X-Google-Smtp-Source: ABdhPJxqdYOtrD/HpqNx8Jl2GuLgmmSCJn2kjs3ih3MXm5tW7/fk6d/rOnxhKD9k0szvgWN4vx9rbw==
X-Received: by 2002:a4a:d8c1:: with SMTP id c1mr65697oov.31.1602605213606;
 Tue, 13 Oct 2020 09:06:53 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 42sm52847otv.35.2020.10.13.09.06.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2020 09:06:52 -0700 (PDT)
Received: (nullmailer pid 3610298 invoked by uid 1000);
 Tue, 13 Oct 2020 16:06:51 -0000
Date: Tue, 13 Oct 2020 11:06:51 -0500
From: Rob Herring <robh@kernel.org>
To: Olivier Moysan <olivier.moysan@st.com>
Message-ID: <20201013160651.GA3610242@bogus>
References: <20201009141051.27365-1-olivier.moysan@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201009141051.27365-1-olivier.moysan@st.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4] ASoC: dt-bindings: stm32: convert sai
	to json-schema
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

On Fri, 09 Oct 2020 16:10:51 +0200, Olivier Moysan wrote:
> Convert the STM32 SAI bindings to DT schema format using json-schema.
> 
> Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
> ---
> Changes in v2:
> - use pattern for compatible of child nodes
> - rework dmas and clocks properties
> - add "additionalProperties"
> 
> Changes in v3:
> - move clocks properties for st,stm32h7-sai compatible, to 'else' clause
> 
> Changes in v4:
> - fix dtbs_check errors
> ---
>  .../bindings/sound/st,stm32-sai.txt           | 107 ----------
>  .../bindings/sound/st,stm32-sai.yaml          | 200 ++++++++++++++++++
>  2 files changed, 200 insertions(+), 107 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/st,stm32-sai.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/st,stm32-sai.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
