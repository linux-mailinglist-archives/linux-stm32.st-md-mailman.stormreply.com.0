Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 40145281144
	for <lists+linux-stm32@lfdr.de>; Fri,  2 Oct 2020 13:32:59 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 012FEC424B7;
	Fri,  2 Oct 2020 11:32:59 +0000 (UTC)
Received: from mail.thorsis.com (mail.thorsis.com [92.198.35.195])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C1109C424AF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Oct 2020 10:07:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.thorsis.com (Postfix) with ESMTP id C69A3F15
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Oct 2020 12:07:45 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.thorsis.com
Received: from mail.thorsis.com ([127.0.0.1])
 by localhost (mail.thorsis.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U3yjvM2JqRsO
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Oct 2020 12:07:45 +0200 (CEST)
Received: by mail.thorsis.com (Postfix, from userid 109)
 id 95DC23B69; Fri,  2 Oct 2020 12:07:45 +0200 (CEST)
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NO_RECEIVED,
 NO_RELAYS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
 version=3.4.2
From: Alexander Dahl <ada@thorsis.com>
To: linux-leds@vger.kernel.org
Date: Fri, 02 Oct 2020 12:07:38 +0200
Message-ID: <1708987.KbI9FDK2aH@ada>
In-Reply-To: <CAJKOXPewAhZU1Enz9HrdrG5RF==y6Mna=E_vfpD4u2747CVo8A@mail.gmail.com>
References: <20200930234637.7573-1-post@lespocky.de>
 <20200930234637.7573-4-post@lespocky.de>
 <CAJKOXPewAhZU1Enz9HrdrG5RF==y6Mna=E_vfpD4u2747CVo8A@mail.gmail.com>
X-Mailman-Approved-At: Fri, 02 Oct 2020 11:32:57 +0000
Cc: devicetree@vger.kernel.org,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-mips@vger.kernel.org,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Rob Herring <robh+dt@kernel.org>,
 Alexander Dahl <post@lespocky.de>, Dan Murphy <dmurphy@ti.com>,
 Pavel Machek <pavel@ucw.cz>, linux-amlogic@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hello Krzysztof,

Am Freitag, 2. Oktober 2020, 11:21:10 CEST schrieb Krzysztof Kozlowski:
> On Thu, 1 Oct 2020 at 01:51, Alexander Dahl <post@lespocky.de> wrote:
> > The node names for devices using the pwm-leds driver follow a certain
> > naming scheme (now).
> 
> What warning? Please post them here and in every DTS patch.

ack

> Your schema does not enforce pwmleds node naming (the main node, not
> children), or at least I could not see it. You change multiple files
> in your patchset so are you sure that all these are justified by
> warnings pointed out by schema?

The rename was suggested by Rob [1], and I think you're right, those names are 
not (yet) enforced by schema?  So at least the commit message is misleading 
for now.  I'll have to see if I rather reword or update the schema again.

Greets
Alex

[1] https://lore.kernel.org/linux-leds/20200922155747.GA2734659@bogus/


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
