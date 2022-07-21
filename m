Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A71E457D3D9
	for <lists+linux-stm32@lfdr.de>; Thu, 21 Jul 2022 21:09:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0F22BC03FEA;
	Thu, 21 Jul 2022 19:09:49 +0000 (UTC)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com
 [209.85.166.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 916B2C03FD5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Jul 2022 19:09:47 +0000 (UTC)
Received: by mail-io1-f43.google.com with SMTP id 125so2084657iou.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Jul 2022 12:09:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hQFrxHeJdzvANrllAmKTlhCi9vN8C5VKpFJVCaVkLFs=;
 b=YEryKthGsonX4sx0ctmQw2MFELaXHj/1ms9JZJpZKWYbVxZR4Nd36zeXmLtY4Sx9wX
 eimfIM1rsO7qHMIGRzQpl9D9/T7FcfKzDQSd/NTUNJzDrMbsPHvrzVddtG21vpQSJvF4
 JRL80fgCIYOSw3PXqpN9rn3LXGe3KlpB2pyU0MU9M5db/oCGX2xDUL/0UcbNkcdA4owJ
 ELrz8wDm/1b9HnNYk4Fa+/1GzdiF7G8+ZPU0UhcqOhqtKZ90w3b+EmJ8IRAhVm0iDxh7
 BuMVMHyQ0CTXbVe82ZYM6bNflrolSWi4WvQjrN14qzFpmZkj+lF+arWLWuQjybH5T0Kq
 DaEg==
X-Gm-Message-State: AJIora81gBIkumfXJLFBGG90fQZVpm6o/6ghxYtMkbrEwa2Q6Jr84eJT
 y1cDo0KAyxuFt6JFfSVLBw==
X-Google-Smtp-Source: AGRyM1u7fzVuv/Kt9k58mUx+0yDPia+vIuP9OYCu9LHllLtFNlhXxaPyN6CZT32rGhwqGmpJvoNGGg==
X-Received: by 2002:a6b:fe05:0:b0:67b:ec2a:8138 with SMTP id
 x5-20020a6bfe05000000b0067bec2a8138mr13302755ioh.185.1658430586339; 
 Thu, 21 Jul 2022 12:09:46 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id
 c27-20020a023b1b000000b0033f86542abfsm1119995jaa.37.2022.07.21.12.09.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jul 2022 12:09:45 -0700 (PDT)
Received: (nullmailer pid 1763155 invoked by uid 1000);
 Thu, 21 Jul 2022 19:09:44 -0000
Date: Thu, 21 Jul 2022 13:09:44 -0600
From: Rob Herring <robh@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Lee Jones <lee.jones@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Message-ID: <20220721190944.GA1759974-robh@kernel.org>
References: <20220706211934.567432-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220706211934.567432-1-robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: mfd: stm32-timers: Move
 fixed string node names under 'properties'
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

On Wed, Jul 06, 2022 at 03:19:33PM -0600, Rob Herring wrote:
> Fixed string node names should be under 'properties' rather than
> 'patternProperties'. Additionally, without beginning and end of line
> anchors, any prefix or suffix is allowed on the specified node name.
> 
> Move the stm32 timers 'counter' and 'timer' nodes to the 'properties'
> section.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../bindings/mfd/st,stm32-lptimer.yaml        | 28 +++++++++----------
>  .../bindings/mfd/st,stm32-timers.yaml         | 20 ++++++-------
>  2 files changed, 24 insertions(+), 24 deletions(-)

Lee, going to pick this one up?

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
