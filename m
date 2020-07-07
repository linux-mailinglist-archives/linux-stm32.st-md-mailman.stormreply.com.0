Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F2BEB21773A
	for <lists+linux-stm32@lfdr.de>; Tue,  7 Jul 2020 20:55:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A6597C36B2A;
	Tue,  7 Jul 2020 18:55:17 +0000 (UTC)
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com
 [209.85.218.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7AAB2C36B27
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Jul 2020 18:55:16 +0000 (UTC)
Received: by mail-ej1-f66.google.com with SMTP id l12so47698085ejn.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 07 Jul 2020 11:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RMd8tTCfjNB1oolYgjCGnbvueA8plaMd/4ysVp4hew8=;
 b=MSqOBX8iZf3N6uIy8Wnm5L4m29/XEr8WCDGWKf500fbPsnl0xzYC6LVlONOf42h0CR
 I4Rd/idVHgRuoGFtY+arKp+gSn5l1NRpVZPWVHS7fUt71j1qB3v2jBGggVQKiUaXawDQ
 qNM+I9ABuRJwyg5qaqOAP2v7E/mgtgDyAf07ig2saLp6YrXGZCFFphghvpbv74afVMS8
 hgukBbVyPl5VtFibxfDALfdkB8feg3dsrXD3cpQ8FTKR3WiUU7+WwLET7Fw8fB0Y9Ntx
 fJHk1hgmFv1SXz42n9wzYn1nyBLlwu2BiOkVLXgOydApO9SPolevYiuOnuXVadp33hpE
 sucw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RMd8tTCfjNB1oolYgjCGnbvueA8plaMd/4ysVp4hew8=;
 b=UhaXRvxWa8oBoXKRydm4bLadenn1aTrlwJSRD2+5oQqB6wLlxjC2XsXLWUnaKDSWb9
 glSDtht4W8hlY451d/LvCnKc7jX45uNZbE38FSaGHtUSdpQJJ5J8qcb0QA9foDozpaOR
 Ya7o9k7BEJVirEhSERWzJW93zKd3WRC9oFxuvyU+sCIgfx5trQADarwdTbbPVWBb08Tb
 /XyQtRKr6LLXkV+WOugXgInrfouJPkTCvJ40eUQ28LMBhBzMw+tVsAUt2MzQqwaqMLei
 jO7n/i/1B6JPWpVNVvgYPJlfbjd7bmyMql4DoUY0I4ZyAw43dT278cRGz1wI51O77/Kx
 ojqA==
X-Gm-Message-State: AOAM530j7HXP5zX4JMHylKMf0qJI1OLRwqOIErf16ZqAAFa4zaeIv3qL
 cxkibqQ8yQxQptzC0ngLBGIefceqK+yRrDugTBE=
X-Google-Smtp-Source: ABdhPJyGaJyOnxq0gk8ybfmAthcx/e6Mw+KIY+a9E8de0FSUviN2dLI02eWmz8T4W3gH7eX3EhiPg+3nhWg5mmVWaSQ=
X-Received: by 2002:a17:906:2287:: with SMTP id
 p7mr49705831eja.537.1594148115920; 
 Tue, 07 Jul 2020 11:55:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200616140717.28465-2-amelie.delaunay@st.com>
 <20200704174219.612060-1-martin.blumenstingl@googlemail.com>
 <05a81997-5ddb-ea81-7a89-8078b8a2b610@st.com>
In-Reply-To: <05a81997-5ddb-ea81-7a89-8078b8a2b610@st.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 7 Jul 2020 20:55:05 +0200
Message-ID: <CAFBinCCVYJ=DuKbqhJJ8463Gs+GW0bgxyXSFiLXhUfvWV6AR0Q@mail.gmail.com>
To: Amelie DELAUNAY <amelie.delaunay@st.com>
Cc: "balbi@kernel.org" <balbi@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "hminas@synopsys.com" <hminas@synopsys.com>,
 Fabrice GASNIER <fabrice.gasnier@st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 1/3] usb: dwc2: override PHY input signals
 with usb role switch support
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

Hi Amelie,

On Tue, Jul 7, 2020 at 6:13 PM Amelie DELAUNAY <amelie.delaunay@st.com> wrote:
>
> Hi Martin,
>
> On 7/4/20 7:42 PM, Martin Blumenstingl wrote:
> > Hello Amelie,
> >
> > thank you for this patch - I am hoping that it will help us on Amlogic
> > Meson8, Meson8b, Meson8m2 and GXBB SoCs as well.
> > On these SoCs the ID detection is performed by the PHY IP and needs to
> > be polled.
> > I think usb_role_switch is the perfect framework for this on dwc2 side.
> > For the PHY driver I'm going to implement the cable state using the
> > extcon framework and then having a new usb-conn-extcon driver. This is
> > just to give you an overview why I'm interested in this.
> >
>
> I'm wondering, why use extcon framework and not the usb role switch API
> ? This patch on dwc2 is tested on STM32MP157C-DK2 board with STUSB160x
> Type-C controller driver recently pushed with usb role switch. You can
> have a look here https://lore.kernel.org/patchwork/patch/1256238/.
one of the boards that I'm working on is for example the Odroid-C1. It
has a Micro-USB port and there's no Type-C controller present.

in the next few days I'll try to send my idea as RFC, but this is the
.dts I've come up with so far:
&usb0 {
    dr_mode = "otg";
    usb-role-switch;

    connector {
        compatible = "extcon-usb-b-connector", "usb-b-connector";
        type = "micro";
        extcon = <&usb0_phy>;
        vbus-supply = <&usb_vbus>;
    };
};

I did this for two reasons:
1. I think the PHY is not a connector and thus it's driver shouldn't
implement any connector specific logic (managing VBUS)
2. without the connector there would be a circular dependency: the USB
controller needs the PHY to initialize but the PHY would need the USB
controller so it can manage the role switch

(or in other words: the connector replaces the Type-C controller in this case)

> > [...]
> >> +static int dwc2_drd_role_sw_set(struct usb_role_switch *sw, enum usb_role role)
> >> +{
> >> +     struct dwc2_hsotg *hsotg = usb_role_switch_get_drvdata(sw);
> >> +     unsigned long flags;
> >> +
> >> +     /* Skip session not in line with dr_mode */
> >> +     if ((role == USB_ROLE_DEVICE && hsotg->dr_mode == USB_DR_MODE_HOST) ||
> >> +         (role == USB_ROLE_HOST && hsotg->dr_mode == USB_DR_MODE_PERIPHERAL))
> >> +             return -EINVAL;
> >> +
> >> +     /* Skip session if core is in test mode */
> >> +     if (role == USB_ROLE_NONE && hsotg->test_mode) {
> >> +             dev_dbg(hsotg->dev, "Core is in test mode\n");
> >> +             return -EBUSY;
> >> +     }
> >> +
> >> +     spin_lock_irqsave(&hsotg->lock, flags);
> > due to this spin_lock_irqsave() ...
> >
> >> +     if (role == USB_ROLE_HOST) {
> >> +             if (dwc2_ovr_avalid(hsotg, true))
> >> +                     goto unlock;
> >> +
> >> +             if (hsotg->dr_mode == USB_DR_MODE_OTG)
> >> +                     /*
> >> +                      * This will raise a Connector ID Status Change
> >> +                      * Interrupt - connID A
> >> +                      */
> >> +                     dwc2_force_mode(hsotg, true);
> > ... we cannot sleep in here. the call flow is:
> > dwc2_drd_role_sw_set
> >    spin_lock_irqsave
> >    dwc2_force_mode
> >      dwc2_wait_for_mode
> >        usleep_range
> >
>
> In fact, with the avalid or bvalid overriding + the debounce filter
> bypass, GINTSTS_CURMOD is already in the expected mode, so that we exit
> the loop directly, without running into usleep_range.
on my Amlogic SoC this is not the case:
The kernel complains because of that usleep_range from within the
spinlock context

Please let me know if/how I can help debug this.

[...]
> > +int dwc2_drd_init(struct dwc2_hsotg *hsotg)
> > +{
> > +       struct usb_role_switch_desc role_sw_desc = {0};
> > +       struct usb_role_switch *role_sw;
> > +       int ret;
> > +
> > +       if (!device_property_read_bool(hsotg->dev, "usb-role-switch"))
> > +               return 0;
> > should we also return early here if dr_mode != "otg"?
> >
>
> No, because when VBUS is not connected to the controller, you also need
> to get the usb_role_none from the usb-role-switch to catch the
> unattached state (also in Peripheral or Host only mode).
I see - thank you for the explanation!


Best regards,
Martin
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
