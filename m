Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 09AF0104302
	for <lists+linux-stm32@lfdr.de>; Wed, 20 Nov 2019 19:10:01 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C6E58C36B0B;
	Wed, 20 Nov 2019 18:10:00 +0000 (UTC)
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8CBC3C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Nov 2019 18:09:58 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id v138so619281oif.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Nov 2019 10:09:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=YzyZQ4fEqLiui26PMcdzE5fiKafIuHsPZ+HchTRfUPQ=;
 b=HCjD+qSEdG3p/zLoXEGQlM1HV0iGXIm7qgMe5eOPdbIco9tAYPbXRfIZl52dblhla6
 d3O8h+kQQzm3Mlb1lDM/wqgLr+UX0wEm5TO++r6Ez1x94itffPIsOmMkw4s5xiU/gu8F
 5V9uaoCrag5lGF0/O4rEmYN++bVb+2AOqvjdQ+u+l3+fcXO4D3p8uJLGzP3evcYTrDEv
 +ctv5fcvxgmnqIPW38Ts8kRRnH/QVsFwrhgm8EN0eScsn2uCccd7v8bxVgl3Vd5MuSyw
 MW309qDRVsiqqmfQhdPQ7M1cfhNqQ0/7heRNL2MpSO5PMnythJcJdbT0ANfzui3aM1ua
 ok3w==
X-Gm-Message-State: APjAAAUuL6vLUQtwNq4Ir40CQ+hfi360tHx7rZXaxROPSh8j76OZlzwX
 yRn6u+4MGHb8ypZBA33b0g==
X-Google-Smtp-Source: APXvYqzaDfbYrfeEjWY541EKHP6pgAPEWL5ptEcD1hGCgK+Un3JISnVZs/7iXribLlYOAxWgCIgp5w==
X-Received: by 2002:aca:cfd8:: with SMTP id f207mr3990174oig.145.1574273397185; 
 Wed, 20 Nov 2019 10:09:57 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id a10sm8305379otf.72.2019.11.20.10.09.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Nov 2019 10:09:56 -0800 (PST)
Date: Wed, 20 Nov 2019 12:09:55 -0600
From: Rob Herring <robh@kernel.org>
To: Benjamin Gaignard <benjamin.gaignard@st.com>
Message-ID: <20191120180955.GA22823@bogus>
References: <20191118094842.20171-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191118094842.20171-1-benjamin.gaignard@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, lars@metafoo.de,
 linux-pwm@vger.kernel.org, linux-iio@vger.kernel.org,
 u.kleine-koenig@pengutronix.de, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, thierry.reding@gmail.com,
 linux-arm-kernel@lists.infradead.org, pmeerw@pmeerw.net, knaack.h@gmx.de,
 fabrice.gasnier@st.com, lee.jones@linaro.org,
 linux-stm32@st-md-mailman.stormreply.com, jic23@kernel.org
Subject: Re: [Linux-stm32] [PATCH v2] dt-bindings: mfd: Convert stm32 low
 power timers bindings to json-schema
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

On Mon, 18 Nov 2019 10:48:42 +0100, Benjamin Gaignard wrote:
> Convert the STM32 low power timers binding to DT schema format using json-schema
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
> changes in version 2:
> - improve counter function description
> - set reg maximum to 2 instead of 3
> 
>  .../bindings/counter/stm32-lptimer-cnt.txt         |  29 -----
>  .../bindings/iio/timer/stm32-lptimer-trigger.txt   |  23 ----
>  .../devicetree/bindings/mfd/st,stm32-lptimer.yaml  | 120 +++++++++++++++++++++
>  .../devicetree/bindings/mfd/stm32-lptimer.txt      |  48 ---------
>  .../devicetree/bindings/pwm/pwm-stm32-lp.txt       |  30 ------
>  5 files changed, 120 insertions(+), 130 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/counter/stm32-lptimer-cnt.txt
>  delete mode 100644 Documentation/devicetree/bindings/iio/timer/stm32-lptimer-trigger.txt
>  create mode 100644 Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml
>  delete mode 100644 Documentation/devicetree/bindings/mfd/stm32-lptimer.txt
>  delete mode 100644 Documentation/devicetree/bindings/pwm/pwm-stm32-lp.txt
> 

Applied, thanks.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
