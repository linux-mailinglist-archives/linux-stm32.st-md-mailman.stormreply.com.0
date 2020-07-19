Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC7B2253D3
	for <lists+linux-stm32@lfdr.de>; Sun, 19 Jul 2020 21:56:41 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7CF52C36B2A;
	Sun, 19 Jul 2020 19:56:40 +0000 (UTC)
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com
 [209.85.218.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 030A9C36B27
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Jul 2020 19:56:38 +0000 (UTC)
Received: by mail-ej1-f66.google.com with SMTP id f12so15964099eja.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Jul 2020 12:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UkvPwVZQWgoIN1YiUvn+3mkMTZrdb6lXgiYZt8Sccuk=;
 b=o/oSAcfUJWlBQjWyMztERWI8MDMmAtF1ufgmyl9EibnFkKRCLjLJ0YWUBr+t4lHrje
 3JuoxxSFyL8YQwtaRqSzR52OTcsv1DL09gIMcvt76YwFYmsjadCx7fUt6e3wvZhgA5Pj
 U2Q2AiwA8slQl0845vGlS/sZ6jaSWXyeqldkFj9kCN25aLH8J/zdE4AdTbhr1BqodAc3
 G5elYV5C5Vd1DFpHJwV5cUNIHYSBBZGiHC/9pzfpZNLGA7uYFv5o+drLvubkOnI3opdk
 9p9fK9Uf1sqv0qVc7GeDJEsVt1j9LUYa2Vt82kCV2/nWYP9WZz2CmoSq9e8xDw05RDT7
 Ogig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UkvPwVZQWgoIN1YiUvn+3mkMTZrdb6lXgiYZt8Sccuk=;
 b=UT5P4oigxbnQobGUoZjDEu8NDg5LGS1FNt5kbifY5hgI2XCswWOi968QVQ7y8UmVbe
 uIAeM0mJx5GTju5BkIgBzelICQ4aAIAGgINF0AV5PXcq5X2MvwqoHXoFb6e7pUqpE7gg
 Pz5Twi21k/F3Ptt+FGX+A2Jjd5nAN0R/6CNSbBABFI51Vux2FHq52axKJCqRha1sqBKf
 JhgxzqI63EYyzlmELf05rzdyrN519xMZzP7s7wzoXja8SITMWWweXI6uoIqoYcwxi3Qf
 gn5ygSrkZo46gI6WO23jSwa8/K8yet3pTar9FoD8S9ZE0hGz8cdcnsnG3UhAHTBSSl4M
 ai2Q==
X-Gm-Message-State: AOAM531mD60nQfF+ICeQ+dO6j0P3dNLL0aJ80CQ4VQMoID3kSFBtfeCa
 3GqBqpPhsob/7Ih1ZHv81hNXS9uN3mdLjkJaWbs=
X-Google-Smtp-Source: ABdhPJyGNKE6IUTHOPmFmEyDoa7JuyZ+ziIL1QORMAJVC3zY1tBNeKPzbnMPk4bE3NtaqwOlMnSddTSskQ4hGBVYfpc=
X-Received: by 2002:a17:906:dbe5:: with SMTP id
 yd5mr18079240ejb.328.1595188598479; 
 Sun, 19 Jul 2020 12:56:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200616140717.28465-2-amelie.delaunay@st.com>
 <20200704174219.612060-1-martin.blumenstingl@googlemail.com>
 <05a81997-5ddb-ea81-7a89-8078b8a2b610@st.com>
 <CAFBinCCVYJ=DuKbqhJJ8463Gs+GW0bgxyXSFiLXhUfvWV6AR0Q@mail.gmail.com>
 <ee4ee889-835e-2244-504c-2b1b605d78aa@st.com>
In-Reply-To: <ee4ee889-835e-2244-504c-2b1b605d78aa@st.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 19 Jul 2020 21:56:27 +0200
Message-ID: <CAFBinCDUxvovAyDywz3xVcu_1v4nai+ebR2D38U2B8oBGss=yg@mail.gmail.com>
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

Hello Amelie,

sorry for the late reply

On Wed, Jul 8, 2020 at 6:00 PM Amelie DELAUNAY <amelie.delaunay@st.com> wrote:
[...]
> Could you please test with:
>
> static int dwc2_drd_role_sw_set(struct device *dev, enum usb_role role)
> {
>         struct dwc2_hsotg *hsotg = dev_get_drvdata(dev);
>         unsigned long flags;
>         int already = 0;
>
>         /* Skip session not in line with dr_mode */
>         if ((role == USB_ROLE_DEVICE && hsotg->dr_mode == USB_DR_MODE_HOST) ||
>             (role == USB_ROLE_HOST && hsotg->dr_mode == USB_DR_MODE_PERIPHERAL))
>                 return -EINVAL;
>
>         /* Skip session if core is in test mode */
>         if (role == USB_ROLE_NONE && hsotg->test_mode) {
>                 dev_dbg(hsotg->dev, "Core is in test mode\n");
>                 return -EBUSY;
>         }
>
>         spin_lock_irqsave(&hsotg->lock, flags);
>
>         if (role == USB_ROLE_HOST) {
>                 already = dwc2_ovr_avalid(hsotg, true);
>         } else if (role == USB_ROLE_DEVICE) {
>                 already = dwc2_ovr_bvalid(hsotg, true);
>                 /* This clear DCTL.SFTDISCON bit */
>                 dwc2_hsotg_core_connect(hsotg);
>         } else {
>                 if (dwc2_is_device_mode(hsotg)) {
>                     if (!dwc2_ovr_bvalid(hsotg, false))
>                         /* This set DCTL.SFTDISCON bit */
>                         dwc2_hsotg_core_disconnect(hsotg);
>                 } else {
>                         dwc2_ovr_avalid(hsotg, false);
>                 }
>         }
>
>         spin_unlock_irqrestore(&hsotg->lock, flags);
>
>         if (!already &&
>             role != USB_ROLE_NONE && hsotg->dr_mode == USB_DR_MODE_OTG)
>                 /* This will raise a Connector ID Status Change Interrupt */
>                 dwc2_force_mode(hsotg, role == USB_ROLE_HOST);
>
>         dev_dbg(hsotg->dev, "%s-session valid\n",
>                 role == USB_ROLE_NONE ? "No" :
>                 role == USB_ROLE_HOST ? "A" : "B");
>
>         return 0;
> }
>
>
> dwc2_force_mode is called outside the spin_lock_irqsave so the kernel
> should not complain. I've tested on my setup and the behavior seems the
> same.
this one is looking good - the previous kernel warnings are now gone!
thank you very much


Best regards,
Martin
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
