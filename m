Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B3A58DB38
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Aug 2022 17:37:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 68D0FC03FDB;
	Tue,  9 Aug 2022 15:37:33 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 578B7C035BC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Aug 2022 15:37:31 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id z12so14735767wrs.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 09 Aug 2022 08:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=PtkDAKuLYtipKso/qtzcAxoyZFXE+gtPjmSjF2+dZT8=;
 b=B4aSdALX+HOfDoK2RMhVxwCMY75Lvw/KvYO3H2Pp836XdkT7RwzrmfbytDbKOOJQIE
 kiMgeho3WTxF0lRCKxiry19SGg4wVqXaXWhIpPGTRLVtf24VQH2yQ1da/InL1+a/vFUT
 vbQh2m+R4oXo/CnacHGLNfs3MZc8MugsgbKxkPIWF++cNeCS8W+dju0WKSHHbQ4QDmd/
 MVhzo3+9dqoCYaptzlMx78HrArs6dvvz/PAOgJSyNAmjOE4FneuFdiuYPoghL10e9mHF
 V/Dw+/z785JI4VGewE/j8verPHsuw6KdmoWbb6Bb75cmiHRPxU2ONacU7fcILAbXcwcT
 LXuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=PtkDAKuLYtipKso/qtzcAxoyZFXE+gtPjmSjF2+dZT8=;
 b=DgvAm87dUxT072pp7ERFouxjKl1gYr6lYrm+g0iw/TyOt1+XJimaDiJtxYO9nx0HWa
 zzNY/VZshmABXlnMiAxLjkb2s02xGWJk0L9mCOXZEQVW+s7mHVKytNQpktoyXUoCBz+L
 g7azDiMpQIiJPNRAfHTF6s2uicmGnPznK0S0TA5eTSPcsgW4DBhowN4iTZnlva9PN2lz
 oncFYZDkM//J6oNWVrptWv95lHA0k1a1nYSiHeCSLzaUAOJWe+BmLKoVr2nsy6LOJc6b
 p0tiW2VFuqUAgHbqHz9XNv5zhrqeuKgQQIbTRhPj+c46IXQ3uqM2pDteaMMfjlTsapZx
 br1g==
X-Gm-Message-State: ACgBeo1whJFfwTYVeRU6MJ9J2pM5ZY4uYpOzJQChavTHoy+jOQvNTjiR
 grTzulbKCFW2hrM1iWAfSbcnlQ==
X-Google-Smtp-Source: AA6agR7Rl6LrXJMccHtrODxJmUsBl/OXTkCxpvd9qLdL2g6K1oFbc81PrOCebZAftVyGx6FprERcaw==
X-Received: by 2002:adf:fc08:0:b0:21e:d133:3500 with SMTP id
 i8-20020adffc08000000b0021ed1333500mr15478038wrr.353.1660059450864; 
 Tue, 09 Aug 2022 08:37:30 -0700 (PDT)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net.
 [86.27.177.88]) by smtp.gmail.com with ESMTPSA id
 l8-20020a05600c4f0800b003a17ab4e7c8sm24014628wmq.39.2022.08.09.08.37.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Aug 2022 08:37:29 -0700 (PDT)
Date: Tue, 9 Aug 2022 16:37:27 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Francesco Dolcini <francesco.dolcini@toradex.com>
Message-ID: <YvJ/N2zulizbiU6u@google.com>
References: <20220712163345.445811-1-francesco.dolcini@toradex.com>
 <20220712163345.445811-5-francesco.dolcini@toradex.com>
 <20220809134607.GA44926@francesco-nb.int.toradex.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220809134607.GA44926@francesco-nb.int.toradex.com>
Cc: devicetree@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-iio@vger.kernel.org,
 Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-input@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v2 4/5] dt-bindings: iio: adc: stmpe:
 Remove node name requirement
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

On Tue, 09 Aug 2022, Francesco Dolcini wrote:

> Hello Jonathan, can you pick this? Patches 1 and 2 were applied to MFD
> tree.

Sending out nags whilst the merge-window is open is seldom helpful.

Also, please refrain from top-posting.

Thanks.

> On Tue, Jul 12, 2022 at 06:33:44PM +0200, Francesco Dolcini wrote:
> > STMPE driver does not require a specific node name anymore, only the
> > compatible is checked, update binding according to this.
> > 
> > Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> > ---
> >  Documentation/devicetree/bindings/iio/adc/st,stmpe-adc.yaml | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/iio/adc/st,stmpe-adc.yaml b/Documentation/devicetree/bindings/iio/adc/st,stmpe-adc.yaml
> > index 9049c699152f..333744a2159c 100644
> > --- a/Documentation/devicetree/bindings/iio/adc/st,stmpe-adc.yaml
> > +++ b/Documentation/devicetree/bindings/iio/adc/st,stmpe-adc.yaml
> > @@ -13,8 +13,7 @@ description:
> >    This ADC forms part of an ST microelectronics STMPE multifunction device .
> >    The ADC is shared with the STMPE touchscreen. As a result some ADC related
> >    settings are specified in the parent node.
> > -  The node name myst be stmpe_adc and should be a child node of the stmpe node
> > -  to which it belongs.
> > +  The node should be a child node of the stmpe node to which it belongs.
> >  
> >  properties:
> >    compatible:
> 

-- 
DEPRECATED: Please use lee@kernel.org
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
