Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C0126373C
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Sep 2020 22:23:04 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 87004C3FAE2;
	Wed,  9 Sep 2020 20:23:04 +0000 (UTC)
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
 [209.85.166.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7602FC36B33
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Sep 2020 20:23:02 +0000 (UTC)
Received: by mail-il1-f194.google.com with SMTP id m1so3574659ilj.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 09 Sep 2020 13:23:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=p/XHmGhJiyARP/AywHLjGyFW+zNdKo78DZXJUs497vk=;
 b=f/BLHmCOlzYE9RMSGp+FTMwknqUevIqV+nWsFR2sBcaiaF8ZpIHS7WpNAijqgi6dBc
 jOF52Agzz8ZfpWvHsl4VYXZndLwHl20OxJVIV365xWET0/6gNIynSrAzdAJTNGVN3hNA
 hdF6gMxlCS0VCmU3uoUrIh0bd5vYmaRX34137yi+L47swttfth7JBUpLy25AGmjI4YBo
 BvG+3ajZcahTLrOGchvneO1bmsZ1CxQ9KOb03fU6wlwhdJLgqsALvRKcZJPo/hs/p/gb
 w8NZDl7ku/dH+UbPZ+GFml/pHHhtdz0njO3QMKrqCNVOF5xU9J8gq1361KeqPbNSd4Bs
 esoA==
X-Gm-Message-State: AOAM533KidEEH06usYuN1H1ey88uDbKI5nEqF1IAmGu9hGDa66ZRKBRt
 iyk6f9C7EfrTYrL/re6xZmAJFmMhjkPb
X-Google-Smtp-Source: ABdhPJwGgJMfrg41VCSlFUyxeF4VEeQtHEzW/mNeG0zBjw9Qla8f2sLKD3BFKup9Yno/CdJR1OlO5Q==
X-Received: by 2002:a92:bad9:: with SMTP id t86mr4991746ill.308.1599682981597; 
 Wed, 09 Sep 2020 13:23:01 -0700 (PDT)
Received: from xps15 ([64.188.179.251])
 by smtp.gmail.com with ESMTPSA id f83sm2024294ilg.9.2020.09.09.13.22.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2020 13:23:00 -0700 (PDT)
Received: (nullmailer pid 3008103 invoked by uid 1000);
 Wed, 09 Sep 2020 20:22:51 -0000
Date: Wed, 9 Sep 2020 14:22:51 -0600
From: Rob Herring <robh@kernel.org>
To: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Message-ID: <20200909202251.GA2975092@bogus>
References: <20200827072101.26588-1-arnaud.pouliquen@st.com>
 <20200827072101.26588-3-arnaud.pouliquen@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200827072101.26588-3-arnaud.pouliquen@st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, devicetree@vger.kernel.org,
 Mathieu Poirier <mathieu.poirier@linaro.org>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Fabien Dessenne <fabien.dessenne@st.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/3] dt-bindings: remoteproc: stm32_rproc:
 update for firmware synchronization
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

On Thu, Aug 27, 2020 at 09:21:00AM +0200, Arnaud Pouliquen wrote:
> Add new properties description used to attach to a pre-loaded
> firmware according to the commit 9276536f455b3
> ("remoteproc: stm32: Parse syscon that will manage M4 synchronisation")
> which updates the driver part.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
> ---
>  .../bindings/remoteproc/st,stm32-rproc.yaml   | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
> index 4ffa25268fcc..e50957d86b1c 100644
> --- a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
> @@ -96,6 +96,25 @@ properties:
>          3rd cell: register bitmask for the deep sleep bit
>      maxItems: 1
>  
> +  st,syscfg-m4-state:
> +    $ref: "/schemas/types.yaml#/definitions/phandle-array"
> +    description: |
> +      Reference to the tamp register which exposes the Cortex-M4 state.
> +        1st cell: phandle to syscon block
> +        2nd cell: register offset containing the Cortex-M4 state
> +        3rd cell: register bitmask for the Cortex-M4 state
> +    maxItems: 1
> +
> +  st,syscfg-rsc-tbl:
> +    $ref: "/schemas/types.yaml#/definitions/phandle-array"
> +    description: |
> +      Reference to the tamp register which references the Cortex-M4
> +      resource table address.
> +        1st cell: phandle to syscon block
> +        2nd cell: register offset containing the resource table address
> +        3rd cell: register bitmask for the resource table address
> +    maxItems: 1

Why can't these be implied? You can lookup the tamp syscon by 
compatible.

Please add these to the example.

> +
>    st,auto-boot:
>      $ref: /schemas/types.yaml#/definitions/flag
>      description:
> -- 
> 2.17.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
