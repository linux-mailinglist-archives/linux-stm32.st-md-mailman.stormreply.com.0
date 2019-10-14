Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B40D683D
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Oct 2019 19:19:05 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 78CF1C36B0B;
	Mon, 14 Oct 2019 17:19:05 +0000 (UTC)
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 61ADEC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Oct 2019 17:19:03 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id 67so14448466oto.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Oct 2019 10:19:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Oawtn+ZtULQjiLVim+vckZa5eaPMWsScI+Ob1030FAs=;
 b=gz/WpFgWs273CgmMkyVAm2agScvWGr39z+lHVpZA5rH57I28Okrq2VRSvG50lDh/na
 BiQZqLTY46JhqR+9rfEWFFKb1PgLVuN8OgD4STRvnVRnnau4PtVSRm3nxXqePoz6bFE6
 c4CyvGIrNLQPaSDt0pRDIUj3VBUBMYyHCQ9aRU+JnYPh/wbphfZMkw/IQ+hiaRb5hCOs
 dpagVpMPyhYSEAQkAs31+UG8q9YUenS1ySWsO7Z1G9gwMiP2+fC/nTn7qEOzg1Pn7Esf
 MBVLO3ijjiLedjqZRtvfoDRp0Fw6BpThsSXMs9l71y7UTv68/h5CNNzqXnZ+SersVlf8
 YOxw==
X-Gm-Message-State: APjAAAUjFQbmiFhH7t3RimvUkhVgNwA4ho7amvKNiWms8b+65uuV2r4K
 1nTG4ojRspu9Zs41NxLqzA==
X-Google-Smtp-Source: APXvYqyPtnEO4APY3yw1HpmCGICMIlAbQFIjbEAo3JeIS6WLqjZNALfT21r09YAL7iS9fjzlr9BLKQ==
X-Received: by 2002:a9d:7993:: with SMTP id h19mr4679414otm.226.1571073542158; 
 Mon, 14 Oct 2019 10:19:02 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id c19sm5576940oib.21.2019.10.14.10.19.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2019 10:19:01 -0700 (PDT)
Date: Mon, 14 Oct 2019 12:19:00 -0500
From: Rob Herring <robh@kernel.org>
To: Benjamin Gaignard <benjamin.gaignard@st.com>
Message-ID: <20191014171900.GA8680@bogus>
References: <20191014092200.24179-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191014092200.24179-1-benjamin.gaignard@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 amit.kucheria@verdurent.com, linux-pm@vger.kernel.org,
 daniel.lezcano@linaro.org, linux-kernel@vger.kernel.org, edubezval@gmail.com,
 robh+dt@kernel.org, rui.zhang@intel.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3] dt-bindings: thermal: Convert stm32
 thermal bindings to json-schema
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

On Mon, 14 Oct 2019 11:22:00 +0200, Benjamin Gaignard wrote:
> Convert the STM32 thermal binding to DT schema format using json-schema
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
> changes in v3:
> - use (GPL-2.0-only OR BSD-2-Clause) license
> - fix indentation
> - add additionalProperties: false
> - add #thermal-sensor-cells property 
> 
>  .../bindings/thermal/st,stm32-thermal.yaml         | 79 ++++++++++++++++++++++
>  .../devicetree/bindings/thermal/stm32-thermal.txt  | 61 -----------------
>  2 files changed, 79 insertions(+), 61 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/thermal/st,stm32-thermal.yaml
>  delete mode 100644 Documentation/devicetree/bindings/thermal/stm32-thermal.txt
> 

Applied, thanks.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
