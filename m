Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6LFgAGyly2mhJwYAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 31 Mar 2026 12:43:56 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 99FEE368392
	for <lists+linux-stm32@lfdr.de>; Tue, 31 Mar 2026 12:43:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 14F51C8F287;
	Tue, 31 Mar 2026 10:43:55 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3600FC58D7A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Mar 2026 10:43:54 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-5a277d9c5b2so831706e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Mar 2026 03:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774953833; x=1775558633;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:references:to:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iTRjFtodY6zz6hsjwtMEZh9oRqLgaEJ+snOXbwMDaaE=;
 b=uLSE6PhEw8MNHW2vuCIlbErYGmYnOPaz9c+azUfrlA1kjSTA2JvwrO5CyTeLNlNeGP
 THzCLkzzNZ71ql9mRO6fPBK0zUM0B9y9JJrslS7yJclKJ7lgzPEvDg5ip6wBeGNY2Kzh
 wiS/dpP3zAW0gnYpPd7y45BBjuVkAc0Fgvg2JDvlNWsYThcNOByV++DMTYx9YfQFw+lt
 WmnOJjf0LCE20gTNQ103l8j5m4fRIvoECtH033SHLDmx2oqXSRSMrBzDUl0DXDMFcr7x
 V3iM3EAtwwSgbaOu4BeIjB5bH5vlKekor8U2p/x25EhOH/ML7tIgg/fkBW42SEWNofqn
 FedQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774953833; x=1775558633;
 h=content-transfer-encoding:in-reply-to:from:references:to:subject
 :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iTRjFtodY6zz6hsjwtMEZh9oRqLgaEJ+snOXbwMDaaE=;
 b=pBS4Q+ZtuzPL5vaUMbYszSwOPvfCITZFhYVfhXP2eMOHmPQ5yDGvDPChGP3VKxvQ62
 iVV6m+1EVB7eHvUxx5x0+Uj2JXmYIrA6mUNuTJz65p+lmL4Hak8hq0OImpHxvkIpKAsz
 f/guVqTGuZUFg8SMAPmF+WWlnuvdGwXpvmepYZi+VtrcHycFjoKGoyQ7k2eKwYdZetaO
 0itYsI0oVqL1csCIVyLFfP3bc91wTGzlcrhgdoIvZadBpzKiXd/Mgz5EEOQUIpFh5krJ
 98duJVYCnfpvB7fcNgfAi+PTQMyBBZVriw9sIhljNmtq10lVB9anzzoUdiJd3CklMCXL
 VFJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVCJIwC2xQgsrhBOwxOjhuPo0Pb70zZQlRTbnRrirvJ9CWDvMeT1Ioq/tf0Csf5+RguPMxyKfKAgsa3w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yxl5gvwPP40bABkH8fWYhCS7/Op9I+I/bXKFQY315wT2KFAmMRc
 BlkxcsqPjCN4Mhr/gYaausybLHSrT/NeIBsEriBt1tv+Mw/RZ77/1O8gDoJjckAtF3Y=
X-Gm-Gg: ATEYQzxA0+6NpOgUAAbmx+kTZC+OeTxA24XEM/4hK4iyUzzoDdJJgiNeb85VK3+UECH
 76AiDo3yUnH/P92lqbzB2497un/iZoj7upPBw9Ge1p7M1qJnsJbLQdBrehkZUJLXuLZDDOLSElb
 jyIzzNu/CqqGkJWcg8h8z/hupZEFCgzwupvb5MbuxvgiiRfDo0P92iIq70t3fPwrgQIEtmNtdAI
 QVWOhL1AHhHfQSF2VZ3cgoLYqE7E9c8XSPIjJHwPiTEzxQRM6FEE91vvpbvyRHqmz2J8ciJZ269
 XVP3g3pQpzoj8Iae5pmaoNgUANiQ5Zl+Ct7wjaxuTNlwCUP9xfvGNzEg1i51Z36VUa0uKLHbTp1
 YJiIttbxC2l8wwA1Fry56IBb9rgBaTYvtoNt/c5QNUcMg79BtHcKGnWkNSeOwewzhv2stUNXNMM
 2bajjKwCzQn25L9M3pYWKXVOYnfXEb4H+Npe137Db6/lnAd07WHBDn6Hbc0alIxhsRRNkae1Lcl
 x6V0w==
X-Received: by 2002:a05:6512:4022:b0:5a2:82b9:afb7 with SMTP id
 2adb3069b0e04-5a2ab5fa11fmr2488669e87.2.1774953833180; 
 Tue, 31 Mar 2026 03:43:53 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi.
 [91.159.24.186]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a2b13fd008sm2350070e87.19.2026.03.31.03.43.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Mar 2026 03:43:52 -0700 (PDT)
Message-ID: <040edb24-3689-404e-b16b-c3ead54aba19@linaro.org>
Date: Tue, 31 Mar 2026 13:43:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20260331091721.61613-3-krzysztof.kozlowski@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260331091721.61613-3-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [Linux-stm32] [PATCH 1/2] clk: qcom: Constify
	qcom_cc_driver_data
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
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[linaro.org:s=google];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[linaro.org : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,baylibre.com,gmail.com,foss.st.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	FORGED_SENDER(0.00)[vladimir.zapolskiy@linaro.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krzysztof.kozlowski@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.935];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[linaro.org:-];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:email,stormreply.com:url,stm-ict-prod-mailman-01.stormreply.prv:helo,qualcomm.com:email,st-md-mailman.stormreply.com:rdns,linaro.org:email,linaro.org:mid]
X-Rspamd-Queue-Id: 99FEE368392
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/31/26 12:17, Krzysztof Kozlowski wrote:
> The static 'struct qcom_cc_driver_data' contains probe match-like data
> and is not modified: neither by the driver defining it nor by common.c
> code using it.
> 
> Make it const for code safety and code readability.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
