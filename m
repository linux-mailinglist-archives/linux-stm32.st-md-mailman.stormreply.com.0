Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 39EE327726
	for <lists+linux-stm32@lfdr.de>; Thu, 23 May 2019 09:37:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EB6AACCAA6E
	for <lists+linux-stm32@lfdr.de>; Thu, 23 May 2019 07:37:35 +0000 (UTC)
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
 [209.85.167.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 503E3CCAA6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 May 2019 07:37:34 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id m15so3020544lfh.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 May 2019 00:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cx8kg7WymCjtyRcPfqK4zjuEJ4lhy55B2Gkin5DJtFU=;
 b=fR8RE84n1odppI3p20OTG7XaGgUYqo6kXCldCRW8or5Z3hIBeoEMGNKMB5ZPtdNJk/
 mgByEQfAV30URjnhve0FLDZCf3VjYeJTLxrXOtpebu/WgWJa95xV6q/bzJIWfQu5kAM/
 lb+2YJRaFCyI9zlUIgxWbqOGBQ8GH9WL7wLHOn/TeVF16dYN8cUyFpGCJTNx4/m3BA6y
 WhJFolJShRdIpJ8lYYTZrjQzkt4A0fSuH6IOy7MSadTiKYexx/vuh+O5dw6MVcnvh0iX
 6FmVEvoLxExnr+FvKCG/9HFdK3pBLFR3kjTdxjnhyNRcvh8Flzh1gs9FGLySsBOjgh/R
 +vAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cx8kg7WymCjtyRcPfqK4zjuEJ4lhy55B2Gkin5DJtFU=;
 b=Enz5QdyWxSBOhA6R9VAnLmoqLODvQsVXK39ukyd+mfsMuJnikoB7eQ/hEB0BVUKMy6
 wvxjzeL9USeQ+YmrXxGdsadKg0pIL6t1wFxEZnFRTUAiFf8c+3npvLXfRq/wsckrmYys
 5XGUqGFGj2tqb4EdXHw4RzcQQOl0XYpictDMqsGy+MZEA/aAOUPg9cHEJg57f2wE2zVq
 h8xc5aRlI8sSdC0xz9zQA3YB9OTPMs7zzgMLqEyXpL3MbisESVvQ16EQMuJ2Y7zylKvz
 JL/jNqt6U96c5B/ZOyAZPELR9lb+kTCw3GPTBmxkVe1cU+lKtejJQH//IuRFkVqW6jZN
 BeVw==
X-Gm-Message-State: APjAAAVHy8gMyBmdRdcrsOacqO2/TJhxZczbnyCCTl4rpe7JkhvP07eA
 3Nq4tLGjYhFdXG0jQJa3MebSaGAJ6QBBUOCaaA4A8g==
X-Google-Smtp-Source: APXvYqyBRsqXPk9Dhzbeg2Oz3JZyzA3NjwECl9TBODwCZZrOK9/RFjOdjOlwiSIFYgEUEDYHs19a86bibzY+Aklnf3E=
X-Received: by 2002:ac2:5935:: with SMTP id v21mr4885287lfi.117.1558597053613; 
 Thu, 23 May 2019 00:37:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190522152925.12419-1-benjamin.gaignard@st.com>
In-Reply-To: <20190522152925.12419-1-benjamin.gaignard@st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 23 May 2019 09:37:22 +0200
Message-ID: <CACRpkdYOS0UrXPtJb0--4RW6QM_Xq8wb=9Gj5X9fk7JWCgpWfQ@mail.gmail.com>
To: Benjamin Gaignard <benjamin.gaignard@st.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 0/2] Allow pinctrl framework to create
	links
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

Hi Benjamin!

On Wed, May 22, 2019 at 5:29 PM Benjamin Gaignard
<benjamin.gaignard@st.com> wrote:

> Some pin controllers may need to ensure suspend/resume calls ordering between
> themselves and their clients.
> That is the case for STMFX (an I2C GPIO expender) which need to be suspended
> after all it clients to let them call pinctrl_pm_select_sleep_state() before
> perform it own suspend function. It is the same problem for resume but in
> reverse order.
>
> This series allow to let pinctrl core knows if a controller would like to
> create link between itself and it client by setting create_link to true.

I changed the name of the boolt to "link_consumers" and applied!

I will send patches for all other pin controllers that are I2C or other
slow bus based, as they will definately need this. Let's see what
happens!

Yours,
Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
