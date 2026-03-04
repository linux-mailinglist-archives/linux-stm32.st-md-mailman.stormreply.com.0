Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2CC4Fyu8p2nfjQAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 04 Mar 2026 05:59:23 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E35071FACDD
	for <lists+linux-stm32@lfdr.de>; Wed, 04 Mar 2026 05:59:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 50311C5A4C5;
	Wed,  4 Mar 2026 04:59:22 +0000 (UTC)
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com
 [74.125.82.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AA4DBC055F4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Mar 2026 04:59:20 +0000 (UTC)
Received: by mail-dy1-f173.google.com with SMTP id
 5a478bee46e88-2be1ab1fa7dso3135896eec.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 03 Mar 2026 20:59:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772600359; x=1773205159;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=EDBrUhFaFc7wQVcSeZc1Bi9PtbigcT50WYnul0mkrvw=;
 b=DicyBrE1iLBPNTDu5hmAeoh6d5AGHLcEgDLbj7Q5KnSHtVlTn3E36E3pWRV3mZ3TIF
 DFlrxHkyQLy7IEkatI9nwafGmmpRklce8DXeLycp01gT3rh5eNKrV1r6VO/LmiCYZ08q
 +VSz06hp+8Gz84h0pUkNmhlMAk2UtmA1xrZwLAYqJFncYk7zN8gwgWrXj6DXR0k53Cao
 QeU04PMlHNSayMylcFoid916RP0OxIEhyIVtQqxeBiZ372YD/T6Km6G87QJ2gXK8iRNW
 vHmRXl5nDHYJTKuv+JHP8QTDvSf7ZGoEMk8yKE9eGUbxCO15fVIYx3fsyOd6nVCMDkss
 owkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772600359; x=1773205159;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EDBrUhFaFc7wQVcSeZc1Bi9PtbigcT50WYnul0mkrvw=;
 b=ok++kaRAR59FhOv84kPPybVl0lHvFeEe8oLZhqdZeEGbDqKpgyAvRusCJelzJPyQdm
 OFMgTv+zUYxapc1QyiKIvM3tCUoWeOy7SRAq0hGeJyyrUqF2PSy3Az6S51OWRA6zf5V9
 PxUCQg7Du2beOp8rmGzNgrqsNE11KbZDuoKUDR4tZ1pYEdiFfDx1gftLDT6DvcakPd6n
 +0M6OXHNcihoyMegO6LcbSoPhVcdoTzkhfz1lQvYZvPtqVUqFQ5zXlTVqyN9WPXXRImC
 wiVZlrL6XqSTk43oHK3TZdGET6QhrN9xR3/QvvYS3w8nuQmD8AhWlwmxBfWcJmqyBX+A
 62+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0c2h3oyfoZVE8FJvego0qC4/IJBNDKwv2M53si2ROhaS00Ll3UMNOWvx7fkQz0FnhRWSvO38bi8Wd4Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw2upkgdQ96tG93xzqI6laVzWJbo9J1ya+8ZKDEGbf1w7VKuszU
 Wd1Ixs8TeFD+RzJwjrsL8GuXH1h0YJfamQA+8atgxedS0XgyWiQlZB0R
X-Gm-Gg: ATEYQzyFwLpzAI81uzR2SBt0nIM735oaKFeMi0/4rUkx84t0OI5DhH1t0KQ0NSWZk0d
 7hLsZjnRt7CKBU1Yfz6TkFBcYdhdjqfNH8T/66Z5GrYkqNHh59oOYaPNvpa244VWKMgs0TZ8d6a
 0yB6NFuvhw3cVOtvifQTvB8yQW6UmbA1vZT+g1rEaPWkbgGO5UZ7hSaKf2JY3vA6L0uwPUqDett
 bObrr8RQlaU+fpIEyI2A5A6l9ugapharjFtCsaYXVCOGhTi0mKx1BD80eA2AHzkyU2MhO3HzReX
 eof+jEEVr/Ad/Snfmt0d7CouiolgS2MTvmhaX3D6x38Sd8pt/RCb34QddbmjRHImVYEasEHSRy6
 9RKG7CRAsFzA2cpZr3c5SDPNhyfO0ji3pmza1erOf4SX2WX9h4GG0DYEhuFwumMIsoLx3mNAujf
 68N3hi+Fhzwyyv3FUjjnV4RoaFsMXakCveOecTgtq21CcJFU6wgvcaQiGoGrgc3mtH
X-Received: by 2002:a05:7300:a887:b0:2bd:b961:7e8b with SMTP id
 5a478bee46e88-2be310975famr422928eec.24.1772600358821; 
 Tue, 03 Mar 2026 20:59:18 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:a048:d9ec:d217:7d59])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2be1ce921dasm3981312eec.10.2026.03.03.20.59.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 20:59:18 -0800 (PST)
Date: Tue, 3 Mar 2026 20:59:15 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: david@ixit.cz
Message-ID: <aae7zuSkAgNaciUK@google.com>
References: <20260301-stmfts5-v1-0-22c458b9ac68@ixit.cz>
 <20260301-stmfts5-v1-3-22c458b9ac68@ixit.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260301-stmfts5-v1-3-22c458b9ac68@ixit.cz>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org,
 Petr Hodina <petr.hodina@protonmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-input@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, phone-devel@vger.kernel.org,
 Konrad Dybcio <konradybcio@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 03/10] Input: stmfts - abstract reading
 information from the firmware
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
X-Rspamd-Queue-Id: E35071FACDD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[dmitrytorokhov@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:david@ixit.cz,m:robh@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:andersson@kernel.org,m:rydberg@bitmath.org,m:krzk@kernel.org,m:linux-kernel@vger.kernel.org,m:petr.hodina@protonmail.com,m:mcoquelin.stm32@gmail.com,m:linux-input@vger.kernel.org,m:krzk+dt@kernel.org,m:phone-devel@vger.kernel.org,m:konradybcio@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.644];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,bitmath.org,protonmail.com,gmail.com,st-md-mailman.stormreply.com,lists.infradead.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Action: no action

On Sun, Mar 01, 2026 at 06:51:17PM +0100, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Improves readability and makes splitting power on function in following
> commit easier.
> ---

Missing signed-off-by...

Thanks.

-- 
Dmitry
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
