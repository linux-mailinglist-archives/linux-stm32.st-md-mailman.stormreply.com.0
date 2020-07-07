Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD9E2176A9
	for <lists+linux-stm32@lfdr.de>; Tue,  7 Jul 2020 20:27:00 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5E5C4C36B2A;
	Tue,  7 Jul 2020 18:27:00 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5EDB5C36B27
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Jul 2020 18:26:59 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id s14so17072406plq.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 07 Jul 2020 11:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=qvQ9BWiorgAMI59gx7e2L9Kar4VUwCoPb3oUywbJHwA=;
 b=Cdl5hKZTByffG8WuN6tekngHahUumklqO8yyUjeyMcdCBhBH2Qp1rcDismVcXbVLR/
 Mk1luMjdd31WhHG716Jy1lTOTs8MWdzPPmgCH4LYUr3bOR0KgXgTHFUUixgVPhM+b1OK
 VeUFh9xgoFDPUkNndq3tHTmTnfm0q8eyvGocTgCetxrWAW48wGZgS2pnCi6c79NMt6Cd
 qXpwLmtcerGizQSiqkjVTQzho6RH3CNjXEqvyoZThZXHTEnVSZrVtDInWTry6HnFRUSL
 fVm2mvDFnz4kJlLsgnlDFMohjHrY9i9NSBhPBV0IUnIhZM8qZs6VOk36YCmyDgv0VFVF
 z76A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qvQ9BWiorgAMI59gx7e2L9Kar4VUwCoPb3oUywbJHwA=;
 b=UZO0SoMmVYwYf2weMoI8HU//85hc6JWCmfC2/qSts/zeBgIPQjjGzaeWp/OLUUY6/B
 hoXGK85btPrYnyslGAqD1AzaZryuma52UB9L1uOgdyooN/rrw62L1IytOEr9cVC4pGUA
 kLWwbcjVLAPKG8N0QKCsP2rz+gr4yVf92ZTkWFya64lQUsYaIvGbMDJjMzT8HtqWRrnw
 3pZgkb6HDpJxKLA+9OJEKAtabCm0lx4PJr2ZDhuaNL9VR31b/tJPTsNpKABEToYwkjaJ
 7VnbuF0LdVNKU6kto5zr+aVGIwjd4X13P290bqxFcuC14QSQD4Sh4/p2JvNOS6xGU45f
 azQg==
X-Gm-Message-State: AOAM5320wnMOMJh9xBPon1Vunk2ilMQSg1dhLhRl3pt/kAUIQ2rn3IMD
 4FTmeJ41ww6Mt3tb3Dwh4Qg=
X-Google-Smtp-Source: ABdhPJx2Xl7Qi1XE1pQddLYTBMwkm97nQVhC2vVlLRHiG1EAW8UiZzMDfZT9OqEAKL6SEU5kIePbAw==
X-Received: by 2002:a17:90a:2e18:: with SMTP id
 q24mr5325457pjd.25.1594146417651; 
 Tue, 07 Jul 2020 11:26:57 -0700 (PDT)
Received: from dtor-ws ([100.99.132.186])
 by smtp.gmail.com with ESMTPSA id c139sm8637148pfb.65.2020.07.07.11.26.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 11:26:56 -0700 (PDT)
Date: Tue, 7 Jul 2020 11:26:54 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Message-ID: <20200707182654.GF3273837@dtor-ws>
References: <20200707180857.GA30600@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200707180857.GA30600@embeddedor>
Cc: linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-input@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH][next] Input: Use fallthrough
	pseudo-keyword
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

On Tue, Jul 07, 2020 at 01:08:57PM -0500, Gustavo A. R. Silva wrote:
> Replace the existing /* fall through */ comments and its variants with
> the new pseudo-keyword macro fallthrough[1]. Also, remove unnecessary
> fall-through markings when it is the case.
> 
> [1] https://www.kernel.org/doc/html/latest/process/deprecated.html?highlight=fallthrough#implicit-switch-case-fall-through
> 
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Applied, thank you.

-- 
Dmitry
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
