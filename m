Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA4943243D
	for <lists+linux-stm32@lfdr.de>; Mon, 18 Oct 2021 18:52:54 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E0A2AC5A4D3;
	Mon, 18 Oct 2021 16:52:53 +0000 (UTC)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com
 [209.85.210.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A22D3C597B6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Oct 2021 16:52:51 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id
 x27-20020a9d459b000000b0055303520cc4so552061ote.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Oct 2021 09:52:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=idu8zupzi5pS6hzrp6ynbXD+bkwdw463mG6haC2JAek=;
 b=tMUT2X2TjA/B1njh6ppj42NXoFlxMN8a1AYbfe53mPOeh0WzFldomxKEPKMVASj9Lr
 Wc2XhYKCR3iVndy5xnDYh7+Nl9l/sTp3DczAkV8wnCVWXIjfcWc4/QvC7QS4g7QZBkIB
 08RYEK7VA7c8nxo001HBbUcqo2MNGLCdN8wa+w8/u69UftA9oNDPNbJEeOO6dqmVFM2G
 l8aICd9YaPRbU5OapX8/0fidnXuQIIJ9/jE7bYxdGnGTkLRDN1xz8qKzdkdXhIqnVppF
 jS3PsrNadAUd0DlxLktGzwPOYXiU+0OPywIQqzSG2dg0bs3HdBIKaLkykhfWnBaam9aH
 UHOA==
X-Gm-Message-State: AOAM531sP8C7AK2CdhYtkh9aVl+paDYDV28lq2HTRTUhcQplNRo++VVy
 5Cr0XMeXGb7G7fctIP2mmQ==
X-Google-Smtp-Source: ABdhPJz0+k4rUOqUbyRuu+ug+/6QUcJdyhzNhXGmSejnHwnXvXsuF7ooaa0TCLUvpU2W5ORWSeifhA==
X-Received: by 2002:a05:6830:19c2:: with SMTP id
 p2mr790868otp.27.1634575970518; 
 Mon, 18 Oct 2021 09:52:50 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id c4sm2555623ook.5.2021.10.18.09.52.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 09:52:49 -0700 (PDT)
Received: (nullmailer pid 2547973 invoked by uid 1000);
 Mon, 18 Oct 2021 16:52:48 -0000
Date: Mon, 18 Oct 2021 11:52:48 -0500
From: Rob Herring <robh@kernel.org>
To: Olivier Moysan <olivier.moysan@foss.st.com>
Message-ID: <YW2mYKpWSPzGvzUa@robh.at.kernel.org>
References: <20211014131228.4692-1-olivier.moysan@foss.st.com>
 <20211014131228.4692-2-olivier.moysan@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211014131228.4692-2-olivier.moysan@foss.st.com>
Cc: devicetree@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-iio@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v5 1/7] dt-bindings: iio: stm32-adc: add
 generic channel binding
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

On Thu, 14 Oct 2021 15:12:22 +0200, Olivier Moysan wrote:
> Add ADC generic channel binding. This binding should
> be used as an alternate to legacy channel properties
> whenever possible.
> ADC generic channel binding allows to identify supported
> internal channels through the following reserved label names:
> "vddcore", "vrefint" and "vbat".
> This binding also allows to set a different sampling time
> for each channel.
> 
> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
> Reviewed-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> ---
>  .../bindings/iio/adc/st,stm32-adc.yaml        | 100 ++++++++++++++++--
>  1 file changed, 93 insertions(+), 7 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
