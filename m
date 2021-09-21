Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 244D041381B
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Sep 2021 19:10:24 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CCE58C5A4CD;
	Tue, 21 Sep 2021 17:10:23 +0000 (UTC)
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com
 [209.85.161.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 206DBC57189
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Sep 2021 17:10:22 +0000 (UTC)
Received: by mail-oo1-f44.google.com with SMTP id
 b5-20020a4ac285000000b0029038344c3dso7280497ooq.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Sep 2021 10:10:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=S4rWK627e6yBDbCEhLg6VsNoB81RgebdS3Ln+6wAGas=;
 b=LBBu/oSpmj2ew0PWy0O9LK4hDRZoaxzBoweSEABO4HltwMk+wt77BrWKtYCg9wwGUA
 OfESkJdHgsP4uGn7mn9zdPiYjyrv+ynzw5jhlzXy0KXM8Xf0X97swKdAP+H3NxaqD264
 e/A1McDQAipxLLoFHo7HGK4eaBrPCWnjdnYxRkI9y8JS/qeu6exLvHJ9PhBkGtHJSJcT
 t4wFcL+6n9kJBH89WNgQqxYbo9lKQ5NzNQ6V1cIx4i7w+ThyazAAm4GP625U/03GHxm8
 zGzKCMIcdU3BZ+C7e5aVr7nXs2eBEnyZxY9nK6Ktw46bo2sfsoIVA64ivGAMkY3ma2KE
 x8ug==
X-Gm-Message-State: AOAM5312fJPf1qgXze/+py42FzBkOVAKkDRisIqiDRDfZ32KvZJCmpoo
 DKkUYS6ERZTALVZgbKjNRA==
X-Google-Smtp-Source: ABdhPJws4TdO+DPNS83SxM7XXfOVzOeooClPFMk6APULxosklf1aAoTwygi1il30jNMUX7PawpRkzg==
X-Received: by 2002:a4a:52c4:: with SMTP id d187mr10680196oob.53.1632244221024; 
 Tue, 21 Sep 2021 10:10:21 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id h15sm372163ots.2.2021.09.21.10.10.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 10:10:19 -0700 (PDT)
Received: (nullmailer pid 2967390 invoked by uid 1000);
 Tue, 21 Sep 2021 17:10:17 -0000
Date: Tue, 21 Sep 2021 12:10:17 -0500
From: Rob Herring <robh@kernel.org>
To: Olivier Moysan <olivier.moysan@foss.st.com>
Message-ID: <YUoR+Z5HEE56odzj@robh.at.kernel.org>
References: <20210908155452.25458-1-olivier.moysan@foss.st.com>
 <20210908155452.25458-3-olivier.moysan@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210908155452.25458-3-olivier.moysan@foss.st.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Lars-Peter Clausen <lars@metafoo.de>, linux-iio@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 2/7] dt-bindings: iio: adc: add nvmem
 support for vrefint internal channel
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

On Wed, 08 Sep 2021 17:54:47 +0200, Olivier Moysan wrote:
> Add support of nvmem. This allows to retrieve calibration data from OTP
> for vrefint internal channel.
> 
> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
> ---
>  .../devicetree/bindings/iio/adc/st,stm32-adc.yaml         | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
