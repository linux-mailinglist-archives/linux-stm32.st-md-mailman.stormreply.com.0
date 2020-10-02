Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EBAC2810C3
	for <lists+linux-stm32@lfdr.de>; Fri,  2 Oct 2020 12:53:09 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D103EC424B0;
	Fri,  2 Oct 2020 10:53:08 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9FA95C3FAFF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Oct 2020 10:53:07 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EEC79208B6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Oct 2020 10:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601635986;
 bh=WUSRRX+XBvVTYHzBDRPQz4PtaU7zhX11OBofs03lu7w=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=yvX1A3cLWsjS1cWSyIRSg+WJmwZtSfrDcvyV/NeaKNl7GPsIy0voCxFZ/rOk4Gpmn
 2KaO/nUo6AwHYxAo8duM5tiz9TubUPDXXY5lD8rnJHuHCrD3KuX85XjN3soizDcz8B
 jOf84bE2XRGR0Trvh3UMgzg0dT6cjmceAFfHiP3o=
Received: by mail-ej1-f48.google.com with SMTP id z23so1297175ejr.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 02 Oct 2020 03:53:05 -0700 (PDT)
X-Gm-Message-State: AOAM533KQUnLuewuNuNtn7TwWG31kkdTiF4Rdi8rIYd8OgGkxMb6/FnB
 v8Aj9WsmjoRAmUSQSzEToz5X7PnuQN5b62fHpdc=
X-Google-Smtp-Source: ABdhPJz2njtnLuaxs13sg4hhwWj46P8QK/G+8vH63FlRpE0n16xuRCvITpEi9m8uB+qnlenWJGhPhUHCNrXOYo6xhlo=
X-Received: by 2002:a17:906:1984:: with SMTP id
 g4mr1573436ejd.119.1601635984516; 
 Fri, 02 Oct 2020 03:53:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200930234637.7573-1-post@lespocky.de>
 <20200930234637.7573-3-post@lespocky.de>
 <CAJKOXPe7Tg+5ESsdPGks_Aqj+zQH4-asC839FseWp0OCJbT4Mw@mail.gmail.com>
 <9895379.VNsV0mSTfq@ada>
In-Reply-To: <9895379.VNsV0mSTfq@ada>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Fri, 2 Oct 2020 12:52:52 +0200
X-Gmail-Original-Message-ID: <CAJKOXPcTstvUuy-CnJbOGxiONLx2V2hfpnR0H4gS=4v+C1udtQ@mail.gmail.com>
Message-ID: <CAJKOXPcTstvUuy-CnJbOGxiONLx2V2hfpnR0H4gS=4v+C1udtQ@mail.gmail.com>
To: Alexander Dahl <ada@thorsis.com>
Cc: devicetree@vger.kernel.org,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-mips@vger.kernel.org,
 Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Alexander Dahl <post@lespocky.de>, linux-leds@vger.kernel.org,
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

On Fri, 2 Oct 2020 at 12:46, Alexander Dahl <ada@thorsis.com> wrote:
>
> Hei hei,
>
> Am Freitag, 2. Oktober 2020, 11:31:09 CEST schrieb Krzysztof Kozlowski:
> > On Thu, 1 Oct 2020 at 01:52, Alexander Dahl <post@lespocky.de> wrote:
> > > The example was adapted in the following ways:
> > >
> > > - make use of the now supported 'function' and 'color' properties
> > > - remove pwm nodes, those are documented elsewhere
> > > - tweake node names to be matched by new dtschema rules
> >
> > tweak? or align?
>
> Depends on if schema actually checks it (child nodes) or if it's just DT
> policy (parent node).  I'll reword in v7.
>
> > > License was discussed with the original author.
> >
> > Since you relicense their work, you need an ack or signed off from
> > every author. You cannot just say "I discussed" and post it. That way
> > I could pretend (lie) I talked to Linus and try to relicense Linux to
> > BSD...
>
> I know.  Peter promised to give his Ack publicly on the list back when I
> worked on v2 or v3, so he is in Cc since then, but apparently he did not yet
> post it. ;-)
>
> > You need acks/SoB from Peter and Russel.
>
> Well, I should add Russel in v7, too, then.

Yes, please.

For the patch itself:
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
