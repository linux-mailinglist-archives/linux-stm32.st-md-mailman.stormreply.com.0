Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF7C3AB0A8
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Jun 2021 11:58:44 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 33D1EC597B0;
	Thu, 17 Jun 2021 09:58:44 +0000 (UTC)
Received: from lb1-smtp-cloud8.xs4all.net (lb1-smtp-cloud8.xs4all.net
 [194.109.24.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8019AC59780
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Jun 2021 09:58:42 +0000 (UTC)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
 by smtp-cloud8.xs4all.net with ESMTPA
 id tonGl2mJvhqlttonJl047h; Thu, 17 Jun 2021 11:58:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
 t=1623923922; bh=4+0emTt2Q486IcW98DZFNRVvjUg3qd0S7NWvP8SHwNQ=;
 h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
 Subject;
 b=QezLtQe8VjcOU5spwRQxV0zjw4C+bBirjEmJeIM5iQ6sTWtdelLkAm+cYPUvleoS9
 wU64tQZTNEyxJOfw9reO7Xarq36BXgTbAnUw+g3OukJB42KMi54hwztmw5xPXrreSw
 ly85lxBu3fWyN6hkpzwFcFkg0nD6H4FhZFusQa3riRE4RAasPItkzRjtJ1dhscxk+h
 Wxs+U1jDQ0fXufV19IgvO0qprxFh+4VqPlKtZQAMqAUQxd7iZwV1pKNVZzVld4/35o
 tRML2kgauwbzGvxcwTgc33f2ZSj7SPZZNZOdQyPlL3Oo+9W+46JjWWRatpSCRut2kH
 a32xBDC16GwSg==
To: dillon.minfei@gmail.com, mchehab@kernel.org, mchehab+huawei@kernel.org,
 ezequiel@collabora.com, gnurou@gmail.com, pihsun@chromium.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org
References: <1621508727-24486-1-git-send-email-dillon.minfei@gmail.com>
 <1621508727-24486-7-git-send-email-dillon.minfei@gmail.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <d9d2a893-a159-1681-866f-e905609ce9d0@xs4all.nl>
Date: Thu, 17 Jun 2021 11:58:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <1621508727-24486-7-git-send-email-dillon.minfei@gmail.com>
Content-Language: en-US
X-CMAE-Envelope: MS4xfOlFbTk5W6IXkthnVtXy0IVODJJ0n676wOK03ANA/pMCzttcMjnZO498HSGDhrBV854jtnT690I6OQ3DFUdNRB7MAf6/5d45kK6urNVMrTqYMDOoY2f4
 mTehocGmyXrYZD+hk/9MOD3nCBGTWxadphi2I1JeXzbhugc/ytf63xCz1xWR343Ldp5YOAXspneBmoFxcd5g4GWJDmqpjwlP4Ya8fc9oeG5bWTDX/RIIJuGS
 paVgw3GFhmknu7aclVxNxK0AgrywZnTHtu41gJtOJoN9rCtAhEcqRy7/ng0cTphkZbocbONGRX7ow1tb+m3CpG+QVpfYTt+oDXMmEpS/zT2hBVCwR0Qv4a1z
 EZLobIQmFQ61BqIRSEezvXWLQcMVbETn7G/cTsBRTV60Xr72YQJ+4MPG6lVh38CgZx1KNLr6z6nMOy+CONdj/9cRJzYLOp/5P54/X76MR9jILCgIrXCAWZBq
 3v0EwSlPVadZtbCh5A4vWB4KRCJZb29sBY1Xyh5oG1sWiOlZfZoJ7dICJShoTYNhL0UxqTIVteUVdjeKjMTaanQiv8shnVGtl8Ox7kKEGxMkiqrgaf639Wkc
 UegHoaHNKB4jtrPBJOxSAH26Egf7VDkPk9RGUE2KfFLdNaKzwiVFhqb4sZ1C7/MCDXk6NoTuCWkHEGbEQxwQX+BGweExdYLA7Fhh/Yds3DVhm77F5fVl0UAw
 JeOf1wOLQqjLzeITKCCCMMFNASv5L8VronMQwyqx1LUPnpev2glSAwsaYYjkCgamFEf4SptA5vF73jNAN5PHLNEVb4vbzyOa1NCPv07Du8M4mHX8umtHBNeE
 By7tiTIMsCcsqht+ISo3Z3fJllz/Ou0qWTl22s4J1GXAU2rDzHUGx5qLBWAd9w==
Cc: devicetree@vger.kernel.org, hugues.fruchet@foss.st.com,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 6/7] media: v4l2-mem2mem: add
 v4l2_m2m_get_unmapped_area for no-mmu platform
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

On 20/05/2021 13:05, dillon.minfei@gmail.com wrote:
> From: Dillon Min <dillon.minfei@gmail.com>
> 
> For platforms without MMU the m2m provides a helper method
> v4l2_m2m_get_unmapped_area(), The mmap() routines will call
> this to get a proposed address for the mapping.
> 
> More detailed information about get_unmapped_area can be found in
> Documentation/nommu-mmap.txt

I'm getting checkpatch.pl --strict warnings:

CHECK: Alignment should match open parenthesis
#31: FILE: drivers/media/v4l2-core/v4l2-mem2mem.c:971:
+unsigned long v4l2_m2m_get_unmapped_area(struct file *file, unsigned long addr,
+               unsigned long len, unsigned long pgoff, unsigned long flags)

CHECK: Alignment should match open parenthesis
#62: FILE: include/media/v4l2-mem2mem.h:500:
+unsigned long v4l2_m2m_get_unmapped_area(struct file *file, unsigned long addr,
+               unsigned long len, unsigned long pgoff, unsigned long flags);

Regards,

	Hans

> 
> Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
> ---
>  drivers/media/v4l2-core/v4l2-mem2mem.c | 20 ++++++++++++++++++++
>  include/media/v4l2-mem2mem.h           |  4 ++++
>  2 files changed, 24 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
> index e7f4bf5bc8dd..f82a18ecab2f 100644
> --- a/drivers/media/v4l2-core/v4l2-mem2mem.c
> +++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
> @@ -966,6 +966,26 @@ int v4l2_m2m_mmap(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
>  }
>  EXPORT_SYMBOL(v4l2_m2m_mmap);
>  
> +#ifndef CONFIG_MMU
> +unsigned long v4l2_m2m_get_unmapped_area(struct file *file, unsigned long addr,
> +		unsigned long len, unsigned long pgoff, unsigned long flags)
> +{
> +	struct v4l2_fh *fh = file->private_data;
> +	unsigned long offset = pgoff << PAGE_SHIFT;
> +	struct vb2_queue *vq;
> +
> +	if (offset < DST_QUEUE_OFF_BASE) {
> +		vq = v4l2_m2m_get_src_vq(fh->m2m_ctx);
> +	} else {
> +		vq = v4l2_m2m_get_dst_vq(fh->m2m_ctx);
> +		pgoff -= (DST_QUEUE_OFF_BASE >> PAGE_SHIFT);
> +	}
> +
> +	return vb2_get_unmapped_area(vq, addr, len, pgoff, flags);
> +}
> +EXPORT_SYMBOL_GPL(v4l2_m2m_get_unmapped_area);
> +#endif
> +
>  #if defined(CONFIG_MEDIA_CONTROLLER)
>  void v4l2_m2m_unregister_media_controller(struct v4l2_m2m_dev *m2m_dev)
>  {
> diff --git a/include/media/v4l2-mem2mem.h b/include/media/v4l2-mem2mem.h
> index 5a91b548ecc0..91269227c265 100644
> --- a/include/media/v4l2-mem2mem.h
> +++ b/include/media/v4l2-mem2mem.h
> @@ -495,6 +495,10 @@ __poll_t v4l2_m2m_poll(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
>  int v4l2_m2m_mmap(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
>  		  struct vm_area_struct *vma);
>  
> +#ifndef CONFIG_MMU
> +unsigned long v4l2_m2m_get_unmapped_area(struct file *file, unsigned long addr,
> +		unsigned long len, unsigned long pgoff, unsigned long flags);
> +#endif
>  /**
>   * v4l2_m2m_init() - initialize per-driver m2m data
>   *
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
