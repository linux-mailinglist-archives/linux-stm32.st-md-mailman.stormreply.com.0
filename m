Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C06CE4C45EB
	for <lists+linux-stm32@lfdr.de>; Fri, 25 Feb 2022 14:20:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 819EAC60491;
	Fri, 25 Feb 2022 13:20:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 01862C57B6C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Feb 2022 13:20:19 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21PD7oji031571;
 Fri, 25 Feb 2022 14:19:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=LkW62k1kez4onNz5WnO7tO0QIWuCB9ldqXvRsV6nPqw=;
 b=SVostm1nI+zn46O/FSyoSL038Zksrwu7/d4jbLLajBAFOENbSLEy0Zw6sdZKfZw176h/
 Nnhkow09gC+lg3WAIU8G9P6HQcm2JB/ODPSSlDAT6s3Tub1d7gZWUNZfLdQ7hRzlLY9w
 RSjv0jeFGgodwvwK9v3NxLcjmdSmSCOFSeQv63yqq+97kk9++aGrRb12Ygar49rNvbfq
 38WsZRvfD3pajWcRtcVtCzoAS0UGTqbimhDyOGCOkhAQWxax4zGWhWVlC6xTwtKwc2wv
 CflTeGvXaGthztqES4z/YjJnrqgvcqKO8shiPN6OQx4IYUge35CHdiC1UH6UBYuQ3zi4 Kw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3eetrf25hn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Feb 2022 14:19:52 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4CDC010002A;
 Fri, 25 Feb 2022 14:19:51 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3F423226FB7;
 Fri, 25 Feb 2022 14:19:51 +0100 (CET)
Received: from [10.201.22.81] (10.75.127.47) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Fri, 25 Feb
 2022 14:19:50 +0100
Message-ID: <c61d8a3f-6f19-48aa-ae69-e4f3670d4b16@foss.st.com>
Date: Fri, 25 Feb 2022 14:19:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Nathan Chancellor <nathan@kernel.org>, Yannick Fertre
 <yannick.fertre@foss.st.com>
References: <20220222152045.484610-1-nathan@kernel.org>
From: Philippe CORNU <philippe.cornu@foss.st.com>
In-Reply-To: <20220222152045.484610-1-nathan@kernel.org>
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-02-25_07,2022-02-25_01,2022-02-23_01
Cc: llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] drm/stm: Avoid using val uninitialized
 in ltdc_set_ycbcr_config()
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>



On 2/22/22 16:20, Nathan Chancellor wrote:
> Clang warns:
> 
>    drivers/gpu/drm/stm/ltdc.c:625:2: warning: variable 'val' is used uninitialized whenever switch default is taken [-Wsometimes-uninitialized]
>            default:
>            ^~~~~~~
>    drivers/gpu/drm/stm/ltdc.c:635:2: note: uninitialized use occurs here
>            val |= LxPCR_YCEN;
>            ^~~
>    drivers/gpu/drm/stm/ltdc.c:600:9: note: initialize the variable 'val' to silence this warning
>            u32 val;
>                   ^
>                    = 0
>    1 warning generated.
> 
> Use a return instead of break in the default case to fix the warning.
> Add an error message so that this return is not silent, which could hide
> issues in the future.
> 
> Fixes: 484e72d3146b ("drm/stm: ltdc: add support of ycbcr pixel formats")
> Link: https://github.com/ClangBuiltLinux/linux/issues/1575
> Acked-by: Yannick Fertre <yannick.fertre@foss.st.com>
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> Reviewed-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
> 
> v1 -> v2: https://lore.kernel.org/r/20220207165304.1046867-1-nathan@kernel.org/
> 
> * Use DRM_ERROR() instead of drm_err() (Philippe).

Hi Nathan,

Applied on drm-misc-next.
Many thanks for your patch,
Philippe :-)

> 
> * Collect tags from v1, as nothing substantial has changed.
> 
>   drivers/gpu/drm/stm/ltdc.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
> index 5eeb32c9c9ce..c9bc4ccb6d43 100644
> --- a/drivers/gpu/drm/stm/ltdc.c
> +++ b/drivers/gpu/drm/stm/ltdc.c
> @@ -624,7 +624,8 @@ static inline void ltdc_set_ycbcr_config(struct drm_plane *plane, u32 drm_pix_fm
>   		break;
>   	default:
>   		/* RGB or not a YCbCr supported format */
> -		break;
> +		DRM_ERROR("Unsupported pixel format: %u\n", drm_pix_fmt);
> +		return;
>   	}
>   
>   	/* Enable limited range */
> 
> base-commit: 542898c5aa5c6a3179dffb1d1606884a63f75fed
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
