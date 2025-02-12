Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 101B4A32E6D
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Feb 2025 19:20:02 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AFC54C78F89;
	Wed, 12 Feb 2025 18:20:01 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B0E57C78034
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Feb 2025 18:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739384393;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bBV0Sy/rtjPKatjfVFGEaCghJwUWQiYq5g6kIT5vukg=;
 b=IbvXorM+5A1D+8ZiTZ8VNs54m0/03iT8IL7H0SSOne4GyIQwYQntwM/trh7EhlMnM+Sbj+
 tEZItqWmT1cKDlzEwWyOqjLuMNU11buX7G4rE0RC9GEUFJHLAhaPRVt5Yvwz9+S7LMnRl1
 /76vZFe+TTcF3rKAzXPlqvI77wCXQxE=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-597-TqKZMzNCP9CJhEGVSJwNHA-1; Wed, 12 Feb 2025 13:19:50 -0500
X-MC-Unique: TqKZMzNCP9CJhEGVSJwNHA-1
X-Mimecast-MFC-AGG-ID: TqKZMzNCP9CJhEGVSJwNHA
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-5de3d2a3090so6125816a12.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Feb 2025 10:19:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739384389; x=1739989189;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gZh4AjieEBhVpChkY/ZbfZf/JCY7uSfZ7yn1oUrifN0=;
 b=YI9qouuo3TAdlc9dEEg66XBw+I6pwbvYXAENKbjTTX5HOHbmxvv+V1aVfmVjJaC5SR
 6027dm/yKW9ZErsNzsUubnFJJ9LEBNThCTLrWBrddcCeC+0xICoAXDNR/V+adBHksm77
 BaUvgkQ2mZ60X/K0vfzqh9oezjO/+42IWHm2Pav2c1PE1AbqZrZoKy2zuFH4p4Z+veNy
 FhLP7qv8o+9Zwxcm8lK+5KDCT262EK+zis2M/nymnM1n2ZKI1GiKfZheUwW5GuzYFD51
 C0Jn6r0rL7SKdekl7n7UoBiWeuGzULvb3B/HYX74SM2yu1Ra/ZpLmcsYxng9Umr62gBG
 uyiQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcpeMF3tess8Tt08HRljyE4p8RwzKWdxC8pUdYVYVdxUiFCyL+mFpveO5EwCVKR/IucVXfbqDG8xqdtg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwT8tATTAFy9ACIfVqq/9vlYc4eEzhh/Sm8Up3AXvyBubXhiOmf
 OpZQ7huRzHjCQkWvI5wbKBXZuzdDpVssamGw/oM1KiFD5gdVvkUCUJGzEBWCwezdOOq5eGstFBR
 CTnGYweNXrD2qOVzAy7rjamdVFO3SFEER2sYpy3iPhxq/TNFgSq3Di/yAMbGkNR0ED8XEpbInb3
 iF4g==
X-Gm-Gg: ASbGnctI4LysW5lMENeM6kPHnxb4bsIyfZRrMtuQ/Xe1frDcpV+6fTK6158xvWOxlKq
 q2VWGf9F+pMzRiBaOQeqoKUhuuXP982vaQEYRLpid+y6AE/lLwHp6YziA7F3tgFyKrU/FDWxzbM
 +mKKbsNzt6aV3Fz5rMAn7SlLaxeknnZ4eQzHj3/uEIUcTKGSlvAb4eaG1DnUMrFC+dLPLq1SATH
 wQxO3NwNzA6e1qgauow43aKrq2MIggty0TwNQtu/2ot7pwqhnnu0S6m7gFuFx69umszQXswd0NT
 M8tV63vHrQBsnlhSrsWBjb+XCUtYGO3anJPn+POptadDTeRYNGkhdPycAptD6GnTU2oltepZISN
 TjNfsDd/XFlZb9I+8jdRFszyKk9uJqTlc6g==
X-Received: by 2002:a05:6402:4605:b0:5dc:8f03:bb5c with SMTP id
 4fb4d7f45d1cf-5deadd9217bmr3909061a12.11.1739384389359; 
 Wed, 12 Feb 2025 10:19:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IESGQAXDzed7Fmi16ciLszJ4Ey0xkXA+j06UKHlLqfUdrmcANPKem5IWP/WHHNGNcVUN6LRhQ==
X-Received: by 2002:a05:6402:4605:b0:5dc:8f03:bb5c with SMTP id
 4fb4d7f45d1cf-5deadd9217bmr3909028a12.11.1739384389013; 
 Wed, 12 Feb 2025 10:19:49 -0800 (PST)
Received: from ?IPv6:2001:16b8:2d24:c00:803c:5b80:8fe:19d4?
 (200116b82d240c00803c5b8008fe19d4.dip.versatel-1u1.de.
 [2001:16b8:2d24:c00:803c:5b80:8fe:19d4])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5de4d250084sm10090241a12.16.2025.02.12.10.19.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Feb 2025 10:19:48 -0800 (PST)
Message-ID: <dfbc4edd2670fc102ba4959d99bb2c5d6bd1d626.camel@redhat.com>
From: Philipp Stanner <pstanner@redhat.com>
To: Andrew Lunn <andrew@lunn.ch>, Philipp Stanner <phasta@kernel.org>
Date: Wed, 12 Feb 2025 19:19:47 +0100
In-Reply-To: <885058ae-605b-46e6-989b-3ff52908e6fd@lunn.ch>
References: <20250212145831.101719-2-phasta@kernel.org>
 <885058ae-605b-46e6-989b-3ff52908e6fd@lunn.ch>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: N-CBhjajPdQV1u2FgSVXzqzTmbvsx_e3Pmb2ZochsIA_1739384389
X-Mimecast-Originator: redhat.com
Cc: Yanteng Si <si.yanteng@linux.dev>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, Yinggang Gu <guyinggang@loongson.cn>,
 Huacai Chen <chenhuacai@kernel.org>, Serge Semin <fancer.lancer@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] stmmac: Replace deprecated PCI functions
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

T24gV2VkLCAyMDI1LTAyLTEyIGF0IDE5OjEzICswMTAwLCBBbmRyZXcgTHVubiB3cm90ZToKPiA+
IMKgCS8qIEdldCB0aGUgYmFzZSBhZGRyZXNzIG9mIGRldmljZSAqLwo+ID4gLQlmb3IgKGkgPSAw
OyBpIDwgUENJX1NURF9OVU1fQkFSUzsgaSsrKSB7Cj4gPiAtCQlpZiAocGNpX3Jlc291cmNlX2xl
bihwZGV2LCBpKSA9PSAwKQo+ID4gLQkJCWNvbnRpbnVlOwo+ID4gLQkJcmV0ID0gcGNpbV9pb21h
cF9yZWdpb25zKHBkZXYsIEJJVCgwKSwKPiA+IHBjaV9uYW1lKHBkZXYpKTsKPiA+IC0JCWlmIChy
ZXQpCj4gPiAtCQkJZ290byBlcnJfZGlzYWJsZV9kZXZpY2U7Cj4gPiAtCQlicmVhazsKPiA+IC0J
fQo+ID4gLQo+ID4gLQltZW1zZXQoJnJlcywgMCwgc2l6ZW9mKHJlcykpOwo+ID4gLQlyZXMuYWRk
ciA9IHBjaW1faW9tYXBfdGFibGUocGRldilbMF07Cj4gPiArCXJlcy5hZGRyID0gcGNpbV9pb21h
cF9yZWdpb24ocGRldiwgMCwgRFJJVkVSX05BTUUpOwo+IAo+IEkgZG9uJ3Qga25vdyB0b28gbXVj
aCBhYm91dCBQQ0ksIGJ1dCB0aGlzIGNoYW5nZSBkb2VzIG5vdCBsb29rCj4gb2J2aW91c2x5IGNv
cnJlY3QgdG8gbWUuIE1heWJlIHRoZSBjb21taXQgbWVzc2FnZSBuZWVkcyBleHBhbmRpbmcgdG8K
PiBleHBsYWluIHdoeSB0aGUgbG9vcCBjYW4gYmUgdGhyb3duIGF3YXk/IEFsc28sIGlzIHRoYXQg
QklUKDApCj4gYWN0dWFsbHkKPiB3cm9uZywgaXQgc2hvdWxkIG9mIGJlZW4gQklUKGkpPyBJcyB0
aGF0IHdoeSB0aGUgbG9vcCBpcyBwb2ludGxlc3MKPiBhbmQKPiBjYW4gYmUgcmVtb3ZlZD8gSWYg
c28sIHdlIHNob3VsZCBiZSBhc2tpbmcgdGhlIGRldmVsb3BlciBvZiB0aGlzIGNvZGUKPiB3aGF0
IGFyZSB0aGUgaW1wbGljYXRpb25zIG9mIHRoZSBidWcuIFNob3VsZCB0aGUgbG9vcCBiZSBrZXB0
PwoKWWVzLCB0aGUgcmVhc29uIHdoeSB0aGUgbG9vcCBpcyBwb2ludGxlc3MgaXMgdGhhdCBpdCBj
YWxscyBCSVQoMCkgZm9yCmFsbCBydW5zLCBpbnN0ZWFkIG9mIEJJVChpKS4gVGhpcyB3b3VsZCBo
YXZlIGNhdXNlZCBhbiBlcnJvciBidHcgaWYgaXQKd2VyZW4ndCBmb3IgcGNpX3Jlc291cmNlX2xl
bijigKYpID09IDAsIHdoaWNoIEkgYXNzdW1lIHByZXZlbnRzIHRyeWluZyB0bwpyZXF1ZXN0IEJB
UjAgbW9yZSB0aGFuIG9uY2UsIHdoaWNoIHMgaG91bGQgZmFpbC4KClRoZSBjb21taXQgbWVzc2Fn
ZSBzaG91bGQgbWVudGlvbiB0aGlzLCBhZ3JlZWQuCgpJIGFzc3VtZSB0aGlzIGlzIG5vdCBhIGJ1
ZywgYnV0IHRoZSBjb2RlIHdhcyBqdXN0IGNvcGllZCBmcm9tIHRoZSBvdGhlcgpwYXJ0IChhbHNv
IHRvdWNoZWQgaW4gdGhpcyBwYXRjaCkgd2hlcmUgYSBsb29wIHdhcyBuZWNlc3NhcnkuIEFyZ3Vt
ZW50CmJlaW5nIHRoYXQgaWYgdGhlIGFib3ZlIHdlcmUgYSBidWcsIGl0IHdvdWxkIGRlZmluaXRl
bHkgaGF2ZSBiZWVuCm5vdGljZWQgYmVjYXVzZSB0aGUgQkFScyBvdGhlciB0aGFuIDAgYXJlIG5v
dCBiZWluZyBtYXBwZWQsIHNvIHRyeWluZwp0byBhY2Nlc3MgdGhlbSBzaG91bGQgcmVzdWx0IGlu
IGZhdWx0cy4KCkFsdGhvdWdoIGEgY29uZmlybWF0aW9uIGJ5IHRoZSByZXNwZWN0aXZlIGRldmVs
b3BlciB3b3VsZCBpbmRlZWQgYmUKbmljZS4KClAuCgo+IAo+IAlBbmRyZXcKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcg
bGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
