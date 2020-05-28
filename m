Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 371B81E53F0
	for <lists+linux-stm32@lfdr.de>; Thu, 28 May 2020 04:34:20 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DA17BC36B21;
	Thu, 28 May 2020 02:34:19 +0000 (UTC)
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
 [209.85.166.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D313EC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 May 2020 02:34:17 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id h10so28363470iob.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 May 2020 19:34:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kqF76bpS0hFEAXdkTHSZ3YXr22hZc22+rys0SA3QMPk=;
 b=VxvdH0schSMGculQtCjyHlbVUbw5bidiEpGGvcI6ACMFlYhnfEIgdnoHJzxFhOiiXu
 kElTVXQfe6t7wE+isxM0ciCdOVXzE01VKv3DyPdEY+f4p5fmljYgdh0XSNtzj6GcLJqk
 dhNb+xpTd6BEqnyAvZdtD5lGdIuHguaH8W4Eq6/6U4yvWS+jrUN5H5ugRczFW6c6HagR
 xmt9ymG3FAWvDP0PTr8KofSp8OrRQL0DBknVoN57ju/0fwcFgmBjo4vGu/AMCCoFHCjA
 IGFKwNHZ/MQFUEIbnGdq0ID5Vl0IxQIFPoOLWvPnLNPm2MbubobOPlEbkYIBo/oLQ++0
 absw==
X-Gm-Message-State: AOAM533/jFtIrHWY37X7bZvJYx8j3/eQfBQ8/2APtjP3sGXy0B9fX7bg
 SidndweoR9riYC+50OzNUQ==
X-Google-Smtp-Source: ABdhPJzF++cIcTDH0TOkYkCFPm5c2j8QHiBDHdUfgKNUuUgtAY/Z7RRWm7F8UYPlEkwmgEQHVbZuww==
X-Received: by 2002:a6b:7017:: with SMTP id l23mr718088ioc.140.1590633256643; 
 Wed, 27 May 2020 19:34:16 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id y12sm2669938ilk.16.2020.05.27.19.34.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 May 2020 19:34:16 -0700 (PDT)
Received: (nullmailer pid 3250304 invoked by uid 1000);
 Thu, 28 May 2020 02:34:14 -0000
Date: Wed, 27 May 2020 20:34:14 -0600
From: Rob Herring <robh@kernel.org>
To: Benjamin Gaignard <benjamin.gaignard@st.com>
Message-ID: <20200528023414.GA3250195@bogus>
References: <20200513145935.22493-1-benjamin.gaignard@st.com>
 <20200513145935.22493-15-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200513145935.22493-15-benjamin.gaignard@st.com>
Cc: devicetree@vger.kernel.org, gregkh@linuxfoundation.org,
 linus.walleij@linaro.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, robh+dt@kernel.org,
 mcoquelin.stm32@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 14/15] dt-bindings: pinctrl: stm32: Add
 missing interrupts property
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

On Wed, 13 May 2020 16:59:34 +0200, Benjamin Gaignard wrote:
> Driver use interrupt-parent field so update the bindings to allow it.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
