Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5909F34B00D
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Mar 2021 21:18:58 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 14A49C5718D;
	Fri, 26 Mar 2021 20:18:58 +0000 (UTC)
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com
 [209.85.166.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8E013C32E90
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Mar 2021 20:18:56 +0000 (UTC)
Received: by mail-io1-f50.google.com with SMTP id f19so6672812ion.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Mar 2021 13:18:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Z5fnCZ8eriALH/wVywXxei9R/GBDBcSFb+uK/SYuxjI=;
 b=OkaEHv2Ys5c7xQmdbr4mTlsTO4aBw6N3emzdm8UX7GSfdSwNabGmGxSi3KZAKI295M
 8vxooZHZfNIRsHeF5f3rO5tmHYUyPWUBg747eJ18mOQPurXu3M1hTsqyYPmR/tQSoisY
 Vgdyg7b0nFECR47PAm66qIgKWUXPvQPoWREoOTfdNK+JZJgXws9cF7kbScILQhTkNLtW
 5LVAfbz8vMycApKIudMmeQYUF1BpEZRqzQqw7Ck24+xmD4/q8NPbYvxU7VfGmgc2OI5W
 WoWhsDKbZ0JBa1d56fPXEb0IsvnZ/r8Om7UCNzDJoPdHxC5VqkOK/5FWYcgUoyxFlz7z
 NK6g==
X-Gm-Message-State: AOAM530fuTzLbSO/OHRx+G1Hlw3ELxG35tN2HzvJ4aXXGPLHRHuB/bZE
 Vp1p/bPkCbsyBgbPqZxckA==
X-Google-Smtp-Source: ABdhPJw8hxpqliqEqveCE0yBH3PreXUErj+X7V6Syn7BEnO+wv2aoj4g5Y+Msh+D4irsnKkg8+KstA==
X-Received: by 2002:a02:cb8f:: with SMTP id u15mr13266031jap.45.1616789935338; 
 Fri, 26 Mar 2021 13:18:55 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id r15sm4864130iot.5.2021.03.26.13.18.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Mar 2021 13:18:53 -0700 (PDT)
Received: (nullmailer pid 3799500 invoked by uid 1000);
 Fri, 26 Mar 2021 20:18:50 -0000
Date: Fri, 26 Mar 2021 14:18:50 -0600
From: Rob Herring <robh@kernel.org>
To: dillon.minfei@gmail.com
Message-ID: <20210326201850.GA3799452@robh.at.kernel.org>
References: <1616757302-7889-1-git-send-email-dillon.minfei@gmail.com>
 <1616757302-7889-8-git-send-email-dillon.minfei@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1616757302-7889-8-git-send-email-dillon.minfei@gmail.com>
Cc: devicetree@vger.kernel.org, lkp@intel.com, rong.a.chen@intel.com,
 linux@armlinux.org.uk, gregkh@linuxfoundation.org,
 Alexandre.torgue@foss.st.com, linux-kernel@vger.kernel.org,
 vladimir.murzin@arm.com, erwan.leray@st.com, mcoquelin.stm32@gmail.com,
 linux-serial@vger.kernel.org, afzal.mohd.ma@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v6 9/9] dt-bindings: serial: stm32: Use
 'type: object' instead of false for 'additionalProperties'
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

On Fri, 26 Mar 2021 19:15:02 +0800, dillon.minfei@gmail.com wrote:
> From: dillon min <dillon.minfei@gmail.com>
> 
> To use additional properties 'bluetooth' on serial, need replace false with
> 'type: object' for 'additionalProperties' to make it as a node, else will
> run into dtbs_check warnings.
> 
> 'arch/arm/boot/dts/stm32h750i-art-pi.dt.yaml: serial@40004800:
> 'bluetooth' does not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Fixes: af1c2d81695b ("dt-bindings: serial: Convert STM32 UART to json-schema")
> Reported-by: kernel test robot <lkp@intel.com>
> Tested-by: Valentin Caron <valentin.caron@foss.st.com>
> Signed-off-by: dillon min <dillon.minfei@gmail.com>
> ---
> 
> v6: no changes
> 
>  Documentation/devicetree/bindings/serial/st,stm32-uart.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
