Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 35DC1889FC
	for <lists+linux-stm32@lfdr.de>; Sat, 10 Aug 2019 10:22:29 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D2D52C35E01;
	Sat, 10 Aug 2019 08:22:28 +0000 (UTC)
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
 [209.85.167.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 04C8DC36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 10 Aug 2019 08:22:26 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id n19so2753703lfe.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 10 Aug 2019 01:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pc3qLlQ0oDS/ErmPhgCH+EKKU+gZ3YZH+6szWLiU8H8=;
 b=h/J/JDe+O8fLtWaF7QsQUS65lORhTc/HLOUgNSJBchaDmHC9FOX1tjM2vsU8KE92J0
 L3TZUbszXjPM6ieOgu2zBATyb/EIQNzRL1jAKTNcty6Brrx0Q9bXvVYaT2aP8aqJFkNb
 2Zy7ew6SyiIWqGKmXWd2au7j7gkbzo4Pg+zYOWk+xg+GqxZ8Z0NgFyDFjQOFyiSiDSNd
 Qq4XNSuK+9+3MtrldCbidcUguL/3P2XgI6rClzRD9bjUgmyBUnqmokuPw1Fb87PDJgA1
 B+k8trmUgKNLPHxSeJp82o6LFUdQUR0dzM87r+f4K1bkLMizQkHnQZYIl1T0zkEQzH2Q
 xkFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pc3qLlQ0oDS/ErmPhgCH+EKKU+gZ3YZH+6szWLiU8H8=;
 b=gaox6f9R7unzNjhNs24ZY36jdk8a0+kxysmgAHSFKIDVQ24JD9t1RhA+hzj61vPrws
 bAB6V9EyeITGX1WTUH8AaIKYDza+cUfGVb5unwpzxYFxjNVE9GCG/fAAyum08Hu6dccO
 HJPFJRi6gL7/GJFk1L99Ae7qgnJVEdHE+nEhYTflhVw8K3WDgu1GhAeMvO1+/bAOrtmV
 vaZ/U0NGcx7sF3LjBs9/RA5jA6n0/4mr1hgrDVMHGMxZWZyD8RsP+HujzzkyHFSqo/SO
 Exva96TKk3KN++/TFl0uPAZpmJtM2b0lmAf4T1m1V2sF8V7iixh+v75ddyBQ8IVpfPWk
 hOuA==
X-Gm-Message-State: APjAAAVq6FK7Nch0gdRtu49bM0uLkrmrlLDlWp7VngdpNk/snMHxgP5+
 ofRYDdaiqlCL1iEI4N7b4LIkxf2LlVyWGCsIrf1ehA==
X-Google-Smtp-Source: APXvYqyvHrlvtVs7ifq6cN1Jxp6sfhCgtxKfNrZ3NRhbWC/hAwmuwvvUHk3Q0lUpq+cm+bv8rqjcj7WSrqYgaz6dQCM=
X-Received: by 2002:a19:e006:: with SMTP id x6mr14672568lfg.165.1565425345868; 
 Sat, 10 Aug 2019 01:22:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190808075457.16109-1-nishkadg.linux@gmail.com>
In-Reply-To: <20190808075457.16109-1-nishkadg.linux@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 10 Aug 2019 10:22:14 +0200
Message-ID: <CACRpkdZgpSzwgjM_p99+j+0_+J6ydK-L6_ouphggF1iGs+Jwmg@mail.gmail.com>
To: Nishka Dasgupta <nishkadg.linux@gmail.com>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] pinctrl: stm32: stm32: Add of_node_put()
	before return
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

On Thu, Aug 8, 2019 at 9:55 AM Nishka Dasgupta <nishkadg.linux@gmail.com> wrote:

> Each iteration of for_each_child_of_node and
> for_each_available_child_of_node puts the previous node, but in
> the case of a return from the middle of the loop, there is no put, thus
> causing a memory leak. Hence add an of_node_put before the return in
> two places.
> Issue found with Coccinelle.
>
> Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>

Patch applied.

Yours,
Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
