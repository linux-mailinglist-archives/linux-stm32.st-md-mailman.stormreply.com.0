Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F027643276D
	for <lists+linux-stm32@lfdr.de>; Mon, 18 Oct 2021 21:19:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4BBC6C5A4D5;
	Mon, 18 Oct 2021 19:19:07 +0000 (UTC)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com
 [209.85.167.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 93E91C597BA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Oct 2021 19:19:06 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id m67so1210818oif.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Oct 2021 12:19:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XzZA50mc4BjmpmEztRaxMISR4WRQ5FsdiLAiBdxZMQ8=;
 b=oP3MHf2qfkLOWUUCUzxZCHJwkx41E88yU0IvZpGsxgnlstKL1vKU/IstwkAGVKXmOl
 iS9i/AUPoX04JL7Dhb5/AgnvAv/90fIGT/TqG5ldXt1NjGU6pYRhubgX216B/0BrXFAV
 YGeT/ALWqa5/N76d9ww+Ks5m0SUjGMqeOdFjhUOsIpxk25PxQMxO+5fFjouM9hMr7sDZ
 edHP+t/32gilieQazCGg+zjcd+a/rQ/Us3zoqyGVOnzz0KOM2XOiaqd+cyq4yEdpdhQg
 ceqPGBFGYiL5WZYhw3RgF0rZJ7WQ9LZXf4uBzTBOvkNx2N4ZlmSVJEMHcN4sR9Fkh4Fi
 XuLg==
X-Gm-Message-State: AOAM530+4N/Mkhl8FQWRnHxHdjjajiiK4yUn8qZ1n37tbhXXvfBb0Tpb
 gltms8QjQjl9M8qE6hdjag==
X-Google-Smtp-Source: ABdhPJzi5oIzQvFFsTJQzRG1M4YHxjr7RvG38AEuCWK4MXFxFyARyWTLHNWWGxwh4ifKNHkYHkbDVA==
X-Received: by 2002:a05:6808:20a6:: with SMTP id
 s38mr563895oiw.149.1634584745423; 
 Mon, 18 Oct 2021 12:19:05 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id l26sm3248993oti.45.2021.10.18.12.19.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 12:19:04 -0700 (PDT)
Received: (nullmailer pid 2788566 invoked by uid 1000);
 Mon, 18 Oct 2021 19:19:03 -0000
Date: Mon, 18 Oct 2021 14:19:03 -0500
From: Rob Herring <robh@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <YW3Ip4gxMnYSIsUg@robh.at.kernel.org>
References: <1634133425-25670-1-git-send-email-fabrice.gasnier@foss.st.com>
 <1634133425-25670-2-git-send-email-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1634133425-25670-2-git-send-email-fabrice.gasnier@foss.st.com>
Cc: devicetree@vger.kernel.org, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, alexandre.torgue@foss.st.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, hminas@synopsys.com,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v3 1/4] dt-bindings: usb: dwc2: Add
 reference to usb-drd.yaml
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

On Wed, 13 Oct 2021 15:57:02 +0200, Fabrice Gasnier wrote:
> Add a reference to usb-drd.yaml, in order to:
> - extend possible supported properties
> - avoid duplicated definitions of standard properties
> Remove definitions for dr_mode and usb-role-switch standard properties.
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> ---
>  Documentation/devicetree/bindings/usb/dwc2.yaml | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
