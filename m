Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1D31E53F5
	for <lists+linux-stm32@lfdr.de>; Thu, 28 May 2020 04:34:34 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E7B23C36B21;
	Thu, 28 May 2020 02:34:33 +0000 (UTC)
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0A3E7C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 May 2020 02:34:33 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id s18so14416860ioe.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 May 2020 19:34:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=n/FH6mJ3fikdqE4Zcc+b5bEIYmcTN5k726IIFViGyw8=;
 b=o0N3jlur+2YLQHHyBIaVADPbcbYiH1bMrX+1AXilfcJJXc/97LjavIeq8TCCiTE1mI
 mMR4QC5HLSS2ossfrH5UqWun3rKUm+BS0ceRiPiYDCNXbS1WpqgKh46hAcmTngE+5cT9
 X14qRuUDhU0o6ji0WTUskcs4yRPgL33UhMMIBHjpaj4Jp3AwOivEx3Z+Q8nlHKMLi4IS
 s1oeKvWhBhdsCSvf5/lttw7eaIXYZkIUIrasqzv4UOcKjWYOfdq3UF1cc9ILdMLLgWM/
 ITxWwxdDuhIeUMcIWByLZWHuIhYts5euzJtjS/rAShm3U7PX8bgqBzZ5UY0cu3bCq8V2
 PHoA==
X-Gm-Message-State: AOAM531J0hJtViOmMXt+YXkQ10qxN3/YrsEcgbl17aSgW4TGBZQ5hFAr
 h72fGxro6jLoc1kWXJL9sA==
X-Google-Smtp-Source: ABdhPJzlRpRHQMmZDZLj/tYbF7cnyKdNiYI4MRq2hMn5XR8oW8DZfDevLNinGnIjZkv6csK9kUeBLA==
X-Received: by 2002:a05:6602:2ac9:: with SMTP id
 m9mr710941iov.68.1590633271819; 
 Wed, 27 May 2020 19:34:31 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id l21sm2658506ili.8.2020.05.27.19.34.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 May 2020 19:34:31 -0700 (PDT)
Received: (nullmailer pid 3250747 invoked by uid 1000);
 Thu, 28 May 2020 02:34:30 -0000
Date: Wed, 27 May 2020 20:34:30 -0600
From: Rob Herring <robh@kernel.org>
To: Benjamin Gaignard <benjamin.gaignard@st.com>
Message-ID: <20200528023430.GA3250641@bogus>
References: <20200513145935.22493-1-benjamin.gaignard@st.com>
 <20200513145935.22493-16-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200513145935.22493-16-benjamin.gaignard@st.com>
Cc: devicetree@vger.kernel.org, gregkh@linuxfoundation.org,
 linus.walleij@linaro.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, robh+dt@kernel.org,
 mcoquelin.stm32@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 15/15] dt-bindings: usb: dwc2: Fix issues
 for stm32mp15x SoC
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

On Wed, 13 May 2020 16:59:35 +0200, Benjamin Gaignard wrote:
> Correct the compatible list for stm32mp15x SoC.
> Fix the name of the stm32mp15x dedicated supply to be aligned with
> what the driver use.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
>  Documentation/devicetree/bindings/usb/dwc2.yaml | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
