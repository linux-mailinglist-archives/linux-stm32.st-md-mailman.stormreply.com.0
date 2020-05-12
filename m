Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1181D019E
	for <lists+linux-stm32@lfdr.de>; Wed, 13 May 2020 00:10:51 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 16889C32E8E;
	Tue, 12 May 2020 22:10:51 +0000 (UTC)
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0B2A2C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 May 2020 22:10:48 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id b18so19678552oic.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 May 2020 15:10:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=hLS7bp8T/22TjzypF5PGmB5dEY+3krp0hxJHV/JBg7g=;
 b=rSsdRpIf7lV3BagYYmuVhz4Hl1R8s06cFlPOREdUzp9cnzfinj2dgIS+EBJLnnf3h+
 UANvSLNB6OMcUqMEmgU0LO7ZcTG2T41EB45Xpm9aQGDT4GN5CYsq6GuRnaVevKj/nggi
 CpfFIetmLXL+/tDctfpTxld54hs28EhW/waru9+G29mU3jsdYh36IhlfJaFb4cRvjz5P
 T6NcendTyxbVQBXkZLnCQ78fae2AmxsFSKWte8NkaAk2MVLi64HEw/SkbZ3a35iqC9/F
 DESgDyqMtWopwNXYtSV6GGgV73uE7XzilqJJUljaD4bQ7NWegzM0gUabB2iVgde0/3u8
 MZNQ==
X-Gm-Message-State: AGi0PubNTzR7J+arm4yDbvhgDyWDsYsz8ckYh4k/L2jqfM5R/9Ndo3fO
 aPUAQR3BihNHQAFopsheMw==
X-Google-Smtp-Source: APiQypKGf4qEmv6HKFeAwKeNvcyY2qEuJmES4jhc+TZ+TkY+0koHDMAcOv8WvrCsD+XIzcg0qyyu9w==
X-Received: by 2002:aca:d9d7:: with SMTP id
 q206mr24081650oig.134.1589321447426; 
 Tue, 12 May 2020 15:10:47 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id h9sm1222216oor.21.2020.05.12.15.10.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 15:10:46 -0700 (PDT)
Received: (nullmailer pid 24273 invoked by uid 1000);
 Tue, 12 May 2020 22:10:46 -0000
Date: Tue, 12 May 2020 17:10:46 -0500
From: Rob Herring <robh@kernel.org>
To: mani@kernel.org
Message-ID: <20200512221046.GA24216@bogus>
References: <20200503154215.23654-1-mani@kernel.org>
 <20200503154215.23654-2-mani@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200503154215.23654-2-mani@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/6] dt-bindings: Add vendor prefix for
 Shiratech Solutions
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

On Sun,  3 May 2020 21:12:10 +0530,  wrote:
> From: Manivannan Sadhasivam <mani@kernel.org>
> 
> This commit adds devicetree vendor prefix for Shiratech solutions,
> a SOM/embedded board manufacturing company.
> 
> https://www.shiratech-solutions.com/
> 
> Signed-off-by: Manivannan Sadhasivam <mani@kernel.org>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
