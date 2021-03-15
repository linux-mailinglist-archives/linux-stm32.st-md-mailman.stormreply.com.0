Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FCA133C9C0
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Mar 2021 00:11:43 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 29B6DC57B55;
	Mon, 15 Mar 2021 23:11:43 +0000 (UTC)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com
 [209.85.166.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7F792C5662E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Mar 2021 23:11:41 +0000 (UTC)
Received: by mail-il1-f179.google.com with SMTP id h18so11002215ils.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Mar 2021 16:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OWwHR8Ne423+zbtI1q+8mLttBfXbDb6VslhtXcXanQg=;
 b=tDmV3Clxxrt5CYW6RR5YvvuFRnN750yidjGLYegOB42Ae9zwMhBjB8qjfA173QHAlG
 oAWC+SYJO1hS9ifiZSDX1U/sGOQyigND3hHv1grdytMkoojG5raNQxL+9HUwT8RXSxG5
 asX49ilTHb6G06bDtHYtIwSjlpYCbnTABKe5yHIEm0h6g3ojlhxqhL/N/XeIsyXy0zPW
 dWpvNMJRikRoHV1IjjcsOPy404NrmT5eMpPXTQ24R2ibgtXXbLBzX2E7xLn4hSne7pu9
 K3Rr8c7Ky8R3vo28DEHiwdx5ppLMUJ61kCV1q/KGy1Ek/yPqrxVJh2vOtr0Ou014TA9B
 AwGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OWwHR8Ne423+zbtI1q+8mLttBfXbDb6VslhtXcXanQg=;
 b=dXKYpq0pgDItNWcPwf/i3LLH7rvlU4z2xL1OF6G/tekppkMePiH0A+H2Olfs86+dSX
 BLk0myKH9BjUQo+mrFQN5iGAPdOfJeBILLnmUKraxt8iaI0TVOwv4KCRVCwi919019eB
 Q043QVCjRBBk9Typqi+yZ5cTMrriZNG7JjcAw7ocjF7jIqYq9T3Vra5rMkYUoD17IJ+1
 PFOoNguC5j2GbY0Marto2VWHl6C8jOAc4mi604POgKpa2jNosI6A4KuP+UXH6x7H0qLj
 NpcQijSIoIok6i64HAVURq2wIL8s8JIfjdNHFjXy2bRqxlx2CZ1DbPzaxyIVFHOYMtx0
 eCNw==
X-Gm-Message-State: AOAM533pDggsrFpohXAhArJGHrVOkO1WYCV1yu3X8fGXmZ4tYFrtnShB
 op4Ue2N4LU4WASyEYNAqUzA669xWIL5jmLDqCAE=
X-Google-Smtp-Source: ABdhPJyIMGxVLSY13hI+sOxMMBbHkVYSuVizx6fGRZmxlv5OglFxTSdwX1GBMv9JMdlw2kMfPpdh3pViASu367w3Gpc=
X-Received: by 2002:a05:6e02:dcd:: with SMTP id
 l13mr1430957ilj.271.1615849900503; 
 Mon, 15 Mar 2021 16:11:40 -0700 (PDT)
MIME-Version: 1.0
References: <1615801436-3016-1-git-send-email-dillon.minfei@gmail.com>
 <1615801436-3016-4-git-send-email-dillon.minfei@gmail.com>
 <20210315162648.GB981570@robh.at.kernel.org>
In-Reply-To: <20210315162648.GB981570@robh.at.kernel.org>
From: dillon min <dillon.minfei@gmail.com>
Date: Mon, 15 Mar 2021 23:11:04 +0800
Message-ID: <CAL9mu0+T++RotJt_ayPDFmbxjLL6G20FzR0aQ2FMjn6Dz0qaFw@mail.gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Vladimir Murzin <vladimir.murzin@arm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre TORGUE <alexandre.torgue@foss.st.com>, gregkh@linuxfoundation.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux@armlinux.org.uk, Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-serial@vger.kernel.org,
 afzal.mohd.ma@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 erwan.leray@st.com, Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [Linux-stm32] [PATCH v3 3/9] dt-bindings: pinctrl: stm32: Add
	stm32h750 pinctrl
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

On Tue, Mar 16, 2021 at 12:26 AM Rob Herring <robh@kernel.org> wrote:
>
> On Mon, 15 Mar 2021 17:43:50 +0800, dillon.minfei@gmail.com wrote:
> > From: dillon min <dillon.minfei@gmail.com>
> >
> > This patch intend to add pinctrl configuration support for
> > stm32h750 value line
> >
> > The datasheet of stm32h750 value line can be found at:
> > https://www.st.com/resource/en/datasheet/stm32h750ib.pdf
> >
> > Signed-off-by: dillon min <dillon.minfei@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> >
>
>
> Please add Acked-by/Reviewed-by tags when posting new versions. However,
> there's no need to repost patches *only* to add the tags. The upstream
> maintainer will do that for acks received on the version they apply.
>
> If a tag was not added on purpose, please state why and what changed.
>
Sorry for that, i forgot to remove patch 3 from v2/v3 theris, there are no
changes in v2/v3. please just ignore it , thanks.

Dillon,
Best Regards.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
