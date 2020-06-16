Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 217331FAEE4
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Jun 2020 13:06:37 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 00D1AC36B11;
	Tue, 16 Jun 2020 11:06:36 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 43361C36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Jun 2020 10:56:19 +0000 (UTC)
IronPort-SDR: uxU+RwwsWnVARJFtSYpjHLLmxHik1FWWMXTVH+17VnMTfMugQA/OsR/zWA9d8BtwVU7VlxNazg
 X6D1VmflCUdA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2020 03:56:17 -0700
IronPort-SDR: iS5GbzbjKPiXqDKhZpPrConT0bcq2eWASHaqzKGx4fvllcs2ZidupIXhxZrWjdC+Jga7qklkly
 S/l/9R7DZuJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,518,1583222400"; d="scan'208";a="382837797"
Received: from kuha.fi.intel.com ([10.237.72.162])
 by fmsmga001.fm.intel.com with SMTP; 16 Jun 2020 03:56:12 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation);
 Tue, 16 Jun 2020 13:56:12 +0300
Date: Tue, 16 Jun 2020 13:56:12 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Amelie Delaunay <amelie.delaunay@st.com>
Message-ID: <20200616105612.GL3213128@kuha.fi.intel.com>
References: <20200615161512.19150-1-amelie.delaunay@st.com>
 <20200615161512.19150-3-amelie.delaunay@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200615161512.19150-3-amelie.delaunay@st.com>
X-Mailman-Approved-At: Tue, 16 Jun 2020 11:06:34 +0000
Cc: devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/6] usb: typec: add typec_find_pwr_opmode
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

On Mon, Jun 15, 2020 at 06:15:08PM +0200, Amelie Delaunay wrote:
> This patch adds a function that converts power operation mode string into
> power operation mode value.
> 
> It is useful to configure power operation mode through device tree
> property, as power capabilities may be linked to hardware design.
> 
> Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/class.c | 15 +++++++++++++++
>  include/linux/usb/typec.h |  1 +
>  2 files changed, 16 insertions(+)
> 
> diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> index c9234748537a..59e1837ef85e 100644
> --- a/drivers/usb/typec/class.c
> +++ b/drivers/usb/typec/class.c
> @@ -1448,6 +1448,21 @@ void typec_set_pwr_opmode(struct typec_port *port,
>  }
>  EXPORT_SYMBOL_GPL(typec_set_pwr_opmode);
>  
> +/**
> + * typec_find_pwr_opmode - Get the typec power operation mode capability
> + * @name: power operation mode string
> + *
> + * This routine is used to find the typec_pwr_opmode by its string @name.
> + *
> + * Returns typec_pwr_opmode if success, otherwise negative error code.
> + */
> +int typec_find_pwr_opmode(const char *name)
> +{
> +	return match_string(typec_pwr_opmodes,
> +			    ARRAY_SIZE(typec_pwr_opmodes), name);
> +}
> +EXPORT_SYMBOL_GPL(typec_find_pwr_opmode);
> +
>  /**
>   * typec_find_orientation - Convert orientation string to enum typec_orientation
>   * @name: Orientation string
> diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
> index 5daa1c49761c..f7c63ee3d443 100644
> --- a/include/linux/usb/typec.h
> +++ b/include/linux/usb/typec.h
> @@ -254,6 +254,7 @@ int typec_set_mode(struct typec_port *port, int mode);
>  
>  void *typec_get_drvdata(struct typec_port *port);
>  
> +int typec_find_pwr_opmode(const char *name);
>  int typec_find_orientation(const char *name);
>  int typec_find_port_power_role(const char *name);
>  int typec_find_power_role(const char *name);
> -- 
> 2.17.1

thanks,

-- 
heikki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
