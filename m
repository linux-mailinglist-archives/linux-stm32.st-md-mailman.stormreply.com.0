Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C007346D308
	for <lists+linux-stm32@lfdr.de>; Wed,  8 Dec 2021 13:08:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 685CBC5F1E8;
	Wed,  8 Dec 2021 12:08:46 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F2B8FC5F1E2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Dec 2021 12:08:44 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 g191-20020a1c9dc8000000b0032fbf912885so1623747wme.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 08 Dec 2021 04:08:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=R1D6vu1LwULEAHB02GfzTtDg6CGj6MOMTTzNmc1nbxo=;
 b=KQcEugiexb23klmZMI5tSlYPQm99/Zv4PPINCgHpDwY3fjhv8d0Zyt/TJihnvq0Ubc
 ulosvJ/VXLX1hsUssnt5uBohWJZavOjioliqCxG6+Fd8okWoYwHI2BVepUSR0LBr86HD
 skDjsgdbR4jSE6lb4q4Zlx9xgvaWcPL5d3HZlJwf7MaAII/UBpHDs5GKMn8vC3hcqSa3
 j4/ExVLga/qmDqhXUjoeArZW4LSTad6LvvGw661WNvCjd6p1lh2C7KtyBv3dDjDaftSb
 XhUy+zdWjtjEKSsqIID9dZjM+D3L0QtRBY1Wti5aUSzDt2JGywGA79EdQUO47xDDGRwp
 aTAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=R1D6vu1LwULEAHB02GfzTtDg6CGj6MOMTTzNmc1nbxo=;
 b=qrnqnAGqeufPwdZ2d7Lc7QjWBquXbcUjC9JLlrSYldBn5nN5xCEVftoTW6JhgeMXiG
 CigoCzCqXe/vWkSy1xIPou6FV5OzdvP9arItz+YoX4rJm6DRyE4c8zMQgZK64JJRgrVs
 FAlzgu0o8MlNlcuy/Yy5QKzZGf6WyQw5l8SGTnNKXMVMddAoRu+MWwkpNgBxLw4OsIp8
 yrC/unr2+7BLcZxclGGzmRhpeOeuFJ4ynUhAGc+t0Put6hjNqYVfzg07PaGc11j6mBVU
 IUHLxZIPw7wO3oeuTHy48XmULT8zlTWQpMywRO+azHNDgKqKXX9c7P/5rKYnPYUHpaF0
 XLbw==
X-Gm-Message-State: AOAM531B09H4XigdshorinVtAYluQhwtc5W62nzqCNSIzXcZMRgXzXh5
 QlEKdpFyjcwJxYzlmmfmzeSj/w==
X-Google-Smtp-Source: ABdhPJwP41Y8jw1WGUE8GAzmHo4vkR9Ff92/aNI150r9LWBWlHejIG/y9c1S8ZGyrHAs6k1jt25u+w==
X-Received: by 2002:a05:600c:2252:: with SMTP id
 a18mr15774810wmm.133.1638965324354; 
 Wed, 08 Dec 2021 04:08:44 -0800 (PST)
Received: from google.com ([2.31.167.18])
 by smtp.gmail.com with ESMTPSA id u13sm6297713wmq.14.2021.12.08.04.08.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Dec 2021 04:08:43 -0800 (PST)
Date: Wed, 8 Dec 2021 12:08:41 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Message-ID: <YbCgSeA1++U82jtn@google.com>
References: <20211125144053.774-1-olivier.moysan@foss.st.com>
 <20211125144053.774-2-olivier.moysan@foss.st.com>
 <1637875562.357461.2858318.nullmailer@robh.at.kernel.org>
 <237f56b3-0597-2526-a182-f1fbdd327338@foss.st.com>
 <Yaf4jiZIp8+ndaXs@robh.at.kernel.org>
 <627777a4-7458-88ed-e7c5-d11e3db847b5@foss.st.com>
 <cf5f994b-aecf-e051-f5c9-4a46e6414207@pengutronix.de>
 <cb7f19c0-3826-fcc8-227c-982838acf599@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cb7f19c0-3826-fcc8-227c-982838acf599@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, alsa-devel@alsa-project.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, alain.volmat@foss.st.com,
 arnaud.pouliquen@foss.st.com, Fabrice GASNIER <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/4] ASoC: dt-bindings: stm32: i2s: add
 audio-graph-card port
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

T24gV2VkLCAwOCBEZWMgMjAyMSwgQWxleGFuZHJlIFRPUkdVRSB3cm90ZToKCj4gSGkgQWhtYWQK
PiAKPiBPbiAxMi83LzIxIDI6NTkgUE0sIEFobWFkIEZhdG91bSB3cm90ZToKPiA+IEhlbGxvIEFs
ZXgsCj4gPiAKPiA+IE9uIDA3LjEyLjIxIDE0OjUyLCBBbGV4YW5kcmUgVE9SR1VFIHdyb3RlOgo+
ID4gPiBIaSBSb2IKPiA+ID4gCj4gPiA+IE9uIDEyLzEvMjEgMTE6MzQgUE0sIFJvYiBIZXJyaW5n
IHdyb3RlOgo+ID4gPiA+IE9uIEZyaSwgTm92IDI2LCAyMDIxIGF0IDExOjI1OjI3QU0gKzAxMDAs
IE9saXZpZXIgTU9ZU0FOIHdyb3RlOgo+ID4gPiA+ID4gSGkgUm9iLAo+ID4gPiA+ID4gCj4gPiA+
ID4gPiBPbiAxMS8yNS8yMSAxMDoyNiBQTSwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gPiA+ID4gPiA+
IE9uIFRodSwgMjUgTm92IDIwMjEgMTU6NDA6NTAgKzAxMDAsIE9saXZpZXIgTW95c2FuIHdyb3Rl
Ogo+ID4gPiA+ID4gPiA+IFRoZSBTVE0yIEkyUyBEQUkgY2FuIGJlIGNvbm5lY3RlZCB2aWEgdGhl
IGF1ZGlvLWdyYXBoLWNhcmQuCj4gPiA+ID4gPiA+ID4gQWRkIHBvcnQgZW50cnkgaW50byB0aGUg
YmluZGluZ3MuCj4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogT2xp
dmllciBNb3lzYW4gPG9saXZpZXIubW95c2FuQGZvc3Muc3QuY29tPgo+ID4gPiA+ID4gPiA+IC0t
LQo+ID4gPiA+ID4gPiA+ICDCoMKgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9z
b3VuZC9zdCxzdG0zMi1pMnMueWFtbCB8IDUgKysrKysKPiA+ID4gPiA+ID4gPiAgwqDCoCAxIGZp
bGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCj4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+IAo+
ID4gPiA+ID4gPiBSdW5uaW5nICdtYWtlIGR0YnNfY2hlY2snIHdpdGggdGhlIHNjaGVtYSBpbiB0
aGlzIHBhdGNoIGdpdmVzIHRoZQo+ID4gPiA+ID4gPiBmb2xsb3dpbmcgd2FybmluZ3MuIENvbnNp
ZGVyIGlmIHRoZXkgYXJlIGV4cGVjdGVkIG9yIHRoZSBzY2hlbWEgaXMKPiA+ID4gPiA+ID4gaW5j
b3JyZWN0LiBUaGVzZSBtYXkgbm90IGJlIG5ldyB3YXJuaW5ncy4KPiA+ID4gPiA+ID4gCj4gPiA+
ID4gPiA+IE5vdGUgdGhhdCBpdCBpcyBub3QgeWV0IGEgcmVxdWlyZW1lbnQgdG8gaGF2ZSAwIHdh
cm5pbmdzIGZvciBkdGJzX2NoZWNrLgo+ID4gPiA+ID4gPiBUaGlzIHdpbGwgY2hhbmdlIGluIHRo
ZSBmdXR1cmUuCj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiBGdWxsIGxvZyBpcyBhdmFpbGFibGUg
aGVyZTogaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wYXRjaC8xNTU5NzUwCj4gPiA+ID4g
PiA+IAo+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gYXVkaW8tY29udHJvbGxlckA0MDAwYjAwMDog
J3BvcnQnIGRvZXMgbm90IG1hdGNoIGFueSBvZiB0aGUgcmVnZXhlczogJ15wb3J0QFswLTldJywg
J3BpbmN0cmwtWzAtOV0rJwo+ID4gPiA+ID4gPiAgwqDCoMKgwqBhcmNoL2FybS9ib290L2R0cy9z
dG0zMm1wMTU3YS1kazEuZHQueWFtbAo+ID4gPiA+ID4gPiAgwqDCoMKgwqBhcmNoL2FybS9ib290
L2R0cy9zdG0zMm1wMTU3Yy1kazIuZHQueWFtbAo+ID4gPiA+ID4gPiAKPiA+ID4gPiA+IAo+ID4g
PiA+ID4gVGhpcyB3YXJuaW5nIGlzIG5vdCBhIG5ldyBvbmUuCj4gPiA+ID4gPiAKPiA+ID4gPiA+
IFRoZSBpMnMyIG5vZGUgaW4gc3RtMzJtcDE1eHgtZGt4LmR0c2kgd291bGQgcmVxdWlyZSB0aGUg
Zm9sbG93aW5nIGJpbmRpbmc6Cj4gPiA+ID4gPiBwb3J0Ogo+ID4gPiA+ID4gIMKgwqDCoMKgJHJl
ZjogYXVkaW8tZ3JhcGgtcG9ydC55YW1sIwo+ID4gPiA+ID4gIMKgwqDCoMKgdW5ldmFsdWF0ZWRQ
cm9wZXJ0aWVzOiBmYWxzZQo+ID4gPiA+ID4gCj4gPiA+ID4gPiBIb3dldmVyIHRoZSBzcGkgYmlu
ZGluZyByZXF1aXJlcyB0byBpbnRyb2R1Y2UgYSB1bml0IGFkZHJlc3M6Cj4gPiA+ID4gPiBwYXR0
ZXJuUHJvcGVydGllczoKPiA+ID4gPiA+ICDCoMKgICdecG9ydEBbMC05XSc6Cj4gPiA+ID4gPiAg
wqDCoMKgwqAgJHJlZjogYXVkaW8tZ3JhcGgtcG9ydC55YW1sIwo+ID4gPiA+ID4gIMKgwqDCoMKg
IHVuZXZhbHVhdGVkUHJvcGVydGllczogZmFsc2UKPiA+ID4gPiA+IAo+ID4gPiA+ID4gVGhlIHdh
cm5pbmcgY2FuIGJlIHJlbW92ZWQgYnkgcmUtb3JkZXJpbmcgdGhlIGJpbmRpbmdzIHBhdGNoZXMg
aW4gdGhlIHNlcmllLAo+ID4gPiA+ID4gYXMgImFkZGl0aW9uYWxQcm9wZXJ0aWVzOiB0cnVlIiBt
YWtlcyB0aGUgY2hlY2sgbW9yZSB0b2xlcmFudCBvbiBleHRyYQo+ID4gPiA+ID4gcHJvcGVydGll
cy4KPiA+ID4gPiAKPiA+ID4gPiBUaGF0J3MgbmV2ZXIgcmlnaHQuCj4gPiA+ID4gCj4gPiA+ID4g
PiBUaGUgcGF0Y2ggIkFTb0M6IGR0LWJpbmRpbmdzOiBzdG0zMjogaTJzOiBhZGQgYXVkaW8tZ3Jh
cGgtY2FyZCBwb3J0IiBjYW4KPiA+ID4gPiA+IGV2ZW4gYmUgbWVyZWx5IGRyb3BwZWQuCj4gPiA+
ID4gPiBTbywgSSBzdWdnZXN0IHRvIHJlc2VuZCB0aGUgc2VyaWUgd2l0aG91dCBhdWRpby1ncmFw
aC1jYXJkIHBhdGNoLgo+ID4gPiA+IAo+ID4gPiA+IE9ubHkgaWYgeW91IGFyZW4ndCB1c2luZyBh
dWRpby1ncmFwaC1jYXJkLgo+ID4gPiA+IAo+ID4gPiA+ID4gCj4gPiA+ID4gPiBEb2VzIGl0IHNv
dW5kIHRvbyBwZXJtaXNzaXZlIHRvIHlvdSA/Cj4gPiA+ID4gCj4gPiA+ID4gSSB0aGluayBwZXJo
YXBzIHlvdSBuZWVkIHRvIGNvbWJpbmUgdGhlIHNjaGVtYXMgaW50byAxLiBPciB5b3UgbmVlZCB0
bwo+ID4gPiA+IHJlc3RydWN0dXJlIHlvdXIgZHRzaSBmaWxlcyBzdWNoIHRoYXQgeW91IG9ubHkg
YWRkIHNwaSBzcGVjaWZpYwo+ID4gPiA+IHByb3BlcnRpZXMgd2hlbiBzcGkgbW9kZSBpcyBlbmFi
bGVkIGFuZCBvbmx5IGFkZCBpMnMgc3BlY2lmaWMgcHJvcGVydGllcwo+ID4gPiA+IHdoZW4gaTJz
IG1vZGUgaXMgZW5hYmxlZC4gT3IgdXNlIHRoZSAvZGVsZXRlLXByb3BlcnR5LyBkaXJlY3RpdmUu
Cj4gPiA+IAo+ID4gPiBJbml0aWFsbHkgdGhlIGFpbSBvZiB0aGlzIHNlcmllcyB3YXMgdG8gZml4
IGEgIm1ha2UgVz0xIiB3YXJuaW5ncyBzZWVuIG9uIHNwaSBhbmQgaTJzIG5vZGVzIChkdXBsaWNh
dGUgdW5pdC1hZGRyZXNzKS4gTW92aW5nIGJvdGggbm9kZXMgaW4gYSBjb21tb24gbm9kZSArIHVz
aW5nIGEgZGlmZmVyZW50IGNvbXBhdGlibGUgZGVwZW5kaW5nIG9uIFNQSSBvciBJMlMgdXNhZ2Ug
c291bmRlZCBnb29kKSBidXQgaXQgaXMgbm90IGVub3VnaC4gSW4gdGhpcyBzZXJpZXMgdGhlIGNv
bW1vbiBub2RlIGlzIG5hbWVkIGFzIGZvbGxvd2luZzogInNwaTJzMjogc3BpQDQwMDBiMDAwIi4g
SXQgaXMgZmluZSBmb3IgYSBzcGkgdXNhZ2UgYnV0IGlmIHdlIHdhbnQgdG8gdXNlIHRoaXMgImNv
bW1vbiBub2RlIiB3aXRoIEkyUyBjb21wYXRpYmxlIGFuZCBzcGVjaWZpYyBiaW5kaW5ncywgdGhl
IG5vZGUgbmFtZSByZW1haW5zIHNwaUAuLi4gYW5kIHRoZW4gc3BlY2lmaWMgc3BpIGNoZWNrcyBh
cmUgZG9uZS4gRm9yIHRoaXMgd2l0aCB0aGlzIHNlcmllcyBhcHBsaWVkIHdlIGdvdCB0aGlzIGlz
c3VlIHJlcG9ydGVkIGJ5IHNwaS1jb250cm9sbGVyLnlhbWw6Cj4gPiA+IAo+ID4gPiBzcGlANDAw
MGIwMDA6IHBvcnRAMDogJ2NvbXBhdGlibGUnIGlzIGEgcmVxdWlyZWQgcHJvcGVydHkKPiA+ID4g
Cj4gPiA+IFNvLCBpZiB3ZSB1c2UgdHdvIHNlcGFyYXRlcyBub2RlcyB3ZSBnb3QgVz0xIHdhcm5p
bmcgYW5kIGlmIHdlIHVzZSBhIGNvbW1vbiBub2RlIHdlIGdvdCB5YW1sIGNoZWNrIGlzc3VlLiBP
bmUgcG9zc2liaWxpdHkgd291bGQgYmUgdG8gdXNlIGEgY29tbW9uIG5vZGUgd2l0aCBhIG5ldyBu
b2RlIG5hbWUgKGZvciBleGFtcGxlIGkyc3BpQC4uLikgYnV0IEkgdGhpbmsgaXQgaXMgbm90IGFj
Y2VwdGFibGUuCj4gPiA+IAo+ID4gPiBIb3cgdG8gcHJvZ3Jlc3MgPwo+ID4gCj4gPiBBdG1lbCBG
bGV4Y29tIGNhbiBiZSBjb25maWd1cmVkIHRvIGJlIGVpdGhlciBVQVJULCBTUEkgb3IgaTJjLiBG
dW5jdGlvbnMKPiA+IGFyZSBjaGlsZCBub2RlcyBvZiB0aGUgZmxleGNvbSBub2RlIGFuZCB0aGUg
TUZEIGRyaXZlciBtYXRjaGluZyBhZ2FpbnN0IGl0LAo+ID4ganVzdCBjb25maWd1cmUgdGhlIG9w
ZXJhdGluZyBtb2RlIGFuZCB0aGVuIGNhbGxzIG9mX3BsYXRmb3JtX3BvcHVsYXRlLgo+ID4gCj4g
PiBXb3VsZCBzb21ldGhpbmcgYWxvbmcgdGhlc2UgbGluZXMgZml0IGhlcmUgYXMgd2VsbD8KPiAK
PiBZZXMgaXQgY291bGQgYnV0IGluIG15IG1pbmQgaXQgd2FzIG5vdCBhIE1GRCBhcyBib3RoIGZl
YXR1cmUgY2Fubm90IGJlIHVzZWQKPiBhdCB0aGUgc2FtZSB0aW1lOiBpdCBpcyBlaXRoZXIgU1BJ
IG9yIEkyUyBhbmQgY2hvaWNlIGlzIGRvbmUgInN0YXRpY2FsbHkiIGluCj4gZGV2aWNlIHRyZWUg
ZGVwZW5kaW5nIGJvYXJkIHVzYWdlLgo+IAo+IExlZSwgd2hhdCBpdCBpcyB5b3VyIGZlZWxpbmcg
YWJvdXQgdGhhdCA/IFdpbGwgeW91IGFjY2VwdCB0byBhZGQgYSBNRkQKPiBkcml2ZXIgZm9yIHRo
aXMgU1BJL0kyUyBwZXJpcGhlcmFsIHdob3NlIHBydXJwb3NlIGlzIG9ubHkgdG8gcG9wdWxhdGUg
Y2hpbGQKPiBub2RlIChlaXRoZXIgU1BJIG9yIEkyUykgPwoKRnJvbSB5b3VyIGRlc2NyaXB0aW9u
LCB0aGlzIGRvZXNuJ3Qgc291bmQgbGlrZSBhIGdvb2QgZml0IGZvciBNRkQuCgotLSAKTGVlIEpv
bmVzIFvmnY7nkLzmlq9dClNlbmlvciBUZWNobmljYWwgTGVhZCAtIERldmVsb3BlciBTZXJ2aWNl
cwpMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQXJtIFNvQ3MKRm9sbG93
IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgt
c3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
