Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D21213613F7
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Apr 2021 23:13:05 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 99208C57B79;
	Thu, 15 Apr 2021 21:13:05 +0000 (UTC)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com
 [209.85.167.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 93BA7C36B25
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Apr 2021 21:13:03 +0000 (UTC)
Received: by mail-oi1-f180.google.com with SMTP id u16so8401280oiu.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Apr 2021 14:13:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hsGbbCuNHyHicec2zlV4ieUDQ0EApXEKhu0lF/4S5gk=;
 b=Dh2sWVZakBjcb3uHAAB5rHXexka/RbgykGvLvdE+R6wIpRgu37/eTYS0TpDT+jbJpt
 nCDjrBS02PAD4+rIMSbEx5r3lI7BeI8heaIUOcFBgdqyf/xmg2s3CPZJIH/HYgJA6s8A
 x/h2MLwaKXkzz2BzfT2txiCxREhe34eZQGPWdPdlt1dr0ZR2dm5JG0oxl8efcx1r3+sX
 zlBuhx4awFd4UKVqTWi5mE12x7TVCrFxFhiacJRrfCdZi5alLw1Jh8BRQ/3pS2qqvSqu
 3GZ+ApiI5hXc+CTY7hWt27vN/7QuDIuWmDSl8pfO6L5oz78if+sRqfb2JMkz4xcMu6SH
 GBKg==
X-Gm-Message-State: AOAM531KaBXnoc34njDdiDRbUW9TLVPIk5hW/k2ttpKF0MwWAOerPRuu
 5qv+TBLMjzBgWHGhWDt5bg==
X-Google-Smtp-Source: ABdhPJxoyqjr8cK8/sf8EzyhHArK/AKn+UIzTkRXOW0E2wQJb4XwbZYWwALod6aOyM9ibZPUjzmEgA==
X-Received: by 2002:aca:df44:: with SMTP id w65mr3877224oig.36.1618521182433; 
 Thu, 15 Apr 2021 14:13:02 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id f5sm799950oom.35.2021.04.15.14.13.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 14:13:01 -0700 (PDT)
Received: (nullmailer pid 1891784 invoked by uid 1000);
 Thu, 15 Apr 2021 21:13:00 -0000
Date: Thu, 15 Apr 2021 16:13:00 -0500
From: Rob Herring <robh@kernel.org>
To: Erwan Le Ray <erwan.leray@foss.st.com>
Message-ID: <20210415211300.GA1891734@robh.at.kernel.org>
References: <20210413174015.23011-1-erwan.leray@foss.st.com>
 <20210413174015.23011-3-erwan.leray@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210413174015.23011-3-erwan.leray@foss.st.com>
Cc: devicetree@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-serial@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Jiri Slaby <jslaby@suse.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 2/4] dt-bindings: serial: stm32:
 override FIFO threshold properties
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

On Tue, 13 Apr 2021 19:40:13 +0200, Erwan Le Ray wrote:
> Override rx-threshold and tx-threshold properties:
> - extend description
> - provide default and expected values
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> Signed-off-by: Erwan Le Ray <erwan.leray@foss.st.com>
> 
> Changes in v2:
> Change added properties naming and factorize it in serial.yaml as proposed
> by Rob Herring.
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
