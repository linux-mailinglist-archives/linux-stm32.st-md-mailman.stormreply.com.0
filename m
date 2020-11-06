Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 161692A94B6
	for <lists+linux-stm32@lfdr.de>; Fri,  6 Nov 2020 11:51:12 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C3790C3FAD4;
	Fri,  6 Nov 2020 10:51:11 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C6EF9C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Nov 2020 10:51:08 +0000 (UTC)
IronPort-SDR: YVPvahVXK9HwyLRT4deDWo9YjBPPh4/DrIwDNidmprpSkt5FzgN8HT/hVHwiMHO/Hrn9w6GFKK
 nk8Kjr3az8GQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9796"; a="156532102"
X-IronPort-AV: E=Sophos;i="5.77,456,1596524400"; d="scan'208";a="156532102"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2020 02:51:06 -0800
IronPort-SDR: lbbOiRuTeTRiQEc0yZcK//hJeV3DoVV7R2H31sSVvQu8ZS+wTeIh6mmzXWdSz7kpfYAPimOYxt
 RSPvH84npPlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,456,1596524400"; d="scan'208";a="427289318"
Received: from kuha.fi.intel.com ([10.237.72.162])
 by fmsmga001.fm.intel.com with SMTP; 06 Nov 2020 02:51:02 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation);
 Fri, 06 Nov 2020 12:51:01 +0200
Date: Fri, 6 Nov 2020 12:51:01 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Amelie Delaunay <amelie.delaunay@st.com>
Message-ID: <20201106105101.GB4062920@kuha.fi.intel.com>
References: <20201106091854.14958-1-amelie.delaunay@st.com>
 <20201106091854.14958-4-amelie.delaunay@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201106091854.14958-4-amelie.delaunay@st.com>
Cc: devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 linux-kernel@vger.kernel.org, Badhri Jagan Sridharan <badhri@google.com>,
 Rob Herring <robh+dt@kernel.org>, Jun Li <lijun.kernel@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 3/5] usb: typec: stusb160x: fix
 power-opmode property with typec-power-opmode
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

On Fri, Nov 06, 2020 at 10:18:52AM +0100, Amelie Delaunay wrote:
> Device tree property is named typec-power-opmode, not power-opmode.
> 
> Fixes: da0cb6310094 ("usb: typec: add support for STUSB160x Type-C controller family")
> Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/stusb160x.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/stusb160x.c b/drivers/usb/typec/stusb160x.c
> index 2a618f02f4f1..d21750bbbb44 100644
> --- a/drivers/usb/typec/stusb160x.c
> +++ b/drivers/usb/typec/stusb160x.c
> @@ -562,7 +562,7 @@ static int stusb160x_get_fw_caps(struct stusb160x *chip,
>  	 * Supported power operation mode can be configured through device tree
>  	 * else it is read from chip registers in stusb160x_get_caps.
>  	 */
> -	ret = fwnode_property_read_string(fwnode, "power-opmode", &cap_str);
> +	ret = fwnode_property_read_string(fwnode, "typec-power-opmode", &cap_str);
>  	if (!ret) {
>  		ret = typec_find_pwr_opmode(cap_str);
>  		/* Power delivery not yet supported */
> -- 
> 2.17.1

thanks,

-- 
heikki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
