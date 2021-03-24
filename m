Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ECCB9347FB6
	for <lists+linux-stm32@lfdr.de>; Wed, 24 Mar 2021 18:45:33 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9A81EC57B5E;
	Wed, 24 Mar 2021 17:45:33 +0000 (UTC)
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com
 [209.85.166.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5A570C57B55
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Mar 2021 17:45:31 +0000 (UTC)
Received: by mail-io1-f52.google.com with SMTP id j26so22380466iog.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Mar 2021 10:45:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WQOKKI3NBhlafu15L4AYHTsh8eoYcv2NYX3pxh4cbeY=;
 b=N+GJax+JUE7jir1fCg5aM5FSxAbyvA+VZfpr42qBkFye28pCD08+NUs0qZCAyhtJWO
 Ld5WMKdHvkwvEYqbQ4WX59kqv9xN4lTd9E/kZfnC8FocKELZt3Bj+kz6fo6dNkngfH3M
 Lm9sdoZzOQgQKbTXXBFxHgVbnrZbpL1F7pwBspCx2tjAytNEaYm88F5RL15xnYe9RrbG
 3Ie+xcrTg5FeSDZ+/CkP5i/clKnXiIxb2Gcegu4JMjGYB3Q0wuU+lv4yazM+tTrNWFjJ
 mDoU4oxTn76lofFSDnRUe830tEKG/pSMSFTCMFKz99qnZK9ipKvrHRLfwzcizLin84c3
 UnJw==
X-Gm-Message-State: AOAM532n6oI9K2yae6me2bw3/miYKrQPLeUSm9C8tRklaac1mzvWd6gf
 dTHK2WcU2THMSiNzZf8ecg==
X-Google-Smtp-Source: ABdhPJykeeWlxXXZ603awX5WAKK6E91QipPknYAhmUz/+Kj3s31Ka3rSq1o62TNB0Nhkf4AldSTLRQ==
X-Received: by 2002:a02:8801:: with SMTP id r1mr4013533jai.51.1616607929547;
 Wed, 24 Mar 2021 10:45:29 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id 14sm1439848ilt.54.2021.03.24.10.45.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 10:45:28 -0700 (PDT)
Received: (nullmailer pid 3316165 invoked by uid 1000);
 Wed, 24 Mar 2021 17:45:25 -0000
Date: Wed, 24 Mar 2021 11:45:25 -0600
From: Rob Herring <robh@kernel.org>
To: dillon min <dillon.minfei@gmail.com>
Message-ID: <20210324174525.GA3309477@robh.at.kernel.org>
References: <1615801436-3016-1-git-send-email-dillon.minfei@gmail.com>
 <1615801436-3016-10-git-send-email-dillon.minfei@gmail.com>
 <CAL9mu0Lfj+n4uk2rT8QnDtRveHn2gLx4ut6fLCByt0w9e08vwQ@mail.gmail.com>
 <01c9f635-7b2b-fc9c-3cf9-6d7f425d683e@foss.st.com>
 <CAL9mu0LaWyhb0=CdJgrfq8v08P2cgKSx8g=u3MJU=dRQc8bThw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAL9mu0LaWyhb0=CdJgrfq8v08P2cgKSx8g=u3MJU=dRQc8bThw@mail.gmail.com>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Vladimir Murzin <vladimir.murzin@arm.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, rong.a.chen@intel.com,
 gregkh@linuxfoundation.org, Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, erwan.leray@st.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-serial@vger.kernel.org,
 linux@armlinux.org.uk, afzal.mohd.ma@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, lkp@intel.com
Subject: Re: [Linux-stm32] [PATCH v3 9/9] dt-bindings: serial: stm32: add
 phandle 'bluetooth' to fix dtbs_check warrning
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

On Fri, Mar 19, 2021 at 07:13:27PM +0800, dillon min wrote:
> Hi Alexandre,
> 
> Thanks for the reply.
> 
> On Fri, Mar 19, 2021 at 4:38 PM Alexandre TORGUE
> <alexandre.torgue@foss.st.com> wrote:
> >
> > Hi Dillon
> >
> > On 3/19/21 5:28 AM, dillon min wrote:
> > > No changes, Just loop lkp in.
> > >
> > >
> > > Hi lkp,
> > >
> > > Sorry for the late reply, thanks for your report.
> > > This patch is to fix the build warning message.
> > >
> > > Thanks.
> > > Regards
> > >
> > > On Mon, Mar 15, 2021 at 5:45 PM <dillon.minfei@gmail.com> wrote:
> > >>
> > >> From: dillon min <dillon.minfei@gmail.com>
> > >>
> > >> when run make dtbs_check with 'bluetoothi brcm,bcm43438-bt'
> > >> dts enabled on stm32h7, there is a warrning popup:
> > >>
> > >>>> arch/arm/boot/dts/stm32h750i-art-pi.dt.yaml: serial@40004800: 'bluetooth'
> > >>     does not match any of the regexes: 'pinctrl-[0-9]+'
> > >>
> > >> to make dtbs_check happy, so add a phandle bluetooth
> > >>
> > >> Fixes: 500cdb23d608 ("ARM: dts: stm32: Add STM32H743 MCU and STM32H743i-EVAL board")
> > >> Signed-off-by: dillon min <dillon.minfei@gmail.com>
> > >> Reported-by: kernel test robot <lkp@intel.com>
> > >> ---
> > >>   Documentation/devicetree/bindings/serial/st,stm32-uart.yaml | 5 +++++
> > >>   1 file changed, 5 insertions(+)
> > >>
> > >> diff --git a/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml b/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
> > >> index 8631678283f9..5e674840e62d 100644
> > >> --- a/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
> > >> +++ b/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
> > >> @@ -50,6 +50,11 @@ properties:
> > >>       minItems: 1
> > >>       maxItems: 2
> > >>
> > >> +  bluetooth:
> > >> +    type: object
> > >> +    description: |
> > >> +      phandles to the usart controller and bluetooth
> > >> +
> >
> > Do we really need to add this "generic" property here ? You could test
> > without the "AditionalProperties:False".
> Yes, indeed. we have no reason to add a generic 'bluetooth' property
> into specific soc's interface yaml.
> I can't just remove "AditionalProperties:False", else make
> O=../kernel-art/ dtbs dtbs_check will run into
> 
> /home/fmin/linux/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml:
> 'oneOf' conditional failed, one must be fixed:
> 'unevaluatedProperties' is a required property
> 'additionalProperties' is a required property
> ...
> 
> So , i will replace "AditionalProperties:False". with
> unevaluatedProperties: false, do you agree with this?

This is okay as long as 'serial.yaml' is referenced, but will eventually 
fail if not (unevaluatedProperties isn't actually implemented yet).

> If so, i will send patch v4 later.

Or you can do this:

addtionalProperties:
  type: object

Which means any other property has to be a node.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
