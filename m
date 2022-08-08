Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A707F58C676
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Aug 2022 12:33:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4E059C57183;
	Mon,  8 Aug 2022 10:33:32 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 46D8EC03FD4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Aug 2022 10:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659954810; x=1691490810;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=TkDQQIVn5gXSOl294qqKK8buwtM+qJn9ROJ7wvLLwAE=;
 b=Elj3vDUI8NTpBx2slInZ8QE2zHQMfvq2R7J/CqXWrtnZrHgxpoeityID
 qDbwXfgpKeLstGmRXAdqtWKEttFcW5hWXzk9KdgiKBHrgTmFuHktP9ufb
 X+2ZsClUUplReYraNcLAKzZM+26AXsOhjL5RL/sLgcjP2+D5jULYtFUY/
 0QRmbiCmIUxGvl4ol99E+JWcIVDh55NiqWvpq/rJ9MxUNGQw2MgjPsxtN
 v5SUUx+87e1jM77jcEYBnYZGiyu58vet4+MmvVh0wJQ0Ket09GzaT/3MC
 sfRegHYOdXSScWttmkpbfm2kmD8xwcrU5EbNQYDODLGS9SkbtyakpjOLW A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10432"; a="291337268"
X-IronPort-AV: E=Sophos;i="5.93,222,1654585200"; d="scan'208";a="291337268"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2022 03:33:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,222,1654585200"; d="scan'208";a="746583385"
Received: from kuha.fi.intel.com ([10.237.72.185])
 by fmsmga001.fm.intel.com with SMTP; 08 Aug 2022 03:33:24 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation);
 Mon, 08 Aug 2022 13:33:23 +0300
Date: Mon, 8 Aug 2022 13:33:23 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Colin Ian King <colin.i.king@gmail.com>
Message-ID: <YvDmc2RXuvCE8rGt@kuha.fi.intel.com>
References: <20220803123018.913710-1-colin.i.king@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220803123018.913710-1-colin.i.king@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH][next] usb: typec: ucsi: stm32g0: Fix
 spelling mistake "booloader" -> "bootloader"
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

On Wed, Aug 03, 2022 at 01:30:18PM +0100, Colin Ian King wrote:
> There is a spelling mistake in a dev_err_probe message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/ucsi/ucsi_stm32g0.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi_stm32g0.c b/drivers/usb/typec/ucsi/ucsi_stm32g0.c
> index 061551d464f1..6ced49e4d208 100644
> --- a/drivers/usb/typec/ucsi/ucsi_stm32g0.c
> +++ b/drivers/usb/typec/ucsi/ucsi_stm32g0.c
> @@ -599,7 +599,7 @@ static int ucsi_stm32g0_probe_bootloader(struct ucsi *ucsi)
>  		g0->i2c_bl = i2c_new_dummy_device(g0->client->adapter, STM32G0_I2C_BL_ADDR);
>  		if (IS_ERR(g0->i2c_bl)) {
>  			ret = dev_err_probe(g0->dev, PTR_ERR(g0->i2c_bl),
> -					    "Failed to register booloader I2C address\n");
> +					    "Failed to register bootloader I2C address\n");
>  			return ret;
>  		}
>  	}
> -- 
> 2.35.3

-- 
heikki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
