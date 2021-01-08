Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC262EEB62
	for <lists+linux-stm32@lfdr.de>; Fri,  8 Jan 2021 03:41:37 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1A1C5C57194;
	Fri,  8 Jan 2021 02:41:37 +0000 (UTC)
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com
 [209.85.166.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B97CDC5662E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Jan 2021 02:41:35 +0000 (UTC)
Received: by mail-il1-f174.google.com with SMTP id x15so8921341ilq.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 07 Jan 2021 18:41:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=UReZgsEeNazDb1E0tvnMlZgxkV/SKchhzjq/uOzNftA=;
 b=I18mcVuiOZctRtZBS2HKIMZb4GCrwB8rYw0IwXALOBDecz5kjDE7Z+sIkyGKcJ5YxC
 yK7qC8WVhmKxpz/+vXIn2nrLNgVFkNxqkPJmUg6PJr5MwqMSRtjycWzB0k4JSxQY2CBp
 P+86UFOuV02e7aML6KXsMqUw9ZeNq1mXKSF/LgVzslbgRHkTG7IuNUNqycowUHIi7VJ/
 AXvvWZZwVHIlhoGScji+KWzisVAAQXgV9AGjZv9YCUIzHzu+pDdw6yasqOoZOFJDN4WH
 8ynmtnglfrQU5+5E4oQla59xG0jYEYNt3Rjwc79heB3dW/U+Vx2WWoqPzXg3WiwDoykA
 WmRQ==
X-Gm-Message-State: AOAM532ycX5WgGVvnU+dWJqn9b6IKSLry68eZwQZpiUEVNx0oHayE24E
 rjaPq//AVTRuQWv40hDV2g==
X-Google-Smtp-Source: ABdhPJxzJ8EBfjRzhw77Uq2UvKWCik2FGY5zfXOrBWgNrJ1t2elsxK6eFsDm54ajklXduSQSYmSkEQ==
X-Received: by 2002:a05:6e02:1311:: with SMTP id
 g17mr1746135ilr.223.1610073694571; 
 Thu, 07 Jan 2021 18:41:34 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id c9sm589879ili.34.2021.01.07.18.41.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 18:41:33 -0800 (PST)
Received: (nullmailer pid 1768224 invoked by uid 1000);
 Fri, 08 Jan 2021 02:41:31 -0000
Date: Thu, 7 Jan 2021 19:41:31 -0700
From: Rob Herring <robh@kernel.org>
To: Jagan Teki <jagan@amarulasolutions.com>
Message-ID: <20210108024131.GA1768173@robh.at.kernel.org>
References: <20201223191402.378560-1-jagan@amarulasolutions.com>
 <20201223191402.378560-5-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201223191402.378560-5-jagan@amarulasolutions.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-amarula@amarulasolutions.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 4/5] dt-bindings: arm: stm32: Add Engicam
 MicroGEA STM32MP1 MicroDev 2.0 7" OF
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

On Thu, 24 Dec 2020 00:44:01 +0530, Jagan Teki wrote:
> MicroGEA STM32MP1 is an EDIMM SoM based on STM32MP157A from Engicam.
> 
> MicroDev 2.0 is a general purpose miniature carrier board with CAN,
> LTE and LVDS panel interfaces.
> 
> 7" OF is a capacitive touch 7" Open Frame panel solutions.
> 
> MicroGEA STM32MP1 needs to mount on top of MicroDev 2.0 board with
> pluged 7" OF for creating complete MicroGEA STM32MP1 MicroDev 2.0
> 7" Open Frame Solution board.
> 
> Add bindings for it.
> 
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
>  Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
