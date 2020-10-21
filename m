Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 78406294D25
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Oct 2020 15:01:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2DA97C3FAE0;
	Wed, 21 Oct 2020 13:01:07 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 19E3AC3087A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Oct 2020 13:01:02 +0000 (UTC)
IronPort-SDR: w2tJ59IjFaH1iaSoHkeSUzi3fxy7h6Z7xNZwatDLuRMkC/HqK5nFAdcNWyJMrH5KFy8djJfGnq
 SeOhDgTcq1wg==
X-IronPort-AV: E=McAfee;i="6000,8403,9780"; a="147218180"
X-IronPort-AV: E=Sophos;i="5.77,401,1596524400"; d="scan'208";a="147218180"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2020 06:00:59 -0700
IronPort-SDR: lM5wSd6+wT4tggVCLwdGbIPibdst4g5SbujPDO31XcaiYsSmH6OSi9IHSmujusMtC9jZyu4c8a
 HvaYv53wmvcQ==
X-IronPort-AV: E=Sophos;i="5.77,401,1596524400"; d="scan'208";a="522735609"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2020 06:00:55 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
 id 4CB9020815; Wed, 21 Oct 2020 16:00:33 +0300 (EEST)
Date: Wed, 21 Oct 2020 16:00:33 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hugues Fruchet <hugues.fruchet@st.com>
Message-ID: <20201021130033.GI2703@paasikivi.fi.intel.com>
References: <1603188889-23664-1-git-send-email-hugues.fruchet@st.com>
 <1603188889-23664-3-git-send-email-hugues.fruchet@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1603188889-23664-3-git-send-email-hugues.fruchet@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Hans Verkuil <hverkuil@xs4all.nl>, Alain Volmat <alain.volmat@st.com>,
 Rob Herring <robh+dt@kernel.org>, Yannick Fertre <yannick.fertre@st.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v4 2/2] media: dt-bindings: media: st,
 stm32-dcmi: Add support of BT656
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

On Tue, Oct 20, 2020 at 12:14:49PM +0200, Hugues Fruchet wrote:
> Add support of BT656 parallel bus mode in DCMI.
> This mode is enabled when hsync-active & vsync-active
> fields are not specified.
> 
> Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
> ---
>  .../devicetree/bindings/media/st,stm32-dcmi.yaml   | 30 ++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml b/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
> index 3fe778c..1ee521a 100644
> --- a/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
> +++ b/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
> @@ -44,6 +44,36 @@ properties:
>        bindings defined in
>        Documentation/devicetree/bindings/media/video-interfaces.txt.
>  
> +    properties:
> +      endpoint:
> +        type: object
> +
> +        properties:
> +          bus-width: true
> +
> +          hsync-active:
> +            description:
> +              If both HSYNC and VSYNC polarities are not specified, BT656
> +              embedded synchronization is selected.
> +            default: 0
> +
> +          vsync-active:
> +            description:
> +              If both HSYNC and VSYNC polarities are not specified, BT656
> +              embedded synchronization is selected.
> +            default: 0

Should I understand this as if the polarities were not specified, BT.656
will be used? The bindings previously documented BT.601 (parallel) only, so
it was somewhat ambigious to begin with. Is there a risk of interpreting
old BT.601 bindings as BT.656? With bus-type property, I believe you could
avoid at least that risk.

Also not specifying at least one of the default values leads to BT.656
without bus-type. That could be addressed by removing the defaults.

> +
> +          pclk-sample: true
> +
> +          remote-endpoint: true
> +
> +        required:
> +          - remote-endpoint
> +
> +        additionalProperties: false
> +
> +    additionalProperties: false
> +
>  required:
>    - compatible
>    - reg

-- 
Regards,

Sakari Ailus
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
