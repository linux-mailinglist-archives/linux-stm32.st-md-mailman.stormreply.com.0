Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 521E090E909
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Jun 2024 13:11:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0999CC6B460;
	Wed, 19 Jun 2024 11:11:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 53B66C6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jun 2024 11:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718795510; x=1750331510;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Q4p8OGkyZzyrh1giwx6LIVg6Ii/VKLg/MXvccZBGuxM=;
 b=fH5r13H0N8FsPTp7qzmowgUBFLqwKharnnIYc0kRXg3F5LYqzW936Di1
 pdwaTYSvuxspp0/576eJGh4Xf6gq6UPPDZmjWI+RIWtPR37loytge8Y2f
 HsONWIv9Q9CKTGTKrWb7CpQs02vb3xXEH8db/bYsuZ8nJWAFkB/K/xX6k
 t99T4l8sd+Sp3HHNxpzmWjSY8dmH+umwlZJBItlE0t4dtSRi/M5ms9Dbm
 cLRoeIYBmDQfRU5QjmnZs6mcne1ZtbPBJG+tWlZ79+nlNSnm7asE2N3qI
 QCwPAgON8OK6ZqT+ZTcjt5J+uKMLd5lvLxCzCEXDC7X36/8eLcRTXXh5O g==;
X-CSE-ConnectionGUID: sE60K3o7Qp6qLXNgfWvFKA==
X-CSE-MsgGUID: EzyobvCVQU2Y2sVFAfOTag==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="19509364"
X-IronPort-AV: E=Sophos;i="6.08,250,1712646000"; d="scan'208";a="19509364"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 04:11:42 -0700
X-CSE-ConnectionGUID: Mdk7oiMqRseYyKPfAuwCtg==
X-CSE-MsgGUID: Us5UChcrTv2vW5+bzdDyiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,250,1712646000"; d="scan'208";a="46323943"
Received: from kuha.fi.intel.com ([10.237.72.185])
 by fmviesa005.fm.intel.com with SMTP; 19 Jun 2024 04:11:39 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation);
 Wed, 19 Jun 2024 14:11:38 +0300
Date: Wed, 19 Jun 2024 14:11:37 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <ZnK86Zgkr6krdV9C@kuha.fi.intel.com>
References: <20240603-ucsi-rework-interface-v1-0-99a6d544cec8@linaro.org>
 <hgqvyaziumpag5g5ajzupllvpwlz44scma6yu3drmtoqwcwav4@w366suy7c2eo>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <hgqvyaziumpag5g5ajzupllvpwlz44scma6yu3drmtoqwcwav4@w366suy7c2eo>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Nikita Travkin <nikita@trvn.ru>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH RFC 0/7] usb: typec: ucsi: rework glue
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

Hi Dmitry,

On Tue, Jun 18, 2024 at 09:59:07PM +0300, Dmitry Baryshkov wrote:
> On Mon, Jun 03, 2024 at 02:24:53AM GMT, Dmitry Baryshkov wrote:
> > The interface between UCSI and the glue driver is very low-level. It
> > allows reading the UCSI data from any offset (but in reality the UCSI
> > driver reads only VERSION, CCI an MESSAGE_IN data). All event handling
> > is to be done by the glue driver (which already resulted in several
> > similar-but-slightly different implementations). It leaves no place to
> > optimize the write-read-read sequence for the command execution (which
> > might be beneficial for some of the drivers), etc.
> > 
> > The patchseries attempts to restructure the UCSI glue driver interface
> > in order to provide sensible operations instead of a low-level read /
> > write calls.
> > 
> > If this approach is found to be acceptable, I plan to further rework the
> > command interface, moving reading CCI and MESSAGE_IN to the common
> > control code, which should simplify driver's implementation and remove
> > necessity to split quirks between sync_control and read_message_in e.g.
> > as implemented in the ucsi_ccg.c.
> > 
> > Note, the series was tested only on the ucsi_glink platforms. Further
> > testing is appreciated.
> 
> Gracious ping for the reviews / comments. My endgoal is to simplify the
> command submission interface, allowing us to handle odd commands in a
> single function rather than having the code split between sync_write()
> and notification handling.

I don't have any objections. Just rebase these and drop the RFC. The
patch 6/7 did not apply cleanly anymore on top of the two dependencies
you listed.

thanks,

-- 
heikki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
