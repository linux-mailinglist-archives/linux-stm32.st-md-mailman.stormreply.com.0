Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YGkKNp2ly2mhJwYAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 31 Mar 2026 12:44:45 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7C13683CF
	for <lists+linux-stm32@lfdr.de>; Tue, 31 Mar 2026 12:44:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2C228C8F287;
	Tue, 31 Mar 2026 10:44:45 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9505CC58D7A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Mar 2026 10:44:43 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-5a284984dc0so611194e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Mar 2026 03:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774953883; x=1775558683;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:references:to:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ltyTFwopAt48x4pgd03pJK6HEdSrWRvPeSYlpAsSeLU=;
 b=lw2KRYbApSJ9+RiBfRjafdnAQRSRFUyZOA7LdQA8wOeCEvPTLK71KRqoRN7wzzdUIJ
 HDC09m1fWORorpX2NWE7k1VVeXPbVTOUpWXvQyTpizLiRYB5ceGu/x4GMyq4HNCd092S
 7IX85c4tulhWRQ9Dmd1pMSvC1YCqnjaFX3tUQbfrO+Qe8N4YRnS4GNPjy1Ej+7OzgGya
 XZSi6kpWjT++YF7e7YFuuuAJDxIovjcQzgjCQ3Td7uGs1StubAQRGvy3yTnIvWf1y7tD
 HIKRjYY8YQylxv4q/o7z/OBqI8HTPDOd6XHD2NIUrDSexNQP1sdwSJghnK299k5ykBF8
 yohA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774953883; x=1775558683;
 h=content-transfer-encoding:in-reply-to:from:references:to:subject
 :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ltyTFwopAt48x4pgd03pJK6HEdSrWRvPeSYlpAsSeLU=;
 b=HeqHo7jk7vYL11+bZX2z22+OHEfPSpVC6GThZqdPVlzHAFlukA1DZV5I1jh+T/LVU1
 qWRCm4dwbZTTklFTqrHYNOC4h3Fx/rEEy1NUEL2N/G8mWld/ivJbcBo97nMpo9bkq0+D
 zewspscqZMLjRUVHSL1HB9+ZvYqKrKi6qfoex/qo9zt9D4rURFN1gn4yjUCCYUaaOTtL
 MFXtSEaUA7Nr1cV32HbecRuSoQA2e5Qc7hnIjDu3+cySNmFdy+dj8OzJL3v7ZYPNxphy
 JI2ptkcD9DzwzuyfLLQr4aNW5JcFhu5Cm0orBGyGq99Wex4W4hksIOXg0t58IBvB3Lvl
 RGNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTflAkjj80cEXgPpLnOuxxpK4Ej0C8UL+dP9A1qipvsJoL3AzwCJNkVanRYqRUZQQSEdQTsVJmfA8/DQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwI5IFRCf041V1zclom/7ogrDLax+bcf30++dZpWNPCs1/8h0FH
 t4NZl5zniunm785NaQPhXO0uHMEwhlra89Uwc2pJOVpH58Df3oYsZHulag0thL7Lo9U=
X-Gm-Gg: ATEYQzwufddRfZOCyUFp65RCe9xTyZ/5/cWqs7Pxju8V1SzOYyKYNsXdD4kyUBTMFov
 EiP1d4FiKZgz/f6C4ogsTBRVwUPOLclzD/URMVMfg15aVWMoUWv8jmtyJkQEYCg1wyOBt+d1Cfp
 QbzB7e2+/2cXRamn0czQ5euUPkDkyaaT/NSHLD+v5OiGPdMuIL7K4IzQ7Qxp14WoWcOZaKZK0Fm
 h9hesmSubJkjwa20hykeV+fG29tFPqphi1TWsZRaH0tRqBHqjM9xWZVXrdNAbZtNdW94c66NHjO
 c58OvK9URMwHq6bv/qAJKgn+5rGgCmi+Kc25xaCIlOisaE4m1rQxx3QmH72UmgOlygCbVYkO3fX
 Z1PrmMD4TDqdhp7nj0iBBxPO8dX7d+Uy6fE4iiwY5JOWAneYOLKSsUpDjRiZ1ae73mqbFoPwSI1
 PgVEzDpWpObBpjWF4FJmnZKCredfrIbvk22gZyEyYms7kA+Paa/L4bvRqj58g+/JOKITsjUoBjr
 oBDUA==
X-Received: by 2002:a05:6512:3b89:b0:5a2:b53b:a457 with SMTP id
 2adb3069b0e04-5a2b53ba55bmr1795381e87.3.1774953882760; 
 Tue, 31 Mar 2026 03:44:42 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi.
 [91.159.24.186]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a2b1403f69sm2330915e87.29.2026.03.31.03.44.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Mar 2026 03:44:42 -0700 (PDT)
Message-ID: <ebc7630e-c87f-4c17-a743-05e0639d5093@linaro.org>
Date: Tue, 31 Mar 2026 13:44:41 +0300
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
 <20260331091721.61613-4-krzysztof.kozlowski@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260331091721.61613-4-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [Linux-stm32] [PATCH 2/2] clk: qcom: Constify list of critical
	CBCR registers
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[linaro.org : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krzysztof.kozlowski@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,baylibre.com,gmail.com,foss.st.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[vladimir.zapolskiy@linaro.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,qualcomm.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,linaro.org:email,linaro.org:mid,stormreply.com:email,stormreply.com:url]
X-Rspamd-Queue-Id: 6D7C13683CF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/31/26 12:17, Krzysztof Kozlowski wrote:
> The static array 'xxx_critical_cbcrs' contains probe match-like data and
> is not modified: neither by the driver defining it nor by common.c code
> using it.
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
