Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C5212661F
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Dec 2019 16:51:08 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E6131C36B0C;
	Thu, 19 Dec 2019 15:51:07 +0000 (UTC)
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E0128C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Dec 2019 15:51:05 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id a15so7763512otf.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Dec 2019 07:51:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ci18yO6S0a6TgITq8YqQaAsiIr5weNY4GfvU653cx3c=;
 b=kTHNLF8GdGt4SVpyWN08GDuQ+KsvqrnD009V0R+PhJl9KkqSivbI3U5oHls6bPD+J5
 5nnYuo1gbsnyGNxSCmxvJcZVtouVaZCyMHbznINtUtgLj3TksI8RobH+6ysMCxRgst2x
 ZixuwLXT76iyCSFbRQPFE2un/Dyn3xKGB5Zaa3JhFjxGVult42rAOhKURZOK1O5wexkD
 J9eTjpsPSF4xB/pyvzslqoKw/D+bzfy8ee8hnMls+PYXXv6Grd3yTp0lyvbB+voPrKK+
 wThrA25JQ4oQFF8ORTQY5BSyYHvQPjHtIAQAkXKsFFhUA9XNKRgSxqm1Re/wdP0bngWA
 7SXw==
X-Gm-Message-State: APjAAAVkgHf5IxIDnMvVMcHDAqS9+t1FxFzcHPjbvD/DdzyEBQhcKjUa
 pI4JExilrSNe7/8hbnQ8Bw==
X-Google-Smtp-Source: APXvYqxBitxJErG8fqxh+172fCWcJiax2apTWgRol/iP7/vlCUvpXo+dEXMMyBU3q5UoTCa+0/Od8A==
X-Received: by 2002:a9d:7a8f:: with SMTP id l15mr9106619otn.109.1576770664003; 
 Thu, 19 Dec 2019 07:51:04 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id l1sm2092339oic.22.2019.12.19.07.51.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2019 07:51:03 -0800 (PST)
Date: Thu, 19 Dec 2019 09:51:02 -0600
From: Rob Herring <robh@kernel.org>
To: Benjamin Gaignard <benjamin.gaignard@st.com>
Message-ID: <20191219155102.GA26498@bogus>
References: <20191121084316.13839-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191121084316.13839-1-benjamin.gaignard@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, wim@linux-watchdog.org,
 linux-stm32@st-md-mailman.stormreply.com, linux@roeck-us.net,
 linux-watchdog@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2] dt-bindings: watchdog: Convert stm32
 watchdog bindings to json-schema
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

On Thu, Nov 21, 2019 at 09:43:16AM +0100, Benjamin Gaignard wrote:
> Convert the STM32 watchdog binding to DT schema format using json-schema
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
> changes in version 2:
> - remove trailer space
> - add Christophe in the maintainers list
>   
>  .../devicetree/bindings/watchdog/st,stm32-iwdg.txt | 26 ----------
>  .../bindings/watchdog/st,stm32-iwdg.yaml           | 55 ++++++++++++++++++++++
>  2 files changed, 55 insertions(+), 26 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.txt
>  create mode 100644 Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.yaml

Fixed up a typo with 'enums' and applied.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
