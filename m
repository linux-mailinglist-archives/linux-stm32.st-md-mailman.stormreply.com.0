Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B5BE315AC70
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Feb 2020 16:54:37 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 40C25C36B0B;
	Wed, 12 Feb 2020 15:54:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B6561C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Feb 2020 15:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=EIQuvZVjRgnZucfdtz7UxkDAyXXF62ACmzF0Z1QyBKQ=; b=I5uemIgZznT+KbXN73VDUVcGQe
 YT/UiFrjY2biFKrNf4NvXDs8X7FZJ0am5TD+zu5aZ2+FHjB20O9wkWFzLzXaGdGavuCtBzblcBBKi
 SHjW5dUuZVLM4KV3o7ZhVVA1tGvysjlWcM649K0FS3i54wSZxlIT6LSdi/5WT9ULT+CVnImWlw0M3
 w/dXR7XkrxM9QdfrCzO4ACyK6YjQeOQeHJkVEJAJCH0PbMYP+2X/Gz8GlNmW3ko6xN+Yiqb1shVPv
 e482LAGCQef8sq25rp9W2A5J9Ku20gKII0Tr7zGRrKgVxyHJCKrZHLF4jCfqDT3IIeIq6Yrqcr0OU
 YUUsXz9A==;
Received: from [2601:1c0:6280:3f0::19c2]
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j1uLO-0002OF-TQ; Wed, 12 Feb 2020 15:54:30 +0000
To: Arnaud Pouliquen <arnaud.pouliquen@st.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Ohad Ben-Cohen <ohad@wizery.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
References: <20200212093211.15270-1-arnaud.pouliquen@st.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <c912fe7e-601d-6d07-c368-109fecd11a7a@infradead.org>
Date: Wed, 12 Feb 2020 07:54:30 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200212093211.15270-1-arnaud.pouliquen@st.com>
Content-Language: en-US
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] remoteproc: fix kernel-doc warnings
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

Hi,

kernel-doc supports "..." as a function argument for varargs.
See Documentation/doc-guide/kernel-doc.rst:

"If a function has a variable number of arguments, its description should
be written in kernel-doc notation as::

      * @...: description"


So the below could be done as:

On 2/12/20 1:32 AM, Arnaud Pouliquen wrote:
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 097f33e4f1f3..5f9a5812505c 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -224,7 +224,7 @@ EXPORT_SYMBOL(rproc_da_to_va);
>  /**
>   * rproc_find_carveout_by_name() - lookup the carveout region by a name
>   * @rproc: handle of a remote processor
> - * @name,..: carveout name to find (standard printf format)
> + * @name: carveout name to find (standard printf format)

 * @name: carveout name to find
 * @...: standard printf format of args to search for carveout name

although I'm not so sure about the descriptions there.

>   *
>   * Platform driver has the capability to register some pre-allacoted carveout
>   * (physically contiguous memory regions) before rproc firmware loading and


thanks for the kernel-doc update.
-- 
~Randy

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
