Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D27548242E
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Aug 2019 19:45:33 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8652AC35E04;
	Mon,  5 Aug 2019 17:45:33 +0000 (UTC)
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CACA2C35E01
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Aug 2019 17:45:29 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id 4so29748905pld.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 05 Aug 2019 10:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=yaMCm60MQbAiEe109hZbk3mz1nB4Kn7VLm+HH7rwTRQ=;
 b=uILuQErqEj6dMFOf5SZh0i/b2tp5bwQfRZyTmmXbXwiJ905gJe7x+Y0F/LzIGf1GOM
 dbAhNp1MwxulQi3XQYrmPEEMHTBx2zFans4TpSdPfRssyPvaP8pThH1p2vRyI+qyq0er
 50z0RKVU3FWTZjDbrgC0275nB2kfXT95xJt6YA5QW/TQxFgtylRV5BLkD1bzZR9WxUjC
 jsXt6K+hAn+ZyM5pE2UZNTsjqbgDaX6+CXW3zdlkIdtZaoJXr2Tr8NzTJnoyvm1PTMG+
 cDsYIcu7PYHwyrBRenExj3UgjXocGhhCbvtc5z2de0yrPpz+BXVe4NgmA3lJMFHkwzCi
 pEhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=yaMCm60MQbAiEe109hZbk3mz1nB4Kn7VLm+HH7rwTRQ=;
 b=KXNOZED9DizcbWF+IM56FKM6E8DWBXY7j2VkQwTD+2PVYYMA7i/s/JWmMiNsbjXPiH
 bh+R8rdLOK9/bN4wvylcpmsAnBHmVs3D6a9BGTPy3nowkWzLcy9xb5KYlheR1NN4Y35c
 iNlLd4MRKSr0aKIcu8nBc/eNjUISJwLwe1biv0BfSy6rMWkkvSOyPCgVQFodh5i5ir4E
 2/zYpSof9PnSKftFoZODsKv+M5nbcW9rc4FULxejpBKpT43mhMkjysN3YMZgJ4bBk63w
 6QNkKJTAUaVdB9EaaULzeLIma3HWgtPsuaqPT52phdIKpd79ehJPRnKOWre0Fb7wKJD4
 KlVA==
X-Gm-Message-State: APjAAAXnaixNcdMp+w1DozSI1gCsd5k8+54uW2D+F3JtSGA/nWOlCQYM
 sJl3lOc4TAkYV4A0jjrkyJ6Fmw==
X-Google-Smtp-Source: APXvYqyXSBold9rTE84iJAtGLze32KZeXA3Zh9TxcfLV0XfYpUb8i/gYaAVGpQpEYjhS9ow7s7fROw==
X-Received: by 2002:a17:902:9689:: with SMTP id
 n9mr147750614plp.241.1565027127918; 
 Mon, 05 Aug 2019 10:45:27 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net.
 [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id s20sm96177226pfe.169.2019.08.05.10.45.26
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 05 Aug 2019 10:45:27 -0700 (PDT)
Date: Mon, 5 Aug 2019 10:46:59 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Fabien DESSENNE <fabien.dessenne@st.com>
Message-ID: <20190805174659.GA23928@tuxbook-pro>
References: <1552492237-28810-1-git-send-email-fabien.dessenne@st.com>
 <20190801191403.GA7234@tuxbook-pro>
 <1a057176-81ab-e302-4375-2717ceef6924@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1a057176-81ab-e302-4375-2717ceef6924@st.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Mark Rutland <mark.rutland@arm.com>,
 Jonathan Corbet <corbet@lwn.net>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 0/6] hwspinlock: allow sharing of
	hwspinlocks
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Mon 05 Aug 01:48 PDT 2019, Fabien DESSENNE wrote:

> =

> On 01/08/2019 9:14 PM, Bjorn Andersson wrote:
> > On Wed 13 Mar 08:50 PDT 2019, Fabien Dessenne wrote:
> >
> >> The current implementation does not allow two different devices to use
> >> a common hwspinlock. This patch set proposes to have, as an option, so=
me
> >> hwspinlocks shared between several users.
> >>
> >> Below is an example that explain the need for this:
> >> 	exti: interrupt-controller@5000d000 {
> >> 		compatible =3D "st,stm32mp1-exti", "syscon";
> >> 		interrupt-controller;
> >> 		#interrupt-cells =3D <2>;
> >> 		reg =3D <0x5000d000 0x400>;
> >> 		hwlocks =3D <&hsem 1>;
> >> 	};
> >> The two drivers (stm32mp1-exti and syscon) refer to the same hwlock.
> >> With the current hwspinlock implementation, only the first driver succ=
eeds
> >> in requesting (hwspin_lock_request_specific) the hwlock. The second re=
quest
> >> fails.
> >>
> >>
> >> The proposed approach does not modify the API, but extends the DT 'hwl=
ocks'
> >> property with a second optional parameter (the first one identifies an
> >> hwlock) that specifies whether an hwlock is requested for exclusive us=
age
> >> (current behavior) or can be shared between several users.
> >> Examples:
> >> 	hwlocks =3D <&hsem 8>;	Ref to hwlock #8 for exclusive usage
> >> 	hwlocks =3D <&hsem 8 0>;	Ref to hwlock #8 for exclusive (0) usage
> >> 	hwlocks =3D <&hsem 8 1>;	Ref to hwlock #8 for shared (1) usage
> >>
> >> As a constraint, the #hwlock-cells value must be 1 or 2.
> >> In the current implementation, this can have theorically any value but:
> >> - all of the exisiting drivers use the same value : 1.
> >> - the framework supports only one value : 1 (see implementation of
> >>    of_hwspin_lock_simple_xlate())
> >> Hence, it shall not be a problem to restrict this value to 1 or 2 since
> >> it won't break any driver.
> >>
> > Hi Fabien,
> >
> > Your series looks good, but it makes me wonder why the hardware locks
> > should be an exclusive resource.
> >
> > How about just making all (specific) locks shared?
> =

> Hi Bjorn,
> =

> Making all locks shared is a possible implementation (my first =

> implementation
> was going this way) but there are some drawbacks we must be aware of:
> =

> A/ This theoretically break the legacy behavior (the legacy works with
> exclusive (UNUSED radix tag) usage). As a consequence, an existing driver
> that is currently failing to request a lock (already claimed by another
> user) would now work fine. Not sure that there are such drivers, so this
> point is probably not a real issue.
> =


Right, it's possible that a previously misconfigured system now
successfully probes more than one device that uses a particular
spinlock. But such system would be suffering from issues related to e.g.
probe ordering.

So I think we should ignore this issue.

> B/ This would introduce some inconsistency between the two 'request' API
> which are hwspin_lock_request() and hwspin_lock_request_specific().
> hwspin_lock_request() looks for an unused lock, so requests for an exclus=
ive
> usage. On the other side, request_specific() would request shared locks.
> Worst the following sequence can transform an exclusive usage into a shar=
ed
> =


There is already an inconsistency in between these; as with above any
system that uses both request() and request_specific() will be suffering
from intermittent failures due to probe ordering.

> one:
>  =A0 -hwspin_lock_request() -> returns Id#0 (exclusive)
>  =A0 -hwspin_lock_request() -> returns Id#1 (exclusive)
>  =A0 -hwspin_lock_request_specific(0) -> returns Id#0 and makes Id#0 shar=
ed
> Honestly I am not sure that this is a real issue, but it's better to have=
 it
> in mind before we take ay decision

The case where I can see a
problem with this would be if the two clients somehow would nest their
locking regions.

But generally I think this could consider this an improvement, because
the request_specific() would now be able to acquire its hwlock, with
some additional contention due to the multiple use.

> I could not find any driver using the hwspin_lock_request() API, we
> may decide to remove (or to make deprecated) this API, having
> everything 'shared without any conditions'.
> =


It would be nice to have an upstream user of this API.

> =

> I can see three options:
> 1- Keep my initial proposition
> 2- Have hwspin_lock_request_specific() using shared locks and
>  =A0=A0 hwspin_lock_request() using unused (so 'initially' exclusive) loc=
ks.
> 3- Have hwspin_lock_request_specific() using shared locks and
>  =A0=A0 remove/make deprecated hwspin_lock_request().
> =

> Just let me know what is your preference.
> =


I think we should start with #2 and would like input from e.g. Suman
regarding #3.

Regards,
Bjorn

> BR
> =

> Fabien
> =

> >
> > Regards,
> > Bjorn
> >
> >> Fabien Dessenne (6):
> >>    dt-bindings: hwlock: add support of shared locks
> >>    hwspinlock: allow sharing of hwspinlocks
> >>    dt-bindings: hwlock: update STM32 #hwlock-cells value
> >>    ARM: dts: stm32: Add hwspinlock node for stm32mp157 SoC
> >>    ARM: dts: stm32: Add hwlock for irqchip on stm32mp157
> >>    ARM: dts: stm32: hwlocks for GPIO for stm32mp157
> >>
> >>   .../devicetree/bindings/hwlock/hwlock.txt          | 27 +++++--
> >>   .../bindings/hwlock/st,stm32-hwspinlock.txt        |  6 +-
> >>   Documentation/hwspinlock.txt                       | 10 ++-
> >>   arch/arm/boot/dts/stm32mp157-pinctrl.dtsi          |  2 +
> >>   arch/arm/boot/dts/stm32mp157c.dtsi                 | 10 +++
> >>   drivers/hwspinlock/hwspinlock_core.c               | 82 ++++++++++++=
+++++-----
> >>   drivers/hwspinlock/hwspinlock_internal.h           |  2 +
> >>   7 files changed, 108 insertions(+), 31 deletions(-)
> >>
> >> -- =

> >> 2.7.4
> >>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
