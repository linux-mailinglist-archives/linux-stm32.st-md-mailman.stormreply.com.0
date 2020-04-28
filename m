Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A6EC41BBC55
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Apr 2020 13:24:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5D8A8C36B0C;
	Tue, 28 Apr 2020 11:24:17 +0000 (UTC)
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
 [209.85.208.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8014FC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Apr 2020 11:24:14 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id g4so21075193ljl.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Apr 2020 04:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dtSCC/6Zk0CAn9Haq8H1TnXYmgXgUR49no/7MjmVHFQ=;
 b=wbyZMmT9xNXh+i0FXuT8+Zx0WQdZUgyX61MnLeN982X/SWM7j8uLKdx4JNX0goNrlW
 XNleJW0Aumfkz+/nYc6WoQ8Mbrxe3w1WLfSNynijdPAXIoQCU3Axz5WeoIANm/zvra2V
 ijUUTgiTMZ8y0QAkIuJ2Bp78VCRcPB15ZdTKvt9ubTDohSlkhyXFMXv4xeDA7kXorXIc
 jgucg0wgYdFFOPB7eDr41HD8vwo4BbHTO7E1pPV6RY/Q68xD3pDZwrTL4LOvetZ3bQ51
 zH9VJUmgfofrM3p7AOv5Jsy5qEsxI1mNerRs3/gEPO5WEqb6omAGtU1ZPiO6iCLwZeNd
 V+ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dtSCC/6Zk0CAn9Haq8H1TnXYmgXgUR49no/7MjmVHFQ=;
 b=b7FNKxTIM4XHanjbbwR4Y9BnroKPqqY5qVBZ96dNidILaYdHSPoFRZ7Etdd4GhtWcI
 oj9uS63jEibGAxwT7+1YTiV0ZyZVmTTwQBwqxxatosIQXbrLYy4yoYNOGLIQ8NiIjJhq
 ruc4RmaILE+X+oviBKmpJEpHf7/RqqCSUThWUgeZZFSwA9hKBTR3pojUHcrJyJpiixLi
 bZdoeZc2RmyOf9d1WtzbrSF0rBi57uqqqMDoEj91e7tHAp3en4u1frqKWBtfkGQoxd+z
 C5Lz5sBwkKJZnyHiF5HWzQUe6PKa7nT/FQQiH0E9hFQ5iLeoMadluzjBOOhGAfxuqLqd
 TcbQ==
X-Gm-Message-State: AGi0PuYKfdNBCOlrbqLLBB3KD6c3kLR6e8I594lNLBdEpLJp3PDMwB3M
 cB0DPU06dbYB9VjL/ZoDXk2DtKQ9PY8wD6lE9eCgdQ==
X-Google-Smtp-Source: APiQypIAZegG6Qn5JvZ0uvEzFCZSmajX66iK5f+sKRerbAwYFi9OxxOsRKHMp8MI1JCk0ToY+5PLv4Mls7VQnu506Fk=
X-Received: by 2002:a2e:8805:: with SMTP id x5mr18067893ljh.223.1588073053796; 
 Tue, 28 Apr 2020 04:24:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200420134800.31604-1-benjamin.gaignard@st.com>
 <20200420134800.31604-2-benjamin.gaignard@st.com>
In-Reply-To: <20200420134800.31604-2-benjamin.gaignard@st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 28 Apr 2020 13:24:01 +0200
Message-ID: <CACRpkdatGwWyruTLC=+BUtnunvqyxnXAYDhcHqy26oeud8Bs1w@mail.gmail.com>
To: Benjamin Gaignard <benjamin.gaignard@st.com>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Greg KH <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 1/5] dt-bindings: bus: Add firewall
	bindings
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

Hi Benjamin,

On Mon, Apr 20, 2020 at 3:48 PM Benjamin Gaignard
<benjamin.gaignard@st.com> wrote:
>
> Add schemas for firewall consumer and provider.
>
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>

> +$id: http://devicetree.org/schemas/bus/stm32/firewall-consumer.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Common Bus Firewall consumer binding
> +
> +maintainers:
> +  - Benjamin Gaignard <benjamin.gaignard@st.com>

This really needs a description: to tell what is going on and what
these firewalls
are for and how they are supposed to work.

I suppose just a bit of cut'n'paste from the cover letter :D

Otherwise it looks good to me.

Yours,
Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
