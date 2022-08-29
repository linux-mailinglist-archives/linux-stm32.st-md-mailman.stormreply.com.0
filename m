Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CDBEA5A4ED9
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Aug 2022 16:10:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 73E18C04003;
	Mon, 29 Aug 2022 14:10:33 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com
 [209.85.210.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 52C42C03FDA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Aug 2022 14:10:32 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id
 l5-20020a05683004a500b0063707ff8244so5956934otd.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Aug 2022 07:10:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=opbj1lT2rqww+Ko38iiUdytadU+k9CoQLS7KnrXSbyY=;
 b=xBPjoZytoZbSeI83ScEHvKySUakjwwHJ+qxDs2Ly+34WLDFzM3Szo/pSriGyUjdGne
 hNrYQoA+hjXRavaiiY9yIwQfBnZKLrF4Kwr9qKNkIAOiDqbUMxKIGQSKfwdFMl+pPgGb
 +5a3EB/LFrBr0b+EuGqu4vCgEK7H1DdufHVKJyBKNsHD4DZHCXmyTOkv5EaqXxsGYRp1
 M8lZnHxRk27hNOys8THe54JTa0l0C3bzYsS8BFKmkzDTW4TZ5eR+BGu9igt/9tj0rmCP
 iHzB2/bQFnwFbgeEjQiXb/KoQH0pzI/vQ1d5ENjH8Race7EG8oZxdUwaUJ7343hwn/Va
 IHdg==
X-Gm-Message-State: ACgBeo0Swq3p8zW4av00N8jkyAT1KpfgwNCECesI29VbXEUrfLIBWQea
 p4GfUwS5u5IkXePYxGyAfg==
X-Google-Smtp-Source: AA6agR7WIHe/AiLYD102e5d5uKFjLIhVyxUpACShz6LmoyBGjUcs44MJ20snIPOKxNFUVwlVnmhpXw==
X-Received: by 2002:a05:6830:3914:b0:638:f80c:e964 with SMTP id
 br20-20020a056830391400b00638f80ce964mr6530478otb.220.1661782231113; 
 Mon, 29 Aug 2022 07:10:31 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 y5-20020a056830070500b0063b2875246dsm2805095ots.49.2022.08.29.07.10.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Aug 2022 07:10:30 -0700 (PDT)
Received: (nullmailer pid 1485236 invoked by uid 1000);
 Mon, 29 Aug 2022 14:10:29 -0000
Date: Mon, 29 Aug 2022 09:10:29 -0500
From: Rob Herring <robh@kernel.org>
To: Jonathan Cameron <jic23@kernel.org>
Message-ID: <20220829141029.GA1470207-robh@kernel.org>
References: <20220823145649.3118479-2-robh@kernel.org>
 <99dfcc39-ab1b-1b24-c6b2-67de5509f5ac@linaro.org>
 <20220828180050.51c3e857@jic23-huawei>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220828180050.51c3e857@jic23-huawei>
Cc: alsa-devel@alsa-project.org, linux-iio@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, Lars-Peter Clausen <lars@metafoo.de>,
 Michal Simek <michal.simek@xilinx.com>, Andy Gross <agross@kernel.org>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Alexandru Tachici <alexandru.tachici@analog.com>, devicetree@vger.kernel.org,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Cosmin Tanislav <cosmin.tanislav@analog.com>,
 Anand Ashok Dumbre <anand.ashok.dumbre@xilinx.com>,
 Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: iio: Add missing
 (unevaluated|additional)Properties on child nodes
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

On Sun, Aug 28, 2022 at 06:01:41PM +0100, Jonathan Cameron wrote:
> On Thu, 25 Aug 2022 15:04:33 +0300
> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
> 
> > On 23/08/2022 17:56, Rob Herring wrote:
> > > In order to ensure only documented properties are present, node schemas
> > > must have unevaluatedProperties or additionalProperties set to false
> > > (typically).
> > >   
> > 
> > 
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Applied to the togreg branch of iio.git and pushed out as testing for 0-day
> to poke at it before I push out as togreg for linux-next to pick up.

Thanks.

> Side note. Some odd entries in your cc list...  alsa-devel?

Blame MAINTAINERS:

STM32 AUDIO (ASoC) DRIVERS
M:      Olivier Moysan <olivier.moysan@foss.st.com>
M:      Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
L:      alsa-devel@alsa-project.org (moderated for non-subscribers)
S:      Maintained
F:      Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml
F:      Documentation/devicetree/bindings/sound/st,stm32-*.yaml
F:      sound/soc/stm/
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
