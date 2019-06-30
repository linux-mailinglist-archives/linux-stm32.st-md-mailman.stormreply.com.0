Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 260635AE0F
	for <lists+linux-stm32@lfdr.de>; Sun, 30 Jun 2019 06:05:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 17D48C5E2DF
	for <lists+linux-stm32@lfdr.de>; Sun, 30 Jun 2019 04:05:29 +0000 (UTC)
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C7B2EC5E2DB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 30 Jun 2019 04:05:26 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id a93so5486185pla.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 29 Jun 2019 21:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=nZ4faO3Hxt6Vv9DkaePS/Kvvg767f3TOfeZ7FItgRpc=;
 b=rl7EAg+f3oXHBc8Pbo//vWa3my/Z7+d6GEro+N5fRkuf6eXL3Ar1+FGnrNGb58Nkyp
 c7f4MXGR0IHjlG7BmA/rmUzxOAnzGP6xMCHReP4yqY7rm3uihkIYFlHy3wUjZDJ+M/Zb
 I4I+XIWi4KVSVqdJxjdxlhdrAdIcqttsszNBUKYbP0wRubhUFc7zFvMQ4Icd1Vr/OWHA
 Q3y9oGRxxyPp07pxYRbtvqicG+f3Cwc8lH89BWEeheh3G9HiL3+ytCZtYrqHxKeNE6qj
 xFOCGAzC1hlSrLGFC34ZqTBi5S1XvC4x7RPzAUW2Pfb27bY6g4qhSCfWI/rBNsOVj4dh
 Ah/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=nZ4faO3Hxt6Vv9DkaePS/Kvvg767f3TOfeZ7FItgRpc=;
 b=kFZoomsXLWZMPGjugfaeM523vL4RZo2Y9g0hc8en9FWYaYCb6wt6R/cHaS/aSMf1AM
 4OvqXiGnfjE8JxG1wzQc7NBvEbstoQi/HgS/3bPCPKYrSqmAvMien1TGOAM7ogO3MxP5
 WsFnuRrAKUhY3/WTtPrx8qLUx7/Z81I+sIZNQrPgAT3ciUN5JUhUYV9cSc8kVX/KWi6l
 F6yg+JWu6SIiXDuXB90iSvl8qd8E1J0AB9ZDL3pHINvlfBiuxOYoMczqgPFgJgCriHnm
 LfJklwnMI+f07Ek752NyblJ3AytN90b2gntgSiyxN0DnqvvPbBHmreoF+Xq5gSxIk8fG
 NXuw==
X-Gm-Message-State: APjAAAXRJjFv/3UVNXrci98bHUmAnlh3pA43EHmHFmhlWj9f66MekngE
 KxKz4QQK6ZB/kC0CXIL0ZDWTcg==
X-Google-Smtp-Source: APXvYqxg5hDllg1TQKAIWeDHYzxBnrioiXmu06H2WlpeMePI7Rp+znhieN/1bfFWv6zaE9kfcQ+ElA==
X-Received: by 2002:a17:902:a40c:: with SMTP id
 p12mr21215977plq.146.1561867525153; 
 Sat, 29 Jun 2019 21:05:25 -0700 (PDT)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net.
 [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id z13sm6984605pjn.32.2019.06.29.21.05.23
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 29 Jun 2019 21:05:24 -0700 (PDT)
Date: Sat, 29 Jun 2019 21:05:22 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Fabien Dessenne <fabien.dessenne@st.com>
Message-ID: <20190630040522.GA1263@builder>
References: <1551973336-23048-1-git-send-email-fabien.dessenne@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1551973336-23048-1-git-send-email-fabien.dessenne@st.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] hwspinlock: stm32: implement the relax()
	ops
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

On Thu 07 Mar 07:42 PST 2019, Fabien Dessenne wrote:

> Implement this optional ops, called by hwspinlock core while spinning on
> a lock, between two successive invocations of trylock().
> 
> Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>

Applied

Thanks,
Bjorn

> ---
>  drivers/hwspinlock/stm32_hwspinlock.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/hwspinlock/stm32_hwspinlock.c b/drivers/hwspinlock/stm32_hwspinlock.c
> index 4418392..c8eacf4 100644
> --- a/drivers/hwspinlock/stm32_hwspinlock.c
> +++ b/drivers/hwspinlock/stm32_hwspinlock.c
> @@ -5,6 +5,7 @@
>   */
>  
>  #include <linux/clk.h>
> +#include <linux/delay.h>
>  #include <linux/hwspinlock.h>
>  #include <linux/io.h>
>  #include <linux/kernel.h>
> @@ -42,9 +43,15 @@ static void stm32_hwspinlock_unlock(struct hwspinlock *lock)
>  	writel(STM32_MUTEX_COREID, lock_addr);
>  }
>  
> +static void stm32_hwspinlock_relax(struct hwspinlock *lock)
> +{
> +	ndelay(50);
> +}
> +
>  static const struct hwspinlock_ops stm32_hwspinlock_ops = {
>  	.trylock	= stm32_hwspinlock_trylock,
>  	.unlock		= stm32_hwspinlock_unlock,
> +	.relax		= stm32_hwspinlock_relax,
>  };
>  
>  static int stm32_hwspinlock_probe(struct platform_device *pdev)
> -- 
> 2.7.4
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
