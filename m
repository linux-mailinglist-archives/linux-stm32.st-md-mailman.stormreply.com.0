Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0931D01A5
	for <lists+linux-stm32@lfdr.de>; Wed, 13 May 2020 00:11:38 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CC01BC32EA6;
	Tue, 12 May 2020 22:11:37 +0000 (UTC)
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0F59CC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 May 2020 22:11:37 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id p127so194488oia.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 May 2020 15:11:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=RTpvgItjsIRFSZ5D5JwDplmKO7eAYduxml2laMqHkwg=;
 b=kVghj2YuYTZ9KeHWqgJ81ONkizyJHU5/05Cyqu2VypwAMMOZ9aKUgNHsD0yfGNfjxa
 yqAfCXjNfKGEETCNlG7edaZfPKNDY/hhHOlSIcOwj2lhptBNnsqgyZOxNeEbh48SB/3N
 yDU1P6/CeObEbrGzIasUkpiFHvxEB+9/HBCWI0PCbrZXb3GLvFgHf7pfkKNLdiBFIETh
 35Ag8bFeacBtko2DIiDBzRpc1UYGBn4hKQHQjL2+/FogcUQxx64bXl3a4r9B6Vluk/2C
 jTA3mTiCha8u6/Sy3qCSH7gprj0sP3zjjsa6p6WO2ebMFXUqNvNxWmi0TAmq1b9pSSAb
 VtuA==
X-Gm-Message-State: AGi0Pubnsn9SpqSmmqQt+aTHscuBX+VI3FVd/nRK7tjG5nUY0wc2lMsv
 E+qednhafeGXTw7D0EZWmg==
X-Google-Smtp-Source: APiQypJE8Xl38hpDD0pF0oA7mVSnQ/28VAr9BYPuylNa8jiRVasWj469o633WLoXC1xsjFvRKB/CkA==
X-Received: by 2002:aca:b584:: with SMTP id e126mr19711969oif.15.1589321495878; 
 Tue, 12 May 2020 15:11:35 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id v9sm5624639oib.56.2020.05.12.15.11.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 15:11:35 -0700 (PDT)
Received: (nullmailer pid 25779 invoked by uid 1000);
 Tue, 12 May 2020 22:11:34 -0000
Date: Tue, 12 May 2020 17:11:34 -0500
From: Rob Herring <robh@kernel.org>
To: mani@kernel.org
Message-ID: <20200512221134.GA25745@bogus>
References: <20200503154215.23654-1-mani@kernel.org>
 <20200503154215.23654-6-mani@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200503154215.23654-6-mani@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 5/6] dt-bindings: arm: stm32: Document
 IoT Box compatible
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

On Sun,  3 May 2020 21:12:14 +0530,  wrote:
> From: Manivannan Sadhasivam <mani@kernel.org>
> 
> Document devicetree compatible of Shiratech IoT Box.
> 
> Signed-off-by: Manivannan Sadhasivam <mani@kernel.org>
> ---
>  Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
