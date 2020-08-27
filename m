Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2290A2542FD
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Aug 2020 12:00:51 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C6AACC32EA6;
	Thu, 27 Aug 2020 10:00:50 +0000 (UTC)
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 81833C36B26
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Aug 2020 10:00:49 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id r8so3920943ota.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Aug 2020 03:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AAVaUW7VwZegQfkJwMOJ8uza77AqEjXeq+6lLbyPRPM=;
 b=IYEfpoxWOrgM4B+rtfvP9lwMfghFgE8vdnrARgx0tBgVT3lXSqsCFo9fAz+niPiyxo
 rdB2smv37lBdCuf0lCYAMeq992BABs8tJZNXHRI0O/FpJ24EtEBMiehnidWe9jVIUjfq
 CdZFvaZq5IcH3ls+zQIrJXH9K7T2mw+V/R8AcEUCcC3Obv0U1iMOapj1fPdBgDCiSIWW
 7xcHnVejZBN/zu8v+QfvIUfVBvD6eyl2pTz0fi1+Zn8NmW2nmgQC8/MynnilIUHtF5fb
 mmF/v8b/Dv9DjWu2QbGe7U34Ka3wQM9NlktTZePIyXzeAX2E6B4jZs6b6/stfr9afTfP
 mFZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AAVaUW7VwZegQfkJwMOJ8uza77AqEjXeq+6lLbyPRPM=;
 b=CFX8VXBHygxfVsiM5WY8HvPSOdKa+Ayy3KelEXaimJX0DA4RO44IgtDvIx8OfBYaH+
 OVr3XlPOXyYRkrCWigBeVLgvcCQUn2o9DDL0eEAfDCxqDn+s5DA6NC/0WtDqiRLDzRWH
 9nFoLFTtvgZEUUslIZFkJ7mjT+gIzFJc1dQZx3jDqlfBRm76PVgm2kxtzDf4UnqNU9eM
 DB3X5yKr/QASnPHyRqkaEitRjDLjN4id/rvlX+kth+eU8kRZOg9sWNb47Y0Exdm5vIoK
 OpAzS0754mPZjXgayWAJZQFEpBAQehuXUVz9pNLy2AsOUkISkB+lrEupmaT+QkH3AGzM
 jaXQ==
X-Gm-Message-State: AOAM533UVdlXNSpigkb5PIt+nyzfJuSN9+4ukrlHlRV5fPCxGg8e1hCM
 FKyWBmfNdWAUs7GeoLkpkEMywo1h633cNL+DnaM=
X-Google-Smtp-Source: ABdhPJzisz0W2lNrmBlCnPW5yf/NHJi2xOH4+cZ5xxIWgb4iDZYft3NFtXLC2sZ9FFQKQuPthOEekZMRwP+l5XBWL5E=
X-Received: by 2002:a9d:480d:: with SMTP id c13mr13251835otf.224.1598522447729; 
 Thu, 27 Aug 2020 03:00:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200826063850.47625-1-alexandru.ardelean@analog.com>
 <20200826120042.200364-1-alexandru.ardelean@analog.com>
 <CA+U=DsrMDSTQKEc2_3+W8u4bLraAowVB3nB4huKY--v8gnds2Q@mail.gmail.com>
 <c3a9411e-186d-a3ac-5ad0-bd70ad78f147@st.com>
In-Reply-To: <c3a9411e-186d-a3ac-5ad0-bd70ad78f147@st.com>
From: Alexandru Ardelean <ardeleanalex@gmail.com>
Date: Thu, 27 Aug 2020 13:00:36 +0300
Message-ID: <CA+U=DspjGUhXCY7c8P6zOYZsx17ybcU4Kdr52yujmdYOaa1JSQ@mail.gmail.com>
To: Fabrice Gasnier <fabrice.gasnier@st.com>
Cc: linux-iio <linux-iio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Sergiu Cuciurean <sergiu.cuciurean@analog.com>,
 linux-arm-kernel@lists.infradead.org,
 Alexandru Ardelean <alexandru.ardelean@analog.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v2] iio: stm32-dac: Replace
 indio_dev->mlock with own device lock
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

On Thu, Aug 27, 2020 at 12:03 PM Fabrice Gasnier <fabrice.gasnier@st.com> wrote:
>
> On 8/27/20 10:55 AM, Alexandru Ardelean wrote:
> > On Wed, Aug 26, 2020 at 3:03 PM Alexandru Ardelean
> > <alexandru.ardelean@analog.com> wrote:
> >> From: Sergiu Cuciurean <sergiu.cuciurean@analog.com>
> >>
> >> As part of the general cleanup of indio_dev->mlock, this change replaces
> >> it with a local lock. The lock protects against potential races when
> >> reading the CR reg and then updating, so that the state of pm_runtime
> >> is consistent between the two operations.
> >>
> >> Signed-off-by: Sergiu Cuciurean <sergiu.cuciurean@analog.com>
> >> Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
> >> ---
> > Forgot the changelog here.
> > Apologies.
> >
> > Changelog v1 -> v2:
> > * removed whitespace change for 'common' field
> > * updated comment about the lock usage
>
> Hi Alexandru,
>
> Sorry if I missed it... is there an update on the comment :-) ?

For a moment there, I thought I didn't.
GMail's threading is confusing.

----------------------------------------------------------------------------
As part of the general cleanup of indio_dev->mlock, this change replaces
it with a local lock. The lock protects against potential races when
reading the CR reg and then updating, so that the state of pm_runtime
is consistent between the two operations.
----------------------------------------------------------------------------

>
> Best Regards,
> Fabrice
> >
> >>  drivers/iio/dac/stm32-dac.c | 12 ++++++++----
> >>  1 file changed, 8 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/drivers/iio/dac/stm32-dac.c b/drivers/iio/dac/stm32-dac.c
> >> index 092c796fa3d9..7a8aed476850 100644
> >> --- a/drivers/iio/dac/stm32-dac.c
> >> +++ b/drivers/iio/dac/stm32-dac.c
> >> @@ -26,9 +26,11 @@
> >>  /**
> >>   * struct stm32_dac - private data of DAC driver
> >>   * @common:            reference to DAC common data
> >> + * @lock:              lock to protect the data buffer during regmap ops
> >>   */
> >>  struct stm32_dac {
> >>         struct stm32_dac_common *common;
> >> +       struct mutex            lock;
> >>  };
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
