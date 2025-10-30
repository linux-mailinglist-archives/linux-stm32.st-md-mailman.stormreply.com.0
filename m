Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE33C202B5
	for <lists+linux-stm32@lfdr.de>; Thu, 30 Oct 2025 14:09:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 18F82C62D8F;
	Thu, 30 Oct 2025 13:09:43 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1C57DC62D8A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Oct 2025 13:09:42 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-3ee64bc6b85so1018629f8f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Oct 2025 06:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761829781; x=1762434581;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2FvrWgtYM1o1H3GtR4yRdUrofDJ3VZExWe4rEvgf3XU=;
 b=fSbdmBmBZfZ7dit1ergXCGPVZR7/9zcYONCTXf+PySd5RdpTN7t8axEk1vu8jSbq8O
 gRsKyK5BOybdOUvwCh+hIs0twi7OqUHgGFcgpkwWUO/2qh+ObBwklhcjuEIPEpWuVD1a
 peR/OwtSYLPvVRgXJkgxE0fvzc7b99CrfhMHuCtAGMU6AU49wWUKFmhITzfuyDam7Qin
 qd9Pzyl6g/cMXB7H8yembRB28OSAy992eCn1otBs+FwHIdH479PU9+OuHwgfRfbh2gBn
 /XrSFFgKgKqJlqVRQWri+nQEYH9lUfxBbtOZ3ty3XbSu51aUaHMzAo6zQZ2iis/lGdMY
 gDCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761829781; x=1762434581;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2FvrWgtYM1o1H3GtR4yRdUrofDJ3VZExWe4rEvgf3XU=;
 b=gMvO+NG8VafzNR+fubarfCWiyJEZg22rc63fnHPWShJ/N9I3pMom9NsqmjQ6qJnLvV
 MLLjxPMdYKjiWwYTkLWoDG3+59SP5XsSJURPtejaUMOCR6rtUbkCmHdDxlVEPvrMGpXM
 Wr0UW5Ud468TblzX4z6AAslPS+GIkO1he8ryrJhRAJTGksBHQvKu2VV4vO4OVCOLNFwZ
 GJeKHOyhkadetky4ouldZ5Z8m6SKCNB0ySwnoH0FLSuyx02kUzfztkrloqamm0tFYsNW
 8KAgkvZHvMFWsVwNXWMTfbQuhuHO13BuiWI8LhUOM28MjcMfhoV1AI9n7OwWru3Tc74e
 XvAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIBE+mypUHGIUd4Bgmf4IixE0yKYucDOZimvOUS94AwfmB2GhhoukATyPzs57//nIzAOuVVMvm0P7+hQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwhzUG5JiAK/oV6gE3LUkO/eWBBx6t359qJpOzgj3wc49U40tny
 uH2MsKuA3HqedEZphIvVLuknFlCHKwTwKsZG214ZihLplZ9K3uB4ldnC
X-Gm-Gg: ASbGncs0FvSvVuX/YUcC7TI4ptKGjl5jDFrhohUkpHp5HIrHLfoYulgeCV2XcGUqvku
 EzpdYU1WqMgvmbaXsDeWZtU/P9oGmulSof9eOH0njf366ZnimLX0VgPSebOV/yj44f5bA+xEpVu
 JoJ1iQZFG6haLqhuiXXryE0P0YVWCPxMHGyZcQOUVxm0gWC7BE/0C+FCl37uuPojtIUjjqHdZQw
 /qiiEUGEQY31/+KpHCyzkw6BZX3igUN11cc+pfMwZ78L9gmTqzyCSpxx70SGHjz4egNXvE7slEu
 sV2Iwj/bR17LHIDjaa9PKmYSbs0HMaSWfTdCh2xvPwTICcUxDuJpSPSTcwaVObQoQNEU1r0R1+K
 qWBywBzsmf7wHN9FJq/7gptoTi9t0X8rMldB3nyXGRQZwUgsU63UjCxYge2sdaqaVkNF1OGyIjx
 wYEmjeIPAVc/VD0pCEDjomm9PShrGCY5LmuibDAcHsWPwEYwyo2TWYjGYJbl2BQkDKbTs5deTuW
 dvNJFtLi7MJZ343kn/Gn0q+ho4hFoPIf3vT3yiwbEA2Wcw=
X-Google-Smtp-Source: AGHT+IHt0qZj97JBfhSm3bU2Z3jejv68CgVJx0PCPzKZeY8wdWN+4MGQv4dUD3at1v6e8mwpzpu6rQ==
X-Received: by 2002:a5d:5f96:0:b0:429:8d0a:8108 with SMTP id
 ffacd0b85a97d-429b4c8a0acmr2867282f8f.24.1761829780332; 
 Thu, 30 Oct 2025 06:09:40 -0700 (PDT)
Received: from ?IPV6:2a02:8440:750a:26fd:c3f7:5627:ab4b:232f?
 (2a02-8440-750a-26fd-c3f7-5627-ab4b-232f.rev.sfr.net.
 [2a02:8440:750a:26fd:c3f7:5627:ab4b:232f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952ca979sm33491156f8f.14.2025.10.30.06.09.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Oct 2025 06:09:39 -0700 (PDT)
Message-ID: <287da4e3-0a28-42a3-8f59-7e41dde4d20c@gmail.com>
Date: Thu, 30 Oct 2025 14:09:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Amelie Delaunay <amelie.delaunay@foss.st.com>,
 Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20251030-mdma_warnings_fix-v1-1-987f67c75794@foss.st.com>
Content-Language: en-US
From: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
In-Reply-To: <20251030-mdma_warnings_fix-v1-1-987f67c75794@foss.st.com>
Cc: dmaengine@vger.kernel.org,
 =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] dmaengine: stm32-mdma: initialize
 m2m_hw_period and ccr to fix warnings
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

T24gMTAvMzAvMjUgMTM6MjYsIEFtZWxpZSBEZWxhdW5heSB3cm90ZToKPiBGcm9tOiBDbMOpbWVu
dCBMZSBHb2ZmaWMgPGNsZW1lbnQubGVnb2ZmaWNAZm9zcy5zdC5jb20+Cj4gCj4gbTJtX2h3X3Bl
cmlvZCBpcyBpbml0aWFsaXplZCBvbmx5IHdoZW4gY2hhbl9jb25maWctPm0ybV9odyBpcyB0cnVl
LiBUaGlzCj4gdHJpZ2dlcnMgYSB3YXJuaW5nOgo+IOKAmG0ybV9od19wZXJpb2TigJkgbWF5IGJl
IHVzZWQgdW5pbml0aWFsaXplZCBbLVdtYXliZS11bmluaXRpYWxpemVkXQo+IEFsdGhvdWdoIG0y
bV9od19wZXJpb2QgaXMgb25seSB1c2VkIHdoZW4gY2hhbl9jb25maWctPm0ybV9odyBpcyB0cnVl
IGFuZAo+IGlnbm9yZWQgb3RoZXJ3aXNlLCBpbml0aWFsaXplIGl0IHVuY29uZGl0aW9uYWxseSB0
byAwLgo+IAo+IGNjciBpcyBpbml0aWFsaXplZCBieSBzdG0zMl9tZG1hX3NldF94ZmVyX3BhcmFt
KCkgd2hlbiB0aGUgc2cgbGlzdCBpcyBub3QKPiBlbXB0eS4gVGhpcyB0cmlnZ2VycyBhIHdhcm5p
bmc6Cj4g4oCYY2Ny4oCZIG1heSBiZSB1c2VkIHVuaW5pdGlhbGl6ZWQgWy1XbWF5YmUtdW5pbml0
aWFsaXplZF0KPiBJbmRlZWQsIGl0IGNvdWxkIGJlIHVzZWQgdW5pbml0aWFsaXplZCBpZiB0aGUg
c2cgbGlzdCBpcyBlbXB0eS4gSW5pdGlhbGl6ZQo+IGl0IHRvIDAuCj4gCj4gU2lnbmVkLW9mZi1i
eTogQ2zDqW1lbnQgTGUgR29mZmljIDxjbGVtZW50LmxlZ29mZmljQGZvc3Muc3QuY29tPgo+IFNp
Z25lZC1vZmYtYnk6IEFtZWxpZSBEZWxhdW5heSA8YW1lbGllLmRlbGF1bmF5QGZvc3Muc3QuY29t
Pgo+IC0tLQo+ICAgZHJpdmVycy9kbWEvc3RtMzIvc3RtMzItbWRtYS5jIHwgMiArLQo+ICAgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZG1hL3N0bTMyL3N0bTMyLW1kbWEuYyBiL2RyaXZlcnMvZG1hL3N0bTMyL3N0
bTMyLW1kbWEuYwo+IGluZGV4IDA4MGMxYzcyNTIxNi4uYjg3ZDQxYjIzNGRmIDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvZG1hL3N0bTMyL3N0bTMyLW1kbWEuYwo+ICsrKyBiL2RyaXZlcnMvZG1hL3N0
bTMyL3N0bTMyLW1kbWEuYwo+IEBAIC03MzEsNyArNzMxLDcgQEAgc3RhdGljIGludCBzdG0zMl9t
ZG1hX3NldHVwX3hmZXIoc3RydWN0IHN0bTMyX21kbWFfY2hhbiAqY2hhbiwKPiAgIAlzdHJ1Y3Qg
c3RtMzJfbWRtYV9jaGFuX2NvbmZpZyAqY2hhbl9jb25maWcgPSAmY2hhbi0+Y2hhbl9jb25maWc7
Cj4gICAJc3RydWN0IHNjYXR0ZXJsaXN0ICpzZzsKPiAgIAlkbWFfYWRkcl90IHNyY19hZGRyLCBk
c3RfYWRkcjsKPiAtCXUzMiBtMm1faHdfcGVyaW9kLCBjY3IsIGN0Y3IsIGN0YnI7Cj4gKwl1MzIg
bTJtX2h3X3BlcmlvZCA9IDAsIGNjciA9IDAsIGN0Y3IsIGN0YnI7Cj4gICAJaW50IGksIHJldCA9
IDA7Cj4gICAKPiAgIAlpZiAoY2hhbl9jb25maWctPm0ybV9odykKPiAKPiAtLS0KPiBiYXNlLWNv
bW1pdDogMzk4MDM1MTc4NTAzYmY2NjIyODFiYmZmYjRiZWJjZTE0NjBhNGJjNQo+IGNoYW5nZS1p
ZDogMjAyNTEwMzAtbWRtYV93YXJuaW5nc19maXgtZGY0YjNkMTQwNWVkCj4gCj4gQmVzdCByZWdh
cmRzLAoKSGkgQW3DqWxpZSwKClRoYW5rIHlvdSBmb3IgdXBzdHJlYW1pbmcgdGhpcyBwYXRjaC4K
WW91IGNhbiBhZGQgbXkgcmV2aWV3ZWQtYnkgdGFnOgoKUmV2aWV3ZWQtYnk6IENsw6ltZW50IExl
IEdvZmZpYyA8bGVnb2ZmaWMuY2xlbWVudEBnbWFpbC5jb20+CgpCZXN0IHJlZ2FyZHMsCkNsw6lt
ZW50Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXN0bTMyCg==
