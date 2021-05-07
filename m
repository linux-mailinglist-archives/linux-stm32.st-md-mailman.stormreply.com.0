Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D87A375E44
	for <lists+linux-stm32@lfdr.de>; Fri,  7 May 2021 03:14:53 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 16CE6C58D78;
	Fri,  7 May 2021 01:14:53 +0000 (UTC)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com
 [209.85.210.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5B889C56630
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 May 2021 01:14:52 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id
 q7-20020a9d57870000b02902a5c2bd8c17so6621815oth.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 06 May 2021 18:14:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=oEfCN0pfoA/qDroFhgTH+ere0rMR3Q9MSvHYsosWDl8=;
 b=Y0RwFHZsFSbH30UCPoPvo+hFB6n92pIEOGeU2YyJl3OV613xVjXDUpt7tnjd+7ir0u
 WDYnTSQW/6fNm0zFhImgDp2Emi4uHdZH/VJpwUS+DM5Df3/hJmBDHuGSWMYMTtjXwuzA
 4Fcm4i2vB0IGo1xcrmqGXFWr+KJQaXKqu7ZQdwWfg29dhyYHtUurfolMrKZqQL9Qig1M
 HynRF/fOivYaotlw4UJAKPrHg83Hp48hkCLhC4h1hu5//Ut90eS9hPzg6l9Pn8Chz9hI
 ZHpDT55px2qZwSL/J/YpZ8JEgD6nS2J8VgNz7OvA0KlU1n28UZ7YIyebuzgofzqD0fu+
 nycw==
X-Gm-Message-State: AOAM530QvvzCKjgZ1XsY7aoEOWIRnhyDRjLfZpz8BRqvTlg+7x9spHb8
 4dKqazQGUUKxuO0R6hR61A==
X-Google-Smtp-Source: ABdhPJwH6pLpfJTNIPyBF2g8fBrl9A07O+m3Rx4UXrIsglOnYIjflryN7rQAEjYLNNSULq8cGge4wQ==
X-Received: by 2002:a9d:7997:: with SMTP id h23mr6097466otm.366.1620350091104; 
 Thu, 06 May 2021 18:14:51 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id f13sm948681ote.46.2021.05.06.18.14.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 May 2021 18:14:50 -0700 (PDT)
Received: (nullmailer pid 1127217 invoked by uid 1000);
 Fri, 07 May 2021 01:14:49 -0000
Date: Thu, 6 May 2021 20:14:49 -0500
From: Rob Herring <robh@kernel.org>
To: Zhen Lei <thunder.leizhen@huawei.com>
Message-ID: <20210507011449.GA1126886@robh.at.kernel.org>
References: <20210506132049.1513-1-thunder.leizhen@huawei.com>
 <20210506132049.1513-2-thunder.leizhen@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210506132049.1513-2-thunder.leizhen@huawei.com>
Cc: devicetree <devicetree@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Al Cooper <alcooperx@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 linux-serial <linux-serial@vger.kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-stm32 <linux-stm32@st-md-mailman.stormreply.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v3 1/2] dt-bindings: serial: Change to
 reference the kernel-defined serial.yaml
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

On Thu, 06 May 2021 21:20:48 +0800, Zhen Lei wrote:
> The /schemas/serial.yaml from dt-schema only has the property $nodename,
> whereas the kernel-defined /schemas/serial/serial.yaml contains more
> useful properties, support for more complex application scenarios.
> 
> For example:
> 1) The property "current-speed" in fsl-lx2160a.dtsi
> 2) The subnode "bluetooth" in hi3660-hikey960.dts
> 
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
> ---
>  Documentation/devicetree/bindings/serial/8250.yaml            | 2 +-
>  .../devicetree/bindings/serial/brcm,bcm7271-uart.yaml         | 2 +-
>  Documentation/devicetree/bindings/serial/ingenic,uart.yaml    | 2 +-
>  Documentation/devicetree/bindings/serial/pl011.yaml           | 4 ++--
>  Documentation/devicetree/bindings/serial/qca,ar9330-uart.yaml | 4 ++--
>  Documentation/devicetree/bindings/serial/renesas,em-uart.yaml | 2 +-
>  Documentation/devicetree/bindings/serial/samsung_uart.yaml    | 2 +-
>  Documentation/devicetree/bindings/serial/sifive-serial.yaml   | 4 ++--
>  .../devicetree/bindings/serial/snps-dw-apb-uart.yaml          | 2 +-
>  Documentation/devicetree/bindings/serial/st,stm32-uart.yaml   | 3 +--
>  10 files changed, 13 insertions(+), 14 deletions(-)
> 

Thanks for doing this!

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
