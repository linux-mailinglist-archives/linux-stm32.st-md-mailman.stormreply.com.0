Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C04D6825
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Oct 2019 19:16:49 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1F353C36B0B;
	Mon, 14 Oct 2019 17:16:49 +0000 (UTC)
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 525B9C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Oct 2019 17:16:47 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id k20so14380526oih.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Oct 2019 10:16:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=a8hIcdl2e+um++/nUAcgtky3A53BnPYT6tM1T8gzirE=;
 b=GlIJtJj2qpa2TfY76GuWEqGiSW3PXOPhEdyKrBr0IRY5EDLUyk1IwcFUnGQuSo4XrX
 uJU6F0X28YAIPcbw3jjmQptlCz3fwG6oitYmNtGXeUuNxj6QzHyKdY09sluCnTCxx/Wf
 ZaB6nB4uL6L4JveVrGKI6G/1HMvuymcfRWg6MyBdOGeewYzdY7wONTGqf+mzZxCIFGiF
 PZ8L51OsqdaGLGmnCpE6t0RYW180KH8BsZfXEo+/kt8pr44fLXlS1YZLadKuz+GfHvFl
 A+pl0/m+67CEPS2fsLWAClJN1NCSWAAn8k6Z/4WKBMEXMj+mEkhn+u1wtdTLlDDan7M6
 FyNg==
X-Gm-Message-State: APjAAAUYQi52De5DaQfZzjIAzejAii9xe1E2ByZAuyKjNfG1Dp6cVhrx
 8F89Dzb2DYwgt7jeXj146g==
X-Google-Smtp-Source: APXvYqzQz9wZdnGUi/ME0QUo9eS9TqcibXX1bHdajNQOR2xvzskepx0v/CFKXkThQgariekycHrvyQ==
X-Received: by 2002:aca:b841:: with SMTP id i62mr24164992oif.123.1571073405919; 
 Mon, 14 Oct 2019 10:16:45 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id z185sm5729184oia.50.2019.10.14.10.16.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2019 10:16:45 -0700 (PDT)
Date: Mon, 14 Oct 2019 12:16:44 -0500
From: Rob Herring <robh@kernel.org>
To: Benjamin Gaignard <benjamin.gaignard@st.com>
Message-ID: <20191014171644.GA4140@bogus>
References: <20191014091756.23763-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191014091756.23763-1-benjamin.gaignard@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: ohad@wizery.com, mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 bjorn.andersson@linaro.org, robh+dt@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3] dt-bindings: hwlock: Convert stm32
 hwspinlock bindings to json-schema
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

On Mon, 14 Oct 2019 11:17:56 +0200, Benjamin Gaignard wrote:
> Convert the STM32 hwspinlock binding to DT schema format using json-schema
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
> change in v3:
> - use (GPL-2.0-only OR BSD-2-Clause)
> 
> change in v2:
> - use BSD-2-Clause license
> - use const for #hwlock-cells
> - add additionalProperties: false
> 
>  .../bindings/hwlock/st,stm32-hwspinlock.txt        | 23 ----------
>  .../bindings/hwlock/st,stm32-hwspinlock.yaml       | 50 ++++++++++++++++++++++
>  2 files changed, 50 insertions(+), 23 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/hwlock/st,stm32-hwspinlock.txt
>  create mode 100644 Documentation/devicetree/bindings/hwlock/st,stm32-hwspinlock.yaml
> 

Applied, thanks.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
