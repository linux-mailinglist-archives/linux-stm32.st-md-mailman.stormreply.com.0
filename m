Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE0870EE7A
	for <lists+linux-stm32@lfdr.de>; Wed, 24 May 2023 08:50:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8B92CC6A61E;
	Wed, 24 May 2023 06:50:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 235E7C6A61A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 May 2023 06:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=tHeCHx/MOMVMOZD9oj9+Q6YTtU8wrcycwgwfyfxHFIY=; b=EtZtPKW8TSYwismfcohBDho/P1
 N4gWnd35viIowDvStMYa9OeqlAzPKP4t2uN25NL18atYnIyqOi2g8KYDvxzXIfiZbExJhekl4+LY3
 pAs7BsyRPwzikVP4SG4QH3zHU8+Kit63+0rFj0bg0JKyzPPtH1GATs7MbkKVx+7FEoBhBqRPGFDRm
 dcbzdeEU6FN5zy3fbqVA1MbmENfCXBwLc23m+z5AX7Q54osvOCJDYJdMfOya0kYxFGqQ7YFvQnBu3
 j49yNpWbnJnPWhopSNtvTmmvVXSvENPbXGmxD7l7XmIvFPY/qy4ERsCMg6C+ueod+CAYCiOnj9jsu
 bZtFiyAw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1q1iKd-00CX9Z-1L; Wed, 24 May 2023 06:50:47 +0000
Date: Tue, 23 May 2023 23:50:47 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <ZG2zx+ARLO1a7wh5@infradead.org>
References: <20230523091350.292221-1-arnaud.pouliquen@foss.st.com>
 <20230523091350.292221-3-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230523091350.292221-3-arnaud.pouliquen@foss.st.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 op-tee@lists.trustedfirmware.org, Jens Wiklander <jens.wiklander@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [RFC PATCH 2/4] remoteproc: Add TEE support
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

On Tue, May 23, 2023 at 11:13:48AM +0200, Arnaud Pouliquen wrote:
> +	struct tee_param param[MAX_TEE_PARAM_ARRY_MEMB];
> +	struct tee_shm *fw_shm;
> +	int ret;
> +
> +	fw_shm = tee_shm_register_kernel_buf(tee_rproc_ctx->tee_ctx, (void *)fw->data, fw->size);
> +	if (IS_ERR(fw_shm)) {
> +		/* Fallback: Try to allocate memory in OP-TEE space */
> +		fw_shm = tee_shm_alloc_kernel_buf(tee_rproc_ctx->tee_ctx, fw->size);

> +EXPORT_SYMBOL(tee_rproc_load_fw);

Please stick to the EXPORT_SYMBOL_GPL of the underlying tee
infrastructure.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
