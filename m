Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ICWFJh0FF2rT1QcAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 27 May 2026 16:52:13 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8B15E645A
	for <lists+linux-stm32@lfdr.de>; Wed, 27 May 2026 16:52:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 00A2BC8F290;
	Wed, 27 May 2026 14:52:13 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5C602C8F28E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 May 2026 14:52:11 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-3665a90bcd3so12699269a91.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 May 2026 07:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779893530; x=1780498330;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=GysSj+xcxKb96SCtQcauT9ZCA24G3J8cy9Fr5XJtfec=;
 b=XGMMyMMn2fwpSbdlAHmaQocscb7soKa25XDtelo5S84WhtgUFWol2mQHHsY4qrgGBo
 7lRwENYQzahHu3h1SiGuEdySxzZkKBpMtt2WGfqrc1fC2FQlCHHqMEMxErXmkOc6VB84
 0HCOn7ZuxAXIQOoma7fCk2qTJCgiD/73pZx5FlbaFVyaT3nHSK6PlbntPpTf788i62z/
 fTaWvsedq7rduQNcjwDoaI66TuUGid5EGNEodzmLwy9b2freHFPvbPzsSmGavIwduLyd
 cpVKr6FF2SuF+85PsctVkkyJxx7nSVWkHHvUv0Z9BlQ21JjQM1Cn2KRPMjZJX3tbqg38
 GIjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779893530; x=1780498330;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GysSj+xcxKb96SCtQcauT9ZCA24G3J8cy9Fr5XJtfec=;
 b=R7ImsboRHMLQLzz9xtguB0yI2RG518Kfypaz0v5457VyuJiQ/ylBUtAGS/O8E0Mxuj
 VSgQvxXcPgT0oSd1c35T05cMBazDRNyMZbru8vBz/bpkNhi4+Urcrefn+sj2x7/3UCgl
 5Xzpr6MWidvprvmMHOn7qiaeUoU77paESQKfjwj33Sh3WTFtBmNrycAMWY4p7Aj8r5vf
 L1RQKHK01Yr+K3Rj31KtLvVceLzwBHarKIevwmMXo3mdtBbN8NKnaEmW9/HMYXeXnb1r
 slJvWBUKEb6AKMxrXVcADnOPhUFWlsJJ/PEVjOT9wzASN1s/D78I2tF/3hCRIYxmtAmJ
 Wj+g==
X-Forwarded-Encrypted: i=1;
 AFNElJ8AoVfKGCUymm2iTiF99tUmn54VwKnjwkovU1C9oYLohx9XTdWn/OogjXFkezR6OPVNTM6at5ipavoglA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzppenNqdtgroiZ5Zz+R7ISbYuDO54JmP2xlzNJLYlH10JJaYsb
 o6tfGTGw3glTaKr596FVjp8Wc48WAIRlaei3798SBJ4uEiyi9OgIzqJQroXeriIqmDA=
X-Gm-Gg: Acq92OHxeHV+mDVps6To6DUsE3du0OT2yoHi3xLLW/1QMYvVxc+NT/SozBWjccHkRAI
 WBMzsSjS4i0axHsHye00CtSPAPUuvDZ0sUeeN0Yh+fYuThjsjB53wtU7hIRdXTr1mqE8YiRo540
 2xJ+CkaiLuaS9+FZvwwL6ivygun9KqeoTmKyEQF/+A5Dxj52o5TI4TyiWRbKPyZYnBdEsiMBGbH
 3sU8pZh46Clz1VfzpLxF3nQXYrrwAGpzY+ajdoIv3qZKstkQepxZ/Pk/oFKP04k+vqx+eovzaoE
 SC0iAb5oULeEFXrXyr2Zjac8XDB32dBKfQhtrxNpsXJrzxoWAUMKgO9vScuXT+ymH2fW64WK4Ms
 2k2ejTuepq7RmQnE7800Ue1JYLMdOug/toQ7BY18Zf3u00uxmVh4h06VeE9T6MpU95sX/aQAf15
 8MXjXpG1V/dR92HfyiuAS3Z4zWiBKc8KG7wx4mgw==
X-Received: by 2002:a17:90b:3fcb:b0:367:c442:3f20 with SMTP id
 98e67ed59e1d1-36a6762cebdmr25100604a91.19.1779893529666; 
 Wed, 27 May 2026 07:52:09 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:9466:b49b:cd0e:2dac])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-36a721c7baasm19906738a91.9.2026.05.27.07.52.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 May 2026 07:52:08 -0700 (PDT)
Date: Wed, 27 May 2026 08:52:06 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Ben Levinsky <ben.levinsky@amd.com>
Message-ID: <ahcFFkc2b0Pq9icR@p14s>
References: <20260514162129.1504162-1-ben.levinsky@amd.com>
 <20260514162129.1504162-3-ben.levinsky@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260514162129.1504162-3-ben.levinsky@amd.com>
Cc: daniel.baluta@nxp.com, imx@lists.linux.dev, magnus.damm@gmail.com,
 linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com,
 geert+renesas@glider.be, tanmay.shah@amd.com, linux-remoteproc@vger.kernel.org,
 andersson@kernel.org, Frank.Li@nxp.com, linux-renesas-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, kernel@pengutronix.de,
 festevam@gmail.com, s.hauer@pengutronix.de,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 2/5] remoteproc: switch exact-match
 drivers to wc-ioremap callbacks
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
X-Spamd-Result: default: False [3.89 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[linaro.org:s=google];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[linaro.org : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ben.levinsky@amd.com,m:daniel.baluta@nxp.com,m:imx@lists.linux.dev,m:magnus.damm@gmail.com,m:linux-kernel@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:geert+renesas@glider.be,m:tanmay.shah@amd.com,m:linux-remoteproc@vger.kernel.org,m:andersson@kernel.org,m:Frank.Li@nxp.com,m:linux-renesas-soc@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:kernel@pengutronix.de,m:festevam@gmail.com,m:s.hauer@pengutronix.de,m:linux-arm-kernel@lists.infradead.org,m:magnusdamm@gmail.com,m:mcoquelinstm32@gmail.com,m:geert@glider.be,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mathieu.poirier@linaro.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.938];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mathieu.poirier@linaro.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[nxp.com,lists.linux.dev,gmail.com,vger.kernel.org,glider.be,amd.com,kernel.org,st-md-mailman.stormreply.com,pengutronix.de,lists.infradead.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,renesas];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,amd.com:email,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 3B8B15E645A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 14, 2026 at 09:21:26AM -0700, Ben Levinsky wrote:
> Replace the exact-match carveout map and unmap callbacks in the
> existing remoteproc drivers with the common wc-ioremap helpers. This
> covers xlnx_r5_remoteproc, rcar_rproc, st_remoteproc, stm32_rproc,
> imx_rproc, and imx_dsp_rproc.
> 
> Leave the zynqmp R5 TCM callbacks alone because they also clear the
> mapped memory and are therefore not exact matches for the shared
> helpers.
> 
> Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be> # renesas
> ---
>  drivers/remoteproc/imx_dsp_rproc.c      | 36 ++++---------------
>  drivers/remoteproc/imx_rproc.c          | 32 ++---------------
>  drivers/remoteproc/rcar_rproc.c         | 33 ++---------------
>  drivers/remoteproc/st_remoteproc.c      | 31 ++--------------
>  drivers/remoteproc/stm32_rproc.c        | 34 ++----------------
>  drivers/remoteproc/xlnx_r5_remoteproc.c | 47 +++----------------------
>  6 files changed, 18 insertions(+), 195 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> index 008741af9f11..2d9f14fbef1d 100644
> --- a/drivers/remoteproc/imx_dsp_rproc.c
> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> @@ -644,32 +644,6 @@ static void imx_dsp_rproc_free_mbox(struct imx_dsp_rproc *priv)
>  	mbox_free_channel(priv->rxdb_ch);
>  }
>  
> -static int imx_dsp_rproc_mem_alloc(struct rproc *rproc,
> -				   struct rproc_mem_entry *mem)
> -{
> -	struct device *dev = rproc->dev.parent;
> -	void *va;
> -
> -	va = ioremap_wc(mem->dma, mem->len);
> -	if (!va) {
> -		dev_err(dev, "Unable to map memory region: %pa+%zx\n",
> -			&mem->dma, mem->len);
> -		return -ENOMEM;
> -	}
> -
> -	mem->va = va;
> -
> -	return 0;
> -}
> -
> -static int imx_dsp_rproc_mem_release(struct rproc *rproc,
> -				     struct rproc_mem_entry *mem)
> -{
> -	iounmap(mem->va);
> -
> -	return 0;
> -}
> -
>  /**
>   * imx_dsp_rproc_add_carveout() - request mailbox channels
>   * @priv: private data pointer
> @@ -700,8 +674,10 @@ static int imx_dsp_rproc_add_carveout(struct imx_dsp_rproc *priv)
>  
>  		/* Register memory region */
>  		mem = rproc_mem_entry_init(dev, NULL, (dma_addr_t)att->sa,
> -					   att->size, da, imx_dsp_rproc_mem_alloc,
> -					   imx_dsp_rproc_mem_release, "dsp_mem");
> +					   att->size, da,
> +					   rproc_mem_entry_ioremap_wc,
> +					   rproc_mem_entry_iounmap,
> +					   "dsp_mem");
>  
>  		if (mem)
>  			rproc_coredump_add_segment(rproc, da, att->size);
> @@ -732,8 +708,8 @@ static int imx_dsp_rproc_add_carveout(struct imx_dsp_rproc *priv)
>  		/* Register memory region */
>  		mem = rproc_mem_entry_init(dev, NULL, (dma_addr_t)res.start,
>  					   resource_size(&res), da,
> -					    imx_dsp_rproc_mem_alloc,
> -					    imx_dsp_rproc_mem_release,
> +					   rproc_mem_entry_ioremap_wc,
> +					   rproc_mem_entry_iounmap,
>  					   "%.*s", strchrnul(res.name, '@') - res.name, res.name);
>  		if (!mem)
>  			return -ENOMEM;
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 7f54322244ac..6249815b54d8 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -600,35 +600,6 @@ static void *imx_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *i
>  	return va;
>  }
>  
> -static int imx_rproc_mem_alloc(struct rproc *rproc,
> -			       struct rproc_mem_entry *mem)
> -{
> -	struct device *dev = rproc->dev.parent;
> -	void *va;
> -
> -	dev_dbg(dev, "map memory: %p+%zx\n", &mem->dma, mem->len);
> -	va = ioremap_wc(mem->dma, mem->len);
> -	if (IS_ERR_OR_NULL(va)) {
> -		dev_err(dev, "Unable to map memory region: %p+%zx\n",
> -			&mem->dma, mem->len);
> -		return -ENOMEM;
> -	}
> -
> -	/* Update memory entry va */
> -	mem->va = va;
> -
> -	return 0;
> -}
> -
> -static int imx_rproc_mem_release(struct rproc *rproc,
> -				 struct rproc_mem_entry *mem)
> -{
> -	dev_dbg(rproc->dev.parent, "unmap memory: %pa\n", &mem->dma);
> -	iounmap(mem->va);
> -
> -	return 0;
> -}
> -
>  static int imx_rproc_sm_lmm_prepare(struct rproc *rproc)
>  {
>  	struct imx_rproc *priv = rproc->priv;
> @@ -692,7 +663,8 @@ static int imx_rproc_prepare(struct rproc *rproc)
>  		/* Register memory region */
>  		mem = rproc_mem_entry_init(priv->dev, NULL, (dma_addr_t)res.start,
>  					   resource_size(&res), da,
> -					   imx_rproc_mem_alloc, imx_rproc_mem_release,
> +					   rproc_mem_entry_ioremap_wc,
> +					   rproc_mem_entry_iounmap,
>  					   "%.*s", strchrnul(res.name, '@') - res.name,
>  					   res.name);
>  		if (!mem)
> diff --git a/drivers/remoteproc/rcar_rproc.c b/drivers/remoteproc/rcar_rproc.c
> index 3c25625f966d..e3121fadd292 100644
> --- a/drivers/remoteproc/rcar_rproc.c
> +++ b/drivers/remoteproc/rcar_rproc.c
> @@ -19,35 +19,6 @@ struct rcar_rproc {
>  	struct reset_control *rst;
>  };
>  
> -static int rcar_rproc_mem_alloc(struct rproc *rproc,
> -				 struct rproc_mem_entry *mem)
> -{
> -	struct device *dev = &rproc->dev;
> -	void *va;
> -
> -	dev_dbg(dev, "map memory: %pa+%zx\n", &mem->dma, mem->len);
> -	va = ioremap_wc(mem->dma, mem->len);
> -	if (!va) {
> -		dev_err(dev, "Unable to map memory region: %pa+%zx\n",
> -			&mem->dma, mem->len);
> -		return -ENOMEM;
> -	}
> -
> -	/* Update memory entry va */
> -	mem->va = va;
> -
> -	return 0;
> -}
> -
> -static int rcar_rproc_mem_release(struct rproc *rproc,
> -				   struct rproc_mem_entry *mem)
> -{
> -	dev_dbg(&rproc->dev, "unmap memory: %pa\n", &mem->dma);
> -	iounmap(mem->va);
> -
> -	return 0;
> -}
> -
>  static int rcar_rproc_prepare(struct rproc *rproc)
>  {
>  	struct device *dev = rproc->dev.parent;
> @@ -73,8 +44,8 @@ static int rcar_rproc_prepare(struct rproc *rproc)
>  		mem = rproc_mem_entry_init(dev, NULL,
>  					   res.start,
>  					   resource_size(&res), da,
> -					   rcar_rproc_mem_alloc,
> -					   rcar_rproc_mem_release,
> +					   rproc_mem_entry_ioremap_wc,
> +					   rproc_mem_entry_iounmap,
>  					   res.name);
>  
>  		if (!mem)
> diff --git a/drivers/remoteproc/st_remoteproc.c b/drivers/remoteproc/st_remoteproc.c
> index a07edf7217d2..486180cdccb4 100644
> --- a/drivers/remoteproc/st_remoteproc.c
> +++ b/drivers/remoteproc/st_remoteproc.c
> @@ -88,33 +88,6 @@ static void st_rproc_kick(struct rproc *rproc, int vqid)
>  		dev_err(dev, "failed to send message via mbox: %d\n", ret);
>  }
>  
> -static int st_rproc_mem_alloc(struct rproc *rproc,
> -			      struct rproc_mem_entry *mem)
> -{
> -	struct device *dev = rproc->dev.parent;
> -	void *va;
> -
> -	va = ioremap_wc(mem->dma, mem->len);
> -	if (!va) {
> -		dev_err(dev, "Unable to map memory region: %pa+%zx\n",
> -			&mem->dma, mem->len);
> -		return -ENOMEM;
> -	}
> -
> -	/* Update memory entry va */
> -	mem->va = va;
> -
> -	return 0;
> -}
> -
> -static int st_rproc_mem_release(struct rproc *rproc,
> -				struct rproc_mem_entry *mem)
> -{
> -	iounmap(mem->va);
> -
> -	return 0;
> -}
> -
>  static int st_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
>  {
>  	struct device *dev = rproc->dev.parent;
> @@ -138,8 +111,8 @@ static int st_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
>  			mem = rproc_mem_entry_init(dev, NULL,
>  						   (dma_addr_t)res.start,
>  						   resource_size(&res), res.start,
> -						   st_rproc_mem_alloc,
> -						   st_rproc_mem_release,
> +						   rproc_mem_entry_ioremap_wc,
> +						   rproc_mem_entry_iounmap,
>  						   "%.*s",
>  						   strchrnul(res.name, '@') - res.name,
>  						   res.name);
> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> index 632614013dc6..7ac8265b60ac 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -113,35 +113,6 @@ static int stm32_rproc_pa_to_da(struct rproc *rproc, phys_addr_t pa, u64 *da)
>  	return -EINVAL;
>  }
>  
> -static int stm32_rproc_mem_alloc(struct rproc *rproc,
> -				 struct rproc_mem_entry *mem)
> -{
> -	struct device *dev = rproc->dev.parent;
> -	void *va;
> -
> -	dev_dbg(dev, "map memory: %pad+%zx\n", &mem->dma, mem->len);
> -	va = (__force void *)ioremap_wc(mem->dma, mem->len);
> -	if (IS_ERR_OR_NULL(va)) {
> -		dev_err(dev, "Unable to map memory region: %pad+0x%zx\n",
> -			&mem->dma, mem->len);
> -		return -ENOMEM;
> -	}
> -
> -	/* Update memory entry va */
> -	mem->va = va;
> -
> -	return 0;
> -}
> -
> -static int stm32_rproc_mem_release(struct rproc *rproc,
> -				   struct rproc_mem_entry *mem)
> -{
> -	dev_dbg(rproc->dev.parent, "unmap memory: %pa\n", &mem->dma);
> -	iounmap((__force __iomem void *)mem->va);
> -
> -	return 0;
> -}
> -
>  static int stm32_rproc_of_memory_translations(struct platform_device *pdev,
>  					      struct stm32_rproc *ddata)
>  {
> @@ -237,8 +208,8 @@ static int stm32_rproc_prepare(struct rproc *rproc)
>  			mem = rproc_mem_entry_init(dev, NULL,
>  						   (dma_addr_t)res.start,
>  						   resource_size(&res), da,
> -						   stm32_rproc_mem_alloc,
> -						   stm32_rproc_mem_release,
> +						   rproc_mem_entry_ioremap_wc,
> +						   rproc_mem_entry_iounmap,
>  						   "%.*s", strchrnul(res.name, '@') - res.name,
>  						   res.name);
>  			if (mem)
> @@ -957,4 +928,3 @@ MODULE_DESCRIPTION("STM32 Remote Processor Control Driver");
>  MODULE_AUTHOR("Ludovic Barre <ludovic.barre@st.com>");
>  MODULE_AUTHOR("Fabien Dessenne <fabien.dessenne@st.com>");
>  MODULE_LICENSE("GPL v2");
> -

Spurious change.

> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
> index 45a62cb98072..e5d1903c9636 100644
> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
> @@ -447,45 +447,6 @@ static int zynqmp_r5_rproc_stop(struct rproc *rproc)
>  	return ret;
>  }
>  
> -/*
> - * zynqmp_r5_mem_region_map()
> - * @rproc: single R5 core's corresponding rproc instance
> - * @mem: mem descriptor to map reserved memory-regions
> - *
> - * Callback to map va for memory-region's carveout.
> - *
> - * return 0 on success, otherwise non-zero value on failure
> - */
> -static int zynqmp_r5_mem_region_map(struct rproc *rproc,
> -				    struct rproc_mem_entry *mem)
> -{
> -	void __iomem *va;
> -
> -	va = ioremap_wc(mem->dma, mem->len);
> -	if (IS_ERR_OR_NULL(va))
> -		return -ENOMEM;
> -
> -	mem->va = (void *)va;
> -
> -	return 0;
> -}
> -
> -/*
> - * zynqmp_r5_rproc_mem_unmap
> - * @rproc: single R5 core's corresponding rproc instance
> - * @mem: mem entry to unmap
> - *
> - * Unmap memory-region carveout
> - *
> - * return: always returns 0
> - */
> -static int zynqmp_r5_mem_region_unmap(struct rproc *rproc,
> -				      struct rproc_mem_entry *mem)
> -{
> -	iounmap((void __iomem *)mem->va);
> -	return 0;
> -}
> -
>  /*
>   * add_mem_regions_carveout()
>   * @rproc: single R5 core's corresponding rproc instance
> @@ -522,8 +483,8 @@ static int add_mem_regions_carveout(struct rproc *rproc)
>  			rproc_mem = rproc_mem_entry_init(&rproc->dev, NULL,
>  							 (dma_addr_t)res.start,
>  							 resource_size(&res), res.start,
> -							 zynqmp_r5_mem_region_map,
> -							 zynqmp_r5_mem_region_unmap,
> +							 rproc_mem_entry_ioremap_wc,
> +							 rproc_mem_entry_iounmap,
>  							 "%.*s",
>  							 strchrnul(res.name, '@') - res.name,
>  							 res.name);
> @@ -560,8 +521,8 @@ static int add_sram_carveouts(struct rproc *rproc)
>  		rproc_mem = rproc_mem_entry_init(&rproc->dev, NULL,
>  						 dma_addr,
>  						 len, da,
> -						 zynqmp_r5_mem_region_map,
> -						 zynqmp_r5_mem_region_unmap,
> +						 rproc_mem_entry_ioremap_wc,
> +						 rproc_mem_entry_iounmap,
>  						 sram->sram_res.name);
>  		if (!rproc_mem) {
>  			dev_err(&rproc->dev, "failed to add sram %s da=0x%x, size=0x%lx",
> -- 
> 2.34.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
