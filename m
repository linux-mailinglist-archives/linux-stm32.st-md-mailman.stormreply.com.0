Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA29366097
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Apr 2021 22:04:45 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 72713C5719E;
	Tue, 20 Apr 2021 20:04:45 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
 [209.85.210.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 36149C3FADC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Apr 2021 20:04:43 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id
 k14-20020a9d7dce0000b02901b866632f29so36930552otn.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Apr 2021 13:04:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/HxOtJjXRLRSor/ODsPfy5BZOXhp79IDyQZu4OyaTbM=;
 b=UBgISCHYEhV2wqyOy5gCA2kc1bZeWvUcCwl/njMpakGROXUaOHqQg/KELixAGzkfyd
 Bru/H/OZy74zqCLczoS9mGn5tLhmIQXHj04jjiPoRNLSlQoQjaCpgmIkTUZrh4VNKmIg
 aEF0oh00q82yMNuPI16gMsWIWUW/7qFKaCxGskDsYetqHBp2Ibk01hzLs6Y+hcbZCMmO
 4kopY9h8KwQVOE9/TOT+3+rF3b32dtzTJqutOsUEjmZf7Ummun59taDGx40ccIiKXk4b
 zwstDE7bhKdg2B8bGS6tWu9JMLi5vHGXS/FZr1OlprSkTsDLEJYdxJ2oeYwEacr/mpoy
 hFrg==
X-Gm-Message-State: AOAM533yjH9ga/SA1DVX9lCDp3iidlLLkTE8RvOXShJ9KThSdyx6/24Y
 cb+Nh6bpgHA3MyAqzUFBWw==
X-Google-Smtp-Source: ABdhPJwfhMsGLd8dCI8UsdaTln+zjv3z7qFHlTK2dy8VLuAY3ZbTsa1fQZ1mSQcT3X05kHEMYafhWg==
X-Received: by 2002:a9d:64b:: with SMTP id 69mr20371216otn.63.1618949081968;
 Tue, 20 Apr 2021 13:04:41 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id l1sm16447oot.40.2021.04.20.13.04.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 13:04:41 -0700 (PDT)
Received: (nullmailer pid 3722585 invoked by uid 1000);
 Tue, 20 Apr 2021 20:04:40 -0000
Date: Tue, 20 Apr 2021 15:04:40 -0500
From: Rob Herring <robh@kernel.org>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
Message-ID: <20210420200440.GA3722536@robh.at.kernel.org>
References: <20210415101037.1465-1-alexandre.torgue@foss.st.com>
 <20210415101037.1465-5-alexandre.torgue@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210415101037.1465-5-alexandre.torgue@foss.st.com>
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org, arnd@arndb.de,
 linux-kernel@vger.kernel.org, Marcin Sloniewski <marcin.sloniewski@gmail.com>,
 robh+dt@kernel.org, jagan@amarulasolutions.com,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, kuba@kernel.org,
 Lee Jones <lee.jones@linaro.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 04/13] dt-bindings: mfd: stm32-timers:
 remove #address/size cells from required properties
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

On Thu, 15 Apr 2021 12:10:28 +0200, Alexandre Torgue wrote:
> address-cells and size-cells can't be declared as "required" properties
> as they are not needed if subnodes don't have a "reg" entry.
> 
> Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
