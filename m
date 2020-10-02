Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D6C280FBD
	for <lists+linux-stm32@lfdr.de>; Fri,  2 Oct 2020 11:21:27 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 15FF6C424B1;
	Fri,  2 Oct 2020 09:21:27 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2F7B9C424AF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Oct 2020 09:21:25 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 59552206E3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Oct 2020 09:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601630483;
 bh=x5VTDBtOMTRwW5Sw747OpvTmgVVW1CQQvrNgU0YSFNs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=VeY56BONbbmm2FmoqnTtM9j0aC5oneFySPSit/aqtF5HMMwkvhw+S8PlR4PjMhBv2
 MgJXyVXNGNFs4aKNGCJocT13mZWvA5zI826AjQ6tKa1Sz1szZTnT/oTITNdsgyK177
 f9J+EMB3qFETAAOQ4tF6pn5moG9vszHhf+sw5NbM=
Received: by mail-ed1-f46.google.com with SMTP id c8so944745edv.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 02 Oct 2020 02:21:23 -0700 (PDT)
X-Gm-Message-State: AOAM532i/5MZBnw5YDU7OsbA1rvtSgaG2Lmb9BGAvMqIPyjMAqVE7f5Z
 pODJnmmSUwxME5uKWGP2wpLUGrOfenzCf2wYVYo=
X-Google-Smtp-Source: ABdhPJy5R7Q+WOsSZvDV+Obr4DkMiRhMPNxAJD8JtEaTr3YODtDYA+A/6b0kb8ZGbmu38wYHJp0uYdwzdG8IbDIrIZ8=
X-Received: by 2002:aa7:da16:: with SMTP id r22mr1364149eds.132.1601630481982; 
 Fri, 02 Oct 2020 02:21:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200930234637.7573-1-post@lespocky.de>
 <20200930234637.7573-4-post@lespocky.de>
In-Reply-To: <20200930234637.7573-4-post@lespocky.de>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Fri, 2 Oct 2020 11:21:10 +0200
X-Gmail-Original-Message-ID: <CAJKOXPewAhZU1Enz9HrdrG5RF==y6Mna=E_vfpD4u2747CVo8A@mail.gmail.com>
Message-ID: <CAJKOXPewAhZU1Enz9HrdrG5RF==y6Mna=E_vfpD4u2747CVo8A@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH v6 3/7] dt-bindings: mfd: Fix schema
	warnings for pwm-leds
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

On Thu, 1 Oct 2020 at 01:51, Alexander Dahl <post@lespocky.de> wrote:
>
> The node names for devices using the pwm-leds driver follow a certain
> naming scheme (now).

What warning? Please post them here and in every DTS patch.

Your schema does not enforce pwmleds node naming (the main node, not
children), or at least I could not see it. You change multiple files
in your patchset so are you sure that all these are justified by
warnings pointed out by schema?

Best regards,
Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
