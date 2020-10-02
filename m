Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD34280FE6
	for <lists+linux-stm32@lfdr.de>; Fri,  2 Oct 2020 11:31:29 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 34902C424B0;
	Fri,  2 Oct 2020 09:31:29 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 463E7C32EA8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Oct 2020 09:31:24 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 42F9A20658
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Oct 2020 09:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601631082;
 bh=Op9qQOvRCmtTi/qrFC6hcZ02Bsccu0GIK+GbgVOdmMs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=jXh6dz5s7lSBsGhcBoH/Nc5LUh9VJtwNaauWo9Ob9Qu2czr336t8xQZ9ddQYJgwPQ
 RaOSwo52NMRRYNY1yUymOVxtN2YDch2fUv9SI2FlVH45kP8nUj4EOB35WkwVW6kIZv
 fAeICjNWdsNesqlwYmwXvieguXIxvQdd9MdxoK7A=
Received: by mail-ed1-f45.google.com with SMTP id l17so954042edq.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 02 Oct 2020 02:31:22 -0700 (PDT)
X-Gm-Message-State: AOAM5316uScQyM0gCKQuW+RHXzZYcR8ruvhgOWJxYMH+V2tEqOqIRlgl
 d+WyGKAAG4wOlFjRdfT6H/u7mb8EGUYIPe8rhsc=
X-Google-Smtp-Source: ABdhPJwSknSWj02zDQZ7UIOFFH5LS9ug09W2SVgWJOywobkymy1Z3ojVUQEOY7JssA67iKKNGFW+qhSE5EESCA8tfes=
X-Received: by 2002:a50:a452:: with SMTP id v18mr225060edb.143.1601631080807; 
 Fri, 02 Oct 2020 02:31:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200930234637.7573-1-post@lespocky.de>
 <20200930234637.7573-3-post@lespocky.de>
In-Reply-To: <20200930234637.7573-3-post@lespocky.de>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Fri, 2 Oct 2020 11:31:09 +0200
X-Gmail-Original-Message-ID: <CAJKOXPe7Tg+5ESsdPGks_Aqj+zQH4-asC839FseWp0OCJbT4Mw@mail.gmail.com>
Message-ID: <CAJKOXPe7Tg+5ESsdPGks_Aqj+zQH4-asC839FseWp0OCJbT4Mw@mail.gmail.com>
To: Alexander Dahl <post@lespocky.de>
Cc: devicetree@vger.kernel.org,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 Alexander Dahl <ada@thorsis.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-mips@vger.kernel.org, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-leds@vger.kernel.org,
 Pavel Machek <pavel@ucw.cz>, linux-amlogic@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Dan Murphy <dmurphy@ti.com>
Subject: Re: [Linux-stm32] [PATCH v6 2/7] dt-bindings: leds: Convert pwm to
	yaml
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

On Thu, 1 Oct 2020 at 01:52, Alexander Dahl <post@lespocky.de> wrote:
>
> The example was adapted in the following ways:
>
> - make use of the now supported 'function' and 'color' properties
> - remove pwm nodes, those are documented elsewhere
> - tweake node names to be matched by new dtschema rules

tweak? or align?

>
> License was discussed with the original author.

Since you relicense their work, you need an ack or signed off from
every author. You cannot just say "I discussed" and post it. That way
I could pretend (lie) I talked to Linus and try to relicense Linux to
BSD...

You need acks/SoB from Peter and Russel.

Best regards,
Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
