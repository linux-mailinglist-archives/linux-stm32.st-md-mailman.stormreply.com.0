Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A51281062
	for <lists+linux-stm32@lfdr.de>; Fri,  2 Oct 2020 12:12:19 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 96D74C424B1;
	Fri,  2 Oct 2020 10:12:19 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6AFDDC424AF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Oct 2020 10:12:16 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3E0BC20708
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Oct 2020 10:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601633535;
 bh=YMb+SikBzA0kaz01qg1rFRGqMR34IEZDdELzQnvannc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=m+QSecoZOGe8dvzGAzaVLu6djX6wvstSNjTufshrQ7pLbM+zd/i00BMIxk9HtkH36
 4RGMtD5Y9P1GyZIBAMLBkI9wveIJaHkolhG9ddl4D8wp9XAcl991RL+EtWsjr+8KQt
 XTGHujSHsO4T0sIxR14eOk8W/1eFzzgroCv9ipS4=
Received: by mail-ed1-f50.google.com with SMTP id l17so1066043edq.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 02 Oct 2020 03:12:15 -0700 (PDT)
X-Gm-Message-State: AOAM530AJWg5fmWW5IRvaabczDgKP/K82fE21jgrjDnvuXaBZQWUDgVm
 0Rw4/KhJZvFSptCarbzUoY/d5CXHdiMJDLaNVyk=
X-Google-Smtp-Source: ABdhPJyIAzURzd3Z3ZQc9dk3WngtlZ5byJRK3kR//jIcYN1OLykt0UVP1CzVTSlm3oLD4xmvK0KWSQpcyp1ktS9V6aw=
X-Received: by 2002:aa7:da16:: with SMTP id r22mr1552459eds.132.1601633533817; 
 Fri, 02 Oct 2020 03:12:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200930234637.7573-1-post@lespocky.de>
 <20200930234637.7573-4-post@lespocky.de>
 <CAJKOXPewAhZU1Enz9HrdrG5RF==y6Mna=E_vfpD4u2747CVo8A@mail.gmail.com>
 <1708987.KbI9FDK2aH@ada>
In-Reply-To: <1708987.KbI9FDK2aH@ada>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Fri, 2 Oct 2020 12:12:01 +0200
X-Gmail-Original-Message-ID: <CAJKOXPfK_fnyf0bJY_d_pKH0es3C9x07Fc425LPCr323qZkugw@mail.gmail.com>
Message-ID: <CAJKOXPfK_fnyf0bJY_d_pKH0es3C9x07Fc425LPCr323qZkugw@mail.gmail.com>
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

On Fri, 2 Oct 2020 at 12:07, Alexander Dahl <ada@thorsis.com> wrote:
>
> Hello Krzysztof,
>
> Am Freitag, 2. Oktober 2020, 11:21:10 CEST schrieb Krzysztof Kozlowski:
> > On Thu, 1 Oct 2020 at 01:51, Alexander Dahl <post@lespocky.de> wrote:
> > > The node names for devices using the pwm-leds driver follow a certain
> > > naming scheme (now).
> >
> > What warning? Please post them here and in every DTS patch.
>
> ack
>
> > Your schema does not enforce pwmleds node naming (the main node, not
> > children), or at least I could not see it. You change multiple files
> > in your patchset so are you sure that all these are justified by
> > warnings pointed out by schema?
>
> The rename was suggested by Rob [1], and I think you're right, those names are
> not (yet) enforced by schema?  So at least the commit message is misleading
> for now.  I'll have to see if I rather reword or update the schema again.

If schema does not enforce it, then maybe just mention that you align
the children names with schema and pwmleds node to device tree
specification guidelines (node name should be generic, reflecting
function of the device). However in such case changing only pwmleds
node name in DTS (without changing children) would not be justified,
IMHO.

Best regards,
Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
