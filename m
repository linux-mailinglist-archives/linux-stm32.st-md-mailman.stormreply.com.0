Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1035C8FD90
	for <lists+linux-stm32@lfdr.de>; Fri, 16 Aug 2019 10:18:33 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BF165C35E01;
	Fri, 16 Aug 2019 08:18:32 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CC233C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Aug 2019 08:18:31 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Aug 2019 01:16:22 -0700
X-IronPort-AV: E=Sophos;i="5.64,391,1559545200"; d="scan'208";a="167990821"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Aug 2019 01:16:19 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
 id 7606820ABC; Fri, 16 Aug 2019 11:15:14 +0300 (EEST)
Date: Fri, 16 Aug 2019 11:15:14 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hugues Fruchet <hugues.fruchet@st.com>
Message-ID: <20190816081514.GU6133@paasikivi.fi.intel.com>
References: <1565790533-10043-1-git-send-email-hugues.fruchet@st.com>
 <1565790533-10043-3-git-send-email-hugues.fruchet@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1565790533-10043-3-git-send-email-hugues.fruchet@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Yannick Fertre <yannick.fertre@st.com>,
 Mickael GUENE <mickael.guene@st.com>, linux-kernel@vger.kernel.org,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v6 2/4] media: stm32-dcmi: trace the
 supported fourcc/mbus_code
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

Hi Hugues,

On Wed, Aug 14, 2019 at 03:48:51PM +0200, Hugues Fruchet wrote:
> Add a trace of the set of supported fourcc/mbus_code which
> intersect between DCMI and source sub-device.
> 
> Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
> ---
>  drivers/media/platform/stm32/stm32-dcmi.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/stm32/stm32-dcmi.c b/drivers/media/platform/stm32/stm32-dcmi.c
> index b462f71..18acecf 100644
> --- a/drivers/media/platform/stm32/stm32-dcmi.c
> +++ b/drivers/media/platform/stm32/stm32-dcmi.c
> @@ -1447,12 +1447,20 @@ static int dcmi_formats_init(struct stm32_dcmi *dcmi)
>  			/* Code supported, have we got this fourcc yet? */
>  			for (j = 0; j < num_fmts; j++)
>  				if (sd_fmts[j]->fourcc ==
> -						dcmi_formats[i].fourcc)
> +						dcmi_formats[i].fourcc) {
>  					/* Already available */
> +					dev_dbg(dcmi->dev, "Skipping fourcc/code: %4.4s/0x%x\n",
> +						(char *)&sd_fmts[j]->fourcc,
> +						mbus_code.code);
>  					break;
> -			if (j == num_fmts)
> +				}
> +			if (j == num_fmts) {
>  				/* New */
>  				sd_fmts[num_fmts++] = dcmi_formats + i;
> +				dev_dbg(dcmi->dev, "Supported fourcc/code: %4.4s/0x%x\n",

Over 80 characters per line.

> +					(char *)&sd_fmts[num_fmts - 1]->fourcc,
> +					sd_fmts[num_fmts - 1]->mbus_code);
> +			}
>  		}
>  		mbus_code.index++;
>  	}

-- 
Regards,

Sakari Ailus
sakari.ailus@linux.intel.com
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
