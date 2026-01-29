Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SCIiAJ6ne2lWHgIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 29 Jan 2026 19:31:58 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E20F4B398A
	for <lists+linux-stm32@lfdr.de>; Thu, 29 Jan 2026 19:31:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 76A94C01FBF;
	Thu, 29 Jan 2026 18:31:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 47EF5C36B12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Jan 2026 18:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=YGRHN0NuHwElPQUY8BXhrl0wGLg1RNdWY25QjXUQOmc=; b=OdaVR5gJx6pc0tyvMig3CXe2Uv
 c4Wgc4spSdcGCFHRJKbtfmqGLXmP+ip99uAk1kyqzprlh9CYlGkVeUdngcFQvteofNTH0DYF/FqPH
 D+ZFVyJ17aYY4sLASwxwIJiyJ7ttACh9Ekr20H3tlz7yv8xXwacW0AVGu9v+bIhUr09fiJk2lcuW9
 V4k8qISvnAOH0C460FKJY1kKKto5AaOI6qZF/iZSG8AVkqHNF2R5PY9xcf06KSAfRxDgyCOEQkKjO
 18hrPAQ88z65+wegtKGdKo2mNetw5SkDhDTaR04P7zI0iKoQbO619uIrYSX6YDYAyXMprnKX5KEEX
 izI1Gvig==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vlWo1-00000000WJV-0iC8; Thu, 29 Jan 2026 18:31:49 +0000
Message-ID: <0ed08d07-5736-4874-9a0f-0f848e8419b6@infradead.org>
Date: Thu, 29 Jan 2026 10:31:47 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yingchao Deng <yingchao.deng@oss.qualcomm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20260129-p_ost-v5-1-2b14fff39428@oss.qualcomm.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260129-p_ost-v5-1-2b14fff39428@oss.qualcomm.com>
Cc: linux-doc@vger.kernel.org, quic_yingdeng@quicinc.com,
 linux-kernel@vger.kernel.org, Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
 Jinlong Mao <jinlong.mao@oss.qualcomm.com>,
 Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-trace-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v5] stm: class: Add MIPI OST protocol
	support
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[infradead.org:s=bombadil.20210309];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[infradead.org : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,goodmis.org,kernel.org,efficios.com,lwn.net,linux.intel.com,gmail.com,foss.st.com];
	FORGED_SENDER(0.00)[rdunlap@infradead.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:yingchao.deng@oss.qualcomm.com,m:rostedt@goodmis.org,m:mhiramat@kernel.org,m:mathieu.desnoyers@efficios.com,m:corbet@lwn.net,m:alexander.shishkin@linux.intel.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:linux-doc@vger.kernel.org,m:quic_yingdeng@quicinc.com,m:linux-kernel@vger.kernel.org,m:yuanfang.zhang@oss.qualcomm.com,m:jinlong.mao@oss.qualcomm.com,m:tingwei.zhang@oss.qualcomm.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-trace-kernel@vger.kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[infradead.org:-];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:mid,stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: E20F4B398A
X-Rspamd-Action: no action



On 1/29/26 6:25 AM, Yingchao Deng wrote:
> diff --git a/drivers/hwtracing/stm/Kconfig b/drivers/hwtracing/stm/Kconfig
> index eda6b11d40a1..daa4aa09f64d 100644
> --- a/drivers/hwtracing/stm/Kconfig
> +++ b/drivers/hwtracing/stm/Kconfig
> @@ -40,6 +40,20 @@ config STM_PROTO_SYS_T
>  
>  	  If you don't know what this is, say N.
>  
> +config STM_PROTO_OST
> +	tristate "MIPI OST STM framing protocol driver"
> +	default CONFIG_STM

	default STM

Other places where you may have seen this (and copied it) already have
patches.

> +	help
> +	  This is an implementation of MIPI OST protocol to be used
> +	  over the STP transport. In addition to the data payload, it
> +	  also carries additional metadata for entity, better
> +	  means of trace source identification, etc.
> +
> +	  The receiving side must be able to decode this protocol in
> +	  addition to the MIPI STP, in order to extract the data.
> +
> +	  If you don't know what this is, say N.
> +

-- 
~Randy

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
