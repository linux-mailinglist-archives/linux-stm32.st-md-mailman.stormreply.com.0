Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A42282A0662
	for <lists+linux-stm32@lfdr.de>; Fri, 30 Oct 2020 14:26:18 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6561BC3FADA;
	Fri, 30 Oct 2020 13:26:18 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C8593C3087A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Oct 2020 13:26:13 +0000 (UTC)
IronPort-SDR: D2Me6qMjGWqFnmovPVKcktPfE+92tvUvNgqUD1QzFzaABxowCR0Kh6cPqyeDjsIQK7no4RRgKC
 AD0aeliRDApQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9789"; a="156378892"
X-IronPort-AV: E=Sophos;i="5.77,433,1596524400"; d="scan'208";a="156378892"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2020 06:26:10 -0700
IronPort-SDR: YV4wtnH3IbPh9jWJxKOoi2HaVoQvD2DRl2ZQ7xMBjrzlRSS29MaPLlNoVKeXW4U+RJngJoRIqD
 wRuU8KGsnIew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,433,1596524400"; d="scan'208";a="425344461"
Received: from kuha.fi.intel.com ([10.237.72.162])
 by fmsmga001.fm.intel.com with SMTP; 30 Oct 2020 06:26:07 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation);
 Fri, 30 Oct 2020 15:26:06 +0200
Date: Fri, 30 Oct 2020 15:26:06 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Amelie Delaunay <amelie.delaunay@st.com>
Message-ID: <20201030132606.GD2333887@kuha.fi.intel.com>
References: <20201028151703.31195-1-amelie.delaunay@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201028151703.31195-1-amelie.delaunay@st.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 1/1] usb: typec: add missing
 MODULE_DEVICE_TABLE() to stusb160x
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

On Wed, Oct 28, 2020 at 04:17:03PM +0100, Amelie Delaunay wrote:
> When stusb160x driver is built as a module, no modalias information is
> available, and it prevents the module to be loaded by udev.
> Add MODULE_DEVICE_TABLE() to fix this issue.
> 
> Fixes: da0cb6310094 ("usb: typec: add support for STUSB160x Type-C controller family")
> Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/stusb160x.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/typec/stusb160x.c b/drivers/usb/typec/stusb160x.c
> index da7f1957bcb3..42076697e26c 100644
> --- a/drivers/usb/typec/stusb160x.c
> +++ b/drivers/usb/typec/stusb160x.c
> @@ -633,6 +633,7 @@ static const struct of_device_id stusb160x_of_match[] = {
>  	{ .compatible = "st,stusb1600", .data = &stusb1600_regmap_config},
>  	{},
>  };
> +MODULE_DEVICE_TABLE(of, stusb160x_of_match);
>  
>  static int stusb160x_probe(struct i2c_client *client)
>  {
> -- 
> 2.17.1

-- 
heikki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
