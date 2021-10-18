Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF4C432775
	for <lists+linux-stm32@lfdr.de>; Mon, 18 Oct 2021 21:19:28 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 84B87C5A4D5;
	Mon, 18 Oct 2021 19:19:28 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com
 [209.85.210.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 038F8C597BA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Oct 2021 19:19:27 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id
 s18-20020a0568301e1200b0054e77a16651so1108636otr.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Oct 2021 12:19:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=e6arM/5Dhn7rx7N9waMT1O9TAGcCfI2K71aXcO+9YrY=;
 b=EazNbfFGgzE4isUTl+aq57qWa/3pBVnQ6o7NpiQNbCzcvCZsq1BHCxl7JtYx5VsV/R
 m1o+XzVgyu5qPcbp2/srT0c6ivO4LuPzF87DHh1qXw25Rq3ThjW5+S+NertN9Xx+DlHU
 u9llK59Poj9tWjh+rFbPCEOTzwcM0QeiVw3dh8vX/wr/wP7Q6WD2R4IVDZ4zfHgkdrNj
 CPsdMHq0d+V8svXda99d97cy5po4xgkj2HidHuWaQ/ojeCR1cYWBM/kXp/Qs6gxPcR+3
 bSru19aJ2W5CHJT1+x4+ytd9IURbQlCz3MLU7x/gIv8wy3Ux5TC1hyihV8KlpaUaPEEw
 7aZQ==
X-Gm-Message-State: AOAM531VHsmlCuQbKRhAqtMbmVGWjAmQDXFXryE6xMHh1mmba51GGLpV
 nEm83uM54E+YoKxwEwPjCg==
X-Google-Smtp-Source: ABdhPJxTOuyFSpJchEpUgdmoQy3eg1rOqRBnMUqaBKjstriq7xNvJaPRWzlT80xCva6GiJzaYLK6vw==
X-Received: by 2002:a05:6830:440c:: with SMTP id
 q12mr1435350otv.84.1634584765960; 
 Mon, 18 Oct 2021 12:19:25 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id e22sm3189083otp.0.2021.10.18.12.19.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 12:19:25 -0700 (PDT)
Received: (nullmailer pid 2789232 invoked by uid 1000);
 Mon, 18 Oct 2021 19:19:24 -0000
Date: Mon, 18 Oct 2021 14:19:24 -0500
From: Rob Herring <robh@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <YW3IvEwPKvkyuBMM@robh.at.kernel.org>
References: <1634133425-25670-1-git-send-email-fabrice.gasnier@foss.st.com>
 <1634133425-25670-3-git-send-email-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1634133425-25670-3-git-send-email-fabrice.gasnier@foss.st.com>
Cc: devicetree@vger.kernel.org, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, alexandre.torgue@foss.st.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, hminas@synopsys.com,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v3 2/4] dt-bindings: usb: dwc2: adopt otg
 properties defined in usb-drd.yaml
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

On Wed, 13 Oct 2021 15:57:03 +0200, Fabrice Gasnier wrote:
> Adopt some OTG optional properties as defined in usb-drd.yaml:
> - otg-rev
> - hnp-disable
> - srp-disable
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> ---
>  Documentation/devicetree/bindings/usb/dwc2.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
