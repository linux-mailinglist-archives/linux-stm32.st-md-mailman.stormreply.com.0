Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8390DB4557B
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Sep 2025 13:00:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C09E2C35E2E;
	Fri,  5 Sep 2025 11:00:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F1908C35E2B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Sep 2025 11:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757070004; x=1788606004;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=xWFG9IcSFRaAzKyA5Lio/LJJoAzp+33hlHZFKOaExJw=;
 b=K6qBF8eEctUNHpRjYg1gAAZmR2HvBEN+TxVvGrUjE4Ozb5Q4XH8e7vFr
 T5BIptIVG6spAA2CFEGJvTcZ/O620Aqol/vxZnamLbcvQk1Q9/G5qiTyg
 OHeRDlUPnauzYhTyDipCQvnGT6t5BMZxGJIOQlsVhasq37NVOZMhtmqy0
 oBUWVthvjhFlxdI83Jm3zYel/AtC/mARwRSjgfC/V/i5SLx1L1aajzCoC
 U6z2t9DB03o1R2TYYrMHeTmn8Og6yY7VtJcAeqg3u+iBfhJYxtpq7TOvJ
 xfESv83UaYjeVRghDEinhCkGtKWeSrv5MDzqusVorG2xx9QvD6fSIajXV Q==;
X-CSE-ConnectionGUID: cIOsd/qYRc68uU040zsBCw==
X-CSE-MsgGUID: soojrJUQSXeCcDG749mZiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11543"; a="59118968"
X-IronPort-AV: E=Sophos;i="6.18,241,1751266800"; d="scan'208";a="59118968"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 04:00:01 -0700
X-CSE-ConnectionGUID: zgDOmaF0S/+OTUlsH0/d9g==
X-CSE-MsgGUID: 7w6td42BQWaRq1lJzsfd3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,241,1751266800"; d="scan'208";a="172579445"
Received: from kuha.fi.intel.com ([10.237.72.152])
 by fmviesa009.fm.intel.com with SMTP; 05 Sep 2025 03:59:58 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation);
 Fri, 05 Sep 2025 13:59:57 +0300
Date: Fri, 5 Sep 2025 13:59:57 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Thorsten Blum <thorsten.blum@linux.dev>
Message-ID: <aLrCrQOdLsqq0U37@kuha.fi.intel.com>
References: <20250830110426.10007-2-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250830110426.10007-2-thorsten.blum@linux.dev>
Cc: linux-kernel@vger.kernel.org, "Christian A. Ehrhardt" <lk@c--e.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Al Viro <viro@zeniv.linux.org.uk>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Fedor Pchelkin <boddah8794@gmail.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] usb: ucsi: stm32: Use min() to improve
 ucsi_stm32g0_fw_cb()
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

On Sat, Aug 30, 2025 at 01:04:20PM +0200, Thorsten Blum wrote:
> Use min() to improve ucsi_stm32g0_fw_cb() and avoid calculating
> 'end - data' twice.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/ucsi/ucsi_stm32g0.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi_stm32g0.c b/drivers/usb/typec/ucsi/ucsi_stm32g0.c
> index 57ef7d83a412..838ac0185082 100644
> --- a/drivers/usb/typec/ucsi/ucsi_stm32g0.c
> +++ b/drivers/usb/typec/ucsi/ucsi_stm32g0.c
> @@ -10,6 +10,7 @@
>  #include <linux/firmware.h>
>  #include <linux/i2c.h>
>  #include <linux/interrupt.h>
> +#include <linux/minmax.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
>  #include <linux/unaligned.h>
> @@ -523,11 +524,7 @@ static void ucsi_stm32g0_fw_cb(const struct firmware *fw, void *context)
>  	data = fw->data;
>  	end = fw->data + fw->size;
>  	while (data < end) {
> -		if ((end - data) < STM32G0_I2C_BL_SZ)
> -			size = end - data;
> -		else
> -			size = STM32G0_I2C_BL_SZ;
> -
> +		size = min(end - data, STM32G0_I2C_BL_SZ);
>  		ret = ucsi_stm32g0_bl_write(g0->ucsi, addr, data, size);
>  		if (ret) {
>  			dev_err(g0->dev, "Write failed %d\n", ret);
> -- 
> 2.50.1

-- 
heikki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
