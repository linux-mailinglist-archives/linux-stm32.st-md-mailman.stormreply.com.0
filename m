Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A09AC285C7D
	for <lists+linux-stm32@lfdr.de>; Wed,  7 Oct 2020 12:08:58 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4FAC4C3FAD7;
	Wed,  7 Oct 2020 10:08:58 +0000 (UTC)
Received: from mail.thorsis.com (mail.thorsis.com [92.198.35.195])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 48C25C3FAD5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Oct 2020 10:08:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.thorsis.com (Postfix) with ESMTP id 9C6B63D15
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Oct 2020 12:08:53 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.thorsis.com
Received: from mail.thorsis.com ([127.0.0.1])
 by localhost (mail.thorsis.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k5whOGj6o_Ot
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Oct 2020 12:08:53 +0200 (CEST)
Received: by mail.thorsis.com (Postfix, from userid 109)
 id 7CAAF36BC; Wed,  7 Oct 2020 12:08:53 +0200 (CEST)
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NO_RECEIVED,
 NO_RELAYS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
 version=3.4.2
From: Alexander Dahl <ada@thorsis.com>
To: Pavel Machek <pavel@ucw.cz>
Date: Wed, 07 Oct 2020 12:08:46 +0200
Message-ID: <2640582.VKub60Wb7X@ada>
In-Reply-To: <20201007100359.GC12224@duo.ucw.cz>
References: <20201005203451.9985-1-post@lespocky.de>
 <20201005203451.9985-4-post@lespocky.de> <20201007100359.GC12224@duo.ucw.cz>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, Jeff LaBundy <jeff@labundy.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mips@vger.kernel.org, Alexander Dahl <post@lespocky.de>,
 Dan Murphy <dmurphy@ti.com>, linux-amlogic@lists.infradead.org,
 linux-omap@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-leds@vger.kernel.org,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v7 03/12] dt-bindings: mfd: Fix schema
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

Hei Pavel,

Am Mittwoch, 7. Oktober 2020, 12:03:59 CEST schrieb Pavel Machek:
> > The node names for devices using the pwm-leds driver follow a certain
> > naming scheme (now).  Parent node name is not enforced, but recommended
> > by DT project.
> > 
> >   DTC     Documentation/devicetree/bindings/mfd/iqs62x.example.dt.yaml
> >   CHECK   Documentation/devicetree/bindings/mfd/iqs62x.example.dt.yaml
> > 
> > /home/alex/build/linux/Documentation/devicetree/bindings/mfd/iqs62x.exampl
> > e.dt.yaml: pwmleds: 'panel' does not match any of the regexes:
> > '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'> 
> >         From schema:
> >         /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/
> >         leds-pwm.yaml> 
> > Signed-off-by: Alexander Dahl <post@lespocky.de>
> 
> Okay, so I need Rob's ack here, I guess... and rest of the series is
> not really for my tree.

I think so, too.

I saw you applied patch number 1, all the other patches are DT and from my 
side those can wait for the Acks required and maybe I change the indexes again 
and I'm fine resending all that after the 5.10 merge window.

Thanks for applying the non-DT patches for leds subsystem, the rest will be 
sorted out without hurry.

Greets
Alex



_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
