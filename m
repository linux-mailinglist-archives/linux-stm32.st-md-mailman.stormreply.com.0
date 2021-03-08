Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E913314B1
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Mar 2021 18:24:57 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 58FCDC57195;
	Mon,  8 Mar 2021 17:24:56 +0000 (UTC)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com
 [209.85.166.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AD7CBC5718B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Mar 2021 17:24:54 +0000 (UTC)
Received: by mail-il1-f179.google.com with SMTP id e7so9526662ile.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 08 Mar 2021 09:24:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=R8gKey3dqPPlv14cbiWtlikKVEw7APesOnqMJJKljpo=;
 b=NL+prOe4tsRBAX6jqRbi/kDciKXenkBya6OB7USfmo2Z1KOHQaNp9JUvKqgRONmzkZ
 VhsI/0dznw+8uvCloTc57Z5CBjf0DXeDMw5VxnCfcUwbAAhgJ0S+tVxLXgl/b3S1PKwj
 Nby7EoQttOzl2rkPW01OYjVq3yiUDGLb+LXEGQQr+xPP/9VwSrscNprgSEqcFzjXqm8K
 Ffo7gzqftRTZ/UvFeXM2CQOt9mvKqTMRxiNowWNn40c9nIPWHKG0Yv7L1sO2Qm33LgT8
 vfL2Y+sJCeKsBdNrQ2q+bAHflmAJNn616T3E9h+ihfE0aYlq3aMYBoKlMEj65/uyCDPQ
 TrxA==
X-Gm-Message-State: AOAM532jXeq62f+1hsHej4N2DPh9cLC12pdhluX9VoOpY074kJDiE2Mg
 Q/+NdbaKfCkTQLIBjNPYog==
X-Google-Smtp-Source: ABdhPJxagGrSADn7x14IJxmNxUggJ5drrypy3N1weXpB6jWR8dDO41XnCg6MuTz+YTpgSPM8eE7ZMw==
X-Received: by 2002:a05:6e02:12ac:: with SMTP id
 f12mr20640279ilr.103.1615224293332; 
 Mon, 08 Mar 2021 09:24:53 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id k23sm6361502iol.36.2021.03.08.09.24.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 09:24:52 -0800 (PST)
Received: (nullmailer pid 2659624 invoked by uid 1000);
 Mon, 08 Mar 2021 17:24:50 -0000
Date: Mon, 8 Mar 2021 10:24:50 -0700
From: Rob Herring <robh@kernel.org>
To: Jagan Teki <jagan@amarulasolutions.com>
Message-ID: <20210308172450.GA2659327@robh.at.kernel.org>
References: <20210228154323.76911-1-jagan@amarulasolutions.com>
 <20210228154323.76911-7-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210228154323.76911-7-jagan@amarulasolutions.com>
Cc: devicetree@vger.kernel.org, Alexandre Torgue <alexandre.torgue@st.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-amarula@amarulasolutions.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 06/10] dt-bindings: arm: stm32: Add
 Engicam i.Core STM32MP1 C.TOUCH 2.0
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

On Sun, 28 Feb 2021 21:13:19 +0530, Jagan Teki wrote:
> i.Core STM32MP1 is an EDIMM SoM based on STM32MP157A from Engicam.
> 
> C.TOUCH 2.0 is a general purpose carrier board with capacitive
> touch interface support.
> 
> i.Core STM32MP1 needs to mount on top of this Carrier board for
> creating complete i.Core STM32MP1 C.TOUCH 2.0 board.
> 
> Add bindings for it.
> 
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
> Changes for v3:
> - none
> 
>  Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
