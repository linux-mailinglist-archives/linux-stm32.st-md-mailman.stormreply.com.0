Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 18525F0D0E
	for <lists+linux-stm32@lfdr.de>; Wed,  6 Nov 2019 04:29:22 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C8E42C36B0B;
	Wed,  6 Nov 2019 03:29:21 +0000 (UTC)
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 65BD2C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Nov 2019 03:29:20 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id 22so1576280oip.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 05 Nov 2019 19:29:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=YqC9TqSkya1o/KJL8zpucATnY1j4nIoBdkUAmUprxs0=;
 b=WZIF+P7CcaMZ/kDZyT26dXMxeyDURssLlFijria05jbuLy97Kppl2YinF7J8pIHNbw
 k4UkDdqNBlQBc55HEz8whEgp5AGzsU3Dd3s0KXaqdi1Z0p5Jfe4u6VJlzSqsBWvOxXJF
 X62/58cuDnZxc0AotQtnvdsFOuJfx0i3QQtY/jAcInkIY7bwqGlemqi79Rn1Jp2cZ2V9
 cS7Vxu1JcwddPx9dnnIZzA3kNuUFB3cVbLymP5KZthKKwJfvDwIJaaPDsejJsenueBTy
 8ZJ8ESQkmJYT+LjwUhEAjTKjFRpAA2HuzCXL8K5seb1DKiEV29ZdNw20Hw2WXmux4wQt
 KLRw==
X-Gm-Message-State: APjAAAXlSRvELiqFxJBr0UxsxcNx9MkJyqA72CObyTwRJ3OHf4YicFq2
 QhCe6sKHALYs26/uNKM3iA==
X-Google-Smtp-Source: APXvYqx/nF0CpBAElSmOBIYblIaOc2Wf6Sp7yrh2qYVI6M6XfnHyx1svrejcYxe9WS6YADmSZrE0LQ==
X-Received: by 2002:aca:49c7:: with SMTP id w190mr285191oia.117.1573010959021; 
 Tue, 05 Nov 2019 19:29:19 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 88sm3097164otp.59.2019.11.05.19.29.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2019 19:29:18 -0800 (PST)
Date: Tue, 5 Nov 2019 21:29:17 -0600
From: Rob Herring <robh@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@st.com>
Message-ID: <20191106032917.GA25856@bogus>
References: <1572279108-25916-1-git-send-email-fabrice.gasnier@st.com>
 <1572279108-25916-2-git-send-email-fabrice.gasnier@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1572279108-25916-2-git-send-email-fabrice.gasnier@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, lars@metafoo.de,
 linux-iio@vger.kernel.org, pmeerw@pmeerw.net, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, knaack.h@gmx.de, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, jic23@kernel.org
Subject: Re: [Linux-stm32] [PATCH 1/2] dt-bindings: iio: stm32-adc: add max
 clock rate property
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

On Mon, 28 Oct 2019 17:11:47 +0100, Fabrice Gasnier wrote:
> Add optional dt property to tune maximum desired analog clock rate.
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
> ---
>  Documentation/devicetree/bindings/iio/adc/st,stm32-adc.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
