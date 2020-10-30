Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E049C2A07DB
	for <lists+linux-stm32@lfdr.de>; Fri, 30 Oct 2020 15:29:45 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9E2B4C3FADA;
	Fri, 30 Oct 2020 14:29:45 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 564A6C36B37
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Oct 2020 14:29:42 +0000 (UTC)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com
 [209.85.210.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7835F22227
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Oct 2020 14:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604068180;
 bh=qsVa9k8Wl+Z5KQVAZGKVs8j/WHBtdKWOwbQHwlaXnRc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=H2o5OIpvKRvgunRH6E0WYQATf6zc80v399OGJni4pBAW6X8PL8/YNpOrsFsh+EhOH
 159RRw5uFVd1fVtpfX3Vqz8HuwG956KTbcndJoXviYKTdHp9EGJpJgi8Fm4SazNLhQ
 h2ScfQIDKTSvSjK2+fq4e7anR3oaaOhUSq6dQKN4=
Received: by mail-ot1-f43.google.com with SMTP id f37so5675999otf.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Oct 2020 07:29:40 -0700 (PDT)
X-Gm-Message-State: AOAM531A6ztbo01xN2IyUZIaSqkWVrqLwTWSGGK+kV0dNCNHGEUVnq09
 2d8ySTEPYuMLUiab8mF+iTeq2qXoncCbLoNJ+A==
X-Google-Smtp-Source: ABdhPJzIDz1vHsjd0mZx2C3VuQDbrssjCTAGOiEKtovrg3KUWMEdfsM/44ZPa+xsp7OFwsxVn7kbaTkBxgcv3W618P4=
X-Received: by 2002:a9d:62d1:: with SMTP id z17mr1963470otk.192.1604068179674; 
 Fri, 30 Oct 2020 07:29:39 -0700 (PDT)
MIME-Version: 1.0
References: <20201029095806.10648-1-amelie.delaunay@st.com>
 <20201029095806.10648-2-amelie.delaunay@st.com>
 <20201029154016.GA1917373@bogus>
 <860d5620-4fdf-6e01-9a04-3967d6fcfd6b@st.com>
In-Reply-To: <860d5620-4fdf-6e01-9a04-3967d6fcfd6b@st.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 30 Oct 2020 09:29:28 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKs-Po8BdShjQNDNPjNWBCD3FSPdq4KbQGx3=VnV+3nPw@mail.gmail.com>
Message-ID: <CAL_JsqKs-Po8BdShjQNDNPjNWBCD3FSPdq4KbQGx3=VnV+3nPw@mail.gmail.com>
To: Amelie DELAUNAY <amelie.delaunay@st.com>
Cc: devicetree@vger.kernel.org,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux USB List <linux-usb@vger.kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [RESEND PATCH v3 1/4] dt-bindings: connector: add
 power-opmode optional property to usb-connector
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

On Thu, Oct 29, 2020 at 11:49 AM Amelie DELAUNAY <amelie.delaunay@st.com> wrote:
>
>
>
> On 10/29/20 4:40 PM, Rob Herring wrote:
> > On Thu, Oct 29, 2020 at 10:58:03AM +0100, Amelie Delaunay wrote:
> >> Power operation mode may depends on hardware design, so, add the optional
> >> property power-opmode for usb-c connector to select the power operation
> >> mode capability.
> >>
> >> Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
> >> ---
> >>   .../bindings/connector/usb-connector.yaml      | 18 ++++++++++++++++++
> >>   1 file changed, 18 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/connector/usb-connector.yaml b/Documentation/devicetree/bindings/connector/usb-connector.yaml
> >> index 728f82db073d..200d19c60fd5 100644
> >> --- a/Documentation/devicetree/bindings/connector/usb-connector.yaml
> >> +++ b/Documentation/devicetree/bindings/connector/usb-connector.yaml
> >> @@ -93,6 +93,24 @@ properties:
> >>         - device
> >>         - dual
> >>
> >> +  power-opmode:
> >
> > I've acked this version:
> >
> > https://lore.kernel.org/r/20201020093627.256885-2-badhri@google.com
> >
>
> frs is used for Fast Role Swap defined in USB PD spec.
> I understand it allows to get the same information but I'm wondering why
> the property name is limited to -frs- in this case. What about a
> non-power delivery USB-C connector ?

I've got no idea. The folks that know USB-C and PD details need to get
together and work all this out. To me, it looks like the same thing...

And it's not just this, but the stream of USB-C additions that trickle in.

> Moreover, power-opmode property support is already merged in typec class:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/usb/typec/class.c?h=v5.10-rc1&id=12f3467b0d28369d3add7a0deb65fdac9b503c90
> and stusb160x driver uses it :(
>
> So, do I need to modify stusb160x driver (and bindings) to take into
> account this USB PD specific property?

If not documented, then it's not an ABI, so yes.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
