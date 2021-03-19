Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 16CC8341B34
	for <lists+linux-stm32@lfdr.de>; Fri, 19 Mar 2021 12:14:07 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BE1A5C58D5B;
	Fri, 19 Mar 2021 11:14:06 +0000 (UTC)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com
 [209.85.166.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E6723C58D59
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Mar 2021 11:14:04 +0000 (UTC)
Received: by mail-io1-f43.google.com with SMTP id v26so5627347iox.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Mar 2021 04:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w077GjWQdUN1FmrTEFv40WM5lSLyRxcaw45yoOKr8sg=;
 b=Ah/U9lTHR5vNyN0CEC86//Qc9FeylDRH6wMB4HHVQ+NoL7mGihIWraJuVqNZqgp2Yq
 1g7zDsg9MaotmLKYMdZ8EMAVEitWYaC8wRZp9GKEtDjC4i7p81iJgBP8fyzI93bCWGnD
 Q5KckiSWpbzt0jiNoiV21hFSrzaCxa1E9zqBWDL4By2YePFrMkf22CULcAXOV35inCQs
 9WlSU+dWwREWSpY6Wdccq/ppYw0zn1l4v+m/F9uyboA6feKEsemGi95pGtjja/UMh81E
 nsA4md8IhXXCWxPRYPQNuYe0QbQ32fJr5GZ5XmG9aHczqFDePvJi/0kRRw4fjIRutpkO
 +4oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w077GjWQdUN1FmrTEFv40WM5lSLyRxcaw45yoOKr8sg=;
 b=XDZVI3UWpjJjNc3O14zzgYusE43kE0ONl8T7Vn4Y+uY9Fj2EAfc8df90g3eXMHccn5
 f3wPjZUelzNsw3j+M6eJG18kixUbpIfeposG2wJqPGlj0T9udCgtF6eGTs3qSKxhLH9I
 GNpEuutmyZS0kZidz5Q8PZLBODvh4anYFhVDxkzdTZ9jXdhrrhp0qHC9b8cE9wWGA3oD
 UGNt4QpfWWRFBolFrySrrgFLfWeOTigYYR0bBwREkE91Ch5dat/y8CDpdp488bTwSh/i
 BONVohN3V+PoeyZ40imL0JjDL7HGWn2VhW9Mf5E11AAH/IiL5yQ94P12/DEDOekugY5e
 y9Xg==
X-Gm-Message-State: AOAM530eqeb8iMKwlkwpc+6Z02UG42Kr/h/GuzcKia7eRO8MSeUj6Kkw
 1w4RCqFKDgFbCtGPz4czejyUNVkpadPuMcL5IH0=
X-Google-Smtp-Source: ABdhPJwBYQjE5C8weELlPH/FS3kqWEEIEOjhv3Lp9BWZAmT9Yc702ijm0oKC/i+eZjjJ5c1BxjTIrer6UF4iaPSlRw8=
X-Received: by 2002:a05:6638:388e:: with SMTP id
 b14mr831990jav.62.1616152443770; 
 Fri, 19 Mar 2021 04:14:03 -0700 (PDT)
MIME-Version: 1.0
References: <1615801436-3016-1-git-send-email-dillon.minfei@gmail.com>
 <1615801436-3016-10-git-send-email-dillon.minfei@gmail.com>
 <CAL9mu0Lfj+n4uk2rT8QnDtRveHn2gLx4ut6fLCByt0w9e08vwQ@mail.gmail.com>
 <01c9f635-7b2b-fc9c-3cf9-6d7f425d683e@foss.st.com>
In-Reply-To: <01c9f635-7b2b-fc9c-3cf9-6d7f425d683e@foss.st.com>
From: dillon min <dillon.minfei@gmail.com>
Date: Fri, 19 Mar 2021 19:13:27 +0800
Message-ID: <CAL9mu0LaWyhb0=CdJgrfq8v08P2cgKSx8g=u3MJU=dRQc8bThw@mail.gmail.com>
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>, rong.a.chen@intel.com
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Vladimir Murzin <vladimir.murzin@arm.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, gregkh@linuxfoundation.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux@armlinux.org.uk, Rob Herring <robh+dt@kernel.org>, erwan.leray@st.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-serial@vger.kernel.org,
 afzal.mohd.ma@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
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

Hi Alexandre,

Thanks for the reply.

On Fri, Mar 19, 2021 at 4:38 PM Alexandre TORGUE
<alexandre.torgue@foss.st.com> wrote:
>
> Hi Dillon
>
> On 3/19/21 5:28 AM, dillon min wrote:
> > No changes, Just loop lkp in.
> >
> >
> > Hi lkp,
> >
> > Sorry for the late reply, thanks for your report.
> > This patch is to fix the build warning message.
> >
> > Thanks.
> > Regards
> >
> > On Mon, Mar 15, 2021 at 5:45 PM <dillon.minfei@gmail.com> wrote:
> >>
> >> From: dillon min <dillon.minfei@gmail.com>
> >>
> >> when run make dtbs_check with 'bluetoothi brcm,bcm43438-bt'
> >> dts enabled on stm32h7, there is a warrning popup:
> >>
> >>>> arch/arm/boot/dts/stm32h750i-art-pi.dt.yaml: serial@40004800: 'bluetooth'
> >>     does not match any of the regexes: 'pinctrl-[0-9]+'
> >>
> >> to make dtbs_check happy, so add a phandle bluetooth
> >>
> >> Fixes: 500cdb23d608 ("ARM: dts: stm32: Add STM32H743 MCU and STM32H743i-EVAL board")
> >> Signed-off-by: dillon min <dillon.minfei@gmail.com>
> >> Reported-by: kernel test robot <lkp@intel.com>
> >> ---
> >>   Documentation/devicetree/bindings/serial/st,stm32-uart.yaml | 5 +++++
> >>   1 file changed, 5 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml b/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
> >> index 8631678283f9..5e674840e62d 100644
> >> --- a/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
> >> +++ b/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
> >> @@ -50,6 +50,11 @@ properties:
> >>       minItems: 1
> >>       maxItems: 2
> >>
> >> +  bluetooth:
> >> +    type: object
> >> +    description: |
> >> +      phandles to the usart controller and bluetooth
> >> +
>
> Do we really need to add this "generic" property here ? You could test
> without the "AditionalProperties:False".
Yes, indeed. we have no reason to add a generic 'bluetooth' property
into specific soc's interface yaml.
I can't just remove "AditionalProperties:False", else make
O=../kernel-art/ dtbs dtbs_check will run into

/home/fmin/linux/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml:
'oneOf' conditional failed, one must be fixed:
'unevaluatedProperties' is a required property
'additionalProperties' is a required property
...

So , i will replace "AditionalProperties:False". with
unevaluatedProperties: false, do you agree with this?
If so, i will send patch v4 later.

Thanks.

Regards
>
> Regards
> Alex
>
>
> >>   # cts-gpios and rts-gpios properties can be used instead of 'uart-has-rtscts'
> >>   # or 'st,hw-flow-ctrl' (deprecated) for making use of any gpio pins for flow
> >>   # control instead of dedicated pins.
> >> --
> >> 1.9.1
> >>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
