Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B5EA8324B5B
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Feb 2021 08:42:01 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 632FDC57B59;
	Thu, 25 Feb 2021 07:42:01 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8F1A9C57B53
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Feb 2021 18:19:38 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id v17so3478227ljj.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Feb 2021 10:19:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=flowbird.group; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mBSaQywP8SBAM0LXmbrHZQxkhXjbECjiGkWNETHIv4E=;
 b=iAXOVfiJUYUBO4diJCNerdcbRawhS+ka1OLLp7r2uPKBWeElVLUkTd1GswdErXAWOK
 t5RBAifGENFq4wCPuai8fkLPTeZq1Kl8z8eOtWjybkPwVC028Enz0030OPq6NizFSg10
 JKEdg7wOhQFvDnPlLLPVXjKILRq307ydrEZ3t0O8gryd1qlzcx0O0Db5BATjHxJnMUeJ
 stdVfiAYxbNGM5sj19CMa2mVcLhAX4zas8TvVO2m5sK/PaSroBG4v2WRbpUBTE2eXtmC
 2TkD/gmNnGFw/4xPrT4SiZzd85emMyCIKiYEJl/ELMb5bceS0BReBDap6d7dg9JNHKOt
 Bdvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mBSaQywP8SBAM0LXmbrHZQxkhXjbECjiGkWNETHIv4E=;
 b=RUPav0qtjPNxpzEFaf26w9tQ0hSWBwO6Z6jkjLiXDO29S+zro3zFjRelgNciPDlL52
 rmz6Cj39oA/z+jIPfNuD9s5rNifY0YFcCdopm/+Ci5hQE8nha9COEmYkpALy8VjFrKNK
 UA+uD31OpIXG9PsWimqih/D/PaxBs/HGd+wHiI3rmTUXI0l8BcEKEGvXyMwWXgKg9V7H
 bjOVGYjLzQ6ho6AC0I7U+h+ao1QEuPw1QDBhO+4Sr2mMLSUHI1veAgsXNWyWqKlHauX3
 FvecWs3jt0Obj5tANyJHTyElq3J3jQvR1f+enoXLH0e6ASiCkhWz90H0QuVlkypLbL1U
 8/9g==
X-Gm-Message-State: AOAM531UY374aIKfGI+zkov32Zw9LpkY9Zg35NJRfRu0gGIcUi1lf5u9
 epBt96B197wQHqiORI2v/sr1Tb+6OEH5fNC/uPbVPw==
X-Google-Smtp-Source: ABdhPJzO1+uz/b2je80cLZAMY9LdMbBbV8csbQQ3CdxSjWPs2IYpGTnN7pPnu+MY9EWFAwj1egvvYeh46V8vWxF1wNo=
X-Received: by 2002:a05:651c:548:: with SMTP id
 q8mr19968620ljp.256.1614190777758; 
 Wed, 24 Feb 2021 10:19:37 -0800 (PST)
MIME-Version: 1.0
References: <CANh8Qzy9B5qCkwZLiWaJahQX4oMg07dn0276vqeCzEcqgXTd+g@mail.gmail.com>
 <AS8PR10MB471293F419829DD8A3684F59EE9F9@AS8PR10MB4712.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS8PR10MB471293F419829DD8A3684F59EE9F9@AS8PR10MB4712.EURPRD10.PROD.OUTLOOK.COM>
From: "Fuzzey, Martin" <martin.fuzzey@flowbird.group>
Date: Wed, 24 Feb 2021 19:19:27 +0100
Message-ID: <CANh8Qzx56UmRhkpVpPFXc_YZyaD7rDCJdLCXHz3-QOEhv+UbNQ@mail.gmail.com>
To: Alexandre TORGUE <alexandre.torgue@st.com>
X-Mailman-Approved-At: Thu, 25 Feb 2021 07:42:00 +0000
Cc: "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Linux-stm32] [BUG] stm32mp1 gpiod_to_irq() can cause
	"interrupt stealing"
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

Hi Alexandre,

thank you for the very quick reply


On Wed, 24 Feb 2021 at 16:59, Alexandre TORGUE <alexandre.torgue@st.com> wrote:
> Even if this second interrupt is freed ? We have to check if we need to add a link between .alloc and .activate
> callbacks or move the protection.
>

The second *interrupt* cannot be freed because the request_irq()
returns -EBUSY (as it should) so it has never actually been allocated
for the driver.

There is no reverse function to gpiod_to_irq().

The second *gpio* could be freed but that doesn't clear the cached irq
number so even if the second gpio is freed and then gpiod_to_irq() is
called again for the *first* gpio the mapping is not updated.

Even if freeing the gpio were to restore the state somehow the driver
may not want to do that (for example it could have a degraded mode
where it can still function with just the gpio if it cannot get the
irq)

Regards,

Martin
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
