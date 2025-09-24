Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 87690B99335
	for <lists+linux-stm32@lfdr.de>; Wed, 24 Sep 2025 11:42:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D8FDFC36B19;
	Wed, 24 Sep 2025 09:42:15 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8FFC2C36B18
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Sep 2025 09:42:14 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-3ee1221ceaaso3821928f8f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Sep 2025 02:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758706934; x=1759311734;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uDYjbaYtR9X9/K9VwNWQp4yXt0BXnnN3Mgb8xKTG+Sc=;
 b=Fn4ylAB+KII1ZLv5mCCvgJGn5pWFZZBD6yOrUrSn5Rtkjm2RXyM9cNqvZHBfhE5BwF
 uVnzp122eXd0j3+uOamNTFEBlCDXxxUSFB730/xzP2XVW9wZR7WRDkPEHAQZvez4B8xD
 V0jGUTAvaV69L7cZVPIsZrteKWnGKfCPRF+dDr3KiT4T2GGhuEv1u3mNW7URMzxiu/Y/
 41uEtSDMpslHpFlD95M6YG1fc0OkKrJfZnCMWNwh2KGI+iZ7AaAv8WjYLXVL2XlEFEDb
 t+0h/IPo92iD4fbhjFej1VXrD/48OVIMf/iOGFvW5v/iTcB6xKVdxGZmODS8ZlH4Oyj5
 oEXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758706934; x=1759311734;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uDYjbaYtR9X9/K9VwNWQp4yXt0BXnnN3Mgb8xKTG+Sc=;
 b=RfDP+SkOZwhzj3omiktemBFD3t5UMrB0ZGI06OMQ2s8SeCyTBWfdPNXdwwA4v6VQGP
 T2ICNSwhR5lw0C6Xm3ex0Z6BKQwwMDBCHw9pMx3ZJwPfBgZ6NCArk+szggJNfbkgGLE6
 d0OSLk5fFrxT9K3LYOUidY+LAhFrz5EG8fCNtAsMH99bykmPKbkKaco7KDyZXbh2aE1F
 vY4Ib7PjIOQNojMuPIi7ndfacbscs6lvqTGxgW8KdWFKHBDNn5wLHOqahqEclwXuxh5k
 DjfFwAbYnEg6P2rQK8P+b3vIq9S8N8NVdtcsvrLMxoNFjSAx8eg/njEUeFS6WApwP3KN
 7qhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpS9ExZyR+sXrLkQKuD6dNPdd52u0PjopUyr4NsE5wePbtSySQOfU7YvMFlFkXS4TxUaEIr44cr7zaUg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyypZvtFLFwkJBHVinRDt4OsTH2WD/3Vt/hAcCyvyoOfEepCVsu
 W4rUuw5mL5R92XiuKBKWzs+soR58AZ1Ma9QcwIrF8wk3+dAKgNGL0xGj
X-Gm-Gg: ASbGncu+qe59ITbG5C5iqsuaClROI+FcnfLCHgGqi3N54kOD1xn0haVfs54jO9BnRBi
 6jALrNjCFASxqH3efpOd6lAeBHNpXzlPJKG5nzjHuHWREaZ3R/N1jS1YJJkiaOGBelN7aFIpZU2
 C5duQEkC++7Y0A5xJtu0jYkcgnjFyRMMWNdCuiMQk9jmLmEwhSkZjnKUj+0/Pq1m0LHwNWfJmHp
 6Y6hTRlongFsXadEG+pzWe48lZgfM7v8qDsLaA+2dthH+ri1mhg4hoFoBhAXYpXQDsLTXzJglO9
 PAY159+/DNV7iQ+NXKIBSX+eZn9L9QpIh4H4VHCnViweAoIws6uG5IqQ0dZrLG6OAWpwHyDdhyJ
 Tf16CRaNPD2S2UkCq+ujEZo68omOzxFiheClGlPLYMDtnxNKyVhZsjDcz3cFnUN0Yg1d4EPGiDp
 2Na83H4sKZLflvZMTtitnkroadYrtwi+NIHPCejO2KRtohhxHOyNvMhRtHB8th
X-Google-Smtp-Source: AGHT+IH91JwgVhi7xpvny99FXoN7tjt7AmIAW/YGtLT1L1J+48wCTADkEz6Cf/AvHGUdfI4k0/hLkA==
X-Received: by 2002:a05:6000:40c8:b0:3ea:c360:ff88 with SMTP id
 ffacd0b85a97d-405ca959751mr4813428f8f.31.1758706933633; 
 Wed, 24 Sep 2025 02:42:13 -0700 (PDT)
Received: from ?IPV6:2a02:8440:7503:805b:76:f865:8f03:23d3?
 (2a02-8440-7503-805b-0076-f865-8f03-23d3.rev.sfr.net.
 [2a02:8440:7503:805b:76:f865:8f03:23d3])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-402188ef7b2sm8909600f8f.34.2025.09.24.02.42.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Sep 2025 02:42:13 -0700 (PDT)
Message-ID: <841138c8-4fcc-4388-9639-391def0ebc5d@gmail.com>
Date: Wed, 24 Sep 2025 11:42:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julius Werner <jwerner@chromium.org>
References: <20250922-b4-ddr-bindings-v7-0-b3dd20e54db6@gmail.com>
 <20250922-b4-ddr-bindings-v7-1-b3dd20e54db6@gmail.com>
 <CAODwPW_oDTh9FdnLq7w2FPQv68ReAUUpssqEktUH5zhewbfcxg@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
In-Reply-To: <CAODwPW_oDTh9FdnLq7w2FPQv68ReAUUpssqEktUH5zhewbfcxg@mail.gmail.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>,
 devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v7 1/7] dt-bindings: memory: factorise
 LPDDR props into SDRAM props
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

T24gMjMvMDkvMjAyNSAwMDo0NSwgSnVsaXVzIFdlcm5lciB3cm90ZToKPj4gKyAgICAgIGxwZGRy
WCxZWSxaWlpaIG9yIGRkclgtWVlZWSxBQUFBLi4uLFpaIHdoZXJlIFgsIFksIGFuZCBaIGFyZSBp
biBsb3dlcgo+IAo+IEl0IGxvb2tzIGxpa2UgeW91IGFjY2lkZW50YWxseSBjaGFuZ2VkIGBscGRk
clgtWVksWlpaWmAgdG8gYGxwZGRyWCxZWSxaWlpaYD8KCllvdSdyZSByaWdodAoKQmVzdCByZWdh
cmRzLApDbMOpbWVudApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1h
bi9saXN0aW5mby9saW51eC1zdG0zMgo=
