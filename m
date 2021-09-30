Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1368341E07B
	for <lists+linux-stm32@lfdr.de>; Thu, 30 Sep 2021 20:00:56 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BBDADC5A4CD;
	Thu, 30 Sep 2021 18:00:55 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9B703CFAC52
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Sep 2021 18:00:53 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id
 k23-20020a17090a591700b001976d2db364so5419980pji.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Sep 2021 11:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=GvInsCJfgVIdu+bTl+EZcCSDBMnOYdIPFiEnPSEGWq8=;
 b=C+AhbK8OmIghCqB38Es9+sqV5ZiplbGylDANFPGzeGsstzb+vKsJgLrMKcqsXrj+Ls
 E51vKRIr5y+WbmZvxZVTas6LticTYRZPHvE3mTOcmA5do+nsSSV1iTn7ls4F2BlhqLym
 CVjOo2cReN5XP3kuUARBo3Iiap96FHW4NnrJM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=GvInsCJfgVIdu+bTl+EZcCSDBMnOYdIPFiEnPSEGWq8=;
 b=0Q7zRrhHFgXLyx43mQYWKCzBJQmpZnydLmutVdvyZ5rkPw4bGMZKoG950ckpApJaYr
 +o7H+RXd8MfOJ2igatz/FpeHsSBtIt43Hawy+WDlXmKmseUOzJSrXtjqnhSVTQMyj17q
 jvDERxVUH6dVhnzTTpSqq8hw/oKu7JuCe5pxN11QU7qnNtSnXBlefWwHsh6W2PognSeU
 6r0vVQEKjwpX+kJX3zkLGKMLOp83KhfSH3gPf0mlDYj4vJFm7v8DGeRyBLsDsVjo/Lv3
 8O8ibWdpWITdJFWaTUKUFbfY6KV9ymrnzwERbXOSA0zt1BWicqKVJEI1GAfs/1BvkTRq
 cHIw==
X-Gm-Message-State: AOAM530n9HlnBUnyCE1b2pSbfANNd7v/5HNXXSg9CAxtCbxxjiXWWDxq
 OtAEyr405YlpUUUX5yaXdT4NbQ==
X-Google-Smtp-Source: ABdhPJw1x/cuO9mw2pkpxFtvuHlojDjhxrcg02FFcSXPI1A/yf4JspLL4WFzVx/lrn2zgGEudX2AQw==
X-Received: by 2002:a17:902:6ac7:b0:13e:1fec:2bbc with SMTP id
 i7-20020a1709026ac700b0013e1fec2bbcmr5413917plt.82.1633024851430; 
 Thu, 30 Sep 2021 11:00:51 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id k9sm3628222pfi.86.2021.09.30.11.00.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 11:00:50 -0700 (PDT)
Date: Thu, 30 Sep 2021 11:00:49 -0700
From: Kees Cook <keescook@chromium.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Message-ID: <202109301100.2BB00DE96A@keescook>
References: <20210929222922.GA357509@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210929222922.GA357509@embeddedor>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 linux-hardening@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 dmaengine@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH][next] dmaengine: stm32-mdma: Use
 struct_size() helper in devm_kzalloc()
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

On Wed, Sep 29, 2021 at 05:29:22PM -0500, Gustavo A. R. Silva wrote:
> Make use of the struct_size() helper instead of an open-coded version,
> in order to avoid any potential type mistakes or integer overflows that,
> in the worse scenario, could lead to heap overflows.
> 
> Link: https://github.com/KSPP/linux/issues/160
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Looks right to me.

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
