Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F542D4B28
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Dec 2020 21:02:16 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 93E3DC3FADB;
	Wed,  9 Dec 2020 20:02:16 +0000 (UTC)
Received: from mail-oo1-f66.google.com (mail-oo1-f66.google.com
 [209.85.161.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6EABCC32E90
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Dec 2020 20:02:13 +0000 (UTC)
Received: by mail-oo1-f66.google.com with SMTP id t63so702862ooa.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 09 Dec 2020 12:02:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CT4PDwxWQlH8AFGW6DWTgjgKsDiFOb+UtaZdqpeUc4I=;
 b=mPoxDLWmi8ktKT1PojKR7L6RJrWrkHHQd/d9s9fBobXeYUhFKv0/z3jouko/jDgzVP
 wEkxWi3RxrKRQ5ql7nKe6kXCP2qOrP+4W0r2WHQVS1otUzZeZDd1Jji0UCuJv2qSPDTV
 VgjL1HbFZmTACbMXOPelnKtYMi5lUewkNNJ5AEgjgT7obdST/STL3PoKIFDD9on+5f+p
 IdBe4fH8invpg5B0xu2+y+oUvvHsCjt8kxjbfpQFxhfEnHb+6nNJnymf84AzgHEIwIbo
 lWM5HKJG1zS264ILSPfqEAHVEUiMFahlLBKT6fb/m8FVT5WZxZ261nMVb3iKsTHhYwzY
 BYBg==
X-Gm-Message-State: AOAM533YjwwX0PZEU/ltjm2PIVJWl1Vjdo4CmetAwlSBTZrl80wyxTbL
 CwPHMu+/tZ6yPhGtaNrscA==
X-Google-Smtp-Source: ABdhPJzHfu2AIzAnwqkjC98kY5h+nEQzIAojT5SozkRjSJXiZ9f7hyrSIpsiQ97Tusg7zGgr9TzW7Q==
X-Received: by 2002:a4a:c102:: with SMTP id s2mr3285031oop.60.1607544132694;
 Wed, 09 Dec 2020 12:02:12 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id v123sm504160oie.20.2020.12.09.12.02.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 12:02:11 -0800 (PST)
Received: (nullmailer pid 849058 invoked by uid 1000);
 Wed, 09 Dec 2020 20:02:10 -0000
Date: Wed, 9 Dec 2020 14:02:10 -0600
From: Rob Herring <robh@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <20201209200210.GA848983@robh.at.kernel.org>
References: <1606913114-25693-1-git-send-email-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1606913114-25693-1-git-send-email-fabrice.gasnier@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, fabrice.gasnier@st.com, lee.jones@linaro.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: mfd: fix stm32 timers example
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

On Wed, 02 Dec 2020 13:45:14 +0100, Fabrice Gasnier wrote:
> The stm32 timers example name should match the pattern timer@. Also,
> the example is based on stm32mp1 timer 2, so the identifier should be
> '1' instead of '0' (e.g. timer 1).
> 
> Fixes: bfbcbf88f9db ("dt-bindings: timer: Convert stm32 timer bindings to json-schema")
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> ---
>  Documentation/devicetree/bindings/mfd/st,stm32-timers.yaml | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

Applied, thanks!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
