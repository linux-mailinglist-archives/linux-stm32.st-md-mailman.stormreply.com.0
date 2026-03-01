Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YCl4ClG5pGlwpwUAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sun, 01 Mar 2026 23:10:25 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E191D1CFB
	for <lists+linux-stm32@lfdr.de>; Sun, 01 Mar 2026 23:10:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 05107C030D6;
	Sun,  1 Mar 2026 22:10:24 +0000 (UTC)
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com
 [74.125.82.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 44FD8C2909A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  1 Mar 2026 22:10:22 +0000 (UTC)
Received: by mail-dy1-f182.google.com with SMTP id
 5a478bee46e88-2b4520f6b32so4223203eec.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 01 Mar 2026 14:10:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772403020; x=1773007820;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=nFjVWYC4aukpE9k+uYV7EwxrLAHwdFE4Qix6Wa9fAVI=;
 b=WcS4KuZ0zemRwdDAasDQ+3W/oDFBaf5fXA8FDM0oT4gonz8XwraoT2rnNSVbZ1ERP5
 WJmMQQUfT+poP/AvX0QZU/0jU5t39rdrluHnG/h4BFOw2NlaHFxdqaQ8KFXGexXx0RUx
 uXT8Nwm4fwXcum6lLQnfnTBnp88M+d0FdPZ/dApRP/RK2QOQf4dtHnu2NHc4xO7RPcz8
 0Vwhw3okX76T7j1/o0Bxm4sJnUyH5oC/krp7iPObsIUhFzS3yYeD9BZFKX4SDzcGorZG
 R3puQ3hl/Jknycjomybifnnf804V5hcrSILwZSJj21QKgq5Mp+uhiEpuGupEyuUaETcK
 u3dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772403020; x=1773007820;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nFjVWYC4aukpE9k+uYV7EwxrLAHwdFE4Qix6Wa9fAVI=;
 b=XaEcvQzVVAniBxZQNKVWoTLzxh+noeMXyEyQ4UAO++8HmMuhWoT+aBJrLeYdZ1vzQ1
 F++KsdVLqeN8XdPZvjZ8fKw5ldtv5Gq3g7mhzRhJjL1YdA5PK32LG7kgMhmqmwpkW64O
 2HeL7cLzFv/9hMLdfSIz44lQmbeTDa695qTwlpnVrSOWkLdQQZRB28/NvD4kvPnLV2Ol
 emQjwSL/Xj9JqLuWwjwwLB5BQLJqMsL0LI4VL1YSBhVyVuQtvZy7Oxd7hCqaQBcdliX0
 QFOUNnXcXu74PHBt0eGkI1i8qv9//YFwA/a44MwCNemHYNPfGQddmT3Hq+0OeOtnSWNC
 6p+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6zFHDccQ3RJY0ft9n4aqaJgl7w1QlUeB08DNJuel7qnrwe9A+eX4Wl+Pdz2+vVwUUiQZRDIrC6E3C8w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzMIUGZdyS/fWpN/yZNcUCjBH4Qzsf5dZG6EqrSBZCfjMrIasXz
 fX/NxYjbO81LiZcJUco3kbl//dOjLgiFa7QGFhaz7SxmFVuP64HuatZK
X-Gm-Gg: ATEYQzwfPSDkv+CbD7YJw1eQeK/xTwCgDQ7mbNQMu2EZt38ImRWE8iQYRF9+95oiYOY
 0jtdZHxvsMjtkSs/SqyFPPNyfU1M2tcvs7pyYJU9Uh9670NZ6nxX7ISXaRTzPsfLJNM479ta0sz
 a+8zeFr29s/bpHkKcv2MDFkY4+A+lqHp3juVDQ1VSk7Lr54RfWk31oGdewVXrCiX3MH9vilNTO2
 DWT1DnGZI+giR3VAuq3HA22wk7HMV3IaEWqjJggCmj2gvBqLyJX7Xex4xdWJofuCscd0S8+2T+V
 3v+coTni4tKb7BVqgZjgfYRktm7uFxkBfuKQk4+29BHMV5Pt5SbTaUECTTTMzUuWKsXfkc7HXJb
 bWIge+8l5wALRCJUpx7BDnirbgxfYnSTnRO51OFV+lCTyFNxrbR2+tYvZ2S7pAe18TFZ2caIJzt
 ehECEYv/mj2491Wyw1tgV7lKBgvU0myNfE8Onj0CU651T4vdwzhehp2/YUg3zxaxfr
X-Received: by 2002:a05:7300:6c25:b0:2be:e52:a3e2 with SMTP id
 5a478bee46e88-2be0e52a574mr617422eec.33.1772403020408; 
 Sun, 01 Mar 2026 14:10:20 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:864f:8513:57d0:4064])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2be12805b93sm1051546eec.15.2026.03.01.14.10.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Mar 2026 14:10:19 -0800 (PST)
Date: Sun, 1 Mar 2026 14:10:16 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Message-ID: <aaS4cQopqsQoS807@google.com>
References: <20260301-stmfts5-v1-0-22c458b9ac68@ixit.cz>
 <20260301-stmfts5-v1-9-22c458b9ac68@ixit.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260301-stmfts5-v1-9-22c458b9ac68@ixit.cz>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org,
 Petr Hodina <petr.hodina@protonmail.com>, David Heidelberg <david@ixit.cz>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-input@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, phone-devel@vger.kernel.org,
 Konrad Dybcio <konradybcio@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 09/10] Input: stmfts - support FTS5
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
	FORGED_RECIPIENTS(0.00)[m:devnull+david.ixit.cz@kernel.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:andersson@kernel.org,m:rydberg@bitmath.org,m:krzk@kernel.org,m:linux-kernel@vger.kernel.org,m:petr.hodina@protonmail.com,m:david@ixit.cz,m:mcoquelin.stm32@gmail.com,m:linux-input@vger.kernel.org,m:krzk+dt@kernel.org,m:phone-devel@vger.kernel.org,m:konradybcio@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:devnull@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,bitmath.org,protonmail.com,ixit.cz,gmail.com,st-md-mailman.stormreply.com,lists.infradead.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,david.ixit.cz,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: A5E191D1CFB
X-Rspamd-Action: no action

Hi David,

On Sun, Mar 01, 2026 at 06:51:23PM +0100, David Heidelberg via B4 Relay wrote:
> From: Petr Hodina <petr.hodina@protonmail.com>
> 
> Introduce basic FTS5 support.
> 
> FTS support SLPI and AP mode, introduce switch GPIO to switch between
> those two. Currently we can handle only full power AP mode, so we just
> switch to it.
> 
> Useful for devices like Pixel 3 (blueline).

I see "is_fts5" sprinkled throughout the code. I wonder: can we define
chip-specific operations and call them instead of doing conditional
logic which is hard to expand (if ever needed) to support additional
variants.
> 
> Nitpick: changed GPL v2 to GPL in module license.

Please split in to a separate patch.

Thanks.

-- 
Dmitry
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
