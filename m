Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6963F144812
	for <lists+linux-stm32@lfdr.de>; Wed, 22 Jan 2020 00:13:14 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2534BC36B0C;
	Tue, 21 Jan 2020 23:13:14 +0000 (UTC)
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 66D2DC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Jan 2020 23:13:12 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id w21so4590554otj.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Jan 2020 15:13:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ooI0TC2R0RPnixxhz1OoqRc6n/Cpz0oN4+WUYyVQIJQ=;
 b=kevbAIj1cyuEBpgTKbZvE2M1HTmK8TV+u6c2WIIk8cDLQvbmHlg96692SNlEJ0aIZ7
 ZGV4iMbO23AARjBeZVEouKDvCc6denMFw3JsbTgTzksOSVZ8OqL+aor7lt7vXme504aG
 rPbMySdtxHxmiRosp5qlnYWqHLt8+7NwBLcJUxLIYX12DNhL4Lq8VO6FfdWEDIiO8UDZ
 f14I8xYpQvFqiagXQ1uT9KaB1b1WLUJDDf2DbrnCOmEwA8NYb/Y7iPXFlhFNEaPAqEtu
 EUURfTBFLRJf3Z0E2He2XLWoF7NWMM1ruPCrJfBCjFI7r/XysfZPQJr/yvhkN9LNvNum
 KF/w==
X-Gm-Message-State: APjAAAWsSp/4TThDSkgJQm75cvQkkJfK7DLBbNe2tiWVi03Xvb6jn5qR
 l42RWVQPHsM/ZsOTSQSlyA==
X-Google-Smtp-Source: APXvYqyPBzxIhoP3H+P9LqIiK3hX3lZ5SBs7l9OTqvE4gQGrbgUrEC2A1vykW7mfrIfYpBNwc/eCWQ==
X-Received: by 2002:a9d:3cf:: with SMTP id f73mr5553811otf.11.1579648391091;
 Tue, 21 Jan 2020 15:13:11 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 67sm12497977oid.30.2020.01.21.15.13.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2020 15:13:10 -0800 (PST)
Received: (nullmailer pid 17419 invoked by uid 1000);
 Tue, 21 Jan 2020 23:13:09 -0000
Date: Tue, 21 Jan 2020 17:13:09 -0600
From: Rob Herring <robh@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@st.com>
Message-ID: <20200121231309.GA17359@bogus>
References: <1579095941-18648-1-git-send-email-fabrice.gasnier@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1579095941-18648-1-git-send-email-fabrice.gasnier@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, lars@metafoo.de,
 linux-iio@vger.kernel.org, pmeerw@pmeerw.net, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, knaack.h@gmx.de, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, jic23@kernel.org
Subject: Re: [Linux-stm32] [PATCH v3] dt-bindings: iio: adc: stm32-adc:
 convert bindings to json-schema
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

On Wed, 15 Jan 2020 14:45:41 +0100, Fabrice Gasnier wrote:
> Convert the STM32 ADC binding to DT schema format using json-schema
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
> ---
> Changes in V3:
> - Fix minimum and maximum syntax for uint32-array properties as pointed
>   out by Rob.
> - update example to better show this syntax e.g. st,adc-channels = <0 1>;
> 
> Changes in V2:
> - Take almost all of Rob suggestions (removed reg generic description,
>   added minItems, maxItems, st,max-clk-rate-hz range, drop some pipes,
>   simplify clock-names, remove unneeded allOfs)
> - For now, keep all in one file despite there are lots of if/thens in the
>   bindings
> ---
>  .../devicetree/bindings/iio/adc/st,stm32-adc.txt   | 149 -------
>  .../devicetree/bindings/iio/adc/st,stm32-adc.yaml  | 458 +++++++++++++++++++++
>  2 files changed, 458 insertions(+), 149 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/iio/adc/st,stm32-adc.txt
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
