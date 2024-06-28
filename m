Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A15591C0CE
	for <lists+linux-stm32@lfdr.de>; Fri, 28 Jun 2024 16:25:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D6EE1C6DD9F;
	Fri, 28 Jun 2024 14:25:40 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com
 [209.85.128.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ED86FCFAC50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Jun 2024 14:25:32 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-64a6bf15db9so6431527b3.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Jun 2024 07:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719584732; x=1720189532;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wrEi/WACEa6FBCLeXGH4a1qm/TO6DqKPmGGcMFyn4W0=;
 b=xqnR0YRaueYFTX9U46EeSf3XVfN8+Bx9bdiL3OxOYX19+ktiFIRj+560vJYOLv4Gwx
 E3cxpoqaXEyKSoZvEMMdsqXSnRG2Lc0BBzizcNqRroaRw/At200hOU6c3x7oX/HwkOGD
 ezylwL460JKQmcnSCo911bjkNf1khMgX0SJCYdjwagrHNoRfyaIwNWavQNF99TdER17I
 bMeTiozV7Qlvg3f1/ozRtBgk3sOvhLQVIy/6OQyOuJTI7z2KdQ5+qbSq68qGgFMBtCJG
 BIFqoiSF4Ynl01ZlsVSUZV6J+S48uRYosPyGISV/nOXNXMdNwDzDQEhOpm4XbL86w2Rw
 yq1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719584732; x=1720189532;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wrEi/WACEa6FBCLeXGH4a1qm/TO6DqKPmGGcMFyn4W0=;
 b=TQ8j3KEqQyMrLoxslX6yhfyPDs8cTYZpu71v2HpwE3mxRC1XfhpdTO8ILR3l5EfThG
 8VRKnLCuMLM2iOWq4Ropo45fdpnJRD5+bAVWebRzzpECxf7KybMNHJG++d0MjEydQKAE
 vHqdWavo/q0NL8MEQ3lZxAodLWv59vx/6uWIFylDi7w9Gk7MkLCt8+oEBNkgmGvhc12t
 S3hRLzCQ6jeEgpkz+AYQOIJARdJJv6zoz3SxcH0hGG8OHw4J0yYmcbSswf5AVztASvrU
 4rmk855twZ/uW72Xdex7rPBhRuzGoTZ5X638EREmqHLj1KQjaPbOMmVszloEaIxFjgLt
 bG0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhyMJkgmOfGQ4GSOSpRYklYh+vf4+aE8QwKpgcgrD+1q+Qyl+04OXIFbhWtJMzUVEYZ4hMcdbRK/dQz/bj5b2EcjxsXmPvrM4G3Jd5lrKzwRQ1po5CplSI
X-Gm-Message-State: AOJu0YzWt1o7phrFHYC5rD8chu2N6xoJzrLJGfkGbMCkAW53LvwC/ULp
 /BGfJQ3H2JMoOMdcqaw0AweAoWFyjeqX3wCblks860VSOz6zPYCkHJDAr93OyGJn11Lt+7DA5jd
 2kZFssySyPQqVEIuM4A1DZFLsVkO8oTZZW6m/lw==
X-Google-Smtp-Source: AGHT+IGj8wVl5pbaPJkk0Ot2oWBFmKObQZKDXj4G/2axlfG0NZXI9SrYjaAq5/esf9Gfy7A4E0YOFo/bQa5SOx4UVLE=
X-Received: by 2002:a81:8444:0:b0:64b:5cc7:bcbc with SMTP id
 00721157ae682-64b5cc7c0f9mr11323487b3.32.1719584731747; Fri, 28 Jun 2024
 07:25:31 -0700 (PDT)
MIME-Version: 1.0
References: <20240627-ucsi-rework-interface-v4-0-289ddc6874c7@linaro.org>
 <2024062717-foster-document-eb2f@gregkh>
 <CAA8EJprAshnt3YchBv0ssi4Vet9b6oMcf3z8nuRkoZVYNBq64w@mail.gmail.com>
 <CAA8EJpqCJ8_wOO7yLYA85KYtbLO6hvS-yb7DA6kJ2sH4QH43QA@mail.gmail.com>
 <2024062825-balancing-resigned-e383@gregkh>
In-Reply-To: <2024062825-balancing-resigned-e383@gregkh>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 28 Jun 2024 17:25:17 +0300
Message-ID: <CAA8EJprsJLMTnd9epLR4Uc02Vg2veW1mpqFxxL=rHU9DtJ8UqQ@mail.gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Nikita Travkin <nikita@trvn.ru>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 0/7] usb: typec: ucsi: rework glue
	driver interface
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

On Fri, 28 Jun 2024 at 17:24, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Thu, Jun 27, 2024 at 06:08:07PM +0300, Dmitry Baryshkov wrote:
> > On Thu, 27 Jun 2024 at 17:57, Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> > >
> > > On Thu, 27 Jun 2024 at 17:54, Greg Kroah-Hartman
> > > <gregkh@linuxfoundation.org> wrote:
> > > >
> > > > On Thu, Jun 27, 2024 at 05:44:39PM +0300, Dmitry Baryshkov wrote:
> > > > > The interface between UCSI and the glue driver is very low-level. It
> > > > > allows reading the UCSI data from any offset (but in reality the UCSI
> > > > > driver reads only VERSION, CCI an MESSAGE_IN data). All event handling
> > > > > is to be done by the glue driver (which already resulted in several
> > > > > similar-but-slightly different implementations). It leaves no place to
> > > > > optimize the write-read-read sequence for the command execution (which
> > > > > might be beneficial for some of the drivers), etc.
> > > > >
> > > > > The patchseries attempts to restructure the UCSI glue driver interface
> > > > > in order to provide sensible operations instead of a low-level read /
> > > > > write calls.
> > > > >
> > > > > If this approach is found to be acceptable, I plan to further rework the
> > > > > command interface, moving reading CCI and MESSAGE_IN to the common
> > > > > control code, which should simplify driver's implementation and remove
> > > > > necessity to split quirks between sync_control and read_message_in e.g.
> > > > > as implemented in the ucsi_ccg.c.
> > > > >
> > > > > Note, the series was tested only on the ucsi_glink platforms. Further
> > > > > testing is appreciated.
> > > > >
> > > > > Depends: [1], [2]
> > > > >
> > > > > [1] https://lore.kernel.org/linux-usb/20240612124656.2305603-1-fabrice.gasnier@foss.st.com/
> > > > >
> > > > > [2] https://lore.kernel.org/linux-usb/20240621-ucsi-yoga-ec-driver-v8-1-e03f3536b8c6@linaro.org/
> > > > >
> > > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > ---
> > > > > Changes in v4:
> > > > > - Rebased on top of Greg's tree to resolve conflicts.
> > > >
> > > > Nope, still got conflicts, are you sure you updated properly?  Patch 1
> > > > applied, but #2 did not.
> > >
> > > I feel stupid enough now. I rebased on top of usb-next instead of
> > > usb-testing. Let me spam it once again
> >
> > Hmm, I see what happened. I had a next+usb-next. Simple usb-next
> > doesn't contain changes from 9e3caa9dd51b ("usb: typec: ucsi_acpi: Add
> > LG Gram quirk") which this patch also modifies. I can rebase it on top
> > of your tree, but then we will have build issues once usb-linus and
> > usb-next get merged together.
>
> Ah, you need/want stuff from both branches, right?  Then just wait until
> next week when my -linus branch will be in Linus's tree and then I will
> merge that into the -next branch.

Ack. Maybe I'll post another iteration based on the discussion on the
mailing list.

-- 
With best wishes
Dmitry

On Fri, 28 Jun 2024 at 17:24, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Thu, Jun 27, 2024 at 06:08:07PM +0300, Dmitry Baryshkov wrote:
> > On Thu, 27 Jun 2024 at 17:57, Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> > >
> > > On Thu, 27 Jun 2024 at 17:54, Greg Kroah-Hartman
> > > <gregkh@linuxfoundation.org> wrote:
> > > >
> > > > On Thu, Jun 27, 2024 at 05:44:39PM +0300, Dmitry Baryshkov wrote:
> > > > > The interface between UCSI and the glue driver is very low-level. It
> > > > > allows reading the UCSI data from any offset (but in reality the UCSI
> > > > > driver reads only VERSION, CCI an MESSAGE_IN data). All event handling
> > > > > is to be done by the glue driver (which already resulted in several
> > > > > similar-but-slightly different implementations). It leaves no place to
> > > > > optimize the write-read-read sequence for the command execution (which
> > > > > might be beneficial for some of the drivers), etc.
> > > > >
> > > > > The patchseries attempts to restructure the UCSI glue driver interface
> > > > > in order to provide sensible operations instead of a low-level read /
> > > > > write calls.
> > > > >
> > > > > If this approach is found to be acceptable, I plan to further rework the
> > > > > command interface, moving reading CCI and MESSAGE_IN to the common
> > > > > control code, which should simplify driver's implementation and remove
> > > > > necessity to split quirks between sync_control and read_message_in e.g.
> > > > > as implemented in the ucsi_ccg.c.
> > > > >
> > > > > Note, the series was tested only on the ucsi_glink platforms. Further
> > > > > testing is appreciated.
> > > > >
> > > > > Depends: [1], [2]
> > > > >
> > > > > [1] https://lore.kernel.org/linux-usb/20240612124656.2305603-1-fabrice.gasnier@foss.st.com/
> > > > >
> > > > > [2] https://lore.kernel.org/linux-usb/20240621-ucsi-yoga-ec-driver-v8-1-e03f3536b8c6@linaro.org/
> > > > >
> > > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > ---
> > > > > Changes in v4:
> > > > > - Rebased on top of Greg's tree to resolve conflicts.
> > > >
> > > > Nope, still got conflicts, are you sure you updated properly?  Patch 1
> > > > applied, but #2 did not.
> > >
> > > I feel stupid enough now. I rebased on top of usb-next instead of
> > > usb-testing. Let me spam it once again
> >
> > Hmm, I see what happened. I had a next+usb-next. Simple usb-next
> > doesn't contain changes from 9e3caa9dd51b ("usb: typec: ucsi_acpi: Add
> > LG Gram quirk") which this patch also modifies. I can rebase it on top
> > of your tree, but then we will have build issues once usb-linus and
> > usb-next get merged together.
>
> Ah, you need/want stuff from both branches, right?  Then just wait until
> next week when my -linus branch will be in Linus's tree and then I will
> merge that into the -next branch.
>
> thanks,
>
> greg k-h



-- 
With best wishes
Dmitry
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
