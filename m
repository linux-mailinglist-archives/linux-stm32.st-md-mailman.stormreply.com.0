Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FBDB269BD
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Aug 2025 16:41:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 72A9BC349C6;
	Thu, 14 Aug 2025 14:41:38 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1B4C5C36B3F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Aug 2025 14:40:41 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-3b9e415a68eso547842f8f.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Aug 2025 07:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755182441; x=1755787241;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8eKDxpRJVTIzyGI66oWlYnjcg0q+lXbGUZBFK9SZ3r8=;
 b=DIOwPhZSXYNYBgUjQovwHY2M96OFc/RUB+1azHY2XcQGJOECdccPRWQwPatGiDFyqG
 OLVqUNMdmrXE6N+XX+sbQ8v9XlDLa0O8QMH2zAMH8Ur+r41SfXpBjJR2HeJMF/sDRer1
 GLAuKK/yw2ENp8Cfi7xcGrtrQ+C2Z3BBdci2j2PhuP/zQMt9E0/G02x3ZfXMfVaCjH3b
 /a2ppTFAV2T2TcIjXunwgzjOAaHMvxVtgyWG7BGoypAktBp/6ZNjG1TfPzcyQ4uOkNhe
 33n0lHkJpqW9MZWEy5yXMtVF+0hkVda1lJkJqJ+N8eLOCmU8iaoY574KaVNcbJw6QrYM
 TDYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755182441; x=1755787241;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8eKDxpRJVTIzyGI66oWlYnjcg0q+lXbGUZBFK9SZ3r8=;
 b=YSRriMsYyk3617r9PHcnLO0qpW2OSXwciYKlrMj1QzRhFd631oyha681e18wKaPJO2
 HtaMRrdtvSWo9T5wPJPXbmIvhFPYGburHpYB54U3Yc+fTlhcpYTEszc1bwm51J2UoKo8
 CghK3JjsJfXrMRs6LYtfXdIwibnMrt3AuqQ0roNG/yGDu2zpT3xAXWLWJSxbAi4AwAky
 31qHsalNdIuvqCTGKieXJn2Msr0qrVoVY8Q2tBD0GjMqT4i6I+GsBwK9K/8E8DeDaGfc
 H7fngvexcxG6XXMFHuYLFDedW/zydgcAgmOA7A8OPFlgTu2bJurFL4BQ/EETGSp6Kr0J
 Cx5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/qjzsiMU7FRRXFlEAdeLJ5b2HLsULb3zVh+pgIo9JUr0RQ1kJE6HNRExfi+N26MboYdtDuhf1IR9qMg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxobseL6b1aRWO/mDcArPqzsDk9/FvHvXG2aHdDAp+HIZs7KO2r
 UerbK+pmAsUpQ4zE0eoWv2kxuC+HcTeLXNjNzOnu3HX5STsPE/6GICvidKD3d1E38yM7lg==
X-Gm-Gg: ASbGncuJ43d+cMbnbl4G4gmy9lb89v+qoOqvd8LYG7xn93soIDDB42YfvsH1gYp3UHi
 hjaCszf/c/H+krozZU8lJBEYftBtCs+oB/jm8j29uPrsBFAcQ3DzGQ+LM0WzkLAncdJVmAzshRj
 5qWS/sgJEEivHk0GCUzOBTfwCvP0HNxtF3xMtATZSKBjcqnBdzSLFLoHX41jIvFHqphvm7YkDXa
 La1+ja+GriZOgBCS+i2cKZQsaTa7J/JJZ8ImEgMz1i91FK4tQT+LXp9BdX125bxRrPwMObCgzUB
 QpR0cuqwu+Wr8eh4QQY/Cuc3tRummKC1QGN0VIOQtIjCbeZCxCTiYOApn30jxHuf2FWqlPT03yw
 2jO5pSUcufA4rStcMV6OlilvtzOKiMNZDQiRJzMQZbk7FfvIRQsbiEXrpWy1yETjpqYCW+04PoS
 P96UXGQD3UvwB7er7pwUzUym/GVLMKvL6Kk45b3M0LcqjUk51lqgxsU0bdv1Cnx8dv
X-Google-Smtp-Source: AGHT+IGIl6W6nr22Y4YoVoUfpGIRuQbb/HUttEupcp6PwkaGiEDhgt7ofHOiURySJSgcpN1jAaaG6Q==
X-Received: by 2002:a05:6000:4006:b0:3b7:98bc:b856 with SMTP id
 ffacd0b85a97d-3b9edf5b3bemr3100715f8f.41.1755182441060; 
 Thu, 14 Aug 2025 07:40:41 -0700 (PDT)
Received: from ?IPV6:2a01:cb08:941b:4c00:f383:4db2:82a:81e9?
 (2a01cb08941b4c00f3834db2082a81e9.ipv6.abo.wanadoo.fr.
 [2a01:cb08:941b:4c00:f383:4db2:82a:81e9])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45a1b1d4220sm17216425e9.0.2025.08.14.07.40.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Aug 2025 07:40:40 -0700 (PDT)
Message-ID: <05cc39e7-9ec1-4ac1-903d-873f77c3c79d@gmail.com>
Date: Thu, 14 Aug 2025 16:40:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julius Werner <jwerner@chromium.org>,
 =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
References: <20250728-ddrperfm-upstream-v5-0-03f1be8ad396@foss.st.com>
 <20250728-ddrperfm-upstream-v5-6-03f1be8ad396@foss.st.com>
 <CAODwPW8ZXfMdFL2=6ht+BvQq5_LQkwHhQJT5j9DcseEx9naXxg@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
In-Reply-To: <CAODwPW8ZXfMdFL2=6ht+BvQq5_LQkwHhQJT5j9DcseEx9naXxg@mail.gmail.com>
X-Mailman-Approved-At: Thu, 14 Aug 2025 14:41:37 +0000
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jonathan Corbet <corbet@lwn.net>, Stephen Boyd <sboyd@kernel.org>,
 linux-kernel@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 linux-doc@vger.kernel.org, linux-clk@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Will Deacon <will@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v5 06/20] dt-bindings: memory: introduce
	DDR4
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

SGkgSnVsaXVzLAoKT24gMzAvMDcvMjAyNSAyMDoyOSwgSnVsaXVzIFdlcm5lciB3cm90ZToKPj4g
K3RpdGxlOiBERFIzIFNEUkFNIGNvbXBsaWFudCB0byBKRURFQyBKRVNENzktNEQKPiAKPiBTaG91
bGQgdGhpcyBzYXkgRERSND8KWWVzLCBhYnNvbHV0ZWx5Lgo+IAo+PiArZXhhbXBsZXM6Cj4+ICsg
IC0gfAo+PiArICAgIGRkciB7Cj4+ICsgICAgICAgIGNvbXBhdGlibGUgPSAiZGRyNC1mZixmIiwg
ImplZGVjLGRkcjQiOwo+IAo+IFRoaXMgaXMgbm90IGEgdmFsaWQgZXhhbXBsZSBmb3IgdGhlIHdh
eSB5b3UncmUgZGVmaW5pbmcgaXQgbm93IGFueW1vcmUuClllcyB3aWxsIGZpeCBpdC4KCkJlc3Qg
cmVnYXJkcywKQ2zDqW1lbnQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21h
aWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
