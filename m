Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iHMjNs0OeWmHuwEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Jan 2026 20:15:25 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 586BD99B75
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Jan 2026 20:15:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DFB73C01FBF;
	Tue, 27 Jan 2026 19:15:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DFDF9C36B3D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Jan 2026 19:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=+1dnhRLMtu5/XnmCGlow67PwZlHIqJ0tA39/W+z0sa4=; b=nVfyn7gNVN46zpKefERfl0P78F
 qqk4M4PqywOmVjgz096jYEBxIyHPFepOJq44+uCvDUX/LRjfqHLKERY6bgrKiFdqgqiRf8WELZAAj
 hG2sYe81JS3R5/20qG6xBSdUssacygS1XMQFVuUiWZkjNmAb2gbI8Pdnc8mvHy2k5y5Ek670b62mU
 BdzV6w1i5aQ/hgxhWXQlLKNjgAiBeNnMeaFOonoyiagngR+2i0Dae+jojwPIIs1AY/9ouLVNavuAP
 aEzXD/tIWI1kEISc56BfN6wyvmUKay9wzfA21W1bO4J8kOtvu35R3XJp55Y6k/Mz8uIjZHneEcYr8
 VI0VZ/Wg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vkoX1-0000000EtmN-2ijV; Tue, 27 Jan 2026 19:15:19 +0000
Message-ID: <d46a7e44-cddf-425c-a233-911c2d949b9b@infradead.org>
Date: Tue, 27 Jan 2026 11:15:17 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Leo Yan <leo.yan@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 James Clark <james.clark@linaro.org>
References: <20260127-fix_stm_kconfig-v2-1-3c067e00f82e@arm.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260127-fix_stm_kconfig-v2-1-3c067e00f82e@arm.com>
Cc: coresight@lists.linaro.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2] stm class: Fix Kconfig symbols
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
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[infradead.org:s=bombadil.20210309];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[infradead.org : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[arm.com,linux.intel.com,gmail.com,foss.st.com,linuxfoundation.org,linaro.org];
	FORGED_SENDER(0.00)[rdunlap@infradead.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:leo.yan@arm.com,m:alexander.shishkin@linux.intel.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:gregkh@linuxfoundation.org,m:james.clark@linaro.org,m:coresight@lists.linaro.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[infradead.org:-];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,infradead.org:mid,arm.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 586BD99B75
X-Rspamd-Action: no action

On 1/27/26 10:14 AM, Leo Yan wrote:
> Kconfig symbols must not include the CONFIG_ prefix.  Remove the CONFIG_
> prefix for default values to work.
> 
> The STM_PROTO_SYS_T config is selected by default when STM is enabled.
> However, its description currently says "If you don't know what this is,
> say N," which contradicts the default behavior.  Update the description
> to say "Y" to align with the default setting.
> 
> Fixes: a02509f301c6 ("stm class: Factor out default framing protocol")
> Fixes: d69d5e83110f ("stm class: Add MIPI SyS-T protocol support")
> Signed-off-by: Leo Yan <leo.yan@arm.com>

Greg has already merged a patch to fix the symbols:
https://patch.msgid.link/20251228190502.2480758-1-rdunlap@infradead.org


> ---
> Changes in v2:
> - Updated STM_PROTO_BASIC description to align with default selection
>   (James).
> - Link to v1: https://lore.kernel.org/r/20251217-fix_stm_kconfig-v1-1-531fb3674549@arm.com
> ---
>  drivers/hwtracing/stm/Kconfig | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hwtracing/stm/Kconfig b/drivers/hwtracing/stm/Kconfig
> index eda6b11d40a1f9ab49a1ec1e6faae8ee178c5ed3..8ab079785189052945521e9b0a93a0d458de37e0 100644
> --- a/drivers/hwtracing/stm/Kconfig
> +++ b/drivers/hwtracing/stm/Kconfig
> @@ -13,7 +13,7 @@ if STM
>  
>  config STM_PROTO_BASIC
>  	tristate "Basic STM framing protocol driver"
> -	default CONFIG_STM
> +	default STM
>  	help
>  	  This is a simple framing protocol for sending data over STM
>  	  devices. This was the protocol that the STM framework used
> @@ -28,7 +28,7 @@ config STM_PROTO_BASIC
>  
>  config STM_PROTO_SYS_T
>  	tristate "MIPI SyS-T STM framing protocol driver"
> -	default CONFIG_STM
> +	default STM
>  	help
>  	  This is an implementation of MIPI SyS-T protocol to be used
>  	  over the STP transport. In addition to the data payload, it
> @@ -38,7 +38,7 @@ config STM_PROTO_SYS_T
>  	  The receiving side must be able to decode this protocol in
>  	  addition to the MIPI STP, in order to extract the data.
>  
> -	  If you don't know what this is, say N.
> +	  If you don't know what this is, say Y.
>  
>  config STM_DUMMY
>  	tristate "Dummy STM driver"
> 
> ---
> base-commit: fcb70a56f4d81450114034b2c61f48ce7444a0e2
> change-id: 20251216-fix_stm_kconfig-a72f40c7612c
> 
> Best regards,

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
