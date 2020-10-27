Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A6929AB97
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Oct 2020 13:16:13 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 304C5C36B37;
	Tue, 27 Oct 2020 12:16:13 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 53A88C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Oct 2020 12:16:11 +0000 (UTC)
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com
 [209.85.161.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8DEED24650
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Oct 2020 12:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603800969;
 bh=rHy7m3RuiJVB+20ux7B22H/jeahOgDzJQVxUUqsPONE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=nnslobMGiXfBKFGnGsYxOuqPAeWLHs9VXT5qE++xWWTVdGmCplAti2v3iFFzFaPmh
 Aw2AlXxRpu2V1H8IMkogfIpWAvF+1iZ4KdGcyGqB3Mdx5Q8hdz0p0oleDQMcwMkW7I
 Tm3oL/qRKuH7Eee2jicv4D49KxzNLOagtRWKlDNQ=
Received: by mail-oo1-f43.google.com with SMTP id j41so169318oof.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Oct 2020 05:16:09 -0700 (PDT)
X-Gm-Message-State: AOAM530j5wLjzvL6wfz8AI/PjDPPlgIgQRarWtbqZu9TRYagdqW359/m
 TaSJtRNCpp/AEZl0jLmvvdkxBCJWFGeKCrovlQ==
X-Google-Smtp-Source: ABdhPJwWNPIQlF6Bp7SJfw0BWlotFu1Nk1SaBiaHNR8Jk/NmGn35wJqO0jl1Ihg5ANtyL/n3D9IZ22eRLIBU/rPXk3E=
X-Received: by 2002:a4a:d453:: with SMTP id p19mr1528328oos.50.1603800968782; 
 Tue, 27 Oct 2020 05:16:08 -0700 (PDT)
MIME-Version: 1.0
References: <20201021102855.18026-1-a.fatoum@pengutronix.de>
 <20201026143656.GA118160@bogus>
 <23e423ba-25f2-c3ed-ea65-2c2d86ae9522@pengutronix.de>
In-Reply-To: <23e423ba-25f2-c3ed-ea65-2c2d86ae9522@pengutronix.de>
From: Rob Herring <robh@kernel.org>
Date: Tue, 27 Oct 2020 07:15:57 -0500
X-Gmail-Original-Message-ID: <CAL_JsqL8sjw1o6PzCSRM9FtRx7XLDQg2bWXxo4Yw5t6fnroudw@mail.gmail.com>
Message-ID: <CAL_JsqL8sjw1o6PzCSRM9FtRx7XLDQg2bWXxo4Yw5t6fnroudw@mail.gmail.com>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: devicetree@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Sascha Hauer <kernel@pengutronix.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v2 1/2] dt-bindings: arm: stm32: add
 simple-mfd compatible for tamp node
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

On Mon, Oct 26, 2020 at 4:30 PM Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
>
> Hello Rob,
>
> On 10/26/20 3:36 PM, Rob Herring wrote:
> > On Wed, Oct 21, 2020 at 12:28:55PM +0200, Ahmad Fatoum wrote:
> >> The stm32mp1 TAMP (Tamper and backup registers) does tamper detection
> >> and features 32 backup registers that, being in the RTC domain, may
> >> survive even with Vdd switched off.
> >>
> >> This makes it suitable for use to communicate a reboot mode from OS
> >> to bootloader via the syscon-reboot-mode binding. Add a "simple-mfd"
> >> to support probing such a child node. The actual reboot mode
> >> node could then be defined in a board.dts or fixed up by the bootloader.
> >
> > 'simple-mfd' implies there is no dependency on the parent node for the
> > child (such as the regmap perhaps). Is that the case here?
>
> No, there's a dependency and the Linux driver does syscon_node_to_regmap
> on the device tree node's parent but that's how the syscon-reboot-mode binding
> is documented:
>
>   The SYSCON mapped register is retrieved from the
>   parental dt-node plus the offset. So the SYSCON reboot-mode node
>   should be represented as a sub-node of a "syscon", "simple-mfd" node.
>
> How would you prefer this being done instead?

Well, probably the syscon driver could just probe any children, but
I'm not sure if that would break anyone. So I guess fine as-is.

Reviewed-by: Rob Herring <robh@kernel.org>

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
