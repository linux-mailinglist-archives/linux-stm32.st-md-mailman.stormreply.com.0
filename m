Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YAeCAvXwcGk+awAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Jan 2026 16:29:57 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE4459318
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Jan 2026 16:29:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3829BC349C4;
	Wed, 21 Jan 2026 15:29:56 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F392BC36B3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Jan 2026 15:29:54 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id
 5b1f17b1804b1-4801bc32725so34739475e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Jan 2026 07:29:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769009394; x=1769614194;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZVraHTvGYWHeUSeCM7zloSyYdx+u7Hx5nno7KP+9/hA=;
 b=qb9DuALqOo5+wldjytBQA+H6rKPWQJwIIxOKcS61eAQXC2RsJnrB5Y2Hdm8CMNHKbH
 7UrTDZesHh4L0CHPCGB99SV9zujTIQx7rW6SVHavK1T7vIsxAcgt/NzbxboW2gERlroc
 2/qO0TtCydX2u2ArmRDlbKDhklw3VIkjFQ8rrfVADj7mmdGoZ8uryxh4WXarbXYMaEpo
 VTYDNJErfDyeLW7TEOkXUCZGbcVoLV5DszYmozL6tH/xvUrelduf4SunOxznZJTM0gQr
 zMRojI6bQA3eLxg8Nit8rim28g9zLwVYvMwlwCaHXsaHiwWsUm23gV5n+beDm0yPs5LW
 f/Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769009394; x=1769614194;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZVraHTvGYWHeUSeCM7zloSyYdx+u7Hx5nno7KP+9/hA=;
 b=vOxFHux6bTG6WL8LH1V0A1Af3FwN8jbS8KStmptGI3MSjDEL8oRPh1DgjN9WQTm2K5
 JcVgfrajL4i1J7CUtVtHf6cC2aLnPVadMRpF/Qlq74CBMQGiKRajBFM3BRksxIxUrubA
 arJwbpMlIBS/f97VTxA8qLjj2kjaxoHDcai4HuT+1EvvVEyqlxs3XolWK2h6XqitFkl2
 FuGDUXD4XJKdNlrMzafBvMtQf1FUXja4jmoKHhLqZinQDxu7TwT6lLjpu7UihEXyPBCL
 uAlpiaARe6NXpDtWPbORxzarn8T7cfNxWGQMbNCjiZOUtp5A6/a9SG6jh9UP7O+3lGhe
 cjWg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrfdnEvnql9QHUb5076MIVI/VNtb+zSqc+cBpclA73y92Vx1vtzOmGQk8+DS+/pr1NabWUTksG9hPVMQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwbrcmYRW3a47c40+EqnIoPcJJd/bcbUEgzlP5/zb0yhAGme9wt
 X1IVIkFsJKBsaeTc/w6FabCya0dGwoyuQWMcY/M47hbpK/VZT8qbQ6JFEzqT3l74zBU=
X-Gm-Gg: AZuq6aLK5QmqZ8yQW2hjd7hTdoiPsKnLGoJC/QH4As42qwBwsnBkJVuNMd3Fci9ydAc
 e+RQyKM9WQag3EbFTR4MET/st88yZVJOEZg2WYqpngVwSoL1rJvgy3rq/YwrlO42lNhjbvhHlTx
 G4kSUsekTPOM8Wgp0C2GKvGVGJQqtHkk5X7I5tPBMZflat9n3HQOBs92NH6dxEWUFfwORj9Bq54
 c48WJZMpQ2PjkLMIL8Gu79Dbem3wyMqMP1Ap+TvQ3FAufIPuUvaI5hBy0u3s4iV4niWS+R5AfxQ
 AqVSzqOKNioXNP2v+LV7a0as8iufl+kTJBRhYUfAoN75xP4Mtm6xCJE35lFz0gEW6vssVQ6Pi48
 ztT5YjDSsuZDNemKUGR0W2IebdF+W8ID5G+4PaVefNhk5Cg4dGsumjTaDfwijRytG/MHOEctVkR
 OHbRxWBTQ9P4LkBxbdsBI0Fs+K+Vviuzc1ophBTIyLF33jE9y5hEZnMtZ62nGr+1ZX64XNwucP1
 A==
X-Received: by 2002:a05:600c:310e:b0:47d:885d:d2ff with SMTP id
 5b1f17b1804b1-4801eb11002mr229658175e9.29.1769009394082; 
 Wed, 21 Jan 2026 07:29:54 -0800 (PST)
Received: from ?IPV6:2a05:6e02:1041:c10:ebda:5627:9bc:1ede?
 ([2a05:6e02:1041:c10:ebda:5627:9bc:1ede])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-43596090493sm9305361f8f.25.2026.01.21.07.29.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jan 2026 07:29:53 -0800 (PST)
Message-ID: <9131900c-f095-4c2a-a6c6-15b875d5b8ec@linaro.org>
Date: Wed, 21 Jan 2026 16:29:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-pm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260114092808.273695-1-andriy.shevchenko@linux.intel.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20260114092808.273695-1-andriy.shevchenko@linux.intel.com>
Cc: Zhang Rui <rui.zhang@intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Lukasz Luba <lukasz.luba@arm.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v1 1/1] thermal: stm32: Use predefined
 HZ_PER_MHZ instead of a custom one
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Spamd-Result: default: False [3.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[linaro.org:s=google];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[linaro.org : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@linux.intel.com,m:linux-pm@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:rui.zhang@intel.com,m:mcoquelin.stm32@gmail.com,m:lukasz.luba@arm.com,m:rafael@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[daniel.lezcano@linaro.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:-];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[daniel.lezcano@linaro.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[intel.com,gmail.com,arm.com,kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	REDIRECTOR_URL(0.00)[twitter.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,intel.com:email,stormreply.com:email,stormreply.com:url,linaro.org:mid,linaro.org:url,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 9EE4459318
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gMS8xNC8yNiAxMDoyOCwgQW5keSBTaGV2Y2hlbmtvIHdyb3RlOgo+IFVzZSBwcmVkZWZpbmVk
IEhaX1BFUl9NSFogaW5zdGVhZCBvZiBhIGN1c3RvbSBvbmUuIE5vIGZ1bmN0aW9uYWwgY2hhbmdl
cy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmR5IFNoZXZjaGVua28gPGFuZHJpeS5zaGV2Y2hlbmtv
QGxpbnV4LmludGVsLmNvbT4KPiAtLS0KCkFwcGxpZWQsIHRoYW5rcwoKCi0tIAo8aHR0cDovL3d3
dy5saW5hcm8ub3JnLz4gTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFS
TSBTb0NzCgpGb2xsb3cgTGluYXJvOiAgPGh0dHA6Ly93d3cuZmFjZWJvb2suY29tL3BhZ2VzL0xp
bmFybz4gRmFjZWJvb2sgfAo8aHR0cDovL3R3aXR0ZXIuY29tLyMhL2xpbmFyb29yZz4gVHdpdHRl
ciB8CjxodHRwOi8vd3d3LmxpbmFyby5vcmcvbGluYXJvLWJsb2cvPiBCbG9nCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcg
bGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
