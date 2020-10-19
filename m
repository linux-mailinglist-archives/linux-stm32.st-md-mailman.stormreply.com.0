Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 35879292F5C
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Oct 2020 22:26:59 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 937AFC424B9;
	Mon, 19 Oct 2020 20:26:58 +0000 (UTC)
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 14C83C424B3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Oct 2020 20:26:57 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id q136so1417653oic.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Oct 2020 13:26:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XfquN+jLUKwzjwaiCkY1B6coFTTURkYacPYZ2F52YKA=;
 b=a1p7m9Ly6RYsUV4eCdh265YTgV6w1h05kNoWUO1jY6jxv+7EdiUc7RRJf4v9aX8Vq2
 0neR9k1AVRPO+tWpzrpLwiz/9BSsRZJZOSrMWFHNcNept9AwHO9lVVyLzKXrmgy42XhI
 MFYveM7qr5i3gw032vZKksSiTHoP8Yux9felZqwmzyhsNm/NB4Y7pOsQELF908AsJ+DR
 f6N66owNui9qJ2zc/kNdnwn69S4ne745V/GoouvwLKcU9mWdOCq8moxVWkxDLwg8ZbF4
 yG0wiUJPBdBA3baOWXcM3PdOc6vy3Nws0iLpg7UYK+fkihm+LXzM70zhFWNAWAyjUp1Z
 xjFg==
X-Gm-Message-State: AOAM531v4SsET9cjUDZ/UxgHBHZMOeEGRTXr6k7/anTraD8bGowJZCkv
 2HSOe0vP7054n2HKgMAQfQ==
X-Google-Smtp-Source: ABdhPJzsabpxr5YCChl9ztj7eUGnP0Wg+3h4WNy0xEkTLZ7GCfUfGe6W3x2YrnBSXyPoNWUahK5Mgg==
X-Received: by 2002:aca:5a84:: with SMTP id o126mr819009oib.100.1603139215932; 
 Mon, 19 Oct 2020 13:26:55 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id d27sm202565otc.6.2020.10.19.13.26.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2020 13:26:55 -0700 (PDT)
Received: (nullmailer pid 3549356 invoked by uid 1000);
 Mon, 19 Oct 2020 20:26:54 -0000
Date: Mon, 19 Oct 2020 15:26:54 -0500
From: Rob Herring <robh@kernel.org>
To: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Message-ID: <20201019202654.GA3549318@bogus>
References: <20201014125441.2457-1-arnaud.pouliquen@st.com>
 <20201014125441.2457-3-arnaud.pouliquen@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201014125441.2457-3-arnaud.pouliquen@st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, devicetree@vger.kernel.org,
 Mathieu Poirier <mathieu.poirier@linaro.org>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 2/4] dt-bindings: remoteproc:
 stm32_rproc: update for firmware synchronization
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

On Wed, 14 Oct 2020 14:54:39 +0200, Arnaud Pouliquen wrote:
> Add new properties description used to attach to a pre-loaded
> firmware according to the commit 9276536f455b3
> ("remoteproc: stm32: Parse syscon that will manage M4 synchronisation")
> which updates the driver part.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
> ---
>  .../bindings/remoteproc/st,stm32-rproc.yaml       | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
