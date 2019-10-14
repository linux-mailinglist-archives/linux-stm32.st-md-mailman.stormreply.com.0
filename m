Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6584ED6831
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Oct 2019 19:17:31 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 33B0FC36B0B;
	Mon, 14 Oct 2019 17:17:31 +0000 (UTC)
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AAC2FC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Oct 2019 17:17:28 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id k9so14383123oib.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Oct 2019 10:17:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=+b0QR5MF7DVCOWcWE3GZU/teF1mt8LRV+r1yfAkDfws=;
 b=bQaN9/npPZZu9kpt7g0rZVku1t9pdyCdxBBwszRYR6ojNR4LrEvK5nNYWdck8u4LQf
 X0bwOEQXVwKC+tNKv+l0L13Af287SEMMkaXEt2Q7sds72Wlw8Gz+pQkFG1BnJF//QYe3
 7HOD+Hor9g8QLvxt5IYNaKNsub5laUCd5y5uP2A1g+/YsfLFYBAe04rZz3w19DGIyxT9
 w6MXiDjGo4RVyeWvIvHxqilh+AKloF0C6dYUaaFLx58RBxQd0tszzmbQqNv+uE4oYkMz
 grGqXvXQuvOtamCCzwKKWas1JX170TKBPoJefIe7DSDIV0KbEavPugVc/bocBUylfGVR
 IilQ==
X-Gm-Message-State: APjAAAUQS9hq8jLQBsHu8Fak5SkQf2ScyY1WeDayXuEwwMQJbUAQmpNf
 BXWTYJ8m6ktOSisD93hR1A==
X-Google-Smtp-Source: APXvYqwYipBsJ3yRLmNQwqolPY8YtV2dTSLL7DuXyoSS8Rs5Z+4QzavFZ+eAv1k7qSeBpao+RCMibA==
X-Received: by 2002:aca:d44e:: with SMTP id l75mr25527685oig.44.1571073447359; 
 Mon, 14 Oct 2019 10:17:27 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id n127sm5749817oia.0.2019.10.14.10.17.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2019 10:17:26 -0700 (PDT)
Date: Mon, 14 Oct 2019 12:17:26 -0500
From: Rob Herring <robh@kernel.org>
To: Benjamin Gaignard <benjamin.gaignard@st.com>
Message-ID: <20191014171726.GA5625@bogus>
References: <20191014092021.24020-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191014092021.24020-1-benjamin.gaignard@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, yannick.fertre@st.com, robh+dt@kernel.org,
 mchehab@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v3] dt-bindings: media: Convert stm32 cec
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

On Mon, 14 Oct 2019 11:20:20 +0200, Benjamin Gaignard wrote:
> Convert the STM32 cec binding to DT schema format using json-schema
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
> changes in v3:
> - use (GPL-2.0-only OR BSD-2-Clause) license
> 
> changes in v2:
> - use BSD-2-Clause license
> - add additionalProperties: false
> - remove pinctrl-names and pinctrl-[0-9]
> 
>  .../devicetree/bindings/media/st,stm32-cec.txt     | 19 --------
>  .../devicetree/bindings/media/st,stm32-cec.yaml    | 54 ++++++++++++++++++++++
>  2 files changed, 54 insertions(+), 19 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/st,stm32-cec.txt
>  create mode 100644 Documentation/devicetree/bindings/media/st,stm32-cec.yaml
> 

Applied, thanks.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
