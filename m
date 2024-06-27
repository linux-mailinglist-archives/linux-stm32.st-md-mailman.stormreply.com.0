Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DAEB91AA35
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jun 2024 17:02:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C0367C71280;
	Thu, 27 Jun 2024 15:02:57 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EC2D1C6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jun 2024 15:02:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id B8880CE2F4D;
 Thu, 27 Jun 2024 15:02:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7345BC2BBFC;
 Thu, 27 Jun 2024 15:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1719500566;
 bh=nJI2HtmKICRsKHR8/Up41vVhzOP05K+y4EJ5tpnHE6E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=0rdix0PD+Lba9nWZZg72rAThMW8k7ExC6rSxUdEOS2qXhW6EelEY/JmtjA+oeHScT
 /HwWFCd/gyWR+fMKySnEECglSxA7pWJ6c0NavitzKDtqqngUDNsDwKMSD0OPkN/4Fg
 EFvcTNnBXBDz0+8Kz+0V0MtFU411pCTnuerTaa04=
Date: Thu, 27 Jun 2024 17:02:43 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <2024062724-petty-twine-afd5@gregkh>
References: <20240627-ucsi-rework-interface-v4-0-289ddc6874c7@linaro.org>
 <2024062717-foster-document-eb2f@gregkh>
 <CAA8EJprAshnt3YchBv0ssi4Vet9b6oMcf3z8nuRkoZVYNBq64w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAA8EJprAshnt3YchBv0ssi4Vet9b6oMcf3z8nuRkoZVYNBq64w@mail.gmail.com>
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

On Thu, Jun 27, 2024 at 05:57:30PM +0300, Dmitry Baryshkov wrote:
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

Both branches should be identical right now, perhaps you missed when I
synced them up.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
