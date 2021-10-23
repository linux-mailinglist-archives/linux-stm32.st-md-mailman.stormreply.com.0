Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB8D438506
	for <lists+linux-stm32@lfdr.de>; Sat, 23 Oct 2021 21:36:47 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 69EFFC57B6C;
	Sat, 23 Oct 2021 19:36:47 +0000 (UTC)
Received: from smtprelay.hostedemail.com (smtprelay0202.hostedemail.com
 [216.40.44.202])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 45F05C06F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 23 Oct 2021 19:36:46 +0000 (UTC)
Received: from omf12.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
 by smtprelay05.hostedemail.com (Postfix) with ESMTP id D9BBB181C43D8;
 Sat, 23 Oct 2021 19:36:44 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf12.hostedemail.com (Postfix) with ESMTPA id B196D240234; 
 Sat, 23 Oct 2021 19:36:42 +0000 (UTC)
Message-ID: <663d3820f118c37a81529b3362b95e09c8e75e9f.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
 mathieu.poirier@linaro.org, suzuki.poulose@arm.com, mike.leach@linaro.org, 
 leo.yan@linaro.org, alexander.shishkin@linux.intel.com, 
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com
Date: Sat, 23 Oct 2021 12:36:41 -0700
In-Reply-To: <e5fe23370794e2f5442e11e7f8455ddb06e4b10a.1635016943.git.christophe.jaillet@wanadoo.fr>
References: <e5fe23370794e2f5442e11e7f8455ddb06e4b10a.1635016943.git.christophe.jaillet@wanadoo.fr>
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
X-Spam-Status: No, score=1.54
X-Stat-Signature: cn5t8cb9epzithy65nu1xystn5p8usud
X-Rspamd-Server: rspamout04
X-Rspamd-Queue-Id: B196D240234
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX18iFmpi7RwWrxrwqT0wAZ7yhteFsFr3AGo=
X-HE-Tag: 1635017802-700607
Cc: coresight@lists.linaro.org, kernel-janitors@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] coresight: Use devm_bitmap_zalloc when
	applicable
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

On Sat, 2021-10-23 at 21:24 +0200, Christophe JAILLET wrote:
> 'drvdata->chs.guaranteed' is a bitmap. So use 'devm_bitmap_kzalloc()' to
> simplify code, improve the semantic and avoid some open-coded arithmetic
> in allocator arguments.
[]
> diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtracing/coresight/coresight-stm.c
[]
> @@ -862,7 +862,6 @@ static int stm_probe(struct amba_device *adev, const struct amba_id *id)
>  	struct stm_drvdata *drvdata;
>  	struct resource *res = &adev->res;
>  	struct resource ch_res;
> -	size_t bitmap_size;
>  	struct coresight_desc desc = { 0 };
>  
>  	desc.name = coresight_alloc_device_name(&stm_devs, dev);
> @@ -904,9 +903,7 @@ static int stm_probe(struct amba_device *adev, const struct amba_id *id)
>  	else
>  		drvdata->numsp = stm_num_stimulus_port(drvdata);
>  
> -	bitmap_size = BITS_TO_LONGS(drvdata->numsp) * sizeof(long);
> -
> -	guaranteed = devm_kzalloc(dev, bitmap_size, GFP_KERNEL);
> +	guaranteed = devm_bitmap_zalloc(dev, drvdata->numsp, GFP_KERNEL);
>  	if (!guaranteed)
>  		return -ENOMEM;
>  	drvdata->chs.guaranteed = guaranteed;

guaranteed is also pretty useless



_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
