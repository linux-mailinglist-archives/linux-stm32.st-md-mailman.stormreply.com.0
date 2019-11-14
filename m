Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A89C9FCBE0
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Nov 2019 18:31:33 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6B626C36B0B;
	Thu, 14 Nov 2019 17:31:33 +0000 (UTC)
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5E552C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Nov 2019 17:31:32 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id v138so6008741oif.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Nov 2019 09:31:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=3G1UrTKYq6h7EeCf3xtk9ByNRfqNtMiSs5YT8e3r4Hw=;
 b=YC8w4W63OvYcC+QtxSI9T+FOy9GOUfanOmyfT79xyUn0ehQttEE5IDHaB3fnT5iRJB
 x7pS5LNnjPjuXsHZJcYmJsbPIkD+CIURRtP4Hmtt8m4REvKH6k967drPvRr9BTuNKOxo
 BRUXBu4p0nwePVV98NQnlA8keQzRrErJwbv/vVXycNGn2hiwmgQWmaiD7qAnOlsEIUji
 juCYWTs486Lncw26gQXUAsDJMc8+t5KyJfjCJcZS7qULlpZjB34r1jsg0vKMPMXQ6uJp
 kQyCRU+Ytoa7Ix0/L0hvJiPyqRZoGjQv8HSixDd6HWylx7K0dIo9qdusEDZuTSY234X9
 LYYw==
X-Gm-Message-State: APjAAAWQriQq1DPxW9xM9IEaeOkLGk1FbaSzjzp7EB2lf0UGDil0fs+q
 mhk4FUgxP472aACE0PZRDA==
X-Google-Smtp-Source: APXvYqwyclOEvGyBTY6vREWnjvU+4uvkYPxZcorcMlSKeYf3ZPoZJUiEVybWjLsGdKUcmAP2Hril7Q==
X-Received: by 2002:aca:5e04:: with SMTP id s4mr4533315oib.159.1573752690884; 
 Thu, 14 Nov 2019 09:31:30 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id o4sm2019336ota.57.2019.11.14.09.31.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Nov 2019 09:31:30 -0800 (PST)
Date: Thu, 14 Nov 2019 11:31:29 -0600
From: Rob Herring <robh@kernel.org>
To: Benjamin Gaignard <benjamin.gaignard@st.com>
Message-ID: <20191114173129.GA25237@bogus>
References: <20191114101823.23144-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191114101823.23144-1-benjamin.gaignard@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, lars@metafoo.de,
 linux-pwm@vger.kernel.org, linux-iio@vger.kernel.org,
 u.kleine-koenig@pengutronix.de, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, thierry.reding@gmail.com,
 linux-arm-kernel@lists.infradead.org, pmeerw@pmeerw.net, knaack.h@gmx.de,
 fabrice.gasnier@st.com, lee.jones@linaro.org,
 linux-stm32@st-md-mailman.stormreply.com, jic23@kernel.org
Subject: Re: [Linux-stm32] [PATCH v3] dt-bindings: mfd: Convert stm32 timers
 bindings to json-schema
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

On Thu, 14 Nov 2019 11:18:23 +0100, Benjamin Gaignard wrote:
> Convert the STM32 timers binding to DT schema format using json-schema
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
> version 3:
> - correctly use enum for dma-names and remove additionalItems: true
> - provide a range of values for reg property
> 
> version 2:
> - merge all (mfd, iio, pwm, counter) bindings in one file
> - fix typo and trailing spaces
> - rework dmas and dma-names properties to allow schemas like:
>   ch1 , ch2, ch4
>   ch2, up, com
> - use patternProperties to describe timer subnode
> - improve st,breakinput property definition to be able to check the values
>   inside de tuple
> 
>  .../bindings/counter/stm32-timer-cnt.txt           |  31 ----
>  .../bindings/iio/timer/stm32-timer-trigger.txt     |  25 ----
>  .../devicetree/bindings/mfd/st,stm32-timers.yaml   | 159 +++++++++++++++++++++
>  .../devicetree/bindings/mfd/stm32-timers.txt       |  73 ----------
>  .../devicetree/bindings/pwm/pwm-stm32.txt          |  38 -----
>  5 files changed, 159 insertions(+), 167 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/counter/stm32-timer-cnt.txt
>  delete mode 100644 Documentation/devicetree/bindings/iio/timer/stm32-timer-trigger.txt
>  create mode 100644 Documentation/devicetree/bindings/mfd/st,stm32-timers.yaml
>  delete mode 100644 Documentation/devicetree/bindings/mfd/stm32-timers.txt
>  delete mode 100644 Documentation/devicetree/bindings/pwm/pwm-stm32.txt
> 

Applied, thanks.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
