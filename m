Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C81691AA89
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jun 2024 17:08:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 219C0C71280;
	Thu, 27 Jun 2024 15:08:38 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0F464C6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jun 2024 15:08:30 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-1f8395a530dso61939235ad.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jun 2024 08:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719500908; x=1720105708;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XlBk62eLW/kjgbzF1XN/AbvScYXzLgjXOoZnGiz7y1U=;
 b=xyH+hAc9oJBaBllsw4RraisoNX6J4GapAfUlhYo3KEBlBuKSP51eBXm33g9zq7r/5J
 M898WL8qF1K0+cFh+TKwWid+G/H0QbB/irYFDKdLimMUpdQXuPu8m6/IyOtY3UKglmTn
 +d63Bm7aS1GsxhIZt5rmyJvO+/yMjPnvNFtVcVlKbfZMEs/vKjvRycJ0bpGneJHtNGZP
 zQ5KAYaheZ+w/Se/LSgeaM8Ht5HDRFbEkQmd3oLpLuspKJnqwy/9hm7YjEaQzE/WfUC/
 UNLOcTwzbT4sSOeDBI8qadlUt4SXglq3hpm2P7gT0NDOpSIrDj40JR3kIQ0FI1/JO+UP
 9CyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719500908; x=1720105708;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XlBk62eLW/kjgbzF1XN/AbvScYXzLgjXOoZnGiz7y1U=;
 b=N76+ecwcg2HiD4/UHhgTzpXShwsFTEgA6ibqiP3PjX8S2sZ92iuy5vHBlJqeUfFscO
 hzX8Kq1E6B3jGFP9G0pRocwL/6oZWEOCwe2A9WE/KsZYIu2ZtbpTjsNX4mHPzPaShy4T
 Qf7nE7wzeHPRy+aAQipvCqRHL1ZZs8LbGAjkRV2kZNRb2nKUpbZD5euAYzckt0ahcWB+
 Yk21q7sBNNZfxdhNu5rZvoUMw3/pDjS4bMBa/QlgX7z/eri8RXvtCqF6YkkcUqW+Tejt
 S+/AnKdvlFA0Sqk69mM6/vtADv8M4ykHYCg5svz85b25ZEF0lfWT8BXknV/yn+mmpMBV
 ZLBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2BwojjOLhHgj6cjIcFEop221G5ZklhK0MZXX+r9XYmF5eIrY5QbmMqbzfjuuq4C8xV03nwcrfTWoC1MmzJ/VXls/RPsp3W0DMYeWzbHiWNLqHLko9NO6S
X-Gm-Message-State: AOJu0YwKRRhirW6fT42NjqcWvNJ85WjWEO+z0pbF0ovBE+zChY+fGaBj
 +j2uvRzuW4ogg+4Q+GQqir1SKvBB4/JdYDBCkU2Q5fg3X4mxll1IVN6lc1ZLn+6xNlbL+14V07P
 Aoy1KkfJP2MK+bqm3AZSRM4KIpvtT3jx6+P+cRQ==
X-Google-Smtp-Source: AGHT+IG4sxRssQrE3KkksvhzRPbEUpTAN4nLG0tK43Z2W0D0F/3wbeXfMrrZPwet93SF8QRD3aOVYoHaL5scRO2bhuk=
X-Received: by 2002:a17:902:c943:b0:1fa:ab4a:faf7 with SMTP id
 d9443c01a7336-1faab4afe50mr20966755ad.11.1719500908478; Thu, 27 Jun 2024
 08:08:28 -0700 (PDT)
MIME-Version: 1.0
References: <20240627-ucsi-rework-interface-v4-0-289ddc6874c7@linaro.org>
 <2024062717-foster-document-eb2f@gregkh>
 <CAA8EJprAshnt3YchBv0ssi4Vet9b6oMcf3z8nuRkoZVYNBq64w@mail.gmail.com>
In-Reply-To: <CAA8EJprAshnt3YchBv0ssi4Vet9b6oMcf3z8nuRkoZVYNBq64w@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 27 Jun 2024 18:08:07 +0300
Message-ID: <CAA8EJpqCJ8_wOO7yLYA85KYtbLO6hvS-yb7DA6kJ2sH4QH43QA@mail.gmail.com>
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

On Thu, 27 Jun 2024 at 17:57, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Thu, 27 Jun 2024 at 17:54, Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Thu, Jun 27, 2024 at 05:44:39PM +0300, Dmitry Baryshkov wrote:
> > > The interface between UCSI and the glue driver is very low-level. It
> > > allows reading the UCSI data from any offset (but in reality the UCSI
> > > driver reads only VERSION, CCI an MESSAGE_IN data). All event handling
> > > is to be done by the glue driver (which already resulted in several
> > > similar-but-slightly different implementations). It leaves no place to
> > > optimize the write-read-read sequence for the command execution (which
> > > might be beneficial for some of the drivers), etc.
> > >
> > > The patchseries attempts to restructure the UCSI glue driver interface
> > > in order to provide sensible operations instead of a low-level read /
> > > write calls.
> > >
> > > If this approach is found to be acceptable, I plan to further rework the
> > > command interface, moving reading CCI and MESSAGE_IN to the common
> > > control code, which should simplify driver's implementation and remove
> > > necessity to split quirks between sync_control and read_message_in e.g.
> > > as implemented in the ucsi_ccg.c.
> > >
> > > Note, the series was tested only on the ucsi_glink platforms. Further
> > > testing is appreciated.
> > >
> > > Depends: [1], [2]
> > >
> > > [1] https://lore.kernel.org/linux-usb/20240612124656.2305603-1-fabrice.gasnier@foss.st.com/
> > >
> > > [2] https://lore.kernel.org/linux-usb/20240621-ucsi-yoga-ec-driver-v8-1-e03f3536b8c6@linaro.org/
> > >
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > ---
> > > Changes in v4:
> > > - Rebased on top of Greg's tree to resolve conflicts.
> >
> > Nope, still got conflicts, are you sure you updated properly?  Patch 1
> > applied, but #2 did not.
>
> I feel stupid enough now. I rebased on top of usb-next instead of
> usb-testing. Let me spam it once again

Hmm, I see what happened. I had a next+usb-next. Simple usb-next
doesn't contain changes from 9e3caa9dd51b ("usb: typec: ucsi_acpi: Add
LG Gram quirk") which this patch also modifies. I can rebase it on top
of your tree, but then we will have build issues once usb-linus and
usb-next get merged together.

-- 
With best wishes
Dmitry
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
