Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BCFD2FC7B8
	for <lists+linux-stm32@lfdr.de>; Wed, 20 Jan 2021 03:23:54 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EC5D6C3FADA;
	Wed, 20 Jan 2021 02:23:53 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DB961C3089F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Jan 2021 02:23:52 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id y8so11671098plp.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Jan 2021 18:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=xmb/QGSszCboohUtICM5WMzWhCbKBKBMNNZfMQrtTEw=;
 b=KHizKBsTWR0vu0sZYpJFMTTI2nV802unlbr7YwSoJAd01GQBJ9AuBwM4mQBCjHlQE8
 y1E+oglEPPbUkBBPleq3GyojbjCFYT9YxMbIYGVUkWsOTiLi6XHyZCRV/HcbHEjTcp9x
 m+vuikisq+j/fsEE3lboEADYeeU5KoytIj4+Eez3qwLUDdKoo7AWTkzfgFUqeQ0QLOo7
 kywuK/Q7K2+Qn33WlSMH9gQk8XFr4/e/yVAp6boLtQhp6kCqW9ELUJv7oSOHJRB/oHaM
 zgN2j0INSg+ODGVZDu0XGDWxhye518znTbBESDSLh4+808fNPuLzWOG1AMg1zymOTSvC
 uSJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xmb/QGSszCboohUtICM5WMzWhCbKBKBMNNZfMQrtTEw=;
 b=QOXWFnKZ5TsOkR61h79zpKhZHBAaxBZQSSiGlxBjHMpoGTFYBRtUoBhQDeemSJRcTv
 XzTfJp+1VR5Y8FRoerK9cT5nUVNL8y9qhnCwn7k/KVG9zC3TMc/jXqFEFh/DMsspuAKE
 paHz/2nBMhBJbNF8vkdQlD3qfJvK69ebz91Xa5EoUVFCyr5DpIimwOtWz5hpToxZcbMO
 3pOmiTrRrJLwBzxj6DvTzOtwRrYmpkcamwWndCB8rgO+GYKsXkqUwye5Hw9Lro3nFGRq
 05HqciW6wpjMQnvzafBz2iyg6KEB9w51543P/TDVyqRu02dN2YPaBuI0nXQZEoRRPhRk
 dZzQ==
X-Gm-Message-State: AOAM533+xFlmHqPmVECG9F2yNXOeQeSH4XLhaKqfoxEHH/MM4SY/6SYy
 vJqhnu4lJTubFGW2Y62zncY=
X-Google-Smtp-Source: ABdhPJzMeEwi5uckhFp2vbcMPklFF83b3iHDCur6cilHgj+nzivjlKKCxmqLOtlZ0sOIcidridwkDQ==
X-Received: by 2002:a17:90a:414d:: with SMTP id
 m13mr2952460pjg.229.1611109431254; 
 Tue, 19 Jan 2021 18:23:51 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
 by smtp.gmail.com with ESMTPSA id d22sm256009pjv.11.2021.01.19.18.23.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 18:23:50 -0800 (PST)
Date: Tue, 19 Jan 2021 18:23:47 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Lee Jones <lee.jones@linaro.org>
Message-ID: <YAeUM+x1fCPiQ0aX@google.com>
References: <20210114152323.2382283-1-lee.jones@linaro.org>
 <20210114152323.2382283-6-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210114152323.2382283-6-lee.jones@linaro.org>
Cc: Stefan Riedmueller <s.riedmueller@phytec.de>,
 Luotao Fu <l.fu@pengutronix.de>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-input@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [Linux-stm32] [PATCH 5/5] input: touchscreen: stmpe-ts: Add
 description for 'prop' struct member
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

On Thu, Jan 14, 2021 at 03:23:23PM +0000, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/input/touchscreen/stmpe-ts.c:82: warning: Function parameter or member 'prop' not described in 'stmpe_touch'
> 
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> Cc: Stefan Riedmueller <s.riedmueller@phytec.de>
> Cc: Luotao Fu <l.fu@pengutronix.de>
> Cc: linux-input@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Cc: linux-arm-kernel@lists.infradead.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Applied, thank you.

-- 
Dmitry
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
