Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F1845A809
	for <lists+linux-stm32@lfdr.de>; Tue, 23 Nov 2021 17:35:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8E532C5A4D4;
	Tue, 23 Nov 2021 16:35:11 +0000 (UTC)
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com
 [209.85.166.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 57A7DC57189
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Nov 2021 16:35:10 +0000 (UTC)
Received: by mail-io1-f52.google.com with SMTP id k21so28720582ioh.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Nov 2021 08:35:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=L+wT8ZVIvUW7LbdAd258WQWbKmsU54AD2qUyaW0yHWs=;
 b=vbI40K6+e6uTsmO/Tb2GUZT9We4t+6Nb/U7BFZM496/uhZ/ROeibGWKfY5W7H7i+UL
 o41nr7oDVMdSekn/qTPdp91Fv79UQrgxrErAXV0ybMrlF9KjvMIk+8jaosysi+8ONmyu
 Afx3vm26TAWuN1ciM7HfQjjSMZMRrhAss3wxFShPnTbtfCVKNAmFlk6zwxz5gg3ovnn+
 ej+Nq76UNB9HhnibeGVf24qsFEe5KaZxvARPxHZJpyrKjOsop8H39xMyvU6rh2QR0fNX
 MS+vcsKh/GTXd2+ie18luu5tZXA4voeo6lh5II0do30flIJhZVWctjpum8czblz/0pHp
 X++w==
X-Gm-Message-State: AOAM531yKHt3skQkPyBcfjDBvWmPDb95FbezXs4WAAp/LicPTdH1WE3+
 lG/d1buI6SLLX6am5f8mFQ==
X-Google-Smtp-Source: ABdhPJyQBPu5DjU807Y7rKr+WqMhNBwFzOESYmvnIx6qfZZBopTYE7H8kZ1Ck5Wqc55lHBOpRNlIJg==
X-Received: by 2002:a05:6602:1513:: with SMTP id
 g19mr7141385iow.31.1637685309326; 
 Tue, 23 Nov 2021 08:35:09 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id x15sm9270605ill.20.2021.11.23.08.35.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 08:35:08 -0800 (PST)
Received: (nullmailer pid 3442926 invoked by uid 1000);
 Tue, 23 Nov 2021 16:34:29 -0000
From: Rob Herring <robh@kernel.org>
To: Olivier Moysan <olivier.moysan@foss.st.com>
In-Reply-To: <20211119144551.7577-3-olivier.moysan@foss.st.com>
References: <20211119144551.7577-1-olivier.moysan@foss.st.com>
 <20211119144551.7577-3-olivier.moysan@foss.st.com>
Date: Tue, 23 Nov 2021 09:34:29 -0700
Message-Id: <1637685269.721768.3442925.nullmailer@robh.at.kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, arnaud.pouliquen@foss.st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/9] ASoC: dt-bindings: stm32: i2s: add
	audio-graph-card port
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

On Fri, 19 Nov 2021 15:45:44 +0100, Olivier Moysan wrote:
> The STM2 I2S DAI can be connected via the audio-graph-card.
> Add port entry into the bindings.
> 
> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
> ---
>  Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/1557189


audio-controller@4000b000: 'port' does not match any of the regexes: '^port@[0-9]', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/stm32mp157a-dk1.dt.yaml
	arch/arm/boot/dts/stm32mp157c-dk2.dt.yaml

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
