Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DE488B99496
	for <lists+linux-stm32@lfdr.de>; Wed, 24 Sep 2025 12:00:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7464BC36B19;
	Wed, 24 Sep 2025 10:00:21 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D2AFDC36B18
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Sep 2025 10:00:19 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-3ef166e625aso3765945f8f.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Sep 2025 03:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758708019; x=1759312819;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qmVW+Z/mziG0ZeCkjmpV+S/k8DcMMNx/U++MptcSCGo=;
 b=KTMj+xBloYF+/OSbspXxU+W08ZLQiTHFPHarZRe5rSWS46HgcnpKq5S1EbMZsfJ9E/
 R52207tL+qAaiotIv60rZKERvwheST3fRz/al3QvkBXnTnPBR53kWPSHIkS2+cDccleY
 3JJ8A/ewlmMBER3qDwC7dcMU8FidXkpaWlcENdbFhnUHZR2K7P2loseX25VweQXKkPz5
 xea9JGsQRY59CqhoYWiZDkNpukMsdZAwNt9LT/EC3esE6IOoAesAe9VT7qiwsSChzycV
 KAmscGuTEQn8XuoIp4fHta+GxzVYA99xHJ3IfFotC+5Up+QD2H0XofR9lnYicNsL3Rly
 plVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758708019; x=1759312819;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qmVW+Z/mziG0ZeCkjmpV+S/k8DcMMNx/U++MptcSCGo=;
 b=WC+abmAj2l725uG5m1xXlRRlBT6Cf1ChwsKAsw3DGcXr8CrroraDn786c3f4lPtcT7
 OX0sOmkEc2bJwM1iK4QR0vCUA4YPXACC4IUsmaWCNANMBSa3hIDWN6hjgAFtvCrrRcvr
 johCoeHbgYBfavo+D5FgntyQJWCAALHnz0SxPy9wxYQ1xu+N3uiiI2cxkLTO2PcFgePu
 DVgiEJ3AstLUJbC9+8iWQQT8LRUevA/2h1SVivD6Up2zhahUkpN7TEDYKHd8lwa2D+1p
 TXPausUoLxZclOK/mvH2l4sKF++46HTqABOZdEb2mV7wIc44JIBGfDuZ41f5xSQVK5wk
 HEIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4qHLpVR8hB4lnhiCrKWuDQQGAbObs0bG7i0F4ZxSuIvEEZxAW1crUsPV1eMeF/lyof4yWJbLhSa+waQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxN9H9BPaoto3g2RMQBXFvcwH5NzP+pBbhr3ZQFhtHEOJgFiC2Q
 +3GqnBl5/vZNn7RkePf+0fqV/22HpKnKj+quyme9VkxJ7Rf9cpC+PuRH
X-Gm-Gg: ASbGncuFIYDZXWLSt0t2mT6nj9hbIts4MrOKrwHpBA+fA8bRGReVP8RuSMt9INNm8zk
 GVCmFFxtE2QQcYomyChsyqVH7FQ5qIpJOBVCPM//HZHSgPFnpB62HumO1IC5p6vrASnLDAHJQ7n
 aWWpYl+YmIUzbRYSLo7BEqA7d14Q67gKGjFQZr6YT2sS2xBl0lTQQ6eToHBRxK1I4NNYz+NBN+J
 JXhdG0cxyR7Md5WRnrPfnn98XZ7VD3ItYAGuKeKKbSG84fRX3BMeZU0lLX1c0Oq7jIKB1VZotAe
 JB+qbQu2RGtfpdXQl+pMNJ6gga/v65UcNpaefWaMsn2Vgz6yheGOLIoAmmxUIIWN9EggxkTux8P
 2cwtOHnUppGbs3i+ZWvc/KC7Ge6dFnzGfTPF5RflFP+V5OqK2cBhmBGSSbYLoMd/riwIsnJFwKX
 beg4vGzdQAGiYdGgMPSi7K28lgNm7PfjUwsJ7S3l+BpgDrrx1qD4Gzzw+m9EzK
X-Google-Smtp-Source: AGHT+IG42+8OH08VTgLUl9F1YLwdDI/MKRqmfZxK/ji2sSckzPzSa7uie7TpTd+qAIdz3qyFVuJLPw==
X-Received: by 2002:a05:6000:2082:b0:401:5ad1:682 with SMTP id
 ffacd0b85a97d-405c46c242amr5543802f8f.14.1758708019030; 
 Wed, 24 Sep 2025 03:00:19 -0700 (PDT)
Received: from ?IPV6:2a02:8440:7503:805b:76:f865:8f03:23d3?
 (2a02-8440-7503-805b-0076-f865-8f03-23d3.rev.sfr.net.
 [2a02:8440:7503:805b:76:f865:8f03:23d3])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3ee073f4f3csm26375517f8f.2.2025.09.24.03.00.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Sep 2025 03:00:18 -0700 (PDT)
Message-ID: <430e9fad-a877-4328-848f-59b982a10706@gmail.com>
Date: Wed, 24 Sep 2025 12:00:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julius Werner <jwerner@chromium.org>
References: <20250922-b4-ddr-bindings-v7-0-b3dd20e54db6@gmail.com>
 <20250922-b4-ddr-bindings-v7-2-b3dd20e54db6@gmail.com>
 <CAODwPW9Js2AjSzQrvRFMK3xHXjbb6qV2bGEj3GhYWpDELniyCQ@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
In-Reply-To: <CAODwPW9Js2AjSzQrvRFMK3xHXjbb6qV2bGEj3GhYWpDELniyCQ@mail.gmail.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>,
 devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v7 2/7] dt-bindings: memory: introduce DDR4
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

T24gMjMvMDkvMjAyNSAwMDo1MSwgSnVsaXVzIFdlcm5lciB3cm90ZToKPj4gKyAgICAgIC0gcGF0
dGVybjogIl5kZHI0LVswLTlhLWZdezR9LFthLXpdezEsMTB9LFswLTlhLWZdezJ9JCIKPiAKPiBJ
IGRvbid0IHJlYWxseSB1bmRlcnN0YW5kIHdoeSB0aGVyZSBjYW4gb25seSBiZSB1cCB0byAxMCBj
aGFyYWN0ZXJzIGluCj4gdGhlIG1vZHVsZSBwYXJ0IG51bWJlci4gSSBhbHNvIGRvbid0IHVuZGVy
c3RhbmQgd2h5IHlvdSB3cm90ZSAiMjAKPiBieXRlcyAoMTAgY2hhcnMpIiBmb3IgdGhpcyBpbiB0
aGUgcHJldmlvdXMgcGF0Y2guIEFyZSB5b3UgYXNzdW1pbmcKPiB0aGF0IG1vZHVsZSBwYXJ0IG51
bWJlcnMgYXJlIFVURjE2TEU/IEFjY29yZGluZyB0byBteSByZWFkaW5nIG9mIHRoZQo+IHNwZWMs
IGl0IHNvdW5kcyBsaWtlIHRoZXkncmUgc3VwcG9zZWQgdG8gYmUgcGxhaW4gQVNDSUksIGkuZS4g
MjAgYnl0ZXMKPiBzaG91bGQgYmUgYWJsZSB0byBjb250YWluIHVwIHRvIDIwIGNoYXJzLgoKSGkg
SnVsaXVzLAoKWWVzIHBsYWluIEFTQ0lJIG5lZWRzIDggYml0cyBmb3IgZWFjaCBjaGFyIGFzIHRo
ZSB2YWx1ZSByYW5nZSBpcyAwLTEyNwpJIHdhcyBoYXZpbmcgaGV4YWRlY2ltYWwgaW4gbWluZCB3
aGlsZSB3cml0aW5nIHRoaXMsIEknbSBzb3JyeS4KSSdsbCBmaXggaXQgaGVyZSBhbmQgaW4gdGhl
IHByZXZpb3VzIHBhdGNoLgoKQmVzdCByZWdhcmRzLApDbMOpbWVudApfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QK
TGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
