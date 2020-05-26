Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C141E1C9A
	for <lists+linux-stm32@lfdr.de>; Tue, 26 May 2020 09:57:26 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D8D26C36B23;
	Tue, 26 May 2020 07:57:25 +0000 (UTC)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6E965C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 May 2020 07:57:24 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id x6so5802952wrm.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 May 2020 00:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=f4CVXpIwbYA1/rSO3By0QAy5Aok5IdKGfU45oFxadek=;
 b=t5FQ5+tazNQZsu+Wc06IXbeyHxcZj04wOnM1WAOZod74jk0nVN+HvZzxoUv6Dz7tsI
 EApI6/nxS/j2UONJ+N8D/YNKcNnNSA6Xm5bRC28FTWy46oex7A7mQ6BMELMNQs4wc3Fq
 9yI0xDi7xVi7P9vfcei2EAKKljYXwHgjtiHk9yeXjLTW0DjfQYLbUiUMYkueG8npr5YO
 ZN+HNILf+FzKYTZ2Wk/Wkg5PVV6F9ejS/1DWzrGFd4q3EWqxBxUMdXLUSuqsBA2+XJDN
 VOiJtBaucsQF58wwW0ai/ukJlm72bo7w0CD+ufxxLvroTcQEKIOCU2Sh+yO81YHi3v3G
 D1jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=f4CVXpIwbYA1/rSO3By0QAy5Aok5IdKGfU45oFxadek=;
 b=DVNgj5o0u/uruisfcFMtXqiA4lnn+Rldc+Af5wKlQI/Q5OuvkS+rZ/hXm2o6XPsnzv
 kLYHIjHYVUyTYJGeWq1bLQcpyZExIvgJm1BquYZvAZxnORTzzPb+ToTrxz15NuXTeEe1
 Fe9NXhEal8LjLCm2TEdj3Hbu/kvDoAucUbM/4iKY47jJnHnPR1mF/1TqdZ3lOdPj1E43
 EivqShQXHtdoPnyNzX9H8Fig2k43Ua1vrJ5o/EsLTwCdxjA2KMC2ESUsLbPyBKVG/oh3
 zGGXRU2XnrolruQ2Th9/SGhbu7mOnUvucFelMDe894lUxQdMu7PoVn/KklS/BUIECHbr
 Jm7g==
X-Gm-Message-State: AOAM532djbFdKbRfsCBWjGhK9HhLjs2tpYwddEOhRsIAFGEmUHGfli8+
 aNq4ZSz7LFMGOqmYuKGqi6lRvw==
X-Google-Smtp-Source: ABdhPJzl4RWw8izusLBGpeBBKAIALyCyKMKS4tx46Usuii5EVZ40Iz2jybqnYKnh8NS7Yl2OGR4tvg==
X-Received: by 2002:adf:fd49:: with SMTP id h9mr19360150wrs.67.1590479843845; 
 Tue, 26 May 2020 00:57:23 -0700 (PDT)
Received: from dell ([95.149.164.102])
 by smtp.gmail.com with ESMTPSA id j68sm217211wrj.28.2020.05.26.00.57.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2020 00:57:22 -0700 (PDT)
Date: Tue, 26 May 2020 08:57:21 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Amelie Delaunay <amelie.delaunay@st.com>
Message-ID: <20200526075721.GE3628@dell>
References: <20200422090833.9743-1-amelie.delaunay@st.com>
 <20200422090833.9743-2-amelie.delaunay@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200422090833.9743-2-amelie.delaunay@st.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 1/3] mfd: stmfx: reset chip on resume as
 supply was disabled
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gV2VkLCAyMiBBcHIgMjAyMCwgQW1lbGllIERlbGF1bmF5IHdyb3RlOgoKPiBTVE1GWCBzdXBw
bHkgaXMgZGlzYWJsZWQgZHVyaW5nIHN1c3BlbmQuIFRvIGF2b2lkIGEgdG9vIGVhcmx5IGFjY2Vz
cyB0bwo+IHRoZSBTVE1GWCBmaXJtd2FyZSBvbiByZXN1bWUsIHJlc2V0IHRoZSBjaGlwIGFuZCB3
YWl0IGZvciBpdHMgZmlybXdhcmUgdG8KPiBiZSBsb2FkZWQuCj4gCj4gRml4ZXM6IDA2MjUyYWRl
OTE1NiAoIm1mZDogQWRkIFNUIE11bHRpLUZ1bmN0aW9uIGVYcGFuZGVyIChTVE1GWCkgY29yZSBk
cml2ZXIiKQo+IFNpZ25lZC1vZmYtYnk6IEFtZWxpZSBEZWxhdW5heSA8YW1lbGllLmRlbGF1bmF5
QHN0LmNvbT4KPiAtLS0KPiAgZHJpdmVycy9tZmQvc3RtZnguYyB8IDcgKysrKysrKwo+ICAxIGZp
bGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspCgpBcHBsaWVkLCB0aGFua3MuCgotLSAKTGVlIEpv
bmVzIFvmnY7nkLzmlq9dCkxpbmFybyBTZXJ2aWNlcyBUZWNobmljYWwgTGVhZApMaW5hcm8ub3Jn
IOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQVJNIFNvQ3MKRm9sbG93IExpbmFybzogRmFj
ZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
