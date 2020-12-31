Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A51F12E81F4
	for <lists+linux-stm32@lfdr.de>; Thu, 31 Dec 2020 21:37:57 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 584D1C57188;
	Thu, 31 Dec 2020 20:37:57 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
 [209.85.210.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 47EF3C56631
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 31 Dec 2020 20:37:52 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id i6so18862761otr.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 31 Dec 2020 12:37:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=33mJBDwSaLXSZq9uIF9tHwsSa4/sQ0g8ozhF1F4Sc6E=;
 b=eoO4uguJLjj3fHIg1FQHC8UfQ3PZLde3SwD8tn7f3FixL1JprF2FWt5arsDT+KyiYE
 laVX3Tt1CxNUfVTRqA2piSubnE1MT9YLpo64MLkHPEf6L/4AvgwUT69tbz752aZUvVLM
 tMeK5hbJVcI0ckr+6z5vBt8oGTcL/gmM5n3msw3ckN/PCwQxKw9HOailkr/iiIdwuXp5
 D0dsYl6U5mMpjn0CwgsSLFWak4fKiDczNGlB/CVe5N0B9xV3dETTuv9TxynnSAc3aa05
 as9B8GnMHNOQdCMWmK71Kjlrvr79pslSRnQXDeCgjzufODMdcR4VfTb+gVVu06bkQnd6
 gqiQ==
X-Gm-Message-State: AOAM530ZZZ/QeYhtbz9925WSpJ5lJzOPHFMgPWiURZEoOdueKc9qyMAR
 1tjEuYWWgS9VKRby3p2eAA==
X-Google-Smtp-Source: ABdhPJzuS6mrQN9/NoCc6lwKj14DfBKazPXicm33pfgZnY6bLolOGpW9iV1iY/aGl6PBWH0MZYg+NQ==
X-Received: by 2002:a05:6830:1252:: with SMTP id
 s18mr42780191otp.4.1609447071769; 
 Thu, 31 Dec 2020 12:37:51 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id j126sm11281512oib.13.2020.12.31.12.37.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Dec 2020 12:37:50 -0800 (PST)
Received: (nullmailer pid 2321274 invoked by uid 1000);
 Thu, 31 Dec 2020 20:37:49 -0000
Date: Thu, 31 Dec 2020 13:37:49 -0700
From: Rob Herring <robh@kernel.org>
To: Erwan Le Ray <erwan.leray@foss.st.com>
Message-ID: <20201231203749.GA2321239@robh.at.kernel.org>
References: <20201218190020.1572-1-erwan.leray@foss.st.com>
 <20201218190020.1572-6-erwan.leray@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201218190020.1572-6-erwan.leray@foss.st.com>
Cc: devicetree@vger.kernel.org, Valentin Caron <valentin.caron@foss.st.com>,
 linux-serial@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jiri Slaby <jslaby@suse.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 5/8] dt-bindings: serial: stm32: update
 rts-gpios and cts-gpios
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

On Fri, 18 Dec 2020 20:00:16 +0100, Erwan Le Ray wrote:
> Update rts-gpios and cts-gpios:
> - remove max-items as already defined in serial.yaml
> - add a note describing rts-gpios and cts-gpios usage with stm32
> 
> Document the use of cts-gpios and rts-gpios for flow control in STM32 UART
> controller. These properties can be used instead of 'uart-has-rtscts' or
> 'st,hw-flow-ctrl' (deprecated) for making use of any gpio pins for flow
> control instead of dedicated pins.
> It should be noted that both cts-gpios/rts-gpios and 'uart-has-rtscts' or
> 'st,hw-flow-ctrl' (deprecated) properties cannot co-exist in a design.
> 
> Signed-off-by: Erwan Le Ray <erwan.leray@foss.st.com>
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
