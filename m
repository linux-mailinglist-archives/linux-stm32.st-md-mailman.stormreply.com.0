Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A6A19E6A6
	for <lists+linux-stm32@lfdr.de>; Sat,  4 Apr 2020 19:18:27 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B7E69C36B0B;
	Sat,  4 Apr 2020 17:18:26 +0000 (UTC)
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
 [209.85.166.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EE802C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  4 Apr 2020 17:18:24 +0000 (UTC)
Received: by mail-il1-f195.google.com with SMTP id j9so10598710ilr.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 04 Apr 2020 10:18:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=6/+9ql20CpFx44LIbrTXEaI2rIrP2FNLIFPT9pvv1Qs=;
 b=Yd82QF0gA6WZpVyTqiPi/SnSj5AV/45COZ/n9zwxxpV1X22dmSrFTHL44xL68uGb3h
 S2v0ZpkMF49xrpF/fclpc3CmkaRQ+RzuTc5Cpmh5BI4qHjC+X88WBTbPeotSFLw2pzJN
 eMu5sZBf0VCwJ8c8g00bCk9JMknYLBWQpQ8kXYB01tVAzs4+V7cg49yuQiZWG2bCr5wi
 5S/wK12J2xv01DcOYrhvH1jF0JgQ0MFbITTt0dHGNaimOy7g08MRx4GjY+KxFEwvZ9xK
 TCbIWp3xdPdHijBGgXVXH7fpX/Y5G03VMGkRjgyMvZYTmud4vZcB5h4SSa2bEP14BG88
 cwxw==
X-Gm-Message-State: AGi0PuY7LgPkfKL8LMtyZyCo20n+ms1XRSAZ2YN01bcbRhFhDVn9D8o/
 SeB7anMSW4p8W5aLXUymhg==
X-Google-Smtp-Source: APiQypIzCX8GwLPGwwKuqPKkuY3KZcZx+/fEOhsdfxnj62kPmcdX91ySH0xxjFk/0PA6YlV8wtmF0A==
X-Received: by 2002:a92:d347:: with SMTP id a7mr14714839ilh.289.1586020703682; 
 Sat, 04 Apr 2020 10:18:23 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id h24sm3416997iog.29.2020.04.04.10.18.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Apr 2020 10:18:23 -0700 (PDT)
Received: (nullmailer pid 24101 invoked by uid 1000);
 Sat, 04 Apr 2020 17:18:20 -0000
Date: Sat, 4 Apr 2020 11:18:20 -0600
From: Rob Herring <robh@kernel.org>
To: Alain Volmat <alain.volmat@st.com>
Message-ID: <20200404171820.GA24040@bogus>
References: <1585226661-26262-1-git-send-email-alain.volmat@st.com>
 <1585226661-26262-2-git-send-email-alain.volmat@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1585226661-26262-2-git-send-email-alain.volmat@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, wsa@the-dreams.de,
 linux-kernel@vger.kernel.org, pierre-yves.mordret@st.com, alain.volmat@st.com,
 robh+dt@kernel.org, linux-i2c@vger.kernel.org, mcoquelin.stm32@gmail.com,
 fabrice.gasnier@st.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/2] dt-bindings: i2c: i2c-stm32f7:
 allow clock-frequency range
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

On Thu, 26 Mar 2020 13:44:20 +0100, Alain Volmat wrote:
> For STM32F7, STM32H7 and STM32MP1 SoCs, if timing parameters
> match, the bus clock frequency can be from 1Hz to 1MHz.
> 
> Signed-off-by: Alain Volmat <alain.volmat@st.com>
> ---
> v2: identical to v1
> 
>  Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
