Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 04AEC33C1B2
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Mar 2021 17:26:56 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C2E58C57B5A;
	Mon, 15 Mar 2021 16:26:55 +0000 (UTC)
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com
 [209.85.166.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D844EC57A41
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Mar 2021 16:26:53 +0000 (UTC)
Received: by mail-il1-f176.google.com with SMTP id b5so9890695ilq.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Mar 2021 09:26:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uNo6vdAx+jzMNRzSxihSuYm26CfiZWtwAB/YSlTgofg=;
 b=S8p3iaskYqMTdWy0Q021lVbCjNayqIkd37qq6Hm9ErlnU9fUr6B4H6T6LkjWekZRHu
 I+fTk68s32VKRsByiY3qWYdb5goGESu1spv2osvH+BWjNXJSwmJcO81KZqEpQ82UZTbS
 K+uAiT/b6W7vSYt7l426vvYVR9xMTlNXWBy05aw7ujKYqLXy3sm1K/8vuwdEElC+6mr5
 /yn/csRVkudpZ6fL4d67v3Ml87ayqVheZ1bskB+Gsgizj2SRcFrToFVQv1Xm33+cgj3z
 ySAYTqyoMC2EY6zwggJU/HDbbNuR1dNGJoONPQaJSHNaKHT6wfNUPWNx+hwlt1g9JZlT
 sfoA==
X-Gm-Message-State: AOAM5337WrgcXD4kTfVPC/c2AlKg+kQcxSxUDyzI51WsNolTaEf2O35i
 FYw0ZNvGwDKJ/GdoENvjDQ==
X-Google-Smtp-Source: ABdhPJw+veskbFJEXXCKZ2E/BDJV2CNNfMgN0Pv1qQFI928Wh1rpDctvLR3CxE8mWqEyWroMro7orw==
X-Received: by 2002:a92:d6cf:: with SMTP id z15mr355098ilp.40.1615825612758;
 Mon, 15 Mar 2021 09:26:52 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id s9sm7125949iob.33.2021.03.15.09.26.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 09:26:52 -0700 (PDT)
Received: (nullmailer pid 982357 invoked by uid 1000);
 Mon, 15 Mar 2021 16:26:48 -0000
Date: Mon, 15 Mar 2021 10:26:48 -0600
From: Rob Herring <robh@kernel.org>
To: dillon.minfei@gmail.com
Message-ID: <20210315162648.GB981570@robh.at.kernel.org>
References: <1615801436-3016-1-git-send-email-dillon.minfei@gmail.com>
 <1615801436-3016-4-git-send-email-dillon.minfei@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1615801436-3016-4-git-send-email-dillon.minfei@gmail.com>
Cc: devicetree@vger.kernel.org, vladimir.murzin@arm.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux@armlinux.org.uk, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-serial@vger.kernel.org,
 afzal.mohd.ma@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 erwan.leray@st.com, alexandre.torgue@st.com
Subject: Re: [Linux-stm32] [PATCH v3 3/9] dt-bindings: pinctrl: stm32: Add
	stm32h750 pinctrl
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

On Mon, 15 Mar 2021 17:43:50 +0800, dillon.minfei@gmail.com wrote:
> From: dillon min <dillon.minfei@gmail.com>
> 
> This patch intend to add pinctrl configuration support for
> stm32h750 value line
> 
> The datasheet of stm32h750 value line can be found at:
> https://www.st.com/resource/en/datasheet/stm32h750ib.pdf
> 
> Signed-off-by: dillon min <dillon.minfei@gmail.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
