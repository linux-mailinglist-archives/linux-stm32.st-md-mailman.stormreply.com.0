Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 546A34299B0
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Oct 2021 01:13:50 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0BD47C5C82F;
	Mon, 11 Oct 2021 23:13:50 +0000 (UTC)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com
 [209.85.210.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A9CBBC32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Oct 2021 23:13:48 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id
 l7-20020a0568302b0700b0054e40740571so17934607otv.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Oct 2021 16:13:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=7zuoS5ImJfku8d8xCEMyvxbsSp1wfRVxODVvjTNPpWI=;
 b=Q+7f5wZNa9dwrTmebu6kuWJL3cPOSXjF18xugKynNb1jLzDfBan5qiJBKZKbk7RADT
 KZiMp7Ong4vXejq06MT2zISMfXMKDM3IACGDFajOXMZn92ug0njy3JSgZqrtfhvQ4FGK
 PVNH3p3ngwQ9g2CZ51qDVkk15LTu1mtVBMlUJhje5BE4sIzj1cQkyksspac61AK5Vk8J
 3IokesuLUP3kCsDLJ1pgThOEIo+aJYHQmhaUqMRfTxWT8NyGOZvFY7Im9T2D8Qwy1MIc
 woHPdx0WZbXDpwE9PWkBHY0UzZvIWSHO3hE1r9T0XbWNtLqoK7J+Oh6plal6/dDZXT4P
 5kig==
X-Gm-Message-State: AOAM533aiyg3wO3Rn7VPw1LHC0CreiGb9OIyT+4pOZGw2vS4G06OAZVR
 1vR0rata6GVmbQCqx4UORw==
X-Google-Smtp-Source: ABdhPJwgjqa80alYqxnGTfd3HMgT9XwEeOu7Wz9fbyC7hQnvyMYxKzqnL/RZNXXaNYHYTgIuXCirxw==
X-Received: by 2002:a9d:7114:: with SMTP id n20mr14348496otj.25.1633994026820; 
 Mon, 11 Oct 2021 16:13:46 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id r4sm2049640oiw.36.2021.10.11.16.13.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Oct 2021 16:13:45 -0700 (PDT)
Received: (nullmailer pid 1347640 invoked by uid 1000);
 Mon, 11 Oct 2021 23:13:43 -0000
From: Rob Herring <robh@kernel.org>
To: Olivier Moysan <olivier.moysan@foss.st.com>
In-Reply-To: <20211011155717.1594-2-olivier.moysan@foss.st.com>
References: <20211011155717.1594-1-olivier.moysan@foss.st.com>
 <20211011155717.1594-2-olivier.moysan@foss.st.com>
Date: Mon, 11 Oct 2021 18:13:43 -0500
Message-Id: <1633994023.340533.1347639.nullmailer@robh.at.kernel.org>
Cc: devicetree@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>,
 linux-iio@vger.kernel.org, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Jonathan Cameron <jic23@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 1/7] dt-bindings: iio: stm32-adc: add
	generic channel binding
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Mon, 11 Oct 2021 17:57:11 +0200, Olivier Moysan wrote:
> Add ADC generic channel binding. This binding should
> be used as an alternate to legacy channel properties
> whenever possible.
> ADC generic channel binding allows to identify supported
> internal channels through the following reserved label names:
> "vddcore", "vrefint" and "vbat".
> This binding also allows to set a different sampling time
> for each channel.
> 
> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
> Reviewed-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> ---
>  .../bindings/iio/adc/st,stm32-adc.yaml        | 100 ++++++++++++++++--
>  1 file changed, 93 insertions(+), 7 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.example.dt.yaml: adc@48003000: adc@100:channel@13: 'st,min-sample-time-nsecs' does not match any of the regexes: 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.example.dt.yaml: adc@48003000: adc@100:channel@14: 'st,min-sample-time-nsecs' does not match any of the regexes: 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.example.dt.yaml: adc@48003000: adc@100:channel@15: 'st,min-sample-time-nsecs' does not match any of the regexes: 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1539385

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
