Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B694D5539
	for <lists+linux-stm32@lfdr.de>; Fri, 11 Mar 2022 00:22:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 850B7C628A1;
	Thu, 10 Mar 2022 23:22:31 +0000 (UTC)
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com
 [209.85.161.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 559EBC5EC6C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Mar 2022 23:22:30 +0000 (UTC)
Received: by mail-oo1-f48.google.com with SMTP id
 q1-20020a4a7d41000000b003211b63eb7bso8667440ooe.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Mar 2022 15:22:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QxaQQz9lOMso9LFniZ3e9gms+zpAX5bMoBiGaq2NQ80=;
 b=bA+MaW23R2KWUY06wm2hEV6+y4JJvV3UDLqVEG7osEmf+idGX1PasbZ5vuynYcaxqx
 I+rQUeGvDxG1xUUqL/o3L5XHs1gX0YNYsdqa/FnOpgApbtF3WRcCASIHcNUOiSDhdyGq
 2r5a2iC1SALlfxGHqKSerbrW1YnHL0NlDmIUDaDwPUYgtg4QpEjxjKxdZX/A6SCOxQY8
 okqSpiG7Y5sOsWsEot2SagHayijLaR5ZS8x8jvGHj+29RVRej7u7Lm1Od/Y30USUO7Mx
 3FMOxhBVbYlIQenNa/8AZFPRbdQEddotxfMEfzvCdDoNbwBGjhBpNofj5dRhQhTvu7kB
 BNng==
X-Gm-Message-State: AOAM533ypHHExXKfpwKDxPmqpQIsHvb6qbdBrlu7ep49BfwtfXxVYWkS
 aG4b9eOSxjt5jYTpmp2UPw==
X-Google-Smtp-Source: ABdhPJwFNsTJVQACKTaShwctSIDZiz2m99HjBzfGEBRTiXcYlYBa4o1rP9aU6sHuo0rtftWCEpnoWw==
X-Received: by 2002:a05:6870:a2c6:b0:da:b3f:2b2a with SMTP id
 w6-20020a056870a2c600b000da0b3f2b2amr9626676oak.201.1646954549150; 
 Thu, 10 Mar 2022 15:22:29 -0800 (PST)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 n6-20020a9d6f06000000b005b266e43c92sm2567768otq.73.2022.03.10.15.22.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 15:22:28 -0800 (PST)
Received: (nullmailer pid 2287090 invoked by uid 1000);
 Thu, 10 Mar 2022 23:22:27 -0000
Date: Thu, 10 Mar 2022 17:22:27 -0600
From: Rob Herring <robh@kernel.org>
To: trix@redhat.com
Message-ID: <YiqIMxCBFY8Aq5p4@robh.at.kernel.org>
References: <20220309222302.1114561-1-trix@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220309222302.1114561-1-trix@redhat.com>
Cc: devicetree@vger.kernel.org, tmaimon77@gmail.com, paulburton@kernel.org,
 avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, yuenn@google.com,
 alexandre.torgue@foss.st.com, robh+dt@kernel.org, mcoquelin.stm32@gmail.com,
 krzk+dt@kernel.org, tali.perry1@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 benjaminfair@google.com
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: clk: cleanup comments
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

On Wed, 09 Mar 2022 14:23:02 -0800, trix@redhat.com wrote:
> From: Tom Rix <trix@redhat.com>
> 
> For spdx, first line /* */ for *.h, change tab to space
> 
> Replacements
> devider to divider
> Comunications to Communications
> periphrals to peripherals
> supportted to supported
> wich to which
> Documentatoin to Documentation
> 
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  include/dt-bindings/clock/alphascale,asm9260.h    | 2 +-
>  include/dt-bindings/clock/axis,artpec6-clkctrl.h  | 2 +-
>  include/dt-bindings/clock/boston-clock.h          | 3 +--
>  include/dt-bindings/clock/marvell,mmp2.h          | 4 ++--
>  include/dt-bindings/clock/marvell,pxa168.h        | 4 ++--
>  include/dt-bindings/clock/marvell,pxa910.h        | 4 ++--
>  include/dt-bindings/clock/nuvoton,npcm7xx-clock.h | 2 +-
>  include/dt-bindings/clock/stm32fx-clock.h         | 4 ++--
>  include/dt-bindings/clock/stratix10-clock.h       | 2 +-
>  9 files changed, 13 insertions(+), 14 deletions(-)
> 

Applied, thanks!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
