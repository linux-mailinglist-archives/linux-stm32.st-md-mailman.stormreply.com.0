Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFED916A4D
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Jun 2024 16:28:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 90BCEC71287;
	Tue, 25 Jun 2024 14:28:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D65B0C6DD9F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Jun 2024 14:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719325727; x=1750861727;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=4VC/dpmvV2yj+XWaUHU3QaBpFS4x/fGnrsDdid1YfWM=;
 b=OiydOO9eFnCvu+OobIljJP+VHv/PHgrFwAyaPHxsHUhnYMI8bT/vT4uD
 oe4VyvWY+JadDU2ZYG+/Dyv0QxrZ98I7mv9zTrE16GtwmD3g5WB6/2eZ8
 c+mRVc6RckimFITujJ5NL+ej2+USZZXL8UpELQQmNWC2fZe5XnQv+igg5
 gV6YV8YvmXrzwXz2PfJfj7406VLsxYEeEcPncNkcaEZO+tY0cgnETIoMH
 eePeN/YDOsia7am/CQVLpSEBcE7Pg8DZd2lYGfwLZeMgQQRyAIpu/dX4Z
 4dX/7VOZ263ehXw3kHQh6H15awvfkKQJD1KNGh4rD7KU+QBrW5YMqRTj3 Q==;
X-CSE-ConnectionGUID: ir3ni6FJQxiOV0pT5vQLDQ==
X-CSE-MsgGUID: NVZ2OM5cRbSAqknodNQelw==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="16309083"
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="16309083"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 07:28:39 -0700
X-CSE-ConnectionGUID: kbnTYjbeThOxOrKl80gX5Q==
X-CSE-MsgGUID: +lgyiggYS0WF8pCBWxD4Ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="43546824"
Received: from kuha.fi.intel.com ([10.237.72.185])
 by orviesa010.jf.intel.com with SMTP; 25 Jun 2024 07:28:35 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation);
 Tue, 25 Jun 2024 17:28:34 +0300
Date: Tue, 25 Jun 2024 17:28:34 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <ZnrUEp0C9+Q7p+8a@kuha.fi.intel.com>
References: <20240621-ucsi-rework-interface-v2-0-a399ff96bf88@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240621-ucsi-rework-interface-v2-0-a399ff96bf88@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Nikita Travkin <nikita@trvn.ru>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 0/7] usb: typec: ucsi: rework glue
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

On Fri, Jun 21, 2024 at 01:55:19AM +0300, Dmitry Baryshkov wrote:
> The interface between UCSI and the glue driver is very low-level. It
> allows reading the UCSI data from any offset (but in reality the UCSI
> driver reads only VERSION, CCI an MESSAGE_IN data). All event handling
> is to be done by the glue driver (which already resulted in several
> similar-but-slightly different implementations). It leaves no place to
> optimize the write-read-read sequence for the command execution (which
> might be beneficial for some of the drivers), etc.
> 
> The patchseries attempts to restructure the UCSI glue driver interface
> in order to provide sensible operations instead of a low-level read /
> write calls.
> 
> If this approach is found to be acceptable, I plan to further rework the
> command interface, moving reading CCI and MESSAGE_IN to the common
> control code, which should simplify driver's implementation and remove
> necessity to split quirks between sync_control and read_message_in e.g.
> as implemented in the ucsi_ccg.c.
> 
> Note, the series was tested only on the ucsi_glink platforms. Further
> testing is appreciated.

I can run a few tests against these tomorrow.

I don't have have any objections with this approach, but you'll need
to do another rebase. Now these don't apply cleanly because of
9e3caa9dd51b ("usb: typec: ucsi_acpi: Add LG Gram quirk").

thanks,

> Depends: [1], [2]
> 
> [1] https://lore.kernel.org/linux-usb/20240612124656.2305603-1-fabrice.gasnier@foss.st.com/
> 
> [2] https://lore.kernel.org/linux-usb/20240621-ucsi-yoga-ec-driver-v8-1-e03f3536b8c6@linaro.org/
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> Changes in v2:
> - Dropped the RFC prefix
> - Rebased on top of the fixed STM32 patch
> - Included the pending Yoga C630 driver into the cleanup.
> - Link to v1: https://lore.kernel.org/r/20240603-ucsi-rework-interface-v1-0-99a6d544cec8@linaro.org
> 
> ---
> Dmitry Baryshkov (7):
>       usb: typec: ucsi: move ucsi_acknowledge() from ucsi_read_error()
>       usb: typec: ucsi: simplify command sending API
>       usb: typec: ucsi: split read operation
>       usb: typec: ucsi: rework command execution functions
>       usb: typec: ucsi: inline ucsi_read_message_in
>       usb: typec: ucsi: extract common code for command handling
>       usb: typec: ucsi: reorder operations in ucsi_run_command()
> 
>  drivers/usb/typec/ucsi/ucsi.c           | 215 +++++++++++++++++---------------
>  drivers/usb/typec/ucsi/ucsi.h           |  26 ++--
>  drivers/usb/typec/ucsi/ucsi_acpi.c      | 100 +++++++--------
>  drivers/usb/typec/ucsi/ucsi_ccg.c       | 103 +++++++--------
>  drivers/usb/typec/ucsi/ucsi_glink.c     |  74 ++++-------
>  drivers/usb/typec/ucsi/ucsi_stm32g0.c   |  79 ++++--------
>  drivers/usb/typec/ucsi/ucsi_yoga_c630.c | 104 +++++----------
>  7 files changed, 309 insertions(+), 392 deletions(-)
> ---
> base-commit: f0dbf09a40c8100a895f675d619db5ed1f58f7ac
> change-id: 20240525-ucsi-rework-interface-5ff2264f6aec
> 
> Best regards,
> -- 
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
heikki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
