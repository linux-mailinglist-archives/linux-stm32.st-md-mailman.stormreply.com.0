Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7C4E8CE2
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Oct 2019 17:41:07 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 09C66C36B0B;
	Tue, 29 Oct 2019 16:41:07 +0000 (UTC)
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6C41CC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Oct 2019 16:41:05 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id 94so10304676oty.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Oct 2019 09:41:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=fvzDF1EQL0iAT5WRqqbNsT/xaQYYfBwjY6dwN6fN4vE=;
 b=kmaqF2ht2Yw/KMfI9NADuS/mTGZhlUU4qV9pAjpeO4L35wdc2P9/AkRMb6akWzyuof
 XAf668ppYW4dt8j4nJMswLflb9ExpqocxgZUNasX5aI7P44jTH/1TYqaRbbj2ebgFhXp
 eaSKl03SVnNN1bQIY/xTuYcAaJDc3whQxOtWJnYIFVoNGdQRCtzckFndDmDlfXVaysJ4
 Me6QuLVMTK3TBy5nMDxkYircwyUumHLO89Z/y6MNmiXOQ6iSbwYwoa+lFNUCjCIkIHqe
 v/+3iSTno15E8RYSjXWgi6nzGg1uxLuZ+xSnIFi+/zZGWh5yv9uLGmSqfp58fHVXHmfh
 dteA==
X-Gm-Message-State: APjAAAUsKAMuD2UUxYTltxhPxXs7pxJr6lSBAGNCjK9mfD3+wLt13JZF
 SUpjMNjaHLsTyw4qYFOUKA==
X-Google-Smtp-Source: APXvYqxafeKH9kgtJXf3IqeJ45bIUjhlxFGWRtIy/IXgLiC7LvPuf9j+o4ls+HkmFicowKX00KL1Yg==
X-Received: by 2002:a05:6830:1d4c:: with SMTP id
 p12mr3473042oth.139.1572367263971; 
 Tue, 29 Oct 2019 09:41:03 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id t12sm4826024otq.61.2019.10.29.09.41.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2019 09:41:03 -0700 (PDT)
Date: Tue, 29 Oct 2019 11:41:02 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Message-ID: <20191029164102.GA21205@bogus>
References: <20191021151847.13891-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191021151847.13891-1-krzk@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: display: st,
	stm32-dsi: Fix white spaces
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

On Mon, 21 Oct 2019 17:18:47 +0200, Krzysztof Kozlowski wrote:
> Remove unneeded indentation in blank line and space at end of line.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  Documentation/devicetree/bindings/display/st,stm32-dsi.yaml  | 2 +-
>  Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 

Applied, thanks.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
