Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B2AD0346D21
	for <lists+linux-stm32@lfdr.de>; Tue, 23 Mar 2021 23:30:51 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C3F63C57B5A;
	Tue, 23 Mar 2021 22:30:50 +0000 (UTC)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
 [209.85.166.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9D1FDC32EA7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Mar 2021 22:30:48 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id n21so19458728ioa.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Mar 2021 15:30:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=z0xQqmzALS2FhLdkzcWSihGa+FeQuFbmAwvE7tjw9YI=;
 b=YpTicoReAB9L3AbKooe7jouj8hWs2eEwn4DV84JMjQTv+mztXBpXqDkDKSijUk/Som
 vm2uAY6kIhABnajpvmtBFdk9x/xoHOvQS92l+yWysQh1Vyt3MBTAN53wLeqNAMCvqE1+
 LuAHto2PWjJezIggJzhnI/YDrHfQ+m+rKdHJ9hXWnFvh5tB43/O9jsAMTqQ3+ln71+iy
 yU2G5LEoTzYyJ35sa+Ow/LHW6jeRDfVLPXM79LL0pSTdLaAaeZ8N9cMZruQZa/id7a4D
 Q686ksKMc9Wx2ZNnbYPzbsvTCfv3P9ZCmfAqQoD/LTQLdIOdR4T9//arL/0asrE34QwN
 YrAw==
X-Gm-Message-State: AOAM531QKulITMeRwK/iUEJALLu/TPCfaATLsy00yq+TYTsN9fFANlCW
 LEvtumwaWq/CKkpibbX6MA==
X-Google-Smtp-Source: ABdhPJyp2GyxLMCUzepm+Z+ITtn/OVbU1LfwLQWNFPA34sQJ/S7koa026FSCFUPs4pbKlfdAi0qdVA==
X-Received: by 2002:a5d:9959:: with SMTP id v25mr238442ios.189.1616538647518; 
 Tue, 23 Mar 2021 15:30:47 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id x6sm107877ioh.19.2021.03.23.15.30.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 15:30:46 -0700 (PDT)
Received: (nullmailer pid 1463268 invoked by uid 1000);
 Tue, 23 Mar 2021 22:30:44 -0000
Date: Tue, 23 Mar 2021 16:30:44 -0600
From: Rob Herring <robh@kernel.org>
To: Martin Devera <devik@eaxlabs.cz>
Message-ID: <20210323223044.GA1463209@robh.at.kernel.org>
References: <1615559009.788146.2976052.nullmailer@robh.at.kernel.org>
 <20210312153702.12349-1-devik@eaxlabs.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210312153702.12349-1-devik@eaxlabs.cz>
Cc: devicetree@vger.kernel.org, Alexandre Torgue <alexandre.torgue@st.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-serial@vger.kernel.org,
 Jiri Slaby <jirislaby@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Le Ray <erwan.leray@st.com>
Subject: Re: [Linux-stm32] [PATCH v7 1/2] dt-bindings: serial: Add
	rx-tx-swap to stm32-usart
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

On Fri, 12 Mar 2021 16:37:01 +0100, Martin Devera wrote:
> Add new rx-tx-swap property to allow for RX & TX pin swapping.
> 
> Signed-off-by: Martin Devera <devik@eaxlabs.cz>
> Acked-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> ---
> v7:
>   - fix yaml linter warning
> v6:
>   - add version changelog
> v5:
>   - yaml fixes based on Rob Herring comments
>     - add serial.yaml reference
>     - move compatible from 'then' to 'if'
> v3:
>   - don't allow rx-tx-swap for st,stm32-uart (suggested
>     by Fabrice Gasnier)
> v2:
>   - change st,swap to rx-tx-swap (suggested by Rob Herring)
> ---
>  .../devicetree/bindings/serial/st,stm32-uart.yaml  | 29 ++++++++++++++--------
>  1 file changed, 19 insertions(+), 10 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
