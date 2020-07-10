Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FC721BE32
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Jul 2020 22:01:20 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A836CC36B2A;
	Fri, 10 Jul 2020 20:01:19 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BA117C36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jul 2020 20:01:16 +0000 (UTC)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com
 [209.85.167.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 524D4207FC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jul 2020 20:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594411275;
 bh=uxSaA+fCdlWn4qcPwLruiKx79jbqmYw66ELH749IiaE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=1wPkaE20z7plsMQiJwhVZ0+paqUwAPcL9GsKXf1XrgHsHp6QKFd3U0qwNQj1wVKw6
 oFM2bYRdanLlb02iDrG6quyLCCI8fDqDyAlcxJYyq5iMV0fXlzOygHrhBaOBnc10fv
 qOZWzZ3l5FqPvoVBsTQgTCr2YMgP9r32B1WtrAIw=
Received: by mail-oi1-f170.google.com with SMTP id k4so5778409oik.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jul 2020 13:01:15 -0700 (PDT)
X-Gm-Message-State: AOAM530XFS/PYC+8pbppGr6Wxx1CUdHT9aFxXldkWOgtm+MSaav4wiAZ
 ntqlrVCVn+zjYFtql6G0D5ZLdcen9aRlg9cBLg==
X-Google-Smtp-Source: ABdhPJwp+smXE3Nydu1By4o0JE3KuEQE3LX21t7xmomGltsl4AiTMSJDziZ1tEKIqsf+vYtAAi8lMSlSyNN6DaD306U=
X-Received: by 2002:aca:bb82:: with SMTP id l124mr5612171oif.106.1594411274634; 
 Fri, 10 Jul 2020 13:01:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200701130129.30961-1-benjamin.gaignard@st.com>
 <20200701130129.30961-2-benjamin.gaignard@st.com>
 <20200709203718.GA837160@bogus>
 <20e4907a-f218-3e43-1111-7d4b9ee6d945@st.com>
In-Reply-To: <20e4907a-f218-3e43-1111-7d4b9ee6d945@st.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 10 Jul 2020 14:01:02 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+VgXTJy1SQr6B63kLZ3wcRMe4YfYiRNCT6s=gUO_tmTw@mail.gmail.com>
Message-ID: <CAL_Jsq+VgXTJy1SQr6B63kLZ3wcRMe4YfYiRNCT6s=gUO_tmTw@mail.gmail.com>
To: Benjamin GAIGNARD <benjamin.gaignard@st.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "vincent.guittot@linaro.org" <vincent.guittot@linaro.org>,
 "rjw@rjwysocki.net" <rjw@rjwysocki.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "valentin.schneider@arm.com" <valentin.schneider@arm.com>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Re: [Linux-stm32] [PATCH v7 1/3] dt-bindings: media: stm32-dcmi:
 Add DCMI min frequency property
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

On Fri, Jul 10, 2020 at 1:33 AM Benjamin GAIGNARD
<benjamin.gaignard@st.com> wrote:
>
>
>
> On 7/9/20 10:37 PM, Rob Herring wrote:
> > On Wed, Jul 01, 2020 at 03:01:27PM +0200, Benjamin Gaignard wrote:
> >> Document st,stm32-dcmi-min-frequency property which is used to
> >> request CPUs minimum frequency when streaming frames.
> >>
> >> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> >> ---
> >>   Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml | 8 ++++++++
> >>   1 file changed, 8 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml b/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
> >> index 3fe778cb5cc3..05ca85a2411a 100644
> >> --- a/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
> >> +++ b/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
> >> @@ -44,6 +44,13 @@ properties:
> >>         bindings defined in
> >>         Documentation/devicetree/bindings/media/video-interfaces.txt.
> >>
> >> +  st,stm32-dcmi-min-frequency:
> >> +    description: DCMI minimum CPUs frequency requirement (in KHz).
> >> +    allOf:
> >> +      - $ref: /schemas/types.yaml#/definitions/uint32
> >> +      - minimum: 0
> >> +      - default: 0
> > I think this is questionable to be in DT and if it is, it's something
> > that's hardly specific to ST or this block. IIRC, we already have a way
> > to specify minimum OPPs.
> This binding is only needed on some STM32 SoC when DVFS is activated
> with low frequency setting in opp. The value also depends of the targeted
> video format and framerate.

As those 2 things are not in the DT, then neither should this value be.

> It is not an opp because it doesn't define a voltage-current-frequency
> combination
> but only set a minimum target for the CPUs frequency to guaranty a good
> reaction
> time when handling IRQs for the sensor.

OPPs can be frequency only. This is pretty clearly defining the CPU
must Operate at a certain minimum Performance Point.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
