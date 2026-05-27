Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SCT7GUvaF2phTQgAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 28 May 2026 08:01:47 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EA71B5ED176
	for <lists+linux-stm32@lfdr.de>; Thu, 28 May 2026 08:01:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9251EC8F28E;
	Thu, 28 May 2026 06:01:46 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B023AC36B3D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 May 2026 17:44:58 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id
 41be03b00d2f7-c82471904fcso4853347a12.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 May 2026 10:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779903897; x=1780508697;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=+IIwHB4tc8Zk/JmkEkdDm+906F5b3wX8vQAJk7Bu7kM=;
 b=QHnn/WHTvChH7S2AIn39wgmu9Ti/3umLDNvFfdEo/M1K+uBmBOA/lo2ZxhfK9uevtH
 OEZDCd826SnDPn8skXXqXVyA3g3pdjvVmOatSfLYLe8p4YFcVO8d7A8JazIUVm0h7ULA
 zwYrRj1uOzVgXqp64/PyH1zjfzPPYqbJBh3w3s9hEOxNM4bRP4yyOt4/7bpCQM11rnV/
 j5nNNtHZFDLvlW5JeK9YCsodsBaihxFxcsZtCYB18sZXKiVYT2hS+74O1Va0A5vHqqN/
 GyVtyDJ1X0yfWf3i3XKHklRCpidaUQuaT7guhESE7gA0NYrqs4CUnLVUf5te3pp7x6jI
 nvgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779903897; x=1780508697;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+IIwHB4tc8Zk/JmkEkdDm+906F5b3wX8vQAJk7Bu7kM=;
 b=f4ujhCOv5Ka5dMHtULPp7cW0mkQIxa5nKPhTFDmgthuWNCYjnAY2xxfr+comqqrqeb
 p1jamSTjJJcHRdhO5Q25Nk+5938L+Il374Iu8CDifvJej0mrQ9Wi/eR3YdXaSAP+lNN9
 8edJgibC+5O8bVM3aCUSMWuIi4oWJMK8eAf2k8juEKEBLZsTALgTGrAyvIUGvktbeR++
 Fw0pcsFVGvZFcGKBO8pteb18myygUV6GTGoe6GZ7pUBVZBmsJtOTVl65rptOKPOdBhVn
 kxEAuHX6H7m6aJMZAXwsVvjcULFf83RrXW9FVRTSb2mzzdFS3xpcZ3LyaTJVV7urrXLa
 4fRw==
X-Forwarded-Encrypted: i=1;
 AFNElJ8dAJbly8SGYf/O1hxZvy2z7/8ECN4DjmdZuqSeseYpeCPViGXzkxCog65iJAhMvghABCNTSslRNbFVUQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy1gAftl2RnUHWB3PIo5LcQo9t26sHKjbhKK8KkGgytyNx3BCeh
 +8fBalDDnYgoGheVMHpv9EjaBGnP0tc5Vjheha0LNtAVzAvvzavHUtgDvuA8xN0qANg=
X-Gm-Gg: Acq92OFE4AW83qwX1FwPbcBmqI6bm6qBKv0zWldC5Ie4n+lr7anyM6587Z6QsfEkS5A
 2CbDtnvvgcqwHaaYDXNPyM5nlkmP9ulXBCXvd3aSoKiqFHwFLwhxro28FD57+zAsNVi4Gqjjr4u
 XdReL2Yjhy5ymb4+PAJUqNUXCBHFCIDrlDuZ7Lu09K9ZE+fHiSAeq3lxKe4tOtdfAj22JQhbV4Q
 UzLVwM6wGKwd30s9HCW0LHbHskeWywEmYjRDtOKcj7gn6w44ovxseSOvY45VeGx9Q7tTD/gabik
 ND8mN/XIK/lrQPtL0u2kT1hZZYbHVQkM8jlHrRAxSB/xT95C/dOSR4G2d1ngUe2JwazOHJTUZ0z
 AnhXlbaMK1EYhMPYWIYPaMITZgNnsZstIreLIOjdrk6I+aS0ueCdEukWlhnj9xKlWSTJ/jvWc3v
 6CfPYiGSmnwK2LjW7L/Q5N5ZdoVWY=
X-Received: by 2002:a05:6a21:a06:b0:3a5:8542:61a4 with SMTP id
 adf61e73a8af0-3b329340e22mr25394375637.25.1779903896893; 
 Wed, 27 May 2026 10:44:56 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:9466:b49b:cd0e:2dac])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-841d70f17cbsm2814639b3a.45.2026.05.27.10.44.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 May 2026 10:44:56 -0700 (PDT)
Date: Wed, 27 May 2026 11:44:53 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Ben Levinsky <ben.levinsky@amd.com>
Message-ID: <ahctlW_4AKS6IHYt@p14s>
References: <20260514162129.1504162-1-ben.levinsky@amd.com>
 <20260514162129.1504162-6-ben.levinsky@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260514162129.1504162-6-ben.levinsky@amd.com>
X-Mailman-Approved-At: Thu, 28 May 2026 06:01:45 +0000
Cc: daniel.baluta@nxp.com, imx@lists.linux.dev, magnus.damm@gmail.com,
 linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com,
 geert+renesas@glider.be, tanmay.shah@amd.com, linux-remoteproc@vger.kernel.org,
 andersson@kernel.org, Frank.Li@nxp.com, linux-renesas-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, kernel@pengutronix.de,
 festevam@gmail.com, s.hauer@pengutronix.de,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 5/5] remoteproc: switch drivers to
 optional resource-table helper
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
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
	NEURAL_HAM(-0.00)[-0.911];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email]
X-Rspamd-Queue-Id: EA71B5ED176
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 14, 2026 at 09:21:29AM -0700, Ben Levinsky wrote:
> Use the shared optional resource-table helper in the remoteproc
> drivers that already treat a missing resource table as non-fatal:
> xlnx_r5_remoteproc, rcar_rproc, stm32_rproc, imx_rproc, and
> imx_dsp_rproc.
> 
> Keep thin local parse_fw() wrappers in each driver so the helper only
> centralizes the return-value handling. That lets each platform retain
> control over whether the missing-table case is logged and at what
> severity, while other parsing failures continue to propagate to the
> caller.
> 
> Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
> ---
>  drivers/remoteproc/imx_dsp_rproc.c      | 24 ++++++++++-----
>  drivers/remoteproc/imx_rproc.c          | 25 ++++++++-------
>  drivers/remoteproc/rcar_rproc.c         | 25 ++++++++-------
>  drivers/remoteproc/stm32_rproc.c        | 23 +++++++++-----
>  drivers/remoteproc/xlnx_r5_remoteproc.c | 41 +++++++++----------------
>  5 files changed, 73 insertions(+), 65 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> index 2d9f14fbef1d..2ff74f7938f6 100644
> --- a/drivers/remoteproc/imx_dsp_rproc.c
> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> @@ -954,14 +954,6 @@ static int imx_dsp_rproc_elf_load_segments(struct rproc *rproc, const struct fir
>  	return ret;
>  }
>  
> -static int imx_dsp_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
> -{
> -	if (rproc_elf_load_rsc_table(rproc, fw))
> -		dev_warn(&rproc->dev, "no resource table found for this firmware\n");
> -
> -	return 0;
> -}
> -

Why is this getting moved after imx_dsp_rproc_load()?


>  static int imx_dsp_rproc_load(struct rproc *rproc, const struct firmware *fw)
>  {
>  	struct imx_dsp_rproc *priv = rproc->priv;
> @@ -990,6 +982,22 @@ static int imx_dsp_rproc_load(struct rproc *rproc, const struct firmware *fw)
>  	return 0;
>  }
>  
> +static int imx_dsp_rproc_parse_fw(struct rproc *rproc,
> +				  const struct firmware *fw)
> +{
> +	int ret;
> +
> +	ret = rproc_elf_load_rsc_table_optional(rproc, fw);
> +	if (ret)
> +		return ret;
> +
> +	if (!rproc->table_ptr)
> +		dev_warn(&rproc->dev,
> +			 "no resource table found for this firmware\n");
> +
> +	return 0;
> +}
> +

I am not overly fond of having to check rproc->table_ptr for the printout.  How
about:

#define rproc_elf_load_rsc_table_optional(rproc, fw, dev_func, fmt, ...)        \
        ({                                                                      \
                int ret = rproc_elf_load_rsc_table(rproc, fw);                  \
                if (ret == -EINVAL) {                                           \
                        dev_func(&rproc->dev, fmt, ##__VA_ARGS__);              \
                        return 0;                                               \
                } else {                                                        \
                        return ret;                                             \
                }                                                               \
        })

in remoteproc_internal.h and something like:

static int imx_dsp_rproc_parse_fw(struct rproc *rproc,
                                  const struct firmware *fw)
{
        rproc_elf_load_rsc_table_optional(rproc, fw, dev_warn,
                "no resource table found for this firmware\n");
}

in the clients?

>  static const struct rproc_ops imx_dsp_rproc_ops = {
>  	.prepare	= imx_dsp_rproc_prepare,
>  	.unprepare	= imx_dsp_rproc_unprepare,
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 6249815b54d8..58c63f97ebf7 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -680,17 +680,6 @@ static int imx_rproc_prepare(struct rproc *rproc)
>  	return 0;
>  }
>  
> -static int imx_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
> -{
> -	int ret;
> -
> -	ret = rproc_elf_load_rsc_table(rproc, fw);
> -	if (ret)
> -		dev_info(&rproc->dev, "No resource table in elf\n");
> -
> -	return 0;
> -}
> -
>  static void imx_rproc_kick(struct rproc *rproc, int vqid)
>  {
>  	struct imx_rproc *priv = rproc->priv;
> @@ -768,6 +757,20 @@ imx_rproc_elf_find_loaded_rsc_table(struct rproc *rproc, const struct firmware *
>  	return rproc_elf_find_loaded_rsc_table(rproc, fw);
>  }
>  
> +static int imx_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
> +{
> +	int ret;
> +
> +	ret = rproc_elf_load_rsc_table_optional(rproc, fw);
> +	if (ret)
> +		return ret;
> +
> +	if (!rproc->table_ptr)
> +		dev_info(&rproc->dev, "No resource table in elf\n");
> +
> +	return 0;
> +}
> +
>  static const struct rproc_ops imx_rproc_ops = {
>  	.prepare	= imx_rproc_prepare,
>  	.attach		= imx_rproc_attach,
> diff --git a/drivers/remoteproc/rcar_rproc.c b/drivers/remoteproc/rcar_rproc.c
> index e3121fadd292..b7a39014b6bb 100644
> --- a/drivers/remoteproc/rcar_rproc.c
> +++ b/drivers/remoteproc/rcar_rproc.c
> @@ -55,17 +55,6 @@ static int rcar_rproc_prepare(struct rproc *rproc)
>  	}
>  }
>  
> -static int rcar_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
> -{
> -	int ret;
> -
> -	ret = rproc_elf_load_rsc_table(rproc, fw);
> -	if (ret)
> -		dev_info(&rproc->dev, "No resource table in elf\n");
> -
> -	return 0;
> -}
> -
>  static int rcar_rproc_start(struct rproc *rproc)
>  {
>  	struct rcar_rproc *priv = rproc->priv;
> @@ -99,6 +88,20 @@ static int rcar_rproc_stop(struct rproc *rproc)
>  	return err;
>  }
>  
> +static int rcar_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
> +{
> +	int ret;
> +
> +	ret = rproc_elf_load_rsc_table_optional(rproc, fw);
> +	if (ret)
> +		return ret;
> +
> +	if (!rproc->table_ptr)
> +		dev_info(&rproc->dev, "No resource table in elf\n");
> +
> +	return 0;
> +}
> +
>  static struct rproc_ops rcar_rproc_ops = {
>  	.prepare	= rcar_rproc_prepare,
>  	.start		= rcar_rproc_start,
> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> index 7ac8265b60ac..a4d42b755c74 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -232,14 +232,6 @@ static int stm32_rproc_prepare(struct rproc *rproc)
>  	}
>  }
>  
> -static int stm32_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
> -{
> -	if (rproc_elf_load_rsc_table(rproc, fw))
> -		dev_warn(&rproc->dev, "no resource table found for this firmware\n");
> -
> -	return 0;
> -}
> -
>  static irqreturn_t stm32_rproc_wdg(int irq, void *data)
>  {
>  	struct platform_device *pdev = data;
> @@ -623,6 +615,21 @@ stm32_rproc_get_loaded_rsc_table(struct rproc *rproc, size_t *table_sz)
>  	return (__force struct resource_table *)ddata->rsc_va;
>  }
>  
> +static int stm32_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
> +{
> +	int ret;
> +
> +	ret = rproc_elf_load_rsc_table_optional(rproc, fw);
> +	if (ret)
> +		return ret;
> +
> +	if (!rproc->table_ptr)
> +		dev_warn(&rproc->dev,
> +			 "no resource table found for this firmware\n");
> +
> +	return 0;
> +}
> +
>  static const struct rproc_ops st_rproc_ops = {
>  	.prepare	= stm32_rproc_prepare,
>  	.start		= stm32_rproc_start,
> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
> index e5d1903c9636..9b9f07d152e6 100644
> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
> @@ -664,33 +664,6 @@ static int add_tcm_banks(struct rproc *rproc)
>  	return ret;
>  }
>  
> -/*
> - * zynqmp_r5_parse_fw()
> - * @rproc: single R5 core's corresponding rproc instance
> - * @fw: ptr to firmware to be loaded onto r5 core
> - *
> - * get resource table if available
> - *
> - * return 0 on success, otherwise non-zero value on failure
> - */
> -static int zynqmp_r5_parse_fw(struct rproc *rproc, const struct firmware *fw)
> -{
> -	int ret;
> -
> -	ret = rproc_elf_load_rsc_table(rproc, fw);
> -	if (ret == -EINVAL) {
> -		/*
> -		 * resource table only required for IPC.
> -		 * if not present, this is not necessarily an error;
> -		 * for example, loading r5 hello world application
> -		 * so simply inform user and keep going.
> -		 */
> -		dev_info(&rproc->dev, "no resource table found.\n");
> -		ret = 0;
> -	}
> -	return ret;
> -}
> -
>  /**
>   * zynqmp_r5_rproc_prepare() - prepare core to boot/attach
>   * adds carveouts for TCM bank and reserved memory regions
> @@ -843,6 +816,20 @@ static int zynqmp_r5_detach(struct rproc *rproc)
>  	return 0;
>  }
>  
> +static int zynqmp_r5_parse_fw(struct rproc *rproc, const struct firmware *fw)
> +{
> +	int ret;
> +
> +	ret = rproc_elf_load_rsc_table_optional(rproc, fw);
> +	if (ret)
> +		return ret;
> +
> +	if (!rproc->table_ptr)
> +		dev_info(&rproc->dev, "no resource table found.\n");
> +
> +	return 0;
> +}
> +
>  static const struct rproc_ops zynqmp_r5_rproc_ops = {
>  	.prepare	= zynqmp_r5_rproc_prepare,
>  	.unprepare	= zynqmp_r5_rproc_unprepare,
> -- 
> 2.34.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
